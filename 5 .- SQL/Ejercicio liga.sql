create database liga;

use liga;

create table presidente(
	dni varchar(9) primary key,
    nombre varchar(255) not null,
    apellidos varchar(255) not null,
    fecha_nacimiento date,
    fecha_eleccion date
);
-- el estadio podría ser un atributo del equipo
-- pero en realidad tambien necesitamos el aforo
-- y el aforo no es un atributo del equipo, no tiene mucho sentido tenerlo en la misma entidad
create table estadio (
	id int primary key auto_increment,
    nombre varchar(255) not null,
    aforo smallint not null
);
create table equipo (
	id int primary key auto_increment,
    ciudad varchar(50) not null,
    nombre varchar(255) unique,
    fundado_en YEAR(4) not null,
    dni_presidente varchar(9) not null,
    id_estadio int not null,
	constraint fk_presi foreign key (dni_presidente) references presidente(dni),
	constraint fk_estadio foreign key (id_estadio) references estadio(id)
);
alter table presidente drop column fecha_eleccion;
alter table presidente add column elegido_en year(4) not null;
-- podríamos llevar la cuenta de los goles en la tabla partido, pero podríamos tener incongruencias si el numero de goles en esta tabla no coincide con el numero de filas que tenemos en la tabla Gol para este partido
create table partido (
	id int primary key auto_increment,
    fecha datetime not null
 --   goles_equipo_casa tinyint not null default 0,
);
-- aqui tenemos una tabla a mayores porque hicimos una relación M:N
-- otra solución, como en este caso sabemos que los partidos solo van a participar 2 equipos, sería tener 2 claves foráneas id_equipo_casa, id_equipo_visitante, ambas con referencia a Equipo(id)
create table equipos_partido (
	id_partido int not null,
    id_equipo int not null,
    constraint fk_equipo_partido_partido foreign key (id_partido) references partido(id),
	constraint fk_equipo_partido_equipo foreign key (id_equipo) references equipo(id)
);
create table jugador (
	id int primary key auto_increment,
    id_equipo int not null,
    nombre varchar(255) not null,
    fecha_nacimiento date not null,
    posicion enum('portero', 'defensa', 'centrocampista', 'delantero'),
    constraint fk_jugadores_equipo foreign key (id_equipo) references equipo(id)
);
create table gol (
	id_partido int not null,
    id_jugador int not null,
    descripcion varchar(255) not null,
    constraint fk_goles_partido foreign key (id_partido) references partido(id),
    constraint fk_goles_jugador foreign key (id_jugador) references jugador(id)
);
