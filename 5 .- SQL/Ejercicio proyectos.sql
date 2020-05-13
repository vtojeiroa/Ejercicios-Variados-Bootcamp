USE hb_employees;


select * from employee;
select * from department;


create table project (
id int primary key auto_increment,
name varchar(255) not null unique,
init_date date not null,
end_date date default null
);

create table assignments(
id_employee int not null,
id_project int not null,
init_date date not null,
end_date date default null,
constraint fk_assignment_employee foreign key (id_employee) references employee(id),
constraint fk_assignment_project foreign key (id_project) references project(id)
);

-- 2. crear datos en proyectos
-- crear 3 proyectos por lo menos con los nombres 'app vdeoclub', 'app gestion tienda informatica' y 'web catalogo peliculas'
-- 'app gestion tienda informatica' debe tener la fecha en el pasado (hace 10 dias)
insert into project(name, init_date) values('app videoclub', CURRENT_DATE());
insert into project values(0, 'app gestion tienda informatica', DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY), null);
insert into project values(null, 'web catalogo peliculas', CURRENT_DATE(), null);

-- 3. comprobar los datos de la tabla
SET SQL_SAFE_UPDATES = 0;
update project set end_date = null;
alter table project change column start_date init_date date not null;
select * from project;

-- 4. borrar todos los datos de proyectos y crearlos de nuevo usando una transancción
delete from project;

start transaction;
insert into project(name, init_date) values('app videoclub', CURRENT_DATE());
insert into project values(0, 'app gestion tienda informatica', DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY), null);
insert into project values(null, 'web catalogo peliculas', CURRENT_DATE(), null);
commit;

-- 5. comprobamos de nuevo
select * from project;

-- 6. comprobamos todos los empleados y proyectos, por separado, no es necesario usar join aquí
-- apuntad unas cuantos ids de proyectos q vamos a usar con los employees 7369, 7499, 7521, 7566
select * from employee; -- anotamos ids para usar luego: 7369, 7499, 7521, 7566
select * from project;  -- anotamos ids para usar luego: 4, 5, 6
select * from assignments;

-- asignar por lo menos 1 empleado a cada proyecto 
-- asignar varios empleados por lo menos a 1 proyecto
desc assignments;
insert into assignments values (7369, 4, CURRENT_DATE(), null);
alter table assignments modify end_date datetime default null;
insert into assignments (id_employee, id_project, init_date) values (7499, 5, CURRENT_DATE());
insert into assignments (id_employee, id_project, init_date) values (7521, 6, DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY));
insert into assignments (id_employee, id_project, init_date) values (7566, 6, DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY));
insert into assignments (id_employee, id_project, init_date) values (7499, 6, DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY));
insert into assignments values (7521, 4, current_date(),null);
insert into assignments (id_employee, id_project, init_date) values (7521, 5, DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY));
-- comprobad los registros insertados
select *  from assignments;

-- cambiar las fechas del proyecto q empezó hace 10 días y poner fecha de finalización hace 5 días
select * from project; -- comprobamos el ID si queremos del proyecto en concreto
update project 
set end_date = DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY)
where id = 5;
update project 
set end_date = DATE_ADD(end_date, INTERVAL 1 DAY)
where id = 5;

-- creamos un assigment de un empleado a cualquiera de los proyectos 
-- q sea en el pasado y ya se haya terminado
insert into assignments values (
	7521,
    6,
    DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY),
	DATE_SUB(CURRENT_DATE(), INTERVAL 5 DAY)
);

select * from project;

select * from assignments;


-- CONSULTAS
--

-- 1. lista de empleados trabajando en algún proyecto en este momento
select distinct e.* from employee e, assignments a
where e.id = a.id_employee
and a.end_date is null;

select * from assignments;

-- 2, lista de empleados sin proyecto
select * from employee
where not id in (
	select distinct id_employee from assignments where end_date is null
);

-- 3. lista de todos los empleados y sus proyectos, si es q están asignados
select * from employee e left join assignments a
on e.id = a.id_employee;
select * from employee e inner join assignments a
on e.id = a.id_employee;

-- 4. mostrar los proyectos del empleado WARD (7521)

select distinct * from project 
inner join assignments
on project.id = assignments.id_project
 where id_employee in (select id from employee where name ='WARD') ;

-- 4b. mostrar los proyectos en los q trabajó el empleado WARD en el pasado

select distinct * from project 
inner join assignments
on project.id = assignments.id_project
 where id_employee in (select id from employee where name ='WARD') having assignments.end_date is not null ;

-- 4c. mostrar los proyectos en los q trabajó el empleado WARD en el pasado y el proyecto haya finalizado ya
select * from project 
inner join assignments
on project.id = assignments.id_project
 where  id_employee in (select id from employee where name ='WARD') having project.end_date is not null;
 
 -- 5. mostrar los proyectos activos

select * from project where end_date is null;

-- 6. mostrar los proyectos terminados

select * from project where end_date is not null;

-- 7. mostrar todos los empleados del proyecto 'app video club'

select e.* from employee e inner join assignments a on e.id = a.id_employee where a.id_project in (select id from project where name = 'app videoclub');


-- 8. mostrar todos los empleados activamente trabajando proyecto 'web catalogo peliculas'

select e.* from employee e inner join assignments a on e.id = a.id_employee where a.id_project in (select id from project where name = 'web catalogo peliculas' and end_date is null);
