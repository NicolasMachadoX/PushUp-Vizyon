CREATE TABLE cargos(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50),
	sueldo_base DOUBLE
)

CREATE TABLE color(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(255)
	);

CREATE TABLE forma_pago(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50)
	);

CREATE TABLE genero(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50)
	);

CREATE TABLE insumo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	valor_unit DOUBLE,
	stock_min DOUBLE,
	stock_max DOUBLE
	);

CREATE TABLE pais(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50)
	);

CREATE TABLE talla(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50)
	);

CREATE TABLE tipo_estado(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50)
	);

CREATE TABLE tipo_persona(
	id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50)
	);

CREATE TABLE tipo_proteccion(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50)
	);
CREATE TABLE departamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	IdPaisFk INT,
	FOREIGN KEY (IdPaisFk) REFERENCES pais(id)
	);

CREATE TABLE municipio(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	IdDepartamentoFk INT,
	FOREIGN KEY (IdDepartamentoFk) REFERENCES departamento(id)
	);

CREATE TABLE estado(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50),
	IdTipoEstadoFk INT,
	FOREIGN KEY (IdTipoEstadoFk) REFERENCES tipo_estado(id)
	);


CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
	IdCliente VARCHAR(255),
	nombre VARCHAR(255),
fechaRegistro DATE,
IdTipoPersonaFk INT,
	IdMunicipioFk INT,
	FOREIGN KEY (IdTipoPersonaFk) REFERENCES tipo_persona(id),
FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(id)
	);








CREATE TABLE empleado(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
fecha_ingreso DATE,
IdMunicipioFk INT,
	IdCargoFk INT,
	FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(id),
FOREIGN KEY (IdCargoFk) REFERENCES cargos(id)
	);


CREATE TABLE venta(
	id INT PRIMARY KEY AUTO_INCREMENT,
	Fecha  DATE,
IdEmpleadoFk INT,
	IdClienteFk INT,
	IdFormaPagoFk INT,
	FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(id),
FOREIGN KEY (IdClienteFk) REFERENCES cliente(id),
FOREIGN KEY (IdFormaPagoFk) REFERENCES forma_pago(id)
);

CREATE TABLE prenda(
	id INT PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(50),
ValorUnitCop DOUBLE,
ValorUnitUsd DOUBLE,
IdEstadoFk INT,
IdTipoProteccion INT,
IdGeneroFk INT,
Codigo VARCHAR(50),
FOREIGN KEY (IdEstadoFk ) REFERENCES estado(id),
FOREIGN KEY (IdGeneroFk) REFERENCES genero(id)
);

CREATE TABLE inventario(
	id INT PRIMARY KEY AUTO_INCREMENT,
CodInv VARCHAR(255),
IdPrendaFk INT,
ValorVtaCop DOUBLE,
ValorVtaUsd DOUBLE,	
	FOREIGN KEY (IdPrendaFk) REFERENCES prenda(id)
	);

CREATE TABLE detalle_venta(
	id INT PRIMARY KEY AUTO_INCREMENT,
IdVentaFk INT,
IdPrendaFk INT,
IdTallaFk INT,
cantidad INT,
valor_unit DOUBLE,	
	FOREIGN KEY (IdVentaFk) REFERENCES venta(id),
FOREIGN KEY (IdPrendaFk) REFERENCES prenda(id),
FOREIGN KEY (IdTallaFk) REFERENCES talla(id)
	);


INSERT INTO detalle_venta (IdVentaFk, IdPrendaFk, IdTallaFk, cantidad, valor_unit)
VALUES
(1, 1, 1, 2, 25000),
(2, 2, 2, 1, 37500),
(3, 3, 3, 3, 50000),
(4, 4, 4, 4, 62500),
(5, 5, 5, 5, 75000),
(6, 6, 6, 6, 12500);

CREATE TABLE orden(
	id INT PRIMARY KEY AUTO_INCREMENT,
fecha DATE,
IdEmpleadoFk INT,
IdClienteFk INT,
IdEstadoFk INT,
	FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(id),
FOREIGN KEY (IdClienteFk) REFERENCES cliente(id),
FOREIGN KEY (IdEstadoFk) REFERENCES estado(id)
	);

CREATE TABLE detalle_orden(
	id INT PRIMARY KEY AUTO_INCREMENT,
PrendaId INT,
cantidad_producir INT,
cantidad_producida INT,
IdColorFk INT,
IdOrdenFk INT,
IdPrendaFk INT,
IdEstadoFk INT,
	FOREIGN KEY (IdColorFk) REFERENCES color(id),
FOREIGN KEY (IdOrdenFk) REFERENCES orden(id),
FOREIGN KEY (IdPrendaFk) REFERENCES prenda(id),
FOREIGN KEY (IdEstadoFk) REFERENCES estado(id)
	);

CREATE TABLE empresa(
	id INT PRIMARY KEY AUTO_INCREMENT,
 	nit VARCHAR(50),
razon_social TEXT,
representante_legal VARCHAR(50),
FechaCreacion DATE,
IdMunicipioFk INT,
	FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(id)
	);

CREATE TABLE insumo_prendas(
	id INT PRIMARY KEY AUTO_INCREMENT,
	IdInsumoFk INT,
 	IdPrendaFk INT,	
	Cantidad INT,
	FOREIGN KEY (IdInsumoFk) REFERENCES insumo(id),
FOREIGN KEY (IdPrendaFk) REFERENCES prenda(id)
	);

CREATE TABLE inventario_talla(
	id INT PRIMARY KEY AUTO_INCREMENT,
	IdInvFk INT,
 	IdTallaFk INT,	
	FOREIGN KEY (IdInvFk) REFERENCES inventario(id),
FOREIGN KEY (IdTallaFk) REFERENCES talla(id)
	);


CREATE TABLE proveedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NitProveedor VARCHAR(50),
	Nombre VARCHAR(50),
	IdTipoPersona INT,
 	IdMunicipioFk INT,	
	FOREIGN KEY (IdTipoPersona) REFERENCES tipo_persona(id),
FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(id)
	);


CREATE TABLE insumo_proveedor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	IdInsumoFk INT,
 	IdProveedorFk INT,	
	FOREIGN KEY (IdInsumoFk) REFERENCES insumo(id),
FOREIGN KEY (IdProveedorFk) REFERENCES proveedor(id)
	);






