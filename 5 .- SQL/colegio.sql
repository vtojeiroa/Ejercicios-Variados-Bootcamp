-- create table profesor(
-- DNI varchar(9),
-- nombre varchar(255) not null,
-- direccion varchar(255),
-- tlf int not null,
-- primary key (DNI)
-- );

-- create table modulo(
-- ID int primary key auto_increment,
-- nombre varchar(255) not null,
-- dni_profesor varchar(9) references profesor(DNI)
-- );

-- create table alumno (
-- num_expediente varchar(15) primary key,
-- nombre varchar(255) not null,
-- apellidos varchar(255) not null,
-- fecha_nacimiento date not null
-- );

-- create table matriculas_modulo (
-- id_modulo int,
-- num_expediente_alumno varchar(15),
-- foreign key (id_modulo) references modulo(ID),
-- foreign key (num_expediente_alumno) references alumno(num_expediente)
-- );

-- alter table modulo
-- add column num_expediente_delegado varchar(15) not null;

alter table  modulo
add constraint FK_modulo_delegado
foreign key (num_expediente_delegado) references alumno (num_expediente);
