create database buses;
use buses;
create table modelos_buses(
	id int primary key auto_increment,
	marca varchar(255) not null,
    module varchar(255) not null
);
alter table modelos_buses change column module modelo varchar(255) not null;
create table buses(
	id int primary key auto_increment,
    matricula varchar(7) not null unique,
    fabricacion YEAR(4),
    modelos_buses_id int not null,
    constraint fk_modelo_bus FOREIGN KEY (modelos_buses_id) REFERENCES modelos_buses(id)
);
create table conductores (
	id int primary key auto_increment,
    nombre varchar(255) not null,
	apellidos varchar(255) not null,
    dni varchar(9) not null,
    tlf varchar(14) not null
);
create table paradas (
	id int primary key auto_increment,
    nombre varchar(255) not null,
    calle varchar(255) not null,
    número varchar(4) not null
);
create table lineas (
	id int primary key,
    hora_inicio time not null
);
create table itinerario (
	id int primary key auto_increment,
    id_linea int not null,
    id_parada int not null,
    orden tinyint not null,
    minutos_salida tinyint not null,
	constraint fk_itinerario_linea FOREIGN KEY (id_linea) REFERENCES lineas(id),
    constraint fk_itinerario_parada FOREIGN KEY (id_parada) REFERENCES paradas(id)
);
create table conductores_asignados (
	id_conductor int not null,
    id_bus int not null,
    id_linea int not null,
    constraint fk_asignados_conductor FOREIGN KEY (id_conductor) REFERENCES conductores(id),
	constraint fk_asignados_bus FOREIGN KEY (id_bus) REFERENCES buses(id),
	constraint fk_asignados_linea FOREIGN KEY (id_linea) REFERENCES lineas(id),
    PRIMARY KEY (id_conductor, id_bus, id_linea)
);

--
-- insertar datos
--
insert into modelos_buses(marca, modelo) values ('mercedes', 'modelo1');
insert into modelos_buses(marca, modelo) values ('mercedes', 'modelo2');
insert into modelos_buses(marca, modelo) values ('bwm', 'modelo3');
insert into buses values (null, '1111AAA', 1980, 1);
insert into buses values (null, '1111AAB', 1980, 1);
insert into buses values (null, '1111AAC', 1980, 1);
insert into buses values (null, '2222AAA', 1982, 2);
insert into buses values (null, '2222BBB', 1983, 2);
insert into buses values (null, '3333AAA', 1995, 3);
insert into conductores values (null, 'arsenio', 'iglesias', '12345678A', '666555777');
insert into conductores values (null, 'fernando', 'vazquez', '12345678B', '666555888');
insert into conductores values (null, 'mauro', 'silva', '12345678C', '666555999');
insert into paradas values (null, 'garcia byon 1', 'garcia bayon', 1);
insert into paradas values (null, 'garcia byon 2', 'garcia bayon', 45);
insert into paradas values (null, 'avda de la coruña 1', 'avda de la coruña', 12);
insert into paradas values (null, 'avda de la coruña 2', 'avda de la coruña', 77);
insert into paradas values (null, 'avda de la coruña 3', 'avda de la coruña', 115);
insert into paradas values (null, 'rua galicia 1', 'rua galicia', 3);
insert into paradas values (null, 'rua galicia 2', 'rua galicia', 19);
insert into lineas values (14, '10:00');
insert into lineas values (50, '10:15');
insert into lineas values (8, '10:30');
insert into itinerario values (null, 14, 1, 1, 0);
insert into itinerario values (null, 14, 2, 2, 10);
insert into itinerario values (null, 14, 6, 3, 15);
insert into itinerario values (null, 50, 1, 1, 0);
insert into itinerario values (null, 50, 3, 2, 10);
insert into itinerario values (null, 50, 4, 3, 15);
insert into itinerario values (null, 50, 5, 4, 18);
insert into itinerario values (null, 8, 1, 1, 0);
insert into itinerario values (null, 8, 2, 2, 10);
insert into itinerario values (null, 8, 4, 3, 15);
insert into itinerario values (null, 8, 6, 4, 22);
insert into itinerario values (null, 8, 5, 5, 28);
insert into conductores_asignados values (1, 1, 50);
insert into conductores_asignados values (2, 4, 50);
insert into conductores_asignados values (3, 6, 8);