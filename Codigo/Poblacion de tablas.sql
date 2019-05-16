INSERT INTO autor VALUES ('A1', 'Juan', 'Jose', 'Venegas', 'Mexicano');
INSERT INTO autor VALUES ('A2', 'Jose', 'Jose', 'Venegas', 'Aleman');
INSERT INTO autor VALUES ('A3', 'Pedro', 'Martin', 'Venegas', 'Mexicano');

INSERT INTO material VALUES ('M1','Sotano', 'Arriba', 'Pollito', 'L' );
INSERT INTO material VALUES ('M2','Primer Piso', 'Abajo', 'Caballo', 'L' );
INSERT INTO material VALUES ('M3','Segundo Piso', 'Arriba', 'Borrego', 'T' );
INSERT INTO material VALUES ('M4','Sotano', 'Arriba', 'Pollito', 'L' );
INSERT INTO material VALUES ('M5','Primer Piso', 'Abajo', 'Caballo', 'L' );
INSERT INTO material VALUES ('M6','Segundo Piso', 'Arriba', 'Borrego', 'T' );

INSERT  INTO escribe VALUES ('M2','A1');
INSERT  INTO escribe VALUES ('M1','A2');
INSERT  INTO escribe VALUES ('M3','A1');

INSERT INTO libro VALUES ('M2', '1L', 'ISBN1', 'Algebra', 'Segunda');
INSERT INTO libro VALUES ('M3', '2L', 'ISBN2', 'Vectorial', 'Segunda');
INSERT INTO libro VALUES ('M1', '3L', 'ISBN3', 'Calculo', 'Tercera');

INSERT INTO gradoAcademico VALUES ('GA1', 'Kinder');
INSERT INTO gradoAcademico VALUES ('GA2', 'Secu');
INSERT INTO gradoAcademico VALUES ('GA3', 'Prepa');

INSERT INTO directorTesis VALUES ('D1', 'Carlos', 'Ramirez', 'Fernandez', 'GA1');
INSERT INTO directorTesis VALUES ('D2', 'Pedro', 'Miranda', 'Hector', 'GA2');
INSERT INTO directorTesis VALUES ('D3', 'Esteban', 'Chavira', 'Vazquez', 'GA3');

INSERT INTO tesis VALUES ('M4', 'T1', 'Comunicaciones', '2008', 'D2');
INSERT INTO tesis VALUES ('M5', 'T2', 'Ingenieria', '2019', 'D1');
INSERT INTO tesis VALUES ('M6', 'T3', 'Electricos', '2007', 'D3');

INSERT INTO estatus VALUES ('ES1', 'Disponible');
INSERT INTO estatus VALUES ('ES2', 'Prestado');
INSERT INTO estatus VALUES ('ES3', 'Perdido');

INSERT INTO ejemplar VALUES ('EJ1', 'M1', 'ES1');
INSERT INTO ejemplar VALUES ('EJ2', 'M2', 'ES2');
INSERT INTO ejemplar VALUES ('EJ3', 'M3', 'ES2');

INSERT INTO tipoLector VALUES ('TL1', 'Estudiante', '3', '1','8' );
INSERT INTO tipoLector VALUES ('TL2', 'Profesor', '5', '2','15' );
INSERT INTO tipoLector VALUES ('TL3', 'Investigador', '10', '3','30' );

INSERT INTO lector VALUES ('L1', '01/11/15', '55455442', '07/12/18', 'Carlos', 'Leon', 'Cano', 100, 'Campeche', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL1');
INSERT INTO lector VALUES ('L2', '07/01/11', '55455442', '07/12/18', 'Jorge', 'Cano', 'Valdez', 0, 'Puebla', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL2');
INSERT INTO lector VALUES ('L3', '01/03/12', '55455442', '07/12/18', 'Esteba', 'Hernandez', 'Juarez', 0, 'San Luis', '2', 'Arboles ','De la Barranca', 'Tlalpan', 'TL3');

INSERT INTO prestamo VALUES ('P1', 0, '08/10/16', SYSDATE, '10/10/16', 'L1', 'EJ1', 'M1');
INSERT INTO prestamo VALUES ('P2', 1, '08/10/16', SYSDATE, '10/10/16', 'L3', 'EJ3', 'M3');
INSERT INTO prestamo VALUES ('P3', 2, '08/10/16', SYSDATE, '10/10/16', 'L2', 'EJ2', 'M2');

INSERT INTO multa VALUES ('MU1', 'P1', SYSDATE, 20, 2);
INSERT INTO multa VALUES ('MU2', 'P2', SYSDATE, 10, 4);
INSERT INTO multa VALUES ('MU3', 'P3', SYSDATE, 50, 4);