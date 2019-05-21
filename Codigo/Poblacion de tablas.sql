--Autor
exec AltaAutor('Catlaina', 'Gerritsma', 'Zipsell', 'Pakistani');
exec AltaAutor('Andeee', 'Tuer', 'McGoldrick', 'Thai');
exec AltaAutor('Annette', 'Paxforde', 'Ecob', 'Laotian');
exec AltaAutor('Hyacintha', 'Bradtke', 'Pontin', 'Colombian');
exec AltaAutor('Barbi', 'Spracklin', 'Kitt', 'Dominican');
exec AltaAutor('Vernice', 'Dainter', 'Dryburgh', 'Panamanian');
exec AltaAutor('Connie', 'Thring', 'Anderer', 'Alaska Native');
exec AltaAutor('Brande', 'Dawson', 'Erni', 'Uruguayan');
exec AltaAutor('Billi', 'Corking', 'Jellett', 'Fijian');
exec AltaAutor('Riva', 'Beddingham', 'Dunleavy', 'Eskimo');

--estatus
INSERT INTO estatus VALUES ('ES1', 'Disponible');
INSERT INTO estatus VALUES ('ES2', 'Prestado');
INSERT INTO estatus VALUES ('ES3', 'No deja biblioteca');
INSERT INTO estatus VALUES ('ES4', 'En mantenimiento');

--Libros
declare
  vAutor_id char(10);
begin
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('sotano', 'arriba', 'Under the Domim Tree (Etz Hadomim Tafus)','L', vAutor_id, '651665651-7', 'n/a', '1');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('primer piso', 'abajo', 'Ricky Gervais: Out of England - The Stand-Up Special','L',vAutor_id, '942371083-2', 'Public Utilities', '2');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('sotano', 'abajo', 'Beat the Devil','L', vAutor_id, '774114970-9', 'n/a', '3');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('sotano', 'arriba', 'Rebellion (L''ordre et la morale)','L',vAutor_id, '467907549-X', 'n/a', '4');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('sotano', 'arriba', 'Uncertainty','L',vAutor_id, '867356448-4', 'n/a', '5');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('primer piso', 'abajo', 'Letter from an Unknown Woman','L',vAutor_id, '570795478-3', 'n/a', '6');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('primer piso', 'arriba', 'Wagner''s Dream','L',vAutor_id, '256681977-7', 'Consumer Services', '7');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('segundo piso', 'abajo', 'Thick-Walled Room, The (Kabe atsuki heya)','L',vAutor_id, '343065905-1', 'n/a', '8');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('sotano', 'abajo', 'SS Camp 5: Women''s Hell (SS Lager 5: L''inferno delle donne)','L', vAutor_id, '272771509-9', 'n/a', '9');
select  autor_id into vAutor_id from  (select autor_id from autor  order by dbms_random.value)where rownum=1;
AltaLibro('segundo piso', 'abajo', 'Kid from Brooklyn, The','L', vAutor_id, '385322086-X', 'Consumer Services', '10');

end;
/

--grado academico
INSERT INTO gradoAcademico VALUES ('GA1', 'Universidad');
INSERT INTO gradoAcademico VALUES ('GA2', 'Maestria');
INSERT INTO gradoAcademico VALUES ('GA3', 'Doctorado');


--director tesis
declare
  vDescripcionGA varchar2(20);
begin
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Géraldine', 'Meriot', 'Coulthard');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Marie-françoise', 'Refford', 'Kelleway');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Personnalisée', 'Calton', 'Bogart');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Danièle', 'Klimashevich', 'Tarbin');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Eugénie', 'Maddra', 'Challiss');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Estée', 'Rounsefell', 'Arthey');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Adèle', 'Fairchild', 'McSperrin');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Yè', 'Guilloton', 'Riddington');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Maïlys', 'Fussen', 'Binnall');
select descripcionGA into vDescripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1;
AltaDirTesis(SeqAltaDirectorTesis.nextval, vDescripcionGA, 'Clémentine', 'Tole', 'Gaffon');
end;
/

--Tesis
EXEC AltaTesis('Ingenieria','2000','D0','Mexico','Abajo','Algebra1','A0');
EXEC AltaTesis('Aquitectura','2010','D2','EU','Arriba','Recursos de Construccion','A1');
EXEC AltaTesis('Bilogia','2002','D1','Brasil','Arriba','Biologia Celular','A2');
EXEC AltaTesis('Fisica','1993','D2','Canada','Abajo','Newton','A3');
EXEC AltaTesis('Fisica','2003','D3','Mexico','AbaArribajo','Caida Libre','A3');
EXEC AltaTesis('Ingenieria','2004','D6','Reino Unido','Arriba','Calculo V','A4');
EXEC AltaTesis('Electricidad','2009','D6','Venezuela','Abajo','Ley de Ohm','A7');
EXEC AltaTesis('Contabilidad','2019','D8','Colombia','Arriba','Sumas y restas','A4');
EXEC AltaTesis('Medicina','2001','D9','Mexico','Abajo','Medicina Fam','A5');
EXEC AltaTesis('Veterinaria','2000','D4','Peru','Arriba','Perritos 1','A3');



