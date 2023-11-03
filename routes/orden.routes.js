const {Router} = require('express');
const { detallesOrden } = require('../controllers/orden.controllers');

const router = Router();

router.get('/detalles', detallesOrden);

module.exports = router;