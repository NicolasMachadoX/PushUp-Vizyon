const mysqlConexion = require('../db/mysqlConexion');

const insumosProveedores = async(req,res) =>{
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT proveedor.id FROM proveedor INNER JOIN insumo_proveedor ON proveedor.IdInsumoFk = insumo_proveedor.id');
        res.json({result});
        
    } catch (error) {
        res.status(401).json({error});
    }
};

module.exports = {insumosProveedores};