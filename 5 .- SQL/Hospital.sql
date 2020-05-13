create database ejericio5_clinica;
use ejericio5_clinica;

create table paciente (
	id int primary key auto_increment,
    nombre varchar(255) not null,
    apellidos varchar(255) not null,
    fecha_nacimiento date not null,
    tlf int not null
);
create table medico (
	id int primary key auto_increment,
    nombre varchar(255) not null,
    apellidos varchar(255) not null,
    especialidad  varchar(50) not null,
    tlf int not null
);
create table ingreso (
	id int primary key auto_increment,
    cama smallint not null,
    habitacion smallint not null,
    fecha datetime not null,
    id_paciente int not null,
    id_medico int not null,
    foreign key (id_paciente) references paciente(id),
    foreign key (id_medico) references medico(id)
);
create table direccion (
	id int primary key auto_increment,
	calle varchar(255) not null,
    num smallint not null,
    codigo_postal varchar(5) not null
);
alter table paciente add column direccion_id int;
alter table paciente add foreign key (direccion_id) references direccion(id);
alter table medico add column direccion_id int;
alter table medico add foreign key (direccion_id) references direccion(id);

desc medico;