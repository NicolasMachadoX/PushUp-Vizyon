const config = require('../db/config');
const mysqlConexion = require('../db/mysqlConexion');
const encryptPassword = require('../handlers/EncryptPassword');
const validatePassword = require('../handlers/ValidatePassword');
const jwt = require('jsonwebtoken');

const register = async (req,res) => {
    try {
        const {name,email,password} = req.body;
        const newUser = {name,email,password};

        //encrypted 
        newUser.password = await encryptPassword(newuser.password);

        //token

        const token = jwt.sign({id: newUser.id}, config.secret, {expiresIn: 60*60*24});
        res.status(202).json({auth: true, token});

        const conexion = await mysqlConexion();
        const result = await conexion.query('INSERT INTO empleado set ?',[newUser]);
        res.json({result});
        
    } catch (error) {
        res.status(401).json({error});
    }
};

const login = async (req,res) => {
    try {
        const {email,password} = req.body;


        const conexion = await mysqlConexion();
        const emailExists = await conexion.query('SELECT * FROM empleado WHERE email = ?',[email]);

        if(!emailExists){
            res.status(404).json({data: 'data no found'});
        }

        const isPasswordValid = validatePassword(password);

        if(!isPasswordValid){
            res.status(404).json({data: 'data no found'});
        }

        //token

        const token = jwt.sign({id: newUser.id}, process.SECRET, { expiresIn: 60*60*24});
        res.json({auth:true , token});

        
    } catch (error) {
        res.status(401).json({error});
    }
}


const getAll = async (req,res) => {
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT * FROM empleado');
        
    } catch (error) {
        res.status(401).json({error});
    }
};

const getById = async (req,res) => {
    try {
        const id = req.params.id;
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT * FROM empleado WHERE id = ?',[id]);
        res.json({result})
    } catch (error) {
        res.status(401).json({error});
    }
};


const post = async (req,res) => {
    try {
        const newuser = req.body;
        const conexion = await mysqlConexion();
        const result = await conexion.query('INSERT INTO empleado set ?',[newuser]);
        res.json({msg: result});
    } catch (error) {
        res.status(401).json({error});
    }
};


const update = async (req,res) => {
    try {
        const id = req.params.id;
        const updateData  = req.body;
        const conexion = await mysqlConexion();
        const result = await conexion.query('UPDATE empleado set nombre = ?,email = ?,password = ?,fecha_ingreso = ? WHERE id = ?',[id, updateData]);
        res.json({msg: 'update succesfully'})
    } catch (error) {
        res.status(401).json({error});
    }
};


const delet = async (req,res) => {
    try {
        const id = req.params.id;
        const conexion = await mysqlConexion();
        const result = await conexion.query('DELETE * FROM empleado WHERE id = ?',[id]);
        res.json({result})
    } catch (error) {
        res.status(401).json({error});
    }
};

const empleadosCargo = async (req,res) => {
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT empleado.cargo FROM empleado INNER JOIN municipio ON empleado.IdMunicipioFk = municipio.id');
        res.json({result});
        
    } catch (error) {
        res.status(401).json({error});
    }
};

module.exports = {
    register,
    login,
    getAll,
    post,
    update,
    delet,
    getById,
    empleadosCargo
}