--ejemplares
EXEC AltaEjemplar('M1');
EXEC AltaEjemplar('M1');
EXEC AltaEjemplar('M1');
EXEC AltaEjemplar('M2');
EXEC AltaEjemplar('M2');
EXEC AltaEjemplar('M12');
EXEC AltaEjemplar('M13');
EXEC AltaEjemplar('M14');
EXEC AltaEjemplar('M15');
EXEC AltaEjemplar('M16');



--tipo lector
INSERT INTO tipoLector VALUES ('TL1', 'Estudiante', '3', '1','8' );
INSERT INTO tipoLector VALUES ('TL2', 'Profesor', '5', '2','15' );
INSERT INTO tipoLector VALUES ('TL3', 'Investigador', '10', '3','30' );

--lectores
declare
  vTipoLector char(3);
begin
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('0983813282', 'Carey', 'Rustan', 'Ansell', 'CDMX', '4', 'calle-75', 'colonia-00', 'delegacion-48', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('1953180047', 'Casey', 'Sapsforde', 'Wroe', 'CDMX', '5', 'calle-50', 'colonia-72', 'delegacion-00', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('6886594908', 'Alisun', 'Eckery', 'Linner', 'BC', '4', 'calle-89', 'colonia-52', 'delegacion-20', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('5707838082', 'Krissie', 'Houndson', 'Lafee', 'CDMX', '4', 'calle-94', 'colonia-46', 'delegacion-55', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('4568285599', 'Danit', 'Yitzhakov', 'Letessier', 'BC', '7', 'calle-46', 'colonia-56', 'delegacion-20', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('7112882060', 'Mychal', 'Wooffinden', 'Barkworth', 'BC', '7', 'calle-76', 'colonia-33', 'delegacion-10', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('0028418167', 'Neysa', 'Bytheway', 'Readwing', 'CDMX', '7', 'calle-42', 'colonia-70', 'delegacion-13', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('4509672820', 'Erna', 'Jozwicki', 'Duerdin', 'CDMX', '0', 'calle-70', 'colonia-52', 'delegacion-42', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('3759962312', 'Tynan', 'Murrey', 'Philipsen', 'Puebla', '2', 'calle-30', 'colonia-75', 'delegacion-33', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('8702003894', 'Sacha', 'Scading', 'McLagan', 'Puebla', '4', 'calle-52', 'colonia-22', 'delegacion-33', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;

end;
/

--prestamos
EXEC altaprestamo('L1', 'EJ0', 'M1');
EXEC altaprestamo('L1', 'EJ0', 'M2');
EXEC altaprestamo('L1', 'EJ1', 'M1');
EXEC altaprestamo('L3', 'EJ0', 'M12');
EXEC altaprestamo('L4', 'EJ2', 'M1');
EXEC altaprestamo('L5', 'EJ1', 'M2');
EXEC altaprestamo('L6', 'EJ0', 'M13');
EXEC altaprestamo('L7', 'EJ0', 'M14');
EXEC altaprestamo('L8', 'EJ0', 'M16');
EXEC altaprestamo('L9', 'EJ0', 'M15');

UPDATE prestamo SET fecharesello = SYSDATE - 20, fechaprestamo = SYSDATE - 20, fechavencimiento = SYSDATE - 12 WHERE LECTOR_ID = 'L5'; 
UPDATE prestamo SET fecharesello = SYSDATE - 40, fechaprestamo = SYSDATE - 40, fechavencimiento = SYSDATE - 20 WHERE LECTOR_ID = 'L6'; 
UPDATE prestamo SET fecharesello = SYSDATE - 30, fechaprestamo = SYSDATE - 30, fechavencimiento = SYSDATE - 12 WHERE LECTOR_ID = 'L7'; 
UPDATE prestamo SET fecharesello = SYSDATE - 26, fechaprestamo = SYSDATE - 26, fechavencimiento = SYSDATE - 5 WHERE LECTOR_ID = 'L8';
UPDATE prestamo SET fecharesello = SYSDATE - 20, fechaprestamo = SYSDATE - 20, fechavencimiento = SYSDATE - 12 WHERE LECTOR_ID = 'L9'; 


--Multas
DELETE prestamo WHERE prestamo_id = 'P0';
DELETE prestamo WHERE prestamo_id = 'P1';
DELETE prestamo WHERE prestamo_id = 'P2';
DELETE prestamo WHERE prestamo_id = 'P3';
DELETE prestamo WHERE prestamo_id = 'P4';


ALTER TRIGGER tgRevisarResello ENABLE;

