const {config} = require('dotenv');

config();

module.exports = {
    username: process.env.USER_NAME,
    password: process.env.PASSWORD,
    host: process.env.HOST,
    database: process.env.DATABASE,
    secret: process.env.SECRET

}