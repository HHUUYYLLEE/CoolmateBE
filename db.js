// get the client
const mysql = require('mysql2/promise');

// get the promise implementation, we will use bluebird
const bluebird = require('bluebird');

// create the connection, specify bluebird as Promise
const connection = mysql.createPool({host:'127.0.0.1', user: 'huy2', database: 'coolmate', password: '123456', Promise: bluebird});

module.exports= connection