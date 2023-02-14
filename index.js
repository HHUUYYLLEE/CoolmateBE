const express= require("express")
const cors= require("cors")
const connection = require("./db")
const md5 = require("md5")
const { v4 } = require("uuid")
const Fuse= require("fuse.js")
const app= express()

app.use(express.json())
app.use(express.urlencoded({
    extended: true
}))
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
        const [rows]= await connection.execute("DELETE FROM cart WHERE id_user= ?", [req.body.id_user])
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



app.listen(4000, ()=> console.log("Server run on port 4000"))
