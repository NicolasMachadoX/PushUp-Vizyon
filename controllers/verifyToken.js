const jwt = require('jsonwebtoken');
const config = require('../db/config');

const verifyToken = (req,res,next) => {
    const token = req.headers['x-access-token'];
    if(!token){
        res.status(401).json({auth: false, token: null})
    }
    const decode = jwt.verify(token, config.secret);
    req.userId = decode.id;
    next();
} 

module.exports = verifyToken;