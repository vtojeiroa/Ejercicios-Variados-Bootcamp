create database ejercicio4_concesionario;
use ejercicio4_concesionario;

create table cliente (
	id int primary key auto_increment,
    nombre varchar(255) not null,
    direccion varchar(255) not null,
    NIF varchar(9) not null
);
create table coche (
	matricula varchar(7) primary key,
    marca varchar(15) not null,
    modelo varchar(15) not null,
    color varchar(10) not null,
    precio decimal(10,2) not null,
    id_cliente int
);

create table revision (
	id int primary key auto_increment,
    cambio_filtro boolean default false,
	cambio_aceite boolean default false,
    cambio_frenos boolean default false,
	fecha datetime,
    id_coche int not null
);


alter table revision
change column id_coche matricula_coche varchar(7) not null;

alter table revision
add constraint FK_revision_coche foreign key (matricula_coche) references coche(matricula);

alter table coche
add foreign key (id_cliente) references cliente(id);