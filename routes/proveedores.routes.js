const {Router} = require('express');
const { insumosProveedores } = require('../controllers/orden.controllers');

const router = Router();

router.get('/insumosProveedores', insumosProveedores);

module.exports = router;