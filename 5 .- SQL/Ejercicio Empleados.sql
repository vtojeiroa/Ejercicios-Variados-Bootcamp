use hb_employees;

-- 21 Obten los nuevos salarios de los empleados del departamento 30, que resultarian de sumar a su salario una gratificación de 1000.
--     Muestra también los nombres de los empleados

 select name, (salary + 1000) from employee where department_id ='30';

-- 22 Lo mismo que la anterior, pero mostrando también su salario original, y haz que la columna que almaccena el nueva salario se denonime new_sal

  select name, salary, (salary + 1000) as new_sal from employee where department_id ='30';

-- 23 Halla los empleados que tienen una comision superior a la mitad de su salario.

 select name, (coalesce(commission,0) > (salary/2))  from employee;

-- 24 Halla los empleados que no tienen comision, o que la tengan menor o igual que el 25% de su salario.

 select name, salary, commission from employee where not coalesce(commission,0) or (coalesce(commission,0) <=(25*salary/100));

-- 25 Obten una lista de los nombres de los empleados y sus saldarios de forma que en la salida aparezca en todas las filas 'Name:' and 'Salary:' antes
--     del respectivo campo. Las columnas de la tabla deben llamarse 'Name' y 'Salary

 select (concat_ws(' ','Name:',name)) as Name, (concat_ws(' ','Salary:', salary)) as Salary from employee ;

-- 26. Hallar el codigo, salario y comision de los empleados cuyo codigo sea mayor que 7500.

 select id, salary, commission from employee where (id > 7500);

-- 27. Obten todos los datos de los empleados que esten ordenados alfabeticamente y la primera letra sea J o mayor.
--     https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_substring

 select * from employee  where name >= 'J%' order by name asc; 
 select * from employee  where name between 'J%' and 'Z%' order by name asc; 

-- 28. Obten el salario, comision y salario total (salario+comision) de los empleados con comision,
--     ordenando el resultado por numero de empleado.
--     OJO: Solo con comprobar con IS NOT NULL no es suficiente porque hay un empleado cuya comisión  es 0.
--     Suponemos que NULL nos indica que no tiene comision

 select salary, id, commission, (salary + coalesce(commission,0)) as salario_total from employee where commission>0 order by id;

-- 29. Lista la misma informacion, pero para los empleados que no tienen comision.

  select salary, commission, (salary + coalesce(commission,0)) as salario_total from employee where not coalesce(commission,0) order by id;

-- 30. Muestra el nombre de los empleados que, teniendo un salario superior a 1000, tengan como jefe
--     al empleado cuyo codigo es 7698.

 select name from employee where salary>1000 and manager_id= 7698;

-- 31. Halla el conjunto complementario del resultado del ejercicio anterior.

  select name from employee where  not salary>1000 or not coalesce(manager_id= 7698,0);
 
-- DIFICIL

-- 32. Indica para cada empleado el porcentaje que supone su comision sobre su salario, ordenando el
--     resultado por el nombre del mismo empleado.

 select name, ((coalesce(commission,0)/salary)*100) from employee order by name;

-- 33. Hallar los empleados del departamento 10 cuyo nombre no contiene la cadena LA.

 select name from employee where department_id=10 && not name like '%LA%';

-- 34. Obten los empleados que no son supervisados por ning´un otro.

 select name from employee where not coalesce(manager_id,0);
 select name from employee where manager_id IS NULL;

-- 35. Obten los nombres de los departamentos que no sean Ventas (SALES) ni investigacion (RESEARCH).
--     Ordena el resultado por la localidad del departamento.

  select name from department where not (name='sales' or name='research') order by location ;

 -- 36. Deseamos conocer el nombre de los empleados y el codigo del departamento de los administra-
 --     tivos(CLERK) que no trabajan en el departamento 10, y cuyo salario es superior a 800, ordenado
--     por fecha de contratacion.

 select name, department_id from employee where (job ='clerk' and not department_id = 10 and salary>800) order by hire_date;

