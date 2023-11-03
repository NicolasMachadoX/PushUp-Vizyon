const express = require('express');
const cors = require('cors');
const mysqlConexion = require('../db/mysqlConexion');
const morgan = require('morgan');

class Server {

    constructor(){

        this.app = express();

        this.port = process.env.PORT;

        this.app.use(morgan('dev'));
        
        this.paths = {
            user: '/api/user',
            ventas: '/api/ventas',
            orden: '/api/orden',
            proveedores: '/api/proveedores'

        }

        this.middleware();

        this.ConexionDatabase();
    

        this.routes();
    }

    async ConexionDatabase(){
        await mysqlConexion();
    }

    routes(){
        this.app.use(this.paths.user, require('../routes/user.routes'));
        this.app.use(this.paths.ventas, require('../routes/venta.routes'));
        this.app.use(this.paths.orden, require('../routes/orden.routes'));
        this.app.use(this.paths.proveedores, require('../routes/proveedores.routes'));
    }

    middleware(){
        this.app.use(express.json());
        this.app.use(express.urlencoded({extended:false}));
        this.app.use(cors);
    }

    listen(){
        this.app.listen(this.port,()=>{
            console.log(`Server running in port: ${this.port}`);
        })
    }


};

module.exports = Server;