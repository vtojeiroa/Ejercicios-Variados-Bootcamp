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

INSERT INTO modulo VALUES (null, 'desarrolo apps 1');
INSERT INTO modulo VALUES (null, 'desarrolo apps 2');
INSERT INTO modulo VALUES (null, 'inef');
INSERT INTO modulo VALUES (null, 'magisterio');

INSERT INTO grupo VALUES (null, 'grupo1', 1);
INSERT INTO grupo VALUES (null, 'grupo2', 1);
INSERT INTO grupo VALUES (null, 'grupo3', 2);

INSERT INTO usuario VALUES (null, 'jose', 'blanco', '12345678A', 'plaza españa 1', '666777888', true, null);
INSERT INTO usuario VALUES (null, 'jose', 'mato', '12345678B', 'plaza españa 2', '666777999', true, null);
INSERT INTO usuario VALUES (null, 'alumno1', 'alumno1', '11111111A', 'plaza españa 15', '666777111', false, 1);
INSERT INTO usuario VALUES (null, 'alumno2', 'alumno2', '11111111A', 'plaza españa 15', '666777111', false, 1);
INSERT INTO usuario VALUES (null, 'alumno3', 'alumno3', '11111111A', 'plaza españa 15', '666777111', false, 1);
INSERT INTO usuario VALUES (null, 'alumno4', 'alumno4', '11111111A', 'plaza españa 15', '666777111', false, 2);
INSERT INTO usuario VALUES (null, 'alumno5', 'alumno5', '11111111A', 'plaza españa 15', '666777111', false, 3);

INSERT INTO asignatura VALUES (null, 'javascript 1');
INSERT INTO asignatura VALUES (null, 'javascript 2');
INSERT INTO asignatura VALUES (null, 'sql');
INSERT INTO asignatura VALUES (null, 'frrontend');
INSERT INTO asignatura VALUES (null, 'backend');

INSERT INTO asignaturas_modulos VALUES (null, 1, 1);
INSERT INTO asignaturas_modulos VALUES (null, 2, 1);
INSERT INTO asignaturas_modulos VALUES (null, 3, 1);
INSERT INTO asignaturas_modulos VALUES (null, 4, 2);
INSERT INTO asignaturas_modulos VALUES (null, 5, 2);

INSERT INTO asignaturas_profesores VALUES (null, 1, 2);
INSERT INTO asignaturas_profesores VALUES (null, 2, 2);
INSERT INTO asignaturas_profesores VALUES (null, 3, 1);
INSERT INTO asignaturas_profesores VALUES (null, 4, 2);
INSERT INTO asignaturas_profesores VALUES (null, 5, 1);

INSERT INTO aula VALUES (null, 'aula1');
INSERT INTO aula VALUES (null, 'aula2');
INSERT INTO aula VALUES (null, 'sala de eventos');

INSERT INTO horario VALUES (null, 1, 1, 1, 1, '09:00', '10:00', 'l');
INSERT INTO horario VALUES (null, 1, 1, 1, 1, '10:00', '11:00', 'l');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '11:30', '12:30', 'l');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '12:30', '14:00', 'l');
INSERT INTO horario VALUES (null, 1, 1, 1, 1, '09:00', '10:00', 'ma');
INSERT INTO horario VALUES (null, 1, 1, 1, 1, '10:00', '11:00', 'ma');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '11:30', '12:30', 'ma');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '12:30', '14:00', 'ma');
INSERT INTO horario VALUES (null, 1, 1, 1, 1, '09:00', '10:00', 'j');
INSERT INTO horario VALUES (null, 1, 1, 1, 1, '10:00', '11:00', 'j');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '11:30', '12:30', 'j');
INSERT INTO horario VALUES (null, 1, 2, 1, 4, '12:30', '14:00', 'j');
INSERT INTO horario VALUES (null, 2, 2, 1, 2, '09:00', '10:00', 'mi');
INSERT INTO horario VALUES (null, 2, 2, 1, 2, '10:00', '11:00', 'mi');
INSERT INTO horario VALUES (null, 2, 1, 1, 3, '11:30', '12:30', 'mi');
INSERT INTO horario VALUES (null, 2, 1, 1, 5, '12:30', '14:00', 'mi');
INSERT INTO horario VALUES (null, 2, 2, 1, 2, '09:00', '10:00', 'v');
INSERT INTO horario VALUES (null, 2, 2, 1, 2, '10:00', '11:00', 'v');
INSERT INTO horario VALUES (null, 2, 1, 1, 3, '11:30', '12:30', 'v');
INSERT INTO horario VALUES (null, 2, 1, 1, 5, '12:30', '14:00', 'v');


-- transacciones
START TRANSACTION;
INSERT INTO asignatura VALUES (null, 'javascript 3');
INSERT INTO aula VALUES ('nueva aula (en obras)');
-- comprobamos q el insert del aula da error (falta el ID) y hacemos rollback
ROLLBACK;

-- START TRANSACTION;
START TRANSACTION;
INSERT INTO asignatura VALUES (null, 'javascript 3');
INSERT INTO aula VALUES (null, 'nueva aula (en obras)');
COMMIT;


-- 1. listado de horarios con el nombre del aula, dia de la semana, hora de inicio y fin, 
-- nombre y apellidos del profesor q la imparte, nombre de la asignatura y nombre del grupo

select a.nombre, h.dia_semana, h.hora_inicio, h.hora_fin, p.nombre, p.apellidos, ag.nombre, g.nombre from horario h, usuario p, aula a, grupo g, asignatura ag; 


-- 2. listado de horarios del lunes para el grupo con nombre 'grupo1'

select h.* from horario h
where h.grupo_id in(
 select id from grupo where nombre = 'grupo1') and h.dia_semana ='l';

-- 3. listado de horarios de jueves y viernes para 'jose mato'

select h.* from horario h
where h.profesor_id in (
select id from usuario where nombre ='jose' and apellidos ='mato' and profesor= 1) and h.dia_semana in ('j','v');


-- 4. listado de asignaturas q imparte cada profesor con el nombre 
-- y apellidos del profesor y nombre de la asignatura
select a.nombre, p.nombre, p.apellidos from asignatura a, usuario p, asignaturas_profesores ap
where a.id = ap.asignatura_id and p.id = ap.profesor_id;


-- 5. listado asignaturas del módulo 'desarrolo apps 1'

select a.* from asignatura a, asignaturas_modulos am 
where a.id = am.asignatura_id and am.modulo_id in (
select id from modulo where nombre ='desarrolo apps 1');

select g.* , m.* from grupo g, modulo m where g.modulo_id=m.id;

-- 6. listado de alumnos del grupo 'grupo1'
select u.* from usuario u
where grupo_id in (
	select id from grupo where nombre = 'grupo1'
);

-- 7. listado de todos los alumnos

select * from usuario where profesor = false;