const {Router} = require('express');
const { ventasMesJulio, ventas } = require('../controllers/ventas.controllers');
const router = Router();


router.get('/ventasJulio', ventasMesJulio).get('/ventas', ventas);

module.exports = router;