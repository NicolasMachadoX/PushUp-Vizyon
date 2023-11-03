const {Router} = require('express');
const { register, login, getAll, getById, post, delet, update, empleadosCargo } = require('../controllers/user.controllers');
const verifyToken = require('../controllers/verifyToken');

const router = Router();

router.post('/register', register).post('login', verifyToken, login);

router.get('/getAll', getAll).get('/get/:id', getById).post('/post', post).put('/update/:id', update).delete('/delete/:id', delet)
.get('/empleadosCargo' ,empleadosCargo);

module.exports = router;