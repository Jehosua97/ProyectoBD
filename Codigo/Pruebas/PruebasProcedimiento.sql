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
--EXEC AltaEjemplar(NOEJEMPLAR, MATERIAL_ID);
EXEC AltaEjemplar('M1');


/*******Procedimiento Borra Ejemplar (Joya)*********/
/*******Procedimiento Actualiza Ejemplar (Joya)*********/
