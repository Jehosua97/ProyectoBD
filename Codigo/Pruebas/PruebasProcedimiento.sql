/*******Procedimiento Alta Libro (Lazaro)*********/
--Notas: El ISBN se debe variar manualmente para la insercion
--exec AltaLibro(UBICACION, COLOCACION, TITULO, TIPO MATERIAL,'AUTORID', NUMADQUSICION, ISBN, TEMA, EDUCION); 
EXEC AltaLibro('Primer Piso', 'Arriba', 'Hansel y Grettell', 'L', 'A1', null, 'ISBN6', 'Novelas', 'Quinta'); 

/*******Procedimiento Borra Libro (Lazaro)*********/
--exec BorraLibro(MATERIAL_ID);
EXEC BorraLibro('M1');

/*******Procedimiento Actualiza Libro (Lazaro)*********/
--exec ActualizaLibro(MATERIAL_ID, CAMPO.A.MODIFICAR.MAYUSCULAS, VALOR_NUEVO);
EXEC  ActualizaLibro('M8', 'NOADQUISICION', '20');  


/*******Procedimiento Alta Tesis (Oscar)*********/
/*******Procedimiento Borra Tesis (Oscar)*********/
/*******Procedimiento Actualiza Tesis (Oscar)*********/

/*******Procedimiento Alta Director Tesis (Chavira)*********/
--NOTAS: --* gradoEnTexto, por ejemplo: 'Kinder', 'Secu', de la tabla gradoAcademico
         --* apMat se puede ignorar:
--EXEC AltaDirTesis(director_id, gradoEnTexto, Nombre, ApPat, ApMat);
EXEC AltaDirTesis('D4', 'Kinder', 'Uriel', 'Castro', 'Gonzalez');

/*******Procedimiento Borra Director Tesis (Chavira)*********/
--EXEC BajaDirTesis(DIRECTOR_ID);
EXEC BajaDirTesis('D4');

/*******Procedimiento Actualiza Director Tesis (Chavira)*********/
--EXEC ActualizaDirTesis(DIRECTOR_ID, GRADOACADEMICO, NOMBRE, APPATERNO, APMATERNO);
EXEC ActualizaDirTesis('D2', 'Prepa', 'Alberto', 'Gonzalo', 'Venegas');


/*******Procedimiento Alta Ejemplar (Joya)*********/
--NOTAS: El estatus siempre se iniciará en ES1 (Disponible) por default
       --El numeroEjemplar se asigna automaticamente dependiendo el material
--EXEC AltaEjemplar(MATERIAL_ID);
EXEC AltaEjemplar('M1');

/*******Procedimiento Borra Ejemplar (Joya)*********/
--EXEC BajaEjemplar(NoEJEMPLAR, MATERIAL_ID);
EXEC BajaEjemplar('EJ2', 'M2');

/*******Procedimiento Actualiza Ejemplar (Joya)*********/
--NOTAS: --*No se podrá modificar el estatus si se encuntra en prestamo el ejemplar
--EXEC ActualizaEjemplar(NOEJEMPLAR, MATERIAL_ID, CAMPO.A.MODIFICAR, VALOR);
EXEC ActualizaEjemplar('EJ1', 'M6', 'ESTATUS_ID' ,'ES3');


/*******Procedimiento Alta Lector (Lazaro)*********/
--EXEC AltaLector('TELEFONO','NOMBRE','APPATERNO','APMATERNO','CIUDAD','NUMERO'','CALLE','Colonia','Delegacion','TIPOLECTOR');
EXEC AltaLector('5520181818','Abraham','Lazaro','Martinez','CDMX','X','Calle X','Colonia X','Delegacion X','TL1');

/*******Procedimiento Borra Lector (Lazaro)*********/
--NOTAS: Si no existe el lector aun asi hace el procedimineto
--EXEC BorraLector(LECTOR_ID);
EXEC BorraLector('L1');

/*******Procedimiento Actualiza Lector (Lazaro)*********/
--EXEC ActualizaLector(LECTOR_ID, CAMPO, VALOR);
EXEC ActualizaLector('L1', 'FECHAALTALECTOR', '01/01/13');

/*******Procedimiento Alta Prestamo (Oscar)*********/
/*******Procedimiento Borra Prestamo (Oscar)*********/
/*******Procedimiento Actualiza Prestamo (Oscar)*********/


/*******Procedimiento Alta Multa (Chavira)*********/
--EXEC AltaMulta(PRESTAMO_ID);
EXEC AltaMulta('P1')

/*******Procedimiento Baja Multa (Chavira)*********/
--EXEC BajaMulta(MULTA_ID);
EXEC BajaMulta('MU1');

/*******Procedimiento Actualiza Multa (Chavira)*********/


/*******Procedimiento Alta GradoAcademico (Joya)*********/
EXEC AltaGradoAcademico('Kinder');
/*******Procedimiento Baja GradoAcademico (Joya)*********/

/*******Procedimiento Actualiza GradoAcademico (Joya)*********/
