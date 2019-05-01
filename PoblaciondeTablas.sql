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

INSERT INTO tesis VALUES ('M2', )