-- 37. Para los empleados que tengan comision, obten sus nombres y el cociente entre su salario y su
--     comision (excepto cuando la comision sea cero), ordenando el resultado por nombre

 select name , (salary/commission) from employee where (commission>0) order by name;

-- 38. Lista toda la informacion sobre los empleados cuyo nombre completo tenga exactamente 5 caracteres.

 select * from employee where char_length(name)=5;

-- 39. Lo mismo, pero para los empleados cuyo nombre tenga al menos cinco letras.

 select * from employee where char_length(name)<=5;

-- 40. Halla los datos de los empleados que, o bien su nombre empieza por A y su salario es superior
--     a 1000, o bien reciben comisi´on y trabajan en el departamento 30.

 select * from employee where (name like 'A%' and salary>1000)  or (commission > 0 and department_id=30);

-- 41. Halla el nombre, el salario y el sueldo total (sal+com)de todos los empleados, ordenando el resultado
--     primero por salario y luego por el sueldo total. En el caso de que no tenga comisi´on, el sueldo
--     total debe reflejar solo el salario.

 select name , salary, (salary + coalesce(commission,0)) as sueldo_total from employee order by salary , sueldo_total; 

-- 42. Obtén el nombre, salario y la comisión de los empleados que perciben un salario que esta entre la mitad de la comisión y la propia comisión.

 select name, salary, commission  from employee where salary between (commission/2) and commission;

-- 43. Obtén el complementario del anterior.

select name, salary, commission  from employee where not salary between (commission/2) and commission;

-- DIFICIL
-- 44. Lista los nombres y empleos de aquellos empleados cuyo empleo acaba en MAN y cuyo nombre empieza por A. j

select name, job from employee where job like '%MAN' and name like 'A%';

-- 45. Lista los nombres y fecha de contrataci´on de aquellos empleados que no son vendedores (SALESMAN).

select name, hire_date from employee where job != 'salesman';

-- 46. Obten la informacion disponible de los empleados cuyo numero es uno de los siguientes: 
-- 7369, 7521, 7678, 7782, 7844 , 7900 y 7934 , pero que no sea uno de los siguientes: 7499, 7839, 7878 ni 7902
-- Intenta hacerlo usando como máximo un AND en la clausura WHERE.

select * from employee where not (id  like '74%' or id like '783%' or id like '787%' or id like '%902') ;

-- 47. Lista los detalles de los empleados con los detalles de sus respectivos departamentos

 select * from employee,department;

-- 48. Lista los detalles de los empleados con un salario más alto que BLAKE

 select * from employee where salary >( select salary from employee where name = 'BLAKE');

-- 49. Lista los empleados que tienen el mismo job que ALLEN

 select * from employee where job = (select job from employee where name ='ALLEN');

-- 49b. Igual q la anterior, pero ya sabemos el job de ALLEN, queremos omitirlo 

 select * from employee where job = (select job from employee where name ='ALLEN') AND NAME != 'ALLEN';

-- 50. Lista de empleados que llevan más tiempo en la empresa que KING

 select * from employee where hire_date < (select hire_date from employee where  name ='KING');

-- 51. Lista de empleados del departamento 20 que tienen los mismos trabajos que los empleados del departamento 10.
-- podemos comprobar los jobs del departamento 10, y luego volver a tirar la query anterior para comprobar

 select * from employee where department_id = 20 and job in (select job from employee where department_id = 10) ;

-- 53. Nombre y salario de FORD y SMITH y todos aquellos que tengan el salario igual a 1 de ellos. 

 select name, salary from employee where  salary in( select salary from employee where name in ('ford' , 'smith'));

-- 53.b Nombre y salario de emplados que tienen el mismo salario que FORD o SMITH ordenador por salario más alto. FORD O SMITH no deben salir en el resultado.

select name, salary from employee where  salary in ( select salary from employee where name in ('ford' , 'smith')) and name != 'ford' and name != 'smith' ;

-- 54. Lista de empleados cuyo trabajo es el mismo que el de MILLER o cuyo salario es mayor que el de ALLEN

