CREATE TABLE if not exists departamentos(
	idDepartamento INT NOT NULL AUTO_INCREMENT,
	departamento VARCHAR(50),
    PRIMARY KEY(idDepartamento)
);

INSERT INTO departamentos (departamento) VALUES
("Buenos Aires"),("La Plata"),("Lezama");

CREATE TABLE if not exists municipios(
	idMunicipio INT NOT NULL AUTO_INCREMENT,
    municipio VARCHAR(40) NOT NULL,
    idDepartamento INT NOT NULL,
    PRIMARY KEY(idMunicipio),
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento)
);

INSERT INTO municipios (municipio, idDepartamento) VALUES ("La Matanza",1),("Berisso",2);

CREATE TABLE if not exists bodegas(
	idBodega INT NOT NULL AUTO_INCREMENT,
    telefono VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    idDepartamento INT NOT NULL,
    PRIMARY KEY(idBodega),
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento)
);

INSERT INTO bodegas (telefono, direccion,idDepartamento) VALUES ("+541143234312","Perez Castro 26",1),("+541143234334","San Juan 23",2);

CREATE TABLE if not exists tiendas (
	idTienda INT NOT NULL AUTO_INCREMENT,
    tienda VARCHAR(40) NOT NULL,
    idDepartamento INT NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    idBodega INT NOT NULL,
    PRIMARY KEY (idTienda),
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento),
    FOREIGN KEY (idBodega) REFERENCES bodegas(idBodega)
);

INSERT INTO tiendas (tienda, idDepartamento,direccion,idBodega) 
VALUES ("Bebidas Juancito",1,"Perez Castro 43",1),("Licoreia Augusto",1,"Juan Perez 543",1),("Por la Sed",2,"Sarmiento 432",2);

CREATE TABLE if not exists usuarios (
	idUsuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellido VARCHAR(40) NOT NULL,
    usuario VARCHAR(40) NOT NULL,
    psw VARCHAR(40) NOT NULL,
    rol VARCHAR(40) NOT NULL,
    idTienda INT NOT NULL,
    PRIMARY KEY (idUsuario),
    FOREIGN KEY (idTienda) REFERENCES tiendas(idTienda)
);
INSERT INTO usuarios (nombre, apellido,usuario,psw,rol,idTienda) 
VALUES ("Arturo","Freites","arthur106","12345qwert","USER",1),("David","Cassiet","eldavi12","12345qwert","USER",2);

CREATE TABLE if not exists perfiles (
	idPerfil INT NOT NULL AUTO_INCREMENT,
    tipoPerfil VARCHAR(40) NOT NULL,
    PRIMARY KEY (idPerfil)
);

CREATE TABLE if not exists perfilUsuario (
	idTipoPerfil INT NOT NULL AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    idPerfil INT NOT NULL,
    PRIMARY KEY (idTipoPerfil),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idPerfil) REFERENCES perfiles(idPerfil)
);

CREATE TABLE if not exists productos (
	idProducto INT NOT NULL AUTO_INCREMENT,
    CodProducto INT NOT NULL,
    valorUni FLOAT NOT NULL,
    costo FLOAT NOT NULL,
    cantidadLlego INTEGER NOT NULL,
    cantidadActual INTEGER NOT NULL,
    idTipoProducto INT NOT NULL,
    descripcion VARCHAR(60) NOT NULL,
    img VARCHAR(50) NOT NULL,
    PRIMARY KEY (idProducto),
    FOREIGN KEY (idTipoProducto) REFERENCES tipoProductos(idTipoProducto)
);

CREATE TABLE if not exists tipoProductos (
	idTipoProducto INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY (idTipoProducto)
);

CREATE TABLE if not exists traslados (
	idTraslado INT NOT NULL AUTO_INCREMENT,
    idTiendaActual INT NOT NULL,
    idTiendaNueva INT NOT NULL,
    idProducto INT NOT NULL,
    fechaTraslado DATE,
    PRIMARY KEY (idTraslado),
    FOREIGN KEY (idTiendaActual) REFERENCES tiendas(idTienda),
    FOREIGN KEY (idTiendaNueva) REFERENCES tiendas(idTienda),
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
);
CREATE TABLE if not exists TiendaProducto (
	idTiendaProducto INT NOT NULL AUTO_INCREMENT,
    idProducto INT NOT NULL,
    idTienda INT NOT NULL,
    cantidad INT NOT NULL,
    saldo DOUBLE,
    PRIMARY KEY (idTiendaProducto),
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
    FOREIGN KEY (idTienda) REFERENCES tiendas(idTienda)
);

CREATE TABLE if not exists clientes (
	idCliente INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(40) NOT NULL,
    numeroDoc VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefono VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    idDepartamento INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaNacimiento DATE NOT NULL,
    PRIMARY KEY (idCliente),
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)
);

CREATE TABLE if not exists facturaVenta (
	idfacturaVenta INT NOT NULL AUTO_INCREMENT,
    fechaInicio DATE NOT NULL,
    fechaFin VARCHAR(40) NOT NULL,
    estado VARCHAR(40) NOT NULL,
    idCliente INT NOT NULL,
    idUsuario INT NOT NULL,
    idTienda INT NOT NULL,
    PRIMARY KEY (idfacturaVEnta),
    FOREIGN KEY (idTienda) REFERENCES tiendas(idTienda),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

CREATE TABLE if not exists ventas (
	idVentas INT NOT NULL AUTO_INCREMENT,
    cantidad INT NOT NULL,
    tipoDescuento VARCHAR(40) NOT NULL,
    valorDescuento DOUBLE NOT NULL,
    idFactura INT NOT NULL,
    idProducto INT NOT NULL,
    PRIMARY KEY (idVentas),
    FOREIGN KEY (idFactura) REFERENCES facturaVenta(idfacturaVenta),
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
);

CREATE TABLE if not exists devoluciones (
	idDevolucion INT NOT NULL AUTO_INCREMENT,
    idProducto INT NOT NULL,
    fechaDevolucion DATE NOT NULL,
    PRIMARY KEY (idDevolucion),
    FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
);









