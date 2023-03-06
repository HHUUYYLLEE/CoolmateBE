// get the client
const mysql = require('mysql2/promise');

// get the promise implementation, we will use bluebird
const bluebird = require('bluebird');

// create the connection, specify bluebird as Promise
const connection = mysql.createPool({host:'localhost', user: 'root', database: 'coolmate_db', Promise: bluebird});

module.exports= connection