select * from employee where job = (select job from employee where name='miller') or salary > (select salary from employee where name ='allen');

-- 55. Lista de empleados cuyo salario es mayor que el sueldo total de todos los empleados SALESMAN
 
insert into employee values(111,'pepe', 'PRESIDENT', NULL, current_date(), 80000, null,20); 
 select * from employee where salary > (select SUM( salary) + sum( coalesce(commission,0))from employee where job ='salesman');
 
 
-- 58. Lista de empleados cuyos trabajos son los mismos que los de SMITH o ALLEN (y q no muestre a estos últimos). 
 
 select * from employee where job in (select job from employee where name in ('smith','allen')) and name != 'smith' and name != 'allen';
 
-- 59. Lista nombre y salarios de empleados cuyo salario es el mismo que cualquier SALESMAN con 5 años de antiguedad o más insertar la siguiente fila antes de hacer la query.

INSERT INTO employee VALUES ('7777','pepe','CLERK', null,'1981-02-22','1500.00','500.00','30');

select name, salary from employee where salary in (select salary from employee where job = 'salesman' and hire_date <= date_sub(current_date(), interval 35 year));

-- 60. Lista de tipos de empleados (jobs) que existen en el departamento 20 pero no en el 10.

select job from employee where department_id = 20 and job not in (select job from employee where department_id= 10);


-- 62. Encuentra el salario más alto de todos los empleados

select max(salary) from employee;


-- 63. Muestra la información del empleados con el salario más alto

select * from employee where salary in (select max(salary) from employee);

-- 64. Find the highest paid employee of sales department. 

select * from employee where salary in (select max(salary) from employee where job='salesman');
select * from employee where (salary+coalesce(commission,0)) in (select max(salary + coalesce(commission,0)) from employee where job='salesman');

-- 66. Lista de empleados consa más antigüedad que el último empleado contratado cuyo manager es KING.

select * from employee where hire_date < (select hire_date from employee where hire_date in( select max(hire_date) from employee where manager_id='7839'));

-- 66b. comprobar los empleados del equipo de KING, ordenados de menos a más antigüedad, y volver a tirar la query anterior

select * from employee where manager_id ='7839'order by hire_date desc ;


-- 68. Lista de empleados contratados en el 81 (bonus: por lo menos 3 formas diferentes de conseguir el mismo resultado)

select * from employee where hire_date like '1981%';
select * from employee where year(hire_date) = '1981';
select * from employee where hire_date between '1981-01-01' and '1982-01-01'; 

-- 68b Lista de empleados contratados en Diciembre de 1981 (bonus: por lo menos 3 formas diferentes de conseguir el mismo resultado)

select * from employee where hire_date like '%1981-12%';
select * from employee where year(hire_date)= '1981' and month(hire_date)='12';
select * from employee where hire_date between '1981-12-01' and '1982-01-01';

-- 69. Lista de SALESMAN contratados en el 81.

select * from employee where job ='salesman' and hire_date like '%81%';

-- 70. Lista de empleados contratados en el 81 con el mismo job que el primer contratado en ese mismo año.

select * from employee where year(hire_date)='1981' and job in (select job from employee where hire_date in(select min(hire_date) from employee where hire_date between '1981-01-01' and '1982-01-01'));

 -- 70b muestra la lista de empleados contratados en el 81 ordenador de mayor a menor antigüedad para comprobar su job y vuelve a tirar la query anterior

select * from employee where year(hire_date)='1981' order by hire_date;

-- 71. muestra el nombre, slario mensual y salario anual de todos los empleados

select name, salary, (salary*14) as salario_anual from employee;

-- 71b. Muestra el gasto mensual total en salarios de managers

select sum(salary)as gasto_mensual from employee where job = 'manager';

-- 71c Muestra el gasto anual total en salarios de managers

select sum(salary*14) as gasto_anual from employee where job = 'manager';

-- 72. Muestra el gasto anual total en salarios de los empleados con más de 30 años de antigüedad

select sum(salary*14) as gasto_anual from employee where hire_date < date_sub(current_date(), interval 3 year); 


