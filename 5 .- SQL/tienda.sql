-- create table cliente(
-- id int primary key auto_increment,
-- nombre varchar(255) not null,
-- apellido varchar(255) not null,
-- fecha_nacimiento date
-- );

-- create table producto(
-- id int primary key auto_increment,
-- nombre varchar(255) not null,
-- precio decimal(10,2) not null
-- );

-- create table proveedor(
-- nie varchar(9) primary key,
-- nombre varchar(255) not null,
-- direccion varchar(255) not null
-- );

 -- desc cliente;
 
--  alter table cliente
--  modify fecha_nacimiento date not null after name;
-- alter table cliente modify rfc varchar(255) not null defaul'unknow';

-- create table compra(
-- id_cliente int,
-- id_producto int,
-- fecha_compra datetime not null,
-- foreign key (id_cliente) references cliente(id),
-- foreign key (id_producto)references producto(id)
-- );

-- desc compra;

-- alter table producto
-- add column nie_proveedor varchar(9) not null;
-- alter table producto
-- add constraint FK_proveedor_producto
-- foreign key (nie_proveedor) references proveedor(nie);

-- renombrar una tabla

-- alter table cliente
-- change column nombre name  varchar(255) not null;

-- borrar una columna
-- alter table producto drop foreign key FK_proveedor_producto;