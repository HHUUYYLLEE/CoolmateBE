const express= require("express")
const cors= require("cors")
const connection = require("./db")
const md5 = require("md5")
const { v4 } = require("uuid")
const Fuse= require("fuse.js")
const multer  = require('multer')
const fs= require("fs")
const mime= require("mime")
var config = require('config');
const moment = require("moment/moment")
const axios = require('axios').default; // npm install axios
const CryptoJS = require('crypto-js'); // npm install crypto-js
const upload = multer({ dest: 'assets/i/' })

const app= express()

app.use(express.json())
app.use(express.urlencoded({
    extended: true
}))
app.use(express.static(__dirname+ "/assets"))
app.use(cors())

app.get("/api/category", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM category WHERE category_name= ?", [req.query.query])
    const [rows2]= await connection.execute("SELECT * FROM products WHERE category_id= ?", [rows[0].category_id])
    return res.status(200).json({data1: rows, data2: rows2})
})
app.get("/api/slider", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM product_image WHERE id_product= ?", [req.query.id_product])
    return res.status(200).json(rows)
})
app.get("/api/product", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM products WHERE id= ?", [req.query.id_product])
    return res.status(200).json(rows[0])

})

app.get("/api/size", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM product_size WHERE id_product= ?", [req.query.id_product])
    return res.status(200).json(rows)

})

app.get("/api/color", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM product_color WHERE id_product= ?", [req.query.id_product])
    return res.status(200).json(rows)

})

app.get("/api/suggest", async (req, res)=> {
    const [rows]= await connection.execute("SELECT * FROM products ORDER BY RAND() LIMIT 3")
    return res.status(200).json(rows)

})

app.post("/login", async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT id, username, phone, email FROM user WHERE (phone= ? OR email= ?) AND password= ?", [req.body.account, req.body.account, md5(req.body.password)])
        if(rows?.length > 0) {
            return res.status(200).json({login: true, ...rows[0]})  
        }
    } catch (error) {
        return res.status(200).json({login: false})
    }
})
app.post("/signup", async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT username FROM user WHERE email= ? or phone= ?",[req.body.email, req.body.phone] )
        if(rows.length > 0) {
            return res.status(200).json({signup: false, message: "Email hoặc số điện thoại đã tồn tại", exist: true})
        }
        else {
            await connection.execute("INSERT INTO user VALUES(?, ?, ?, ?, ?)", [v4(), req.body.username, req.body.phone, req.body.email, md5(req.body.password)])
            return res.status(200).json({signup: true, message: "Đăng ký thành công"})
        }
    } catch (error) {
        console.log(error)
        return res.status(200).json({signup: false, message: "Có lỗi xảy ra. Vui lòng thử lại"})
    }
})

app.post("/", async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT username, email, phone FROM user WHERE id= ?", [req.body.uid])
        if(rows.length > 0 ) {
            return res.status(200).json({auth: true, ...rows[0]})
        }
        else {
            return res.status(200).json({auth: false})
        }
    } catch (error) {
        return res.status(200).json({auth: false})
    }
})

app.post("/api/add", async (req, res)=> {
    try {
        const [rows]= await connection.execute("INSERT INTO cart VALUES(?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE amount= amount + ?", [v4(),req.body.id_user, req.body.id_product, req.body.size, req.body.color, req.body.amount, parseInt(req.body.amount)])
        return res.status(200).json()
    } catch (error) {
        return res.status(500).json("Error")
    }
})

app.get("/api/get/cart", async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT * FROM cart INNER JOIN products ON products.id = cart.id_product WHERE cart.id_user= ?", [req.query.id_user])
        return res.status(200).json(rows)
    } catch (error) {
        console.log(error)
        return res.status(200).json([])
    }
})

app.post("/api/cart/delete", async (req, res)=> {
    try {
        const [rows]= await connection.execute("DELETE FROM cart WHERE id_cart= ?", [req.body.id_cart])
        
        return res.status(200).json(rows)
    } catch (error) {
        console.log(error)
        return res.status(200).json([])
    }
})

app.post("/api/pay", async (req, res)=> {
    try {
        const [rows]= await connection.execute("DELETE FROM cart WHERE id_user= ? AND id_product= ? AND size=? AND color= ?", [req.body.id_user, req.body.id_product, req.body.size, req.body.color])
        const [rows2]= await connection.execute("INSERT INTO history VALUES(?, ?, ?, ?, ?, ?, ?)", [v4(), req.body.id_user, req.body.id_product, req.body.size, req.body.color, req.body.amount, req.body.time_created])
        return res.status(200).json(rows)
    } catch (error) {
        console.log(error)
        return res.status(200).json([])
    }
})

app.get("/search", async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT * FROM products")
        const options = {
            keys: [
              "product_name",
            ]
          };
        const fuse= new Fuse(rows, options)
        return res.status(200).json(fuse.search(req.query.querySearch))
    } catch (error) {
        console.log(error)
        return res.status(200).json([])
    }
})

app.get("/api/history",async (req, res)=> {
    try {
        const [rows]= await connection.execute("SELECT * FROM history INNER JOIN products ON products.id = history.id_product WHERE history.id_user= ?", [req.query.id_user])
        return res.status(200).json(rows)
    } catch (error) {
        console.log(error)
        return res.status(200).json([])
    }
})