-- NOTA: a partir de aquí puede que necesitéis JOIN en algunas consultas, y habrá algunas q agrupen datos (recordad: GROUP BY)
----------

-- 72b . Muestra el gasto anual en salarios del año 81, agrupado por jobs. 

select sum(salary*14) from employee where year(hire_date)='1981';
 
-- 74. Muesta el salario medio de todos los empleados CLERK

select avg(salary) from employee where job ='clerk';

-- 74b. Muestra el salario medio de cada uno de los jobs.

select job,  avg(salary) from employee group by job;

-- 75. Lista de empleados del departamento 20 con un salario mayor a la media de todos los salarios del departamento 10

select * from employee where department_id = 20 and salary > ( select avg(salary) from employee where department_id =10);

-- comprobad la media del salario del departamento 10, tirad la consulta anterior y comprobad q efectivamente es mayor

select avg(salary) from employee where department_id =10;
 
-- 76. Mostrar el número de empleados de cada job, en cada departamento. Es decir, departamento 10, CLERK, 2, departament 10, SALESMAN, 1, etc (bonus: se puede hacer usando solo la tabla employee, o con un JOIN on department)
 
 select department_id, job, count(job) from employee group by department_id, job ;
 
 -- o usando join con department
 select d.id, e.job, count(e.job) from employee e, department d
 where e.department_id = d.id group by e.job, d.id;
 
-- 77. Lista el id y nombre de los managers y número de empleados en el equipo de cada manager, ordenador por el ID de los manager.

select id, name from employee  where job='manager' order by manager_id ;

select manager_id, count(id) from employee group by manager_id;

select m.id, m.name, count(*) from employee e, employee m
where e.manager_id = m.id 
group by e.manager_id 
order by e.manager_id asc;

-- 78. Mostrar IDs de departamentos y número de empleados de cada de departamento (y también que uno de los grupos sea el número de empleados sin departamento).
-- NOTA: si este grupo no sale, hacer 1 o varios inserts y/o updates en la tabla employee donde el department_id del employee sea NULL, de esta forma esos employees que estáis añadiendo ya no pertenecen a ningún departamento

insert into employee values ( 8888, 'Manolo', 'chapuzas', 7777, '2020-03-16', 1500, null, null);
insert into employee values ( 9999, 'JOse', 'chapuzas', 7777, '2020-03-15', 1600, null, null);

select department_id, count(*) from employee group by department_id;


-- 78b. Mostrar todos los detalles de cada departamento, y el número de empleados que trabajan en él.

select e.* , count(d.id) as num_empleados from employee d, department e  where d.department_id= e.id group by department_id;


-- 78c. Igual que en la anterior, pero a mayores que muestre el grupo de empleados q no tienen departamento.

select e.* , count(*) as num_empleados from employee d left join department e  on d.department_id= e.id group by department_id;

-- 78d. Igual q la 78b, pero que muestre solo los departamento con 4 o más empleados.
 
 select e.* , count(d.id) as num_empleados from employee d, department e  where d.department_id= e.id group by department_id having count(d.id) >=4;
 
-- 80. Mostrar el nombre de los departamentos y el número de empleados CLERK en cada uno

select d.name, count(e.id)from department d, employee e where e.department_id= d.id and e.job ='clerk' group by d.name;

-- 80b. Igual q la anterior, pero q muestre solo los q tienen 2 o más CLERKs.

select d.name, count(e.id)from department d, employee e where e.department_id= d.id and e.job ='clerk' group by d.name having count(e.id)>=2;

-- JOIN

-- 1. Selecciona todos los datos de los empleados y los departamentos relacionados  (explícito e implícito)

select * from employee inner join department;

select * from employee,department;

select * from employee e inner join department d on e.department_id = d.id;
select * from employee,department where employee.department_id=department_id;

-- 2. Obten el nombre del empleado y el nombre del departamento en el que trabaja

select e.name, d.name from employee e, department d where e.department_id = d.id ;

-- 3. Obten el nombre de los empleados y el salario y el nombre del departamento de aquellos empleados cuyo salario es mayor a 2000  (explícito e implícito)

