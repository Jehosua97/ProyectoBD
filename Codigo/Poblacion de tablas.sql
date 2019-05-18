--Autor
exec AltaAutor('Catlaina', 'Gerritsma', 'Zipsell', 'Pakistani');
exec AltaAutor('Andeee', 'Tuer', 'McGoldrick', 'Thai');
exec AltaAutor('Annette', 'Paxforde', 'Ecob', 'Laotian');
exec AltaAutor('Hyacintha', 'Bradtke', 'Pontin', 'Colombian');
exec AltaAutor('Barbi', 'Spracklin', 'Kitt', 'Dominican (Dominican Republic)');
exec AltaAutor('Vernice', 'Dainter', 'Dryburgh', 'Panamanian');
exec AltaAutor('Connie', 'Thring', 'Anderer', 'Alaska Native');
exec AltaAutor('Brande', 'Dawson', 'Erni', 'Uruguayan');
exec AltaAutor('Billi', 'Corking', 'Jellett', 'Fijian');
exec AltaAutor('Riva', 'Beddingham', 'Dunleavy', 'Eskimo');

--Libros
exec AltaLibro('sotano', 'arriba', 'Under the Domim Tree (Etz Hadomim Tafus)', 'Indonesian', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '651665651-7', 'n/a', 1);
exec AltaLibro('primer piso', 'abajo', 'Ricky Gervais: Out of England - The Stand-Up Special', 'Taiwanese', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '942371083-2', 'Public Utilities', 2);
exec AltaLibro('sotano', 'abajo', 'Beat the Devil', 'Ottawa', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '774114970-9', 'n/a', 3);
exec AltaLibro('sotano', 'arriba', 'Rebellion (L''ordre et la morale)', 'Tohono O''Odham', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '467907549-X', 'n/a', 4);
exec AltaLibro('sotano', 'arriba', 'Uncertainty', 'Paiute', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '867356448-4', 'n/a', 5);
exec AltaLibro('primer piso', 'abajo', 'Letter from an Unknown Woman', 'Pueblo', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '570795478-3', 'n/a', 6);
exec AltaLibro('primer piso', 'arriba', 'Wagner''s Dream', 'Melanesian', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '256681977-7', 'Consumer Services', 7);
exec AltaLibro('segundo piso', 'abajo', 'Thick-Walled Room, The (Kabe atsuki heya)', 'Puerto Rican', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '343065905-1', 'n/a', 8);
exec AltaLibro('sotano', 'abajo', 'SS Camp 5: Women''s Hell (SS Lager 5: L''inferno delle donne)', 'Navajo', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '272771509-9', 'n/a', 9);
exec AltaLibro('segundo piso', 'abajo', 'Kid from Brooklyn, The', 'Aleut', (select autor_id from (select autor_id from autor order by dbms_random.value) where rownum=1), '385322086-X', 'Consumer Services', 10);

--Tesis

--grado academico
INSERT INTO gradoAcademico VALUES ('GA1', 'Kinder');
INSERT INTO gradoAcademico VALUES ('GA2', 'Secu');
INSERT INTO gradoAcademico VALUES ('GA3', 'Prepa');

--director tesis
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Géraldine', 'Meriot', 'Coulthard');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Marie-françoise', 'Refford', 'Kelleway');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Personnalisée', 'Calton', 'Bogart');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Danièle', 'Klimashevich', 'Tarbin');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Eugénie', 'Maddra', 'Challiss');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Estée', 'Rounsefell', 'Arthey');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Adèle', 'Fairchild', 'McSperrin');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Yè', 'Guilloton', 'Riddington');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Maïlys', 'Fussen', 'Binnall');
exec AltaDirTesis(SeqAltaDirectorTesis.nextval, (select descripcionGA from (select * from gradoacademico order by dbms_random.value) where rownum=1 ), 'Clémentine', 'Tole', 'Gaffon');
--estatus

INSERT INTO estatus VALUES ('ES1', 'Disponible');
INSERT INTO estatus VALUES ('ES2', 'Prestado');
INSERT INTO estatus VALUES ('ES3', 'No deja biblioteca');
INSERT INTO estatus VALUES ('ES4', 'En mantenimiento');

--ejemplares

exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));
exec AltaEjemplar((select material_id from (select material_id from material order by dbms_random.value) where rownum=1));

--tipo lector

INSERT INTO tipoLector VALUES ('TL1', 'Estudiante', '3', '1','8' );
INSERT INTO tipoLector VALUES ('TL2', 'Profesor', '5', '2','15' );
INSERT INTO tipoLector VALUES ('TL3', 'Investigador', '10', '3','30' );

--lectores
exec AltaLector('0983813282', 'Carey', 'Rustan', 'Ansell', 'CDMX', '4', 'calle-75', 'colonia-00', 'delegacion-48', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('1953180047', 'Casey', 'Sapsforde', 'Wroe', 'CDMX', '5', 'calle-50', 'colonia-72', 'delegacion-00', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('6886594908', 'Alisun', 'Eckery', 'Linner', 'BC', '4', 'calle-89', 'colonia-52', 'delegacion-20', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('5707838082', 'Krissie', 'Houndson', 'Lafee', 'CDMX', '4', 'calle-94', 'colonia-46', 'delegacion-55', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('4568285599', 'Danit', 'Yitzhakov', 'Letessier', 'BC', '7', 'calle-46', 'colonia-56', 'delegacion-20', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('7112882060', 'Mychal', 'Wooffinden', 'Barkworth', 'BC', '7', 'calle-76', 'colonia-33', 'delegacion-10', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('0028418167', 'Neysa', 'Bytheway', 'Readwing', 'CDMX', '7', 'calle-42', 'colonia-70', 'delegacion-13', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('4509672820', 'Erna', 'Jozwicki', 'Duerdin', 'CDMX', '0', 'calle-70', 'colonia-52', 'delegacion-42', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('3759962312', 'Tynan', 'Murrey', 'Philipsen', 'Puebla', '2', 'calle-30', 'colonia-75', 'delegacion-33', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));
exec AltaLector('8702003894', 'Sacha', 'Scading', 'McLagan', 'Puebla', '4', 'calle-52', 'colonia-22', 'delegacion-33', (select tipolector_id from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1));

--prestamos


--multas