app.post("/upload-image", (req, res)=> {
    const {image }= req.body
    try {
        const decodedImg = decodeBase64Image(image);
        const imageBuffer = decodedImg.data;
        const type = decodedImg.type;
        const extension = mime.getExtension(type);
        const fileName= v4()
        try{
            fs.writeFileSync("./assets/i/" + fileName + "."+ extension , imageBuffer, 'utf8');
            return res.status(200).json({img: "http://localhost:4000/i/" + fileName + "."+ extension})
        }
        catch(err){
            console.error(err)
            return res.status(200).json({img: false})
        }
    } catch (error) {
        console.log(error)
        return res.status(200).json({img: false})
    }
})

app.post("/add-product", async (req, res)=> {
    try {
        const [rows]= await connection.execute("INSERT INTO products(category_id, price, discount, review, product_name, image1, image2) VALUES(?, ?, ?, ?, ?, ?, ?)", [parseInt(req.body.category), parseInt(req.body.price), parseInt(req.body.discount), 5, req.body.productName, req.body.image1, req.body.image2])
        const [rows2]= await connection.execute("SELECT DISTINCT LAST_INSERT_ID() FROM products")
        const id_product= Object.values(rows2[0])[0]
        req.body.size.map(async item=> {
            const [rows3]= await connection.execute("INSERT INTO product_size(id_product, size) VALUES(?, ?)", [id_product, item])
            return rows3
        })
        req.body.color.map(async item=> {
            const [rows3]= await connection.execute("INSERT INTO product_color(id_product, color) VALUES(?, ?)", [id_product, item])
            return rows3
        })
        req.body.image.map(async item=> {
            const [rows3]= await connection.execute("INSERT INTO product_image(id_product, image) VALUES(?, ?)", [id_product, item])
            return rows3
        })

        return res.status(200).json({add: true})
    } catch (error) {
        console.log(error)
        return res.status(200).json(error)
    }
})

app.post('/create_payment_url', function (req, res, next) {
    var ipAddr = req.headers['x-forwarded-for'] ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress;

    

    
    var tmnCode = config.get('vnp_TmnCode');
    var secretKey = config.get('vnp_HashSecret');
    var vnpUrl = config.get('vnp_Url');
    var returnUrl = config.get('vnp_ReturnUrl');

    var date = new Date();

    var orderId = v4();
    var amount = req.body.amount;
    var bankCode = req.body.bankCode;
    
    var orderInfo = req.body.orderDescription;
    var orderType = req.body.orderType;
    var locale = req.body.language;
    if(locale === null || locale === ''){
        locale = 'vn';
    }
    var currCode = 'VND';
    var vnp_Params = {};
    vnp_Params['vnp_Version'] = '2.1.0';
    vnp_Params['vnp_Command'] = 'pay';
    vnp_Params['vnp_TmnCode'] = tmnCode;
    vnp_Params['vnp_CreateDate'] = moment(new Date()).format("YYYYMMDDHHmmss");
    vnp_Params['vnp_CurrCode'] = currCode;

    // vnp_Params['vnp_Merchant'] = ''
    vnp_Params['vnp_Locale'] = locale;
    vnp_Params['vnp_TxnRef'] = orderId;
    vnp_Params['vnp_OrderInfo'] = orderInfo;
    vnp_Params['vnp_OrderType'] = orderType;
    vnp_Params['vnp_Amount'] = amount;
    vnp_Params['vnp_ReturnUrl'] = returnUrl;
    vnp_Params['vnp_IpAddr'] = ipAddr;
    // if(bankCode !== null && bankCode !== ''){
    //     vnp_Params['vnp_BankCode'] = bankCode;
    // }

    vnp_Params = sortObject(vnp_Params);

    var querystring = require('qs');
    var signData = querystring.stringify(vnp_Params, { encode: false });
    var crypto = require("crypto");     
    var hmac = crypto.createHmac("sha512", secretKey);
    var signed = hmac.update(new Buffer(signData, 'utf-8')).digest("hex"); 
    vnp_Params['vnp_SecureHash'] = signed;
    vnpUrl += '?' + querystring.stringify(vnp_Params, { encode: false });

    res.status(200).json(vnpUrl)
});

app.post("/pay-zalo", (req, res)=> {
    const config = {
        appid: "553",
        key1: "9phuAOYhan4urywHTh0ndEXiV3pKHr5Q",
        key2: "Iyz2habzyr7AG8SgvoBCbKwKi3UzlLi3",
        endpoint: "https://sbgateway.zalopay.vn/api/getlistmerchantbanks"
      };
      let reqtime = Date.now();
      let params = {
        appid: config.appid,
        reqtime: reqtime, // miliseconds
        mac: CryptoJS.HmacSHA256(config.appid + "|" + reqtime, config.key1).toString() // appid|reqtime
      };  
   
    axios.get(config.endpoint, { params })
    .then(res => {
        let banks = res.data.banks;
        for (let id in banks) {
        let banklist = banks[id];
        console.log(id + ".");
        for (let bank of banklist) {
            console.log(bank);
        }
        }
    })
    .catch(err => console.error(err));
})

function sortObject(obj) {
	let sorted = {};
	let str = [];
	let key;
	for (key in obj){
		if (obj.hasOwnProperty(key)) {
		str.push(encodeURIComponent(key));
		}
	}
	str.sort();
    for (key = 0; key < str.length; key++) {
        sorted[str[key]] = encodeURIComponent(obj[str[key]]).replace(/%20/g, "+");
    }
    return sorted;
}

function decodeBase64Image(dataString) {
    var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
      response = {};
  
    if (matches.length !== 3) {
      return new Error('Invalid input string');
    }
  
    response.type = matches[1];
    response.data = new Buffer(matches[2], 'base64');
  
    return response;
}



app.listen(4000, ()=> console.log("Server run on port 4000"))
