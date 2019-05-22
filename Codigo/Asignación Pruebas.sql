OSCAR (Las tablas Autor, Director Tesis, Libro, Tesis, Material, Ejemplar deben estar vacias y de ahi agregar valores necesarios para trabajar)
--Insertar 4 autores y 4 director Tesis (Mostrar tabla autor y directorTesis)
--Insertar 2 Libros y 2 Tesis (Mostrara tabla libro, tesis, material y ejemplar)
--Insertar 2 ejemplares mas de cada material (Mostrar tabla ejemplar)
--Insertar 3 lector LT1, LT2, LT3 (Mostrar tabla)
--Probar vista vwCatalogoLibro con datos de "Poblacion de tablas.sql"
--Probar vista vwCatalogoLibro "Poblacion de tablas.sql"
--Probar vista vwCatalogoAutor "Poblacion de tablas.sql"
--Probar vista vwCatalogoEstatusMaterial "Poblacion de tablas.sql"
--Probar vista vwCatalogoLector "Poblacion de tablas.sql"

--Insertar 4 autores y 4 director Tesis (Mostrar tabla autor y directorTesis)
SELECT * FROM autor;

EXEC AltaAutor('Julio', 'Gabriel', 'Verje', 'Frances');
EXEC AltaAutor('Stephen', 'Edwin', 'King', 'Estadounidense');
EXEC AltaAutor('Rodolfo', 'Neri', 'Vela', 'Mexicano');
EXEC AltaAutor('Stephen', 'William', 'Hawking', 'Britanico');

--autores insertados
SELECT * FROM autor;

--Insertar 2 Libros y 2 Tesis (Mostrara tabla libro, tesis, material y ejemplar)
SELECT * FROM libro;
SELECT * FROM tesis;
SELECT * FROM material;
SELECT * FROM ejemplar;
-- insertando Libro
--exec AltaLibro(UBICACION, COLOCACION, TITULO, TIPO MATERIAL,'AUTORID', ISBN, TEMA, EDUCION);
EXEC AltaLibro('Segundo Piso','Abajo','DelaTierraalaLuna','L','A1','ISBN1','Novelas','Primera');
EXEC AltaLibro('Segundo Piso','Arriba','The Shining','L','A2','ISBN2','Novelas','Primera');

-- insertando TESIS
--EXEC AltaTesis(v_carreraTema,v_anoPublicacion,v_director_id, v_ubicacion, v_colocacion, v_titulo,v_autor_id);
EXEC AltaTesis('Ingenieria','1975','D1','Primer Piso','Abajo','Tesis de ingenieria','A3');
EXEC AltaTesis('Fisica','1965','D2','Primer Piso','Arriba','Expanding Universes','A4');

--libros y tesis insertados
SELECT * FROM libro;
SELECT * FROM tesis;
SELECT * FROM material;
SELECT * FROM ejemplar;

--Insertar 2 ejemplares mas de cada material (Mostrar tabla ejemplar)
SELECT * FROM ejemplar;

--EXEC AltaEjemplar(MATERIAL_ID);
EXEC AltaEjemplar('M1');
EXEC AltaEjemplar('M1');
EXEC AltaEjemplar('M2');
EXEC AltaEjemplar('M2');
EXEC AltaEjemplar('M3');
EXEC AltaEjemplar('M3');
EXEC AltaEjemplar('M4');
EXEC AltaEjemplar('M4');

--Ejemplares insertados
SELECT * FROM ejemplar;

--Insertar 3 lector LT1, LT2, LT3 (Mostrar tabla)
SELECT * FROM lector;

--EXEC AltaLector('TELEFONO','NOMBRE','APPATERNO','APMATERNO','CIUDAD','NUMERO'','CALLE','Colonia','Delegacion','TIPOLECTOR');
EXEC AltaLector('5522446688','Abraham','Lazaro','Martinez','CDMX','5','Soledad','Santa Ursula','Tlalpan','TL1');
EXEC AltaLector('5511223344','Diego','Setien','Rodriguez','Monterrey','30','Benito Juarez','Montevideo','Juarez','TL2');
EXEC AltaLector('5599887766','Edith','Miramontes','Molina','Ciudad Juarez','7','Universidad','Buenos Aires','Quintana','TL3');

--lectores insertados
SELECT * FROM lector;

--Probar vista vwCatalogoLibro con datos de "Poblacion de tablas.sql"
SELECT * FROM vwCatalogoLibro;

--Probar vista vwCatalogoLibro "Poblacion de tablas.sql"
SELECT * FROM vwCatalogoLibro;

--Probar vista vwCatalogoAutor "Poblacion de tablas.sql"
SELECT * FROM vwCatalogoAutor;

--Probar vista vwCatalogoEstatusMaterial "Poblacion de tablas.sql"
SELECT * FROM vwCatalogoEstatusMaterial;

--Probar vista vwCatalogoLector "Poblacion de tablas.sql"
SELECT * FROM vwCatalogoLector;



------------------------------------------------------------------------------------------------------------------
LAZARO (Las tablas Lector, Prestamo, Ejemplar, Multa deben estar vacias y de ahi agregar valores necesarios para trabajar)
--Insertar 1 solo lector LT1 (Desplegar tabla antes y despues de inserción)
--Intentar exceder limite de materiales LT1 y mostrar error
--Intentar sacar libros en estatus EST2. Desplegar error
--Mostrar que los Dias de prestamo de un LT1 son de 8 dias en la tabla prestamo
--Verificar modificacion de estatus ejemplar al realizar un prestamo LT1. "De EST1 a EST2"
--Verificar que unicamente se puede resellar en la fecha de vencimiento y no antes LT1
--Resello modifica fechas de prestamo, fecha resello y numero resello automaticamente LT1 (Con procedimiento Resello)
--Intentar exceder el numero de resello maximos para LT1 mostrando el error y el numero de resellos (1)
--Devolución modifica estatus ejemplar y genera multa LT1 (mostrar tabla ejemplar antes y despues de la modificacion estatus)
--Mostrar adeudo total y las multas que ha tenido LT1 (tabla lector(solo lector_id, nombre, adeudo, tipoLector), tabla multa)
--Una vez con multa, verificar que no puede sacar prestamos LT1
--Cambiar fecha de vigencia lector y verifiar que ya no puede sacar prestamo LT1

------------------------------------------------------------------------------------------------------------------
CHAVIRA (Las tablas Lector, Prestamo, Ejemplar, Multa deben estar vacias y de ahi agregar valores necesarios para trabajar)
--Insertar 1 solo lector LT2 (Desplegar tabla antes y despues de inserción)
--Intentar exceder limite de materiales LT2 y mostrar error
--Intentar sacar libros en estatus EST3. Desplegar error
--Mostrar que los Dias de prestamo de un LT2 son de 15 dias en la tabla prestamo
--Verificar modificacion de estatus ejemplar al realizar un prestamo LT2. "De EST1 a EST2"
--Verificar que unicamente se puede resellar en la fecha de vencimiento y no antes LT2
--Resello modifica fechas de prestamo, fecha resello y numero resello automaticamente LT2 (Con procedimiento Resello)
--Intentar exceder el numero de resello maximos para LT2 mostrando el error y el numero de resellos (2)
--Devolución modifica estatus ejemplar y genera multa LT2 (mostrar tabla ejemplar antes y despues de la modificacion estatus)
--Mostrar adeudo total y las multas que ha tenido LT2 (tabla lector(solo lector_id, nombre, adeudo, tipoLector), tabla multa)
--Una vez con multa, verificar que no puede sacar prestamos LT2
--Cambiar fecha de vigencia lector y verifiar que ya no puede sacar prestamo LT2

IMPORTANTE: Utilizar el archivo "PRUEBA SPOOL Chavira.sql" en vez de la población de tablas.
CÓDIGO:
--Se ingresa un nuevo Profesor.
SELECT * FROM lector;
EXEC AltaLector('5512345678','Andrés Uriel','Chavira','Tapia','CDMX','123','Av. IPN','Lindavista','GAM','TL2');
SELECT * FROM lector;

SELECT * FROM prestamo;
--Ingreso de préstamos permitido del Profesor: 5 préstamos.
EXEC altaprestamo('L1', 'EJ0', 'M1');
EXEC altaprestamo('L1', 'EJ0', 'M2');
EXEC altaprestamo('L1', 'EJ0', 'M3');
EXEC altaprestamo('L1', 'EJ0', 'M12');
EXEC altaprestamo('L1', 'EJ0', 'M13');
--Error si se excede el límite del Profesor: 5 préstamos.
EXEC altaprestamo('L1', 'EJ0', 'M14');
--Los días del préstamo para el Profesor: 15 días.
SELECT * FROM prestamo;
--Estatus de los ejemplares prestados cambió de 'EST1' a 'EST2', de 'Prestado'.
SELECT * FROM ejemplar;
--Error si el estado del ejemplar es "No sale de la biblioteca".
EXEC altaprestamo('L1', 'EJ0', 'M18');
--Resello denegado si no es en fecha de vencimiento.
EXEC resello('P0');
--Alteración de la fecha de vencimiento dehabilitando el trigger de UPDATE.
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fechaVencimiento=SYSDATE WHERE prestamo_id='P0';
ALTER TRIGGER tgRevisarResello ENABLE;
EXEC resello('P0');
--Nuevos datos de fecha para el préstamo resellado.
SELECT * FROM prestamo WHERE prestamo_id='P0';
--Excediendo el número de resello permitidos del Profesor (Una vez más se deshabilita trigger para modificar fecha forzadamente).
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fechaVencimiento=SYSDATE WHERE prestamo_id='P0';
ALTER TRIGGER tgRevisarResello ENABLE;
EXEC resello('P0');
--Error por rebasar límite de resellos permitidos.
EXEC resello('P0');
--Vemos que no se hace el resello por error anterior
select * from prestamo where prestamo_id= 'P0';
--Modificando la fecha de vencimiento a una anterior a la fecha actual para generar una multa de prueba y devolver el material.
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fecharesello=SYSDATE-20, fechaprestamo=SYSDATE-20, fechavencimiento=SYSDATE-5 WHERE prestamo_id = 'P0';
ALTER TRIGGER tgRevisarResello ENABLE;
--Se cambia el estado del ejemplar asociado al préstamo P0: el ejemplar EJ0 del material M1. Pasa de 'EST2' a 'EST1', de 'Disponible'.
--Se genera una multa por los días de retraso en realizar la devolución.
SELECT * FROM ejemplar WHERE noEjemplar='EJ0' AND material_id='M1';
SELECT * FROM multa;
EXEC bajaPrestamo('P0');
SELECT * FROM ejemplar WHERE noEjemplar='EJ0' AND material_id='M1';
SELECT * FROM multa;
--Se muestra el adeudo del lector, coincidente con la multa generada.
SELECT lector_id, nombreLector, adeudoLector, tipoLector_id
FROM lector WHERE lector_id = 'L1';
--Como cuenta con multa, tiene prohibido dar de alta préstamos en su nombre.
EXEC altaprestamo('L1', 'EJ0', 'M1');
--Se elimina la multa.
DELETE FROM multa;
--Se caduca la fecha de vigencia del lector para prohibir los préstamos de tal forma.
UPDATE lector SET fechaVigenciaLector=SYSDATE-5 WHERE lector_id='L1';
--Con la fecha caducada, se intenta hacer un préstamo de nuevo, y falla.
EXEC altaprestamo('L1', 'EJ0', 'M1');

------------------------------------------------------------------------------------------------------------------

JOYA (Las tablas Lector, Prestamo, Ejemplar, Multa deben estar vacias y de ahi agregar valores necesarios para trabajar)
--Insertar 1 solo lector LT3 (Desplegar tabla antes y despues de inserción)
--Intentar exceder limite de materiales LT3 y mostrar error
--Intentar sacar libros en estatus EST4. Desplegar error
--Mostrar que los Dias de prestamo de un LT3 son de 30 dias en la tabla prestamo
--Verificar modificacion de estatus ejemplar al realizar un prestamo LT3. "De EST1 a EST2"
--Verificar que unicamente se puede resellar en la fecha de vencimiento y no antes LT3
--Resello modifica fechas de prestamo, fecha resello y numero resello automaticamente LT3 (Con procedimiento Resello)
--Intentar exceder el numero de resello maximos para LT3 mostrando el error y el numero de resellos (3)
--Devolución modifica estatus ejemplar y genera multa LT3 (mostrar tabla ejemplar antes y despues de la modificacion estatus)
--Mostrar adeudo total y las multas que ha tenido LT3 (tabla lector(solo lector_id, nombre, adeudo, tipoLector), tabla multa)
--Una vez con multa, verificar que no puede sacar prestamos LT3
--Cambiar fecha de vigencia lector y verifiar que ya no puede sacar prestamo LT3

--Insertando un Lector tipo Investigador
SELECT * FROM lector;
EXEC AltaLector('5548088425','Jehosua Alan','Joya','Venegas','CDMX','73','Av 16 Sep','Tepepan','Xochimilco','TL3');
SELECT * FROM lector;

SELECT * FROM prestamo;
--Ingreso de préstamos permitido del Investigador: 10 préstamos.
EXEC altaprestamo('L1', 'EJ0', 'M1');
EXEC altaprestamo('L1', 'EJ0', 'M2');
EXEC altaprestamo('L1', 'EJ0', 'M3');
EXEC altaprestamo('L1', 'EJ0', 'M4');
EXEC altaprestamo('L1', 'EJ0', 'M5');
EXEC altaprestamo('L1', 'EJ0', 'M12');
EXEC altaprestamo('L1', 'EJ0', 'M13');
EXEC altaprestamo('L1', 'EJ0', 'M14');
EXEC altaprestamo('L1', 'EJ0', 'M15');
EXEC altaprestamo('L1', 'EJ0', 'M16');
--Error si se excede el límite del Investigador: 10 préstamos.
EXEC altaprestamo('L1', 'EJ0', 'M17');
--Los días del préstamo para el Investigador: 30 días.
SELECT * FROM prestamo;
--Estatus de los ejemplares prestados cambió de 'EST1' a 'EST2', de 'Prestado'.
SELECT * FROM ejemplar;
--Error si el estado del ejemplar es "En mantenimiento".
EXEC altaprestamo('L1', 'EJ0', 'M18');
--Resello denegado si no es en fecha de vencimiento.
EXEC resello('P0');
--Alteración de la fecha de vencimiento dehabilitando el trigger de UPDATE.
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fechaVencimiento=SYSDATE WHERE prestamo_id='P0';
ALTER TRIGGER tgRevisarResello ENABLE;
EXEC resello('P0');
--Nuevos datos de fecha para el préstamo resellado.
SELECT * FROM prestamo WHERE prestamo_id='P0';
--Excediendo el número de resello permitidos del Investigador (Una vez más se deshabilita trigger para modificar fecha forzadamente).
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fechaVencimiento=SYSDATE WHERE prestamo_id='P0';
ALTER TRIGGER tgRevisarResello ENABLE;
EXEC resello('P0');
--Error por rebasar límite de resellos permitidos.
EXEC resello('P0');
--Vemos que no se hace el resello por error anterior
select * from prestamo where prestamo_id= 'P0';
--Modificando la fecha de vencimiento a una anterior a la fecha actual para generar una multa de prueba y devolver el material.
ALTER TRIGGER tgRevisarResello DISABLE;
UPDATE prestamo SET fecharesello=SYSDATE-20, fechaprestamo=SYSDATE-20, fechavencimiento=SYSDATE-5 WHERE prestamo_id = 'P0';
ALTER TRIGGER tgRevisarResello ENABLE;
--Se cambia el estado del ejemplar asociado al préstamo P0: el ejemplar EJ0 del material M1. Pasa de 'EST2' a 'EST1', de 'Disponible'.
--Se genera una multa por los días de retraso en realizar la devolución.
SELECT * FROM ejemplar WHERE noEjemplar='EJ0' AND material_id='M1';
SELECT * FROM multa;
EXEC bajaPrestamo('P0');
SELECT * FROM ejemplar WHERE noEjemplar='EJ0' AND material_id='M1';
SELECT * FROM multa;
--Se muestra el adeudo del lector, coincidente con la multa generada.
SELECT lector_id, nombreLector, adeudoLector, tipoLector_id
FROM lector WHERE lector_id = 'L1';
--Como cuenta con multa, tiene prohibido dar de alta préstamos en su nombre.
EXEC altaprestamo('L1', 'EJ0', 'M1');
--Se elimina la multa.
DELETE FROM multa;
--Se caduca la fecha de vigencia del lector para prohibir los préstamos de tal forma.
UPDATE lector SET fechaVigenciaLector=SYSDATE-5 WHERE lector_id='L1';
--Con la fecha caducada, se intenta hacer un préstamo de nuevo, y falla.
EXEC altaprestamo('L1', 'EJ0', 'M1');
