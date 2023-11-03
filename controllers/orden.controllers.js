const mysqlConexion = require('../db/mysqlConexion');

const detallesOrden = async(req,res) =>{
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT empleado FROM empleado INNER JOIN municipio ON empleado.IdMunicipioFk = municipio.id');
        res.json({result});
        
    } catch (error) {
        res.status(401).json({error});
    }
};

module.exports = detallesOrden;