SET SERVEROUTPUT ON

--------------------------------------------1.-LIBRO. (Dar de alta el MATERIAL). -- Lázaro
/*AltaLibro*/
set serveroutput on
create or replace procedure AltaLibro(
  --parametros para la tabla material
  vMaterial_id out char,
  vUbicacion in varchar2,
  vColocacion in varchar2,
  vTitulo in varchar2,
  --parametro para agregar el autor en la tabla escribe
  --tomamos en cuenta que el autor existe
  vAutor_id in out char,
  --parametros para agregar a la tabla libro
  vNoAdquisicion in char,
  vISBN in char,
  vTema in varchar2,
  vEdicion in varchar2
)
is
  vCantidadDeAutores number;
  vCantidadDeLibros number;
begin
  --se cuenta cuantos autores con ese Id existen
  select count(*)
  into vCantidadDeAutores
  from autor
  where autor_id=vAutor_id;
  --se valida que el autor_id exista dentro de la base de datos, en la tabla
  --pertinente
  if vCantidadDeAutores=1 then
    --se encuentra el id del nuevo material
    select count(*)
    into vCantidadDeLibros
    from material;
    --se asigna a la variable pertinente
    vMaterial_id:= 'M'||(vCantidadDeLibros+1);
    --se inserta en la tabla material
    insert into material (material_id,ubicacion,colocacion,titulo)
    values(vMaterial_id,vUbicacion,vColocacion,vTitulo);
    --se inserta en la tabla escribe
    insert into escribe (material_id,autor_id)
    values(vMaterial_id,vAutor_id);
    --se inserta en la tabla libro
    insert into libro (material_id,noAdquisicion,ISBN,tema,edicion)
    values(vMaterial_id,vNoAdquisicion,vISBN,vTema,vEdicion);

  else
    raise_application_error(-20050,'ERROR No existe un autor con ese Id,
      favor de dar de alta ese autor antes de generar un material a su nombre');
  end if;

end;
/
show errors;

/*BorraLibro*/
create or replace procedure BorraLibro(
  vMaterial_id char
)
is
  vPrestamos number;
  vEjemplares number;
  vBandera number;
begin
  --se cuenta cuantos prestamos hay de ese libro
  select count(*)
  into vPrestamos
  from prestamo
  where material_id=vMaterial_id;
  --se cuenta cuantos ejemplares hay de ese libro
  select count(*)
  into vEjemplares
  from ejemplar
  where material_id=vMaterial_id;
  --se compara si existen prestamos del libro, si existen prestamos no se puede
  --eliminar
  if vPrestamos != 0 then
    raise_application_error(-20051,'ERROR No puede eliminar ese libro mientras
      existan ejemplares del libro en prestamo, se encontraron '
      ||vPrestamos
      ||' prestamos');
  else
    --de acuerdo a la cantidad de ejemplares del libro, si es diferente de 0
    --se le pedirá al usuario que confirme si quiere eliminar o no
    --el libro con todos los ejemplares
    if vEjemplares!=0 then
      dbms_output.put_line('Existen '
        ||vEjemplares
        ||' ejemplares de ese libro, se borraran junto con el libro');

    end if;
    --se borrara el libro junto
    --con lo que contemple, borrar los ejemplares, su relacion en escribe,
    --su registro en libro y en material

    delete from ejemplar where material_id=vMaterial_id;
    delete from libro where material_id=vMaterial_id;
    delete from escribe where material_id=vMaterial_id;
    delete from material where material_id=vMaterial_id;

  end if;

end;
/
show errors

/*ActualizaLibro*/
create or replace procedure ActualizaLibro(
  --se indican tres parametros, el id del material libro a actualizar
  --el campo que se actualiza y el valor del campo
  vMaterial_id in char,
  vCampo in varchar2,
  vValor in varchar2
)
is
begin
  --mediante un case checamos los posibles valores que puede tener 'vCampo'
  case
    when upper(vCampo) = 'UBICACION' then
      update material set ubicacion=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'COLOCACION' then
      update material set colocacion=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'TITULO' then
      update material set titulo=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'NOADQUISICION' then
      update libro set noAdquisicion=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'ISBN' then
      update libro set ISBN=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'TEMA' then
      update libro set tema=vValor
      where material_id = vMaterial_id;

    when upper(vCampo) = 'EDICION' then
      update libro set edicion=vValor
      where material_id = vMaterial_id;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');

  end case;
end;
/
show errors;

--------------------------------------------2.-TESIS. (Dar de alta el MATERIAL). — Oscar
/*AltaTesis*/
set serveroutput on
CREATE OR REPLACE PROCEDURE AltaTesis(
  v_material_id     IN tesis.material_id%TYPE,
  v_tesis_id        IN tesis.tesis_id%TYPE,
  v_carreraTema     IN tesis.carreraTema%TYPE,
  v_añoPublicacion  IN tesis.añoPublicacion%TYPE,
  v_director_id     IN tesis.director_id%TYPE
)
AS
BEGIN
  INSERT INTO tesis
  VALUES (vMaterial_id, v_tesis_id, v_carreraTema, v_añoPublicacion, v_director_id);
  DBMS_OUTPUT.PUT_LINE('Se inserto un nuevo material tipo tesis:  ' || vMaterial_id);
  COMMIT;
END AltaTesis;
/

/*BajaTesis*/
CREATE OR REPLACE PROCEDURE BajaTesis(
  v_material_id     IN tesis.material_id%TYPE
)
AS
BEGIN
  DELETE tesis
  WHERE material_id = v_material_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se elimino el material tipo tesis con id:  ' || vgradoAcademico_id);
END BajaTesis;
/

/*ActualizaTesis*/
CREATE OR REPLACE PROCEDURE ActualizaTesis(
  vMaterial_id IN CHAR,
  vCampo IN varchar2,
  vValor IN VARCHAR2
)
is
BEGIN
  CASE
    WHEN UPPER(vCampo) = 'UBICACION' THEN
      UPDATE material SET ubicacion=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'COLOCACION' THEN
      UPDATE material SET colocacion=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'TITULO' THEN
      UPDATE material SET titulo=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'TESIS_ID' THEN
      UPDATE tesis SET tesis_id=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'CARRERATEMA' THEN
      UPDATE tesis SET carreraTema=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'AÑOPUBLICACION' THEN
      UPDATE tesis SET añoPublicacion=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'DIRECTOR_ID' THEN
      UPDATE tesis SET director_id=vValor
      WHERE material_id = vMaterial_id;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');

  end case;
end;
/

--------------------------------------------3.-DIRECTOR DE TESIS.--Chavira
/*AltaDirTesis*/
/*BajaDirTesis*/
/*ActualizaDirTesis*/
--------------------------------------------4.-EJEMPLAR.--Joya
/*AltaEjemplar*/
CREATE OR REPLACE PROCEDURE AltaEjemplar(
  vnoEjemplar IN ejemplar.noEjemplar%TYPE,
  vmaterial_id IN ejemplar.material_id%TYPE,
  vestatus_id IN ejemplar.estatus_id%TYPE
)
AS
BEGIN
IF (vnoEjemplar)
INSERT INTO ejemplar VALUES (vnoEjemplar, vmaterial_id,vestatus_id);
COMMIT;
DBMS_OUTPUT.PUT_LINE('Se insertó el ejemplar con id: ' || vnoEjemplar);
END AltaEjemplar;
/

/*BajaEjemplar*/
CREATE OR REPLACE PROCEDURE BajaEjemplar(
  vnoEjemplar IN ejemplar.noEjemplar%TYPE
)
IS
  vestatus_id ejemplar.estatus_id%TYPE;
BEGIN
SELECT estatus_id INTO vestatus_id
FROM ejemplar WHERE (vnoEjemplar = noEjemplar);
IF (vestatus_id != 'ES2') THEN
  DELETE FROM ejemplar WHERE (vnoEjemplar = noEjemplar);
  DBMS_OUTPUT.PUT_LINE('Se eliminó el ejemplar con id: ' || vnoEjemplar);
  COMMIT;
ELSE
  DBMS_OUTPUT.PUT_LINE('El ejemplar con id ' || vnoEjemplar||' está en prestamo (No se puede eliminar)');
END IF;
END BajaEjemplar;
/

/*ActualizaEjemplar*/
CREATE OR REPLACE PROCEDURE ActualizaEjemplar(
  vnoEjemplar IN ejemplar.noEjemplar%TYPE,
  vmaterial_id IN ejemplar.material_id%TYPE,
  vestatus_id IN ejemplar.estatus_id%TYPE
)
AS
BEGIN
  UPDATE ejemplar
  SET  noEjemplar = vnoEjemplar,
        material_id = vmaterial_id,
        estatus_id = vestatus_id
  WHERE vnoEjemplar = noEjemplar;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se actualizó ejemplar con id ' || vnoEjemplar);
END ActualizaEjemplar;
/
--------------------------------------------5.-LECTOR. --Lázaro
/*AltaLector*/
create or replace procedure AltaLector(
  vLector_id out char,
  vTelefono in varchar2,
  vNombre in varchar2,
  vApPaternoLector in varchar2,
  vApMaternoLector in varchar2,
  vEstado in varchar2,
  vNumero in varchar2,
  vCalle in varchar2,
  vColonia in varchar2,
  vDelegacion in varchar2,
  vTipoLector_id in char
)
is
  vCantidadDeTipos number;
begin
  select count(*)
  into vCantidadDeTipos
  from tipolector
  where tipolector_id = vTipoLector_id;

  select 'L'||count(*)+1
  into vLector_id
  from lector;

  if vCantidadDeTipos != 0 then
    insert into lector (lector_id,fechaAltaLector,telefonoLector,fechaVigenciaLector,
      nombreLector,apPaternoLector,apMaternoLector,AdeudoLector,estado,numero,calle,
      colonia,delegacion,tipolector_id)
    values(vLector_id,sysdate,vTelefono,sysdate+365,vNombre,vApPaternoLector,
      vApMaternoLector,0,vEstado,vNumero,vCalle,vColonia,vDelegacion,vTipoLector_id);
    dbms_output.put_line('Alta de Usuario '
      ||vLector_id
      ||' exitosa');
  else
    raise_application_error(-20052,'ERROR Ese tipo de lector no existe');
  end if;
end;
/
show errors


/*BorraLector*/
create or replace procedure BorraLector(
  vLector_id in char
)
is
  vCantidadDePrestamos number(4,0);
begin
  --se cuenta cuantos prestamos tiene el lector
  select count(*)
  into vCantidadDePrestamos
  from prestamo
  where lector_id=vLector_id;
  --si no tiene prestamos, se puede eliminar, en otro caso no se puede y se
  --lanza la excepcion
  if vCantidadDePrestamos = 0 then
    delete from lector where lector_id=vLector_id;
  else
    raise_application_error(-20054,'ERROR No se puede eliminar al lector
      mientras tenga prestamos en curso, se encontraron '
      ||vCantidadDePrestamos
      ||' prestamos registrados');
  end if;
end;
/
show errors;

/*ActualizaLector*/
create or replace procedure ActualizaLector(
  vLector_id in char,
  vCampo in varchar2,
  vValor in varchar2
)
is
  vFecha date;
begin
  case
    when upper(vCampo) = 'FECHAALTALECTOR' then

      if to_date(vValor,'dd/mm/yy') = SYSDATE then
        vFecha := sysdate;
      else
        vFecha := to_date(vValor,'dd/mm/yy');
      end if;

      update lector set fechaAltaLector = vFecha,
        fechaVigenciaLector = vFecha+365
      where lector_id=vLector_id;

    when upper(vCampo) = 'TELEFONOLECTOR' then

      update lector set telefonoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'NOMBRELECTOR' then

      update lector set nombreLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'APPATERNOLECTOR' then

      update lector set apPaternoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'APMATERNOLECTOR' then

      update lector set apMaternoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'ADEUDOLECTOR' then

      update lector set adeudoLector=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'ESTADO' then

      update lector set estado=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'NUMERO' then

      update lector set numero=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'CALLE' then

      update lector set calle=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'COLONIA' then

      update lector set colonia=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'DELEGACION' then

      update lector set delegacion=vValor
      where lector_id=vLector_id;

    when upper(vCampo) = 'TIPOLECTOR_ID' then

      update lector set tipoLector_id=vValor
      where lector_id=vLector_id;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');

  end case;
end;
/
show errors
--------------------------------------------6.-PRESTAMO. -- Oscar
/*AltaPrestamo*/
set serveroutput on
CREATE OR REPLACE PROCEDURE AltaPrestamo(
  v_prestamoId  IN prestamo.prestamoId%TYPE,
  v_resello     IN prestamo.resello%TYPE,
  v_lector_id   IN prestamo.lecotr_id%TYPE,
  v_noEjemplar  IN prestamo.noEjemplar%TYPE,
  v_material_id IN prestamo.material_id%TYPE,
)
AS
v_fechaPrestamo DATE := SYSDATE;
v_fechaVencimiento DATE := SYSDATE + 5;
BEGIN
  INSERT INTO prestamo
  VALUES (v_prestamoId, v_resello, NULL, v_fechaPrestamo, v_fechaVencimiento,,v_lector_id, v_noEjemplar, v_material_id);
  DBMS_OUTPUT.PUT_LINE('Se realizó el prestamo del material:  ' || v_material_id|| ' Al lector: '|| v_lector_id);
  COMMIT;
END AltaPrestamo;
/

/*BajaPrestamo*/
CREATE OR REPLACE PROCEDURE BajaPrestamo(
  v_prestamoId  IN prestamo.prestamoId%TYPE,
)
AS
BEGIN
  DELETE prestamo
  WHERE prestamoId = v_prestamoId;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se ha devuelto el material:  ' || v_material_id);
END BajaPrestamo;
/

/*ActualizaPrestamo*/
CREATE OR REPLACE PROCEDURE ActualizaPrestamo(
  vprestamoId IN CHAR,
  vCampo IN varchar2,
  vValor IN VARCHAR2
)
is
vFecha DATE;
BEGIN
  CASE
    WHEN UPPER(vCampo) = 'RESELLO' THEN
      UPDATE prestamo SET resello = vValor
      WHERE prestamoId = vprestamoId;

    WHEN UPPER(vCampo) = 'FECHARESELLO' THEN
      IF TO_DATE(vValor,'dd/mm/yy') = SYSDATE THEN
        vFecha := SYSDATE;
      ELSE
        vFecha := TO_DATE(vValor,'dd/mm/yy');
      END if;

      UPDATE prestamo
      SET fecharesello = vFecha,
          fechaVencimiento = vFecha+5
      WHERE prestamoID = vprestamoId;

    WHEN UPPER(vCampo) = 'FECHAPRESTAMO' THEN

      IF TO_DATE(vValor,'dd/mm/yy') = SYSDATE THEN
        vFecha := SYSDATE;
      ELSE
        vFecha := TO_DATE(vValor,'dd/mm/yy');
      END if;

      UPDATE prestamo
      SET fechaPrestamo = vFecha,
          fechaVencimiento = vFecha+5
          WHERE prestamoID = vprestamoId;

    WHEN UPPER(vCampo) = 'LECTOR_ID' THEN
      UPDATE prestamo SET lecotr_id = vValor
      WHERE prestamoId = vprestamoId;

    WHEN UPPER(vCampo) = 'NOEJEMPLAR' THEN
      UPDATE prestamo SET noEjemplar = vValor
      WHERE prestamoId = vprestamoId;

    WHEN UPPER(vCampo) = 'MATERIAL_ID' THEN
      UPDATE prestamo SET material_id = vValor
      WHERE prestamoId = vprestamoId;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');

  end case;
end;
/

--------------------------------------------7.-MULTA. – Chavira
/*AltaMulta*/
/*BajaMulta*/
/*ActualizaMulta*/
--------------------------------------------8.-GRADO ACADEMICO. –- Joya
/*AltaGradoAcademico*/
CREATE OR REPLACE PROCEDURE AltaGradoAcademico(
  vgradoAcademico_id IN gradoAcademico.gradoAcademico_id%TYPE,
  vdescripcionGA IN gradoAcademico.descripcionGA%TYPE
)
AS
BEGIN
  INSERT INTO gradoAcademico
  VALUES (vgradoAcademico_id, vdescripcionGA);
  DBMS_OUTPUT.PUT_LINE('Se inserto un nuevo grado academico con id:  ' || vgradoAcademico_id);
  COMMIT;
END AltaGradoAcademico;
/

/*BajaGradoAcademico*/
CREATE OR REPLACE PROCEDURE BajaGradoAcademico(
    vgradoAcademico_id IN gradoAcademico.gradoAcademico_id%TYPE
)
AS
BEGIN
  DELETE gradoAcademico
  WHERE vgradoAcademico_id = gradoAcademico_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se elimino el grado academico con id:  ' || vgradoAcademico_id);
END BajaGradoAcademico;
/

/*ActualizaGradoAcademico*/
CREATE OR REPLACE PROCEDURE ActualizaGradoAcademico(
  vgradoAcademico_id IN gradoAcademico.gradoAcademico_id%TYPE,
  vdescripcionGA IN gradoAcademico.descripcionGA%TYPE
)
AS
BEGIN
  UPDATE gradoAcademico
  SET gradoAcademico_id = vgradoAcademico_id,
        descripcionGA = vdescripcionGA
  WHERE vgradoAcademico_id = gradoAcademico_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se actualizó el grado academico con id:  ' || vgradoAcademico_id);
END ActualizaGradoAcademico;
/