select e.name, e.salary , d.name from employee e inner join department d on e.department_id = d.id where e.salary > 2000;

select e.name, e.salary, d.name from employee e, department d where e.department_id = d.id and e.salary > 2000;

-- 3b. Obten el nombre de los empleados y el salario y el nombre del departamento de aquellos empleados cuyo salario es mayor a 2000 y que trabajan en el departamento que está en DALLAS

select e.name, e.salary , d.name from employee e inner join department d on e.department_id = d.id where e.salary > 2000 and d.location='dallas';

select e.name, e.salary, d.name from employee e, department d where e.department_id = d.id and e.salary > 2000 and d.location='dallas';

-- 4. Obten los empleados que cobran más que sus jefes

select e.name, e.salary, d.name, d.salary from employee e inner join employee d on e.manager_id = d.id where e.salary > d.salary;
select e.name, e.salary, m.name, m.salary
from employee e 
inner join employee m on e.manager_id = m.id
where e.salary > m.salary;

-- 5. Obten los empleados que cobran más que sus jefes (incluyendo comisiones). Son los mismos

select e.name, e.salary , e.salary +coalesce(e.commission,0) as salario_total_Empleado, d.name, d.salary, d.salary+coalesce(d.commission,0)
 as salario_total_jefe from employee e inner join employee d on e.manager_id = d.id where e.salary +coalesce(e.commission,0) >  d.salary+coalesce(d.commission,0);
-- 5c. Ejecutad la consulta 5 otra ver comprobad que se ven reflejadas las comisiones que acabáis de meter con el UPDATE, y q la lista es diferente.
SET SQL_SAFE_UPDATES = 0; 
update employee set commission = 500 where name in ('JONES', 'SCOTT');
select e.name, e.salary , e.salary +coalesce(e.commission,0) as salario_total_Empleado, d.name, d.salary, d.salary+coalesce(d.commission,0)
 as salario_total_jefe from employee e inner join employee d on e.manager_id = d.id where e.salary +coalesce(e.commission,0) >  d.salary+coalesce(d.commission,0);
-- 6. Obtén el número de empleados que hay en la empresa sin tener en cuenta los que están en DALLAS

select count(*) from employee e inner join department d on e.department_id = d.id where d.location not like 'dallas';

-- 7. Obtén el número de empleados de cada departamento, así como el nombre del departamento.

select d.name, count(e.id) from employee e inner join department d on d.id = e.department_id group by d.id;


-- 8. Los nombres de departamentos con el total de empleados por departamento que tienen una A en su nombre

select d.name, count(e.department_id) from department d , employee e where e.department_id = d.id and e.name like '%a%' group by department_id;

-- 9. Lista de empleados que trabajan el departamento de NEW YORK

select * from employee d inner join department e  on d.department_id = e.id and e.location='new york';

-- 10. Lista de empleados que no trabajan en ningún departamento (con JOIN y sin JOIN)

select * from employee where department_id is null;


select * from employee d left join department e on  d.department_id=e.id where d.department_id is null;

-- 11. Lista de departamentos que no tienen ahora mismo ningún empleado asignado (con JOIN y sin JOIN)

select * from employee e right join department d on d.id=e.department_id where e.department_id  is null;

select * from department where id not in (select distinct department_id from employee where not department_id is null);

-- 12. Lista de empleados que tienen más antigüedad que sus propios managers 

select * from employee e , employee d where e.manager_id = d.id and e.hire_date < d.hire_date;

-- 13. Lista de empleados que tienen más atigüedad q BLAKE y trabajan en BOSTON o CHICAGO e

select * from employee e , department d where e.department_id= d.id and hire_date < (select e.hire_date from employee e where e.name='blake') and d.location in ('boston','chicago');

select * from employee e ,department d where e.department_id = d.id 
and d.location in ('CHICAGO','BOSTON')
and e.hire_date < (
	select hire_date from employee where name = 'BLAKE'
);

update employee set name='Jose' where id= 9999;