DROP DATABASE IF EXISTS insti;
CREATE DATABASE IF NOT EXISTS insti;
USE insti;

DROP TABLE IF EXISTS modulo;
DROP TABLE IF EXISTS grupo;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS asignatura;
DROP TABLE IF EXISTS asignatura_modulos;
DROP TABLE IF EXISTS asignatura_profesores;
DROP TABLE IF EXISTS aula;
DROP TABLE IF EXISTS horario;

CREATE TABLE modulo (
  id INT PRIMARY KEY auto_increment,
  nombre varchar(255) NOT NULL
);

CREATE TABLE grupo (
  id INT PRIMARY KEY auto_increment,
  nombre varchar(255) NOT NULL,
  modulo_id INT NOT NULL,
  constraint fk_modulo_grupo FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);

CREATE TABLE usuario (
  id INT PRIMARY KEY auto_increment,
  nombre varchar(255) NOT NULL,
  apellidos varchar(255) NOT NULL,
  dni varchar(9) NOT NULL,
  direccion varchar(255) NOT NULL,
  tlf varchar(14) NOT NULL,
  profesor bool default false,
  grupo_id INT NULL default NULL,
  constraint fk_alumno_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(id)
);

CREATE TABLE asignatura (
  id INT PRIMARY KEY auto_increment,
  nombre varchar(255) NOT NULL
);

CREATE TABLE asignaturas_modulos (
	id INT PRIMARY KEY auto_increment,
    asignatura_id INT NOT NULL,
    modulo_id INT NOT NULL,
	constraint fk_am_asignatura_id FOREIGN KEY (asignatura_id) REFERENCES asignatura(id),
    constraint fk_am_modulo_id FOREIGN KEY (modulo_id) REFERENCES modulo(id)
);
CREATE TABLE asignaturas_profesores (
	id INT PRIMARY KEY auto_increment,
    asignatura_id INT NOT NULL,
    profesor_id INT NOT NULL,
	constraint fk_ap_asignatura_id FOREIGN KEY (asignatura_id) REFERENCES asignatura(id),
    constraint fk_ap_profesor_id FOREIGN KEY (profesor_id) REFERENCES usuario(id)
);

CREATE TABLE aula (
  id INT PRIMARY KEY auto_increment,
  nombre varchar(255) NOT NULL
);
CREATE TABLE horario (
	id INT PRIMARY KEY auto_increment,
    aula_id INT NOT NULL,
    profesor_id INT NOT NULL,
    grupo_id INT NOT NULL,
    asignatura_id INT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME DEFAULT NULL,
    dia_semana ENUM('l','ma', 'mi', 'j', 'v') NOT NULL,
	constraint fk_horario_aula_id FOREIGN KEY (aula_id) REFERENCES aula(id),
    constraint fk_horario_profesor_id FOREIGN KEY (profesor_id) REFERENCES usuario(id),
    constraint fk_horario_grupo_id FOREIGN KEY (grupo_id) REFERENCES grupo(id),
    constraint fk_horario_asignatura_id FOREIGN KEY (asignatura_id) REFERENCES asignatura(id)
);
