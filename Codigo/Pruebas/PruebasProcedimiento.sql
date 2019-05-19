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
--EXEC AltaTesis(v_carreraTema,v_anoPublicacion,v_director_id, v_ubicacion, v_colocacion, v_titulo,v_autor_id);
EXEC AltaTesis('Ingenieria','2019','D1','Mexico','Abajo','Algebra1','A3');
/*******Procedimiento Actualiza Tesis (Oscar)*********/
EXEC ActualizaTesis('M8', 'TITULO', 'Nuevo titulo');
/*******Procedimiento Borra Tesis (Oscar)*********/
EXEC BajaTesis('M8');

/*******Procedimiento Alta Director Tesis (Chavira)*********/
--NOTAS: --* gradoEnTexto, por ejemplo: 'Kinder', 'Secu', de la tabla gradoAcademico
         --* apMat se puede ignorar:
--EXEC AltaDirTesis(SeqAltaDirectorTesis.nextval, gradoEnTexto, Nombre, ApPat, ApMat);
EXEC AltaDirTesis(SeqAltaDirectorTesis.nextval, 'Kinder', 'Uriel', 'Castro', 'Gonzalez');

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
EXEC AltaPrestamo('L1', 'EJ2', 'M3');
/*******Procedimiento Actualiza Prestamo (Oscar)*********/
EXEC ActualizaPrestamo('P3', 'RESELLO', '1');
/*******Procedimiento resello (Joya)*********/
--EXEC resello(prestamo_id);
EXEC resello('P2');
/*******Procedimiento Borra Prestamo (Oscar)*********/
EXEC BajaPrestamo('P9');

/*******Procedimiento Alta Multa (Chavira)*********/
--EXEC AltaMulta(PRESTAMO_ID, LECTOR_ID, FECHAVENCIMIENTO);
EXEC AltaMulta('P1', 'L2', '01/01/12');

/*******Procedimiento Baja Multa (Chavira)*********/
--EXEC BajaMulta(MULTA_ID);
EXEC BajaMulta('MU1');

/*******Procedimiento Actualiza Multa (Chavira)*********/
--EXEC ActualizaMulta(MULTA_ID, FECHA_MULTA, DIASRETRASO);
EXEC ActualizaMulta('MU1', SYSDATE, 29);

/*******Procedimiento Alta GradoAcademico (Joya)*********/
--EXEC AltaGradoAcademico(DESCRIPCIONGRADOACADEMICO);
EXEC AltaGradoAcademico('Kinder');

/*******Procedimiento Baja GradoAcademico (Joya)*********/
--EXEC BajaGradoAcademico(GRADO_ID);
EXEC BajaGradoAcademico('GA2');

/*******Procedimiento Actualiza GradoAcademico (Joya)*********/
--EXEC ActualizaGradoAcademico(GRADO_ID, DESCRIPCION);
EXEC ActualizaGradoAcademico('GA2', 'UNIVERSIDAD');
