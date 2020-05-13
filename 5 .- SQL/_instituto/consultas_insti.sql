-- 1. listado de horarios con el nombre del aula, dia de la semana, hora de inicio y fin, 
-- nombre y apellidos del profesor q la imparte, nombre de la asignatura y nombre del grupo
select a.nombre, h.dia_semana, h.hora_inicio, h.hora_fin, p.nombre, p.apellidos, ag.nombre, g.nombre from horario h, usuario p, aula a, grupo g, asignatura ag; 


-- 2. listado de horarios del lunes para el grupo con nombre 'grupo1'
select h.* from horario h
where h.grupo_id in (
	select id from grupo where nombre = 'grupo1'
) and h.dia_semana = 'l';

-- 3. listado de horarios de jueves y viernes para 'jose mato'
select h.* from horario h
where h.profesor_id in (
	select id from usuario where nombre = 'jose' and apellidos = 'mato' and profesor = 1
) and h.dia_semana in ('j','v');

-- 4. listado de asignaturas q imparte cada profesor con el nombre 
-- y apellidos del profesor y nombre de la asignatura
select a.nombre, p.nombre, p.apellidos from asignatura a, usuario p, asignaturas_profesores ap
where a.id = ap.asignatura_id and p.id = ap.profesor_id;

-- 5. listado asignaturas del módulo 'desarrolo apps 1'
select a.* from asignatura a, asignaturas_modulos am
where a.id = am.asignatura_id and am.modulo_id in (
	select id from modulo where nombre = 'desarrolo apps 1'
);

-- 6. listado de alumnos del grupo 'grupo1'
select u.* from usuario u
where grupo_id in (
	select id from grupo where nombre = 'grupo1'
);

-- 7. listado de todos los alumnos
select * from usuario where profesor = false;


-- 1. listado de horarios con el nombre del aula, dia de la semana, hora de inicio y fin, 
-- nombre y apellidos del profesor q la imparte, nombre de la asignatura y nombre del grupo

-- 2. listado de horarios del lunes para el grupo con nombre 'grupo1'

-- 3. listado de horarios de jueves y viernes para 'jose mato'

-- 4. listado de asignaturas q imparte cada profesor con el nombre 
-- y apellidos del profesor y nombre de la asignatura

-- 5. listado asignaturas del módulo 'desarrolo apps 1'


-- 6. listado de alumnos del grupo 'grupo1'

-- 7. listado de todos los alumnos
