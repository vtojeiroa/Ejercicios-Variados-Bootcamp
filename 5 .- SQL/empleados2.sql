DROP DATABASE IF EXISTS hb_employees2;
CREATE DATABASE IF NOT EXISTS hb_employees2;
USE hb_employees2;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

CREATE TABLE department (
  id INT PRIMARY KEY,
  name varchar(14) NOT NULL,
  location varchar(13) NOT NULL
);
CREATE TABLE employee (
  id INT PRIMARY KEY,
  name varchar(10) NOT NULL,
  job varchar(9) NOT NULL,
  manager_id INT DEFAULT NULL,
  hire_date date NOT NULL,
  salary decimal(7,2) NOT NULL,
  commission decimal(7,2) default NULL,
  department_id INT NOT NULL,
  constraint fk_department FOREIGN KEY (department_id) REFERENCES department(id),
  constraint fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) on delete set null on update set null
);
-- desc employee;

INSERT INTO department VALUES ('10','ACCOUNTING','NEW YORK');
INSERT INTO department VALUES ('20','RESEARCH','DALLAS');
INSERT INTO department VALUES ('30','SALES','CHICAGO');
INSERT INTO department VALUES ('40','OPERATIONS','BOSTON');

select * from department;

-- con FK manager null y department not null (los departments ya deben existir)
INSERT INTO employee VALUES (1,'SMITH','CLERK',8888,'1980-12-17','800.00',NULL, 20);
INSERT INTO employee VALUES (3,'SMITH','CLERK',NULL,'1980-12-17','800.00',NULL, null);
INSERT INTO employee VALUES (2,'SMITH','CLERK',NULL,'1980-12-17','800.00',NULL, 20);
INSERT INTO employee VALUES (1,'SMITH','CLERK',2,'1980-12-17','800.00',NULL, 20);
select * from employee;

alter table department
modify name  varchar(15) not null unique;

-- sin FKs en manager
alter table employee drop foreign key fk_manager;
INSERT INTO employee VALUES (7439,'SMITH','CLERK',7839,'1980-12-17','800.00',NULL, 20);
INSERT INTO employee VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO employee VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO employee VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO employee VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO employee VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO employee VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO employee VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO employee VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO employee VALUES ('7840','KINGKONG','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO employee VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO employee VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO employee VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO employee VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO employee VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

-- creamos la FK de nuevo
alter table employee add constraint fk_manager 
FOREIGN KEY (manager_id) REFERENCES employee(id) 
on delete set null on update set null;

-- nos da error porque el empleado 2222 no existe
INSERT INTO employee VALUES (1111,'SMITH','CLERK',2222,'1980-12-17','800.00',NULL, 20);
-- lo creamos
INSERT INTO employee VALUES (2222,'SMITH','CLERK',null,'1980-12-17','800.00',NULL, 20);
-- y ahora ya funciona
INSERT INTO employee VALUES (1111,'SMITH','CLERK',2222,'1980-12-17','800.00',NULL, 20);

-- mantine la integridad y nos da error al intentar eliminar el department
delete from department where id = 10;
-- en cambio los empleados, a pesar de ser manager de otro empleado, sí lo podemos borrar porque es opcional
delete from employee where id = 2;

-- transacciones
START TRANSACTION;
INSERT INTO department VALUES ('50','LAWYER','TEXAS');
INSERT INTO employee VALUES (1,'SMITH','CLERK', null,'1980-12-17','800.00', NULL, 50);
INSERT INTO employee VALUES (1,'NEO','CLERK', null,'1980-12-17','800.00', NULL, 50);
-- comprobamos q solo SMITH se creó, y hacemos rollback para vovler al estado inicial
ROLLBACK;

START TRANSACTION;
INSERT INTO department VALUES ('50','LAWYER','TEXAS');
INSERT INTO employee VALUES (1,'SMITH','CLERK', null,'1980-12-17','800.00', NULL, 50);
INSERT INTO employee VALUES (2,'NEO','CLERK', null,'1980-12-17','800.00', NULL, 50);
-- comprobamos q están SMITH y NEO y hacemos commit para confirmar
COMMIT;