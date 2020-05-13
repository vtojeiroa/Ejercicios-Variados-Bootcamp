-- 1. buses de la linea 50
select b.*, m.marca, m.modelo from buses b, conductores_asignados a, modelos_buses m
where b.id = a.id_bus and a.id_linea = 50 and b.modelos_buses_id = m.id;

-- 2. lista de conductores de la linea 50
select c.* from conductores c, conductores_asignados a
where c.id = a.id_conductor and a.id_linea = 50; 

-- 3. lista de conductores de la linea 50 y sus buses
select c.*, b.* from conductores c, conductores_asignados a, buses b
where c.id = a.id_conductor and a.id_linea = 50 and b.id = a.id_bus;

-- 3. lista de conductores de la linea 50 y sus buses
select c.*, m.* from conductores c, conductores_asignados a, buses b, modelos_buses m
where c.id = a.id_conductor and a.id_linea = 50 and b.id = a.id_bus and b.modelos_buses_id = m.id;

-- 4. mostrar el itinerario por orden de parada de la linea 14, con los detalles de cada parada
select p.*, i.orden, i.minutos_salida from paradas p, itinerario i 
where p.id = i.id_parada and i.id_linea = 14;

-- 5. mostrar lineas que pasan por la parada "avda de la coruña 2"
select l.* from lineas l, itinerario i 
where i.id_linea = l.id and i.id_parada in (
	select id from paradas where nombre = "avda de la coruña 2"
);

-- 6. mostrar lineas que empiecen a circular como muy tarde a las 10:00
select l.* from lineas l
where TIME_FORMAT(l.hora_inicio, '%H:%i') <= '10:00';

-- 6b. BONUS: la anterior consulta de 2 formas diferentes 
-- (3 en total con la anterior... busca en los docs de MySQL funciones con time)
-- CAST
select l.* from lineas l
where l.hora_inicio <= CAST('10:00:00' AS time);

--  HOUR() + MINUTE()
select l.* from lineas l
where HOUR(l.hora_inicio) < 10
or (HOUR(l.hora_inicio) = 10 and MINUTE(l.hora_inicio) = 0);

-- 7. mostrar lineas que pasan por la parada "rua galicia 1" y empiecen a circular como muy tarde a las 10:00
select l.* from lineas l, itinerario i 
where i.id_linea = l.id and i.id_parada in (
	select id from paradas where nombre = "rua galicia 1"
)
and TIME_FORMAT(l.hora_inicio, '%H:%i') <= '10:00';

-- 8. lista de paradas que recorre el señor arsenio iglesias
select distinct p.* from paradas p, conductores_asignados a, itinerario i
where i.id_parada = p.id and i.id_linea in (
	select id_linea from conductores_asignados where id_conductor in (
		select id from conductores where nombre = 'arsenio' and apellidos = 'iglesias'
    )
);

-- 9. buses que pasan por "avda de la coruña 1"
select b.* from buses b, conductores_asignados a
where b.id = a.id_bus and a.id_linea in (
	select l.id from lineas l, itinerario i 
    where i.id_linea = l.id and i.id_parada in (
		select id from paradas where nombre = 'avda de la coruña 1'
    )
);

-- 10. información de la líneas y el número de paradas de cada una
select l.*, count(i.id_parada) as num_paradas from lineas l, itinerario i
where l.id = i.id_linea
group by i.id_linea;

-- 11. información solo de la línea con más paradas
select l.*, count(i.id_parada) as num_paradas from lineas l, itinerario i
where l.id = i.id_linea
group by i.id_linea
having count(i.id_parada) = (
	SELECT MAX(num_paradas) FROM (
		select count(i.id_parada) as num_paradas from itinerario i group by i.id_linea
	) as paradas_largas
);

-- 11b. la anterior pero de otra forma 
-- (sin select anidado si lo usaste antes, o con select anidado si no lo usaste)
select l.*, count(i.id_parada) as num_paradas from lineas l, itinerario i
where l.id = i.id_linea
group by i.id_linea
order by num_paradas desc
limit 1;

-- 12. información conductor con el itinerario más largo
select c.* from conductores c, conductores_asignados a
where c.id = a.id_conductor and a.id_linea in (
	select i.id_linea from itinerario i
	group by i.id_linea
	having count(i.id_parada) = (
		SELECT MAX(num_paradas) FROM (
			select count(i.id_parada) as num_paradas from itinerario i group by i.id_linea
		) as paradas_largas
	)
);





-- 1. buses de la linea 50
-- 2. conductores de la linea 50
-- 3. conductores de la linea 50 y sus buses
-- 3b. conductores de la linea 50 y sus buses con marca y modelo
-- 4. itinerario por orden de parada de la linea 14, con los detalles de cada parada
-- 5. lineas que pasan por la parada "avda de la coruña 2"
-- 6. lineas que empiecen a circular como muy tarde a las 10:00
-- 6b. BONUS: la anterior consulta de 2 formas diferentes 
-- (3 en total con la anterior... busca en los docs de MySQL funciones con time)
-- 7. lineas que pasan por la parada "rua galicia 1" y empiecen a circular como muy tarde a las 10:00
-- 8. lista de paradas que recorre el señor arsenio iglesias
-- 9. buses que pasan por "avda de la coruña 1"
-- 10. información de la líneas y el número de paradas de cada una
-- 11. información solo de la línea con más paradas
-- 11b. la anterior pero de otra forma 
-- 12. información conductor con el itinerario más largo
