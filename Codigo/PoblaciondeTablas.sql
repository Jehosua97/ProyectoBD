INSERT INTO autor VALUES ('A1', 'Juan', 'Jose', 'Venegas', 'Mexicano');
INSERT INTO autor VALUES ('A2', 'Jose', 'Jose', 'Venegas', 'Aleman');
INSERT INTO autor VALUES ('A3', 'Pedro', 'Martin', 'Venegas', 'Mexicano');

INSERT INTO material VALUES ('M1','Sotano', 'Arriba', 'Pollito' );
INSERT INTO material VALUES ('M2','Primer Piso', 'Abajo', 'Caballo' );
INSERT INTO material VALUES ('M3','Segundo Piso', 'Arriba', 'Borrego' );

INSERT  INTO escribe VALUES ('M2','A1');
INSERT  INTO escribe VALUES ('M1','A2');
INSERT  INTO escribe VALUES ('M3','A1');

INSERT INTO libro VALUES ('M2', '06/12/17', 'ISBN1', 'Algebra', 'Segunda');
INSERT INTO libro VALUES ('M3', '06/07/15', 'ISBN2', 'Vectorial', 'Segunda');
INSERT INTO libro VALUES ('M1', '07/02/19', 'ISBN3', 'Calculo', 'Tercera');

INSERT INTO gradoAcademico VALUES ('GA1', 'Kinder');
INSERT INTO gradoAcademico VALUES ('GA2', 'Secu');
INSERT INTO gradoAcademico VALUES ('GA3', 'Prepa');

INSERT INTO directorTesis VALUES ('D1', 'Carlos', 'Ramirez', 'Fernandez', 'GA1');
INSERT INTO directorTesis VALUES ('D2', 'Pedro', 'Miranda', 'Hector', 'GA2');
INSERT INTO directorTesis VALUES ('D3', 'Esteban', 'Chavira', 'Vazquez', 'GA3');

--INSERT INTO tesis VALUES ('M1', 'T1', 'Comunicaciones', '2008', 'D2');
--INSERT INTO tesis VALUES ('M3', 'T2', 'Ingenieria', '2019', 'D1');
--INSERT INTO tesis VALUES ('M2', 'T3', 'Electricos', '2007', 'D3');

INSERT INTO estatus VALUES ('ES1', 'Disponible');
INSERT INTO estatus VALUES ('ES2', 'Prestado');
INSERT INTO estatus VALUES ('ES3', 'Perdido');

--INSERT INTO ejemplar VALUES ('EJ1', 'M1', 'ES1');
--INSERT INTO ejemplar VALUES ('EJ2', 'M2', 'ES1');
--INSERT INTO ejemplar VALUES ('EJ3', 'M3', 'ES3');

INSERT INTO tipoLector VALUES ('TL1', 'Estudiante', '3', '1','8' );
INSERT INTO tipoLector VALUES ('TL2', 'Profesor', '5', '2','15' );
INSERT INTO tipoLector VALUES ('TL3', 'Investigador', '10', '3','30' );

--INSERT INTO lector VALUES ('L1', '01/11/15', '55455442', '07/12/18', 'Carlos', 'Leon', 'Cano', 100, 'Campeche', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL1');
--INSERT INTO lector VALUES ('L2', '07/01/11', '55455442', '07/12/18', 'Jorge', 'Cano', 'Valdez', 0, 'Puebla', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL2');
--INSERT INTO lector VALUES ('L3', '01/03/12', '55455442', '07/12/18', 'Esteba', 'Hernandez', 'Juarez', 0, 'San Luis', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL3');

/*Modificar automaticamente FechaVencimiento, y controlar numero de "resello"*/
--INSERT INTO prestamo VALUES ('P1', 0, '08/10/16', DATE, '10/10/16', 'L1', 'EJ1', 'M1');
--INSERT INTO prestamo VALUES ('P2', 1, '08/10/16', DATE, '10/10/16', 'L3', 'EJ3', 'M2');
--INSERT INTO prestamo VALUES ('P3', 2, '08/10/16', DATE, '10/10/16', 'L2', 'EJ2', 'M3');

/*Calcular monto junto con los dias de retraso*/
INSERT INTO multa VALUES ('MU1', 'P1', DATE, 9,'2');
INSERT INTO multa VALUES ('MU2', 'P2', DATE, 10.2,'4');
INSERT INTO multa VALUES ('MU3', 'P3', DATE, 12,'4');