const mysqlConexion = require('../db/mysqlConexion');

const ventasMesJulio = async (req,res) => {
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT * FROM venta WHERE Fecha = 2023-06-00');
        res.json({result});
        
    } catch (error) {
        res.status(401).json({error});
    }
};

const ventas = async (req,res) =>{
    try {
        const conexion = await mysqlConexion();
        const result = await conexion.query('SELECT venta.id, forma_pago.id FROM venta, tipo_pago INNER JOIN cliente ON cliente.idClienteFk = cliente.id ');
        res.json({result});
    } catch (error) {
        res.status(401).json({error})
    }
}

module.exports = {

    ventasMesJulio,
    ventas

}