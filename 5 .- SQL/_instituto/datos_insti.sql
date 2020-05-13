
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
