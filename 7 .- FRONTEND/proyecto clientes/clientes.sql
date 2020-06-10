CREATE DATABASE clientes;

USE clientes;

CREATE TABLE lista_clientes(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(500),
apellido VARCHAR(500),
ciudad VARCHAR (500),
empresa VARCHAR(500)
); 

CREATE TABLE usuarios(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(500),
password VARCHAR(500),
isAdmin BOOLEAN NOT NULL

);


Select * from lista_notas;



INSERT INTO lista_clientes (nombre,apellido,ciudad,empresa) VALUES ('manuel','perez','coruña','repsol');

INSERT INTO usuarios  (usuario,password,isAdmin) VALUES ('admin','admin',1),
														('user','user',0);




