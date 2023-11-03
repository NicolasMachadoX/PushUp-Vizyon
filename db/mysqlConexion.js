const mysql = require('promise-mysql');
const config = require('./config');

const Conexion = mysql.createConnection({
    user: config.username,
    password: config.password,
    database: config.database,
    host: config.host

})

const mysqlConexion = () => {
    console.log('Conexion with  MySQL database sucessfully');
    return Conexion;
}

module.exports = mysqlConexion;