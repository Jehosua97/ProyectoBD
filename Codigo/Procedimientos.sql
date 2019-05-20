SET SERVEROUTPUT ON

--------------------------------------------1.-LIBRO. (Dar de alta el MATERIAL). -- Lázaro
/*AltaLibro*/
create or replace procedure AltaLibro(
  --parametros para la tabla material
  vUbicacion in varchar2,
  vColocacion in varchar2,
  vTitulo in varchar2,
  vTipo in char,
  --parametro para agregar el autor en la tabla escribe
  --tomamos en cuenta que el autor existe
  vAutor_id in char,
  --parametros para agregar a la tabla libro
  vISBN in char,
  vTema in varchar2,
  vEdicion in varchar2
)
is
  vMaterial_id char(5);
  vCantidadDeAutores number;
  vCantidadDeLibros number;
  vCantidadDeAdquisiciones number;
begin
  if vTipo != 'L' then
    raise_application_error(-20049,'ERROR El tipo de material no es libro, ocupa
      el otro procedimiento para agregar tesis');
  end if;
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

    vCantidadDeAdquisiciones:=SeqAltalibro.nextval;

    --se asigna a la variable pertinente
    vMaterial_id:= 'M' || SeqAltaMaterial.NEXTVAL;
    --se inserta en la tabla material
    insert into material (material_id,ubicacion,colocacion,titulo,tipoMaterial)
    values(vMaterial_id,vUbicacion,vColocacion,vTitulo,vTipo);
    --se inserta en la tabla escribe
    insert into escribe (material_id,autor_id)
    values(vMaterial_id,vAutor_id);
    --se inserta en la tabla libro
    insert into libro (material_id,noAdquisicion,ISBN,tema,edicion)
    values(vMaterial_id,vCantidadDeAdquisiciones,vISBN,vTema,vEdicion);

    dbms_output.put_line('Se dio de alta exitosamente al libro '|| vMaterial_id);

  else
    raise_application_error(-20050,'ERROR No existe un autor con ese Id,
      favor de dar de alta ese autor antes de generar un material a su nombre');
  end if;

end;
/

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
  -- DATOS PARA TESIS
  v_carreraTema     IN tesis.carreraTema%TYPE,
  v_anoPublicacion  IN tesis.anoPublicacion%TYPE,
  v_director_id     IN tesis.director_id%TYPE, -- YA DEBE DE EXISTIR EL DIRECTOR
  -- DATOS PARA MATERIAL
  v_ubicacion       IN material.ubicacion%TYPE,
  v_colocacion      IN material.colocacion%TYPE,
  v_titulo          IN material.titulo%TYPE,
  -- DATOS PARA ESCRIBE .. YA DEBE DE EXISTIR EL AUTOR
  v_autor_id        IN autor.autor_id%TYPE
)
AS
  v_existeAutor NUMBER;
  v_existeDirector NUMBER;
  v_material_id material.material_id%TYPE;
  v_tesis_id tesis.tesis_id%TYPE;
BEGIN

  --VERIFIACR SI EXITE EL MATERIAL_ID
  SELECT COUNT(*) INTO v_existeAutor -- si es 0 no existe
  FROM autor
  WHERE autor_id = v_autor_id;

  SELECT COUNT(*) INTO v_existeDirector -- si es 0 no existe
  FROM directorTesis
  WHERE director_id = v_director_id;

  IF v_existeAutor = 0 OR v_existeDirector = 0 THEN  --SI NO EXISTE AUTOR
    raise_application_error(-20100,'ERROR Debe de existir autor y director');
  ELSE
    v_material_id := 'M' || SeqAltaMaterial.NEXTVAL;
    v_tesis_id := 'T' || SeqAltaTesis.NEXTVAL;

    INSERT INTO material
    VALUES(v_material_id, v_ubicacion, v_colocacion, v_titulo, 'T');

    INSERT INTO escribe
    VALUES(v_material_id, v_autor_id);

    INSERT INTO tesis
    VALUES (v_material_id, v_tesis_id, v_carreraTema, v_anoPublicacion, v_director_id);
    DBMS_OUTPUT.PUT_LINE('Se inserto un nuevo material tipo tesis:  ' || v_material_id);
    COMMIT;
  END IF;
END AltaTesis;
/
show errors

/*BajaTesis*/
CREATE OR REPLACE PROCEDURE BajaTesis(
  v_material_id     IN tesis.material_id%TYPE
)
AS
  v_existePrestamo NUMBER;
BEGIN

  SELECT COUNT(*) INTO v_existePrestamo
  FROM prestamo
  WHERE material_id = v_material_id;

  IF v_existePrestamo = 0 THEN
  DELETE FROM ejemplar  WHERE material_id = v_material_id;
  DELETE FROM tesis     WHERE material_id = v_material_id;
  DELETE FROM escribe   WHERE material_id = v_material_id;
  DELETE FROM material  WHERE material_id = v_material_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se elimino el material tipo tesis con id:  ' || v_material_id);
  ELSE
    raise_application_error(-20101,'ERROR La tesis no debe estar en prestamo');
  END IF;

END BajaTesis;
/

/*ActualizaTesis*/
CREATE OR REPLACE PROCEDURE ActualizaTesis(
  vMaterial_id IN material.material_id%TYPE,
  vCampo IN VARCHAR2,
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

    WHEN UPPER(vCampo) = 'ANOPUBLICACION' THEN
      UPDATE tesis SET anoPublicacion=vValor
      WHERE material_id = vMaterial_id;

    WHEN UPPER(vCampo) = 'DIRECTOR_ID' THEN
      UPDATE tesis SET director_id=vValor
      WHERE material_id = vMaterial_id;

    else
      raise_application_error(-20103,'ERROR No existe ese campo');

  end case;
end;
/

--------------------------------------------3.-DIRECTOR DE TESIS.--Chavira
/*AltaDirTesis*/
CREATE OR REPLACE PROCEDURE AltaDirTesis(
  vDirector_id IN directorTesis.director_id%TYPE,
  -- Se ingresará la descripción del Grado Académico. Se buscará el id.
  vGradoAcademicoDescrip IN gradoAcademico.descripcionGA%TYPE,
  -- Se mandan al final los parámetros para poder admitir un Apellido
  -- Materno nulo al final (no se manda valor en la ejecución).
  vNombreDirector IN directorTesis.nombreDirector%TYPE,
  vApPaternoDirector IN directorTesis.apPaternoDirector%TYPE,
  vApMaternoDirector IN directorTesis.apMaternoDirector%TYPE DEFAULT NULL
)
AS
vBuscaGradoAcademico directorTesis.gradoAcademico_id%TYPE;
vDT_id CHAR(5);
BEGIN
vDT_id := 'D' || vDirector_id;
SELECT gradoAcademico_id INTO vBuscaGradoAcademico
FROM gradoAcademico WHERE descripcionGA=vGradoAcademicoDescrip;
IF (vBuscaGradoAcademico IS NOT NULL) THEN
  INSERT INTO directorTesis
  VALUES(vDT_id, vNombreDirector, vApPaternoDirector, vApMaternoDirector, vBuscaGradoAcademico);
  DBMS_OUTPUT.PUT_LINE('Se insertó al director de tesis con id: '|| vDT_id);
ELSE
  DBMS_OUTPUT.PUT_LINE('No se encontró registrado el grado de ' ||vGradoAcademicoDescrip);
END IF;
COMMIT;
END AltaDirTesis;
/
/* EJECUCION:
EXEC AltaDirTesis(director_id, gradoEnTexto, Nombre, ApPat, ApMat);
- gradoEnTexto, por ejemplo: 'Kinder', 'Secu', de la tabla gradoAcademico
- apMat se puede ignorar:
EXEC AltaDirTesis(director_id, gradoEnTexto, Nombre, ApPat); */

/*BajaDirTesis*/
CREATE OR REPLACE PROCEDURE BajaDirTesis(
  vDirector_id directorTesis.director_id%TYPE
)
AS
vBuscaGradoAcademico directorTesis.gradoAcademico_id%TYPE;
BEGIN
DELETE FROM directorTesis WHERE director_id=vDirector_id;
DBMS_OUTPUT.PUT_LINE('Se eliminó al director de tesis con id: ' ||vDirector_id);
COMMIT;
END BajaDirTesis;
/

/*ActualizaDirTesis*/
CREATE OR REPLACE PROCEDURE ActualizaDirTesis(
  vDirector_id IN directorTesis.director_id%TYPE,
  -- Se ingresará la descripción del Grado Académico. Se buscará el id.
  vGradoAcademicoDescrip IN gradoAcademico.descripcionGA%TYPE,
  -- Se mandan al final los parámetros para poder admitir un Apellido
  -- Materno nulo al final (no se manda valor en la ejecución).
  vNombreDirector IN directorTesis.nombreDirector%TYPE,
  vApPaternoDirector IN directorTesis.apPaternoDirector%TYPE,
  vApMaternoDirector IN directorTesis.apMaternoDirector%TYPE DEFAULT NULL
)
AS
vBuscaGradoAcademico directorTesis.gradoAcademico_id%TYPE;
BEGIN
SELECT gradoAcademico_id INTO vBuscaGradoAcademico
FROM gradoAcademico WHERE descripcionGA=vGradoAcademicoDescrip;
IF (vBuscaGradoAcademico IS NOT NULL) THEN
  UPDATE directorTesis SET
    nombreDirector=vNombreDirector,
    apPaternoDirector=vApPaternoDirector,
    apMaternoDirector=vApMaternoDirector,
    gradoAcademico_id=vBuscaGradoAcademico
  WHERE director_id=vDirector_id;
  DBMS_OUTPUT.PUT_LINE('Se insertó al director de tesis con id: '|| vDirector_id);
ELSE
  DBMS_OUTPUT.PUT_LINE('No se encontró registrado el grado de ' ||vGradoAcademicoDescrip);
END IF;
--COMMIT;
END ActualizaDirTesis;
/

--------------------------------------------4.-EJEMPLAR.--Joya
/*AltaEjemplar*/
CREATE OR REPLACE PROCEDURE AltaEjemplar(
  vmaterial_id IN CHAR
)
AS
  vnoEjemplar CHAR(8);
  vCharejemplar CHAR(5);
  vmaterial NUMBER;
BEGIN
SELECT count(*) INTO vmaterial
FROM material
WHERE material_id = vmaterial_id;
IF (vmaterial > 0) THEN
  SELECT TO_CHAR(TO_NUMBER(SUBSTR(MAX(noEjemplar), 3, 10))+1)
  INTO vnoEjemplar
  FROM ejemplar
  WHERE MATERIAL_ID = vmaterial_id;
  IF vnoEjemplar IS NOT NULL THEN
    INSERT INTO ejemplar VALUES ('EJ'|| vnoEjemplar, vmaterial_id, 'ES1');
  ELSE
    INSERT INTO ejemplar VALUES ('EJ0'|| vnoEjemplar, vmaterial_id, 'ES1');
  END IF;
  COMMIT;
ELSE
  DBMS_OUTPUT.PUT_LINE('No existe ningun material registrado aun');
END IF;
END AltaEjemplar;
/

/*BajaEjemplar*/
CREATE OR REPLACE PROCEDURE BajaEjemplar(
  vnoEjemplar IN ejemplar.noEjemplar%TYPE,
  vmaterial_id IN ejemplar.material_id%TYPE
)
IS
  vestatus_id ejemplar.estatus_id%TYPE;
BEGIN
SELECT estatus_id INTO vestatus_id
FROM ejemplar WHERE (vnoEjemplar = noEjemplar AND vmaterial_id = material_id);
IF (vestatus_id <> 'ES2') THEN
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
  vMaterial_id IN ejemplar.material_id%TYPE,
  vCampo in varchar2,
  vValor in varchar2
)
AS
  vEstatusActual CHAR(10);
BEGIN
  CASE
    when upper(vCampo) = 'NOEJEMPLAR' then
      UPDATE ejemplar SET  noEjemplar = vValor
      WHERE vnoEjemplar = noEjemplar AND vMaterial_id = material_id;
    when upper(vCampo) = 'MATERIAL_ID' then
      UPDATE ejemplar SET  material_id = vValor
      WHERE vnoEjemplar = noEjemplar AND vMaterial_id = material_id;
    when upper(vCampo) = 'ESTATUS_ID' then
      UPDATE ejemplar SET  estatus_id = vValor
      WHERE vnoEjemplar = noEjemplar AND vMaterial_id = material_id;
  ELSE
    raise_application_error(-20051,'ERROR No existe ese campo, o usted no lo puede modificar');
  END CASE;
  COMMIT;
END ActualizaEjemplar;
/
--------------------------------------------5.-LECTOR. --Lázaro
/*AltaLector*/
create or replace procedure AltaLector(
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
  vLector_id char(10);
  vCantidadDeTipos number(4,0);
  vCantidadDeLectores number(4,0);
begin
  select count(*)
  into vCantidadDeTipos
  from tipolector
  where tipolector_id = vTipoLector_id;

  select count(*)+1
  into vCantidadDeLectores
  from lector;

  vLector_id:='L'||vCantidadDeLectores;

  if vCantidadDeTipos != 0 then
    insert into lector (lector_id,fechaAltaLector,telefonoLector,fechaVigenciaLector,
      nombreLector,apPaternoLector,apMaternoLector,AdeudoLector,estado,numero,calle,
      colonia,delegacion,tipolector_id)
    values(vLector_id,sysdate,vTelefono,sysdate+365,
      vNombre,vApPaternoLector,vApMaternoLector,0,vEstado,vNumero,vCalle,
      vColonia,vDelegacion,vTipoLector_id);
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
  v_lector_id   IN prestamo.lector_id%TYPE, --YA DEBE DE EXISTIR EL LECTOR
  v_noEjemplar  IN prestamo.noEjemplar%TYPE,
  v_material_id IN prestamo.material_id%TYPE
)
AS
v_estatus_id ejemplar.estatus_id%TYPE;
v_fechaVigenciaLector lector.fechaVigenciaLector%TYPE;
v_prestamo_id  prestamo.prestamo_id%TYPE;
v_diasPrestamo tipoLector.diasPrestamo%TYPE;
v_limiteDeMateriales NUMBER;
v_numeroDeMateriales NUMBER;
v_fechaPrestamo DATE := SYSDATE;
v_fechaVencimiento DATE;
BEGIN

  SELECT estatus_id INTO v_estatus_id
  FROM ejemplar
  WHERE noEjemplar = v_noEjemplar AND v_material_id = material_id;

  SELECT fechaVigenciaLector INTO v_fechaVigenciaLector
  FROM lector
  WHERE lector_id = v_lector_id;

  IF v_estatus_id = 'ES1' THEN
    IF v_fechaVigenciaLector > SYSDATE THEN
        SELECT tl.limiteDeMateriales INTO v_limiteDeMateriales
        FROM tipoLector tl
        JOIN lector l
        ON l.tipoLector_id = tl.tipoLector_id
        WHERE l.lector_id = v_lector_id;

        SELECT COUNT(*) INTO v_numeroDeMateriales
        FROM prestamo
        WHERE lector_id = v_lector_id;

        IF v_limiteDeMateriales > v_numeroDeMateriales THEN

          SELECT tl.diasPrestamo INTO v_diasPrestamo
          FROM tipoLector tl
          JOIN lector l
          ON l.tipoLector_id = tl.tipoLector_id
          WHERE l.lector_id = v_lector_id;

          v_fechaVencimiento := SYSDATE + TO_NUMBER(v_diasPrestamo);
          v_prestamo_id := 'P' || SeqAltaPrestamo.NEXTVAL;
          INSERT INTO prestamo ( PRESTAMO_ID,RESELLO , FECHAPRESTAMO ,FECHAVENCIMIENTO, LECTOR_ID ,NOEJEMPLAR ,MATERIAL_ID)
          VALUES (v_prestamo_id, 0, v_fechaPrestamo, v_fechaVencimiento, v_lector_id, v_noEjemplar, v_material_id);
          DBMS_OUTPUT.PUT_LINE('Se realizó el prestamo del material:  ' || v_material_id|| ' Al lector: '|| v_lector_id);
          COMMIT;
        ELSE
          raise_application_error(-20106,'ERROR Numero de prestamos excedido');
        END IF;
    ELSE
      raise_application_error(-20105,'ERROR La fecha del lector a vencido');
    END IF;
  ELSE
    raise_application_error(-20104,'ERROR El estatus del ejemplar debe ser disponible');
  END IF;
END AltaPrestamo;
/

/*BajaPrestamo*/
CREATE OR REPLACE PROCEDURE BajaPrestamo(
  v_prestamo_id  IN prestamo.prestamo_id%TYPE
)
AS
BEGIN
  DELETE FROM prestamo WHERE prestamo_id = v_prestamo_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se ha devuelto el material con prestamo_id:  ' || v_prestamo_id);
END BajaPrestamo;
/

/*ActualizaPrestamo*/
CREATE OR REPLACE PROCEDURE ActualizaPrestamo(
  vprestamo_id IN CHAR,
  vCampo IN varchar2,
  vValor IN VARCHAR2
)
is
vFecha DATE;
vRefrendo NUMBER;
v_diasPrestamo NUMBER;
BEGIN

  SELECT tl.refrendos, tl.diasPrestamo INTO vRefrendo, v_diasPrestamo
  FROM tipoLector tl
  JOIN lector l
  ON l.tipoLector_id = tl.tipoLector_id
  JOIN prestamo p
  ON p.lector_id = l.lector_id
  WHERE p.prestamo_id = vprestamo_id;

  CASE
    WHEN UPPER(vCampo) = 'RESELLO' THEN
      IF vValor < vRefrendo THEN
        UPDATE prestamo SET resello = vValor
        WHERE prestamo_id = vprestamo_id; --SE ACTUALIZA EL NUMERO DE RESELLOS
        UPDATE prestamo SET fechaResello = SYSDATE
        WHERE prestamo_id = vprestamo_id; -- SE ACTUALIZA LA FECHA EN LA QUE SE RESELLO
        UPDATE prestamo SET fechaVencimiento = SYSDATE + v_diasPrestamo
        WHERE prestamo_id = vprestamo_id; -- SE CALCULA OTRAVEZ LA FECHA DE VENCIMIENTO
      ELSE
        raise_application_error(-20107,'ERROR Numero de resellos excedido');
      END IF;

    WHEN UPPER(vCampo) = 'FECHARESELLO' THEN
      IF TO_DATE(vValor,'dd/mm/yy') = SYSDATE THEN
        vFecha := SYSDATE;
      ELSE
        vFecha := TO_DATE(vValor,'dd/mm/yy');
      END if;

      UPDATE prestamo
      SET fecharesello = vFecha,
          fechaVencimiento = vFecha+5
      WHERE prestamo_id = vprestamo_id;

    WHEN UPPER(vCampo) = 'FECHAPRESTAMO' THEN

      IF TO_DATE(vValor,'dd/mm/yy') = SYSDATE THEN
        vFecha := SYSDATE;
      ELSE
        vFecha := TO_DATE(vValor,'dd/mm/yy');
      END if;

      UPDATE prestamo
      SET fechaPrestamo = vFecha,
          fechaVencimiento = vFecha+5
          WHERE prestamo_id = vprestamo_id;

    WHEN UPPER(vCampo) = 'LECTOR_ID' THEN
      UPDATE prestamo SET lector_id = vValor
      WHERE prestamo_id = vprestamo_id;

    WHEN UPPER(vCampo) = 'NOEJEMPLAR' THEN
      UPDATE prestamo SET noEjemplar = vValor
      WHERE prestamo_id = vprestamo_id;

    WHEN UPPER(vCampo) = 'MATERIAL_ID' THEN
      UPDATE prestamo SET material_id = vValor
      WHERE prestamo_id = vprestamo_id;

    else
      raise_application_error(-20054,'ERROR No existe ese campo');
  end case;
end;
/

CREATE OR REPLACE PROCEDURE resello(
  vprestamo_id in prestamo.prestamo_id%TYPE
)
AS
  vresello prestamo.resello%TYPE;
  vLector_id lector.lector_id%TYPE;
  vtipolector CHAR(4);
BEGIN 
SELECT resello, lector_id INTO vresello, vLector_id
FROM prestamo 
WHERE prestamo_id = vprestamo_id;
SELECT tipolector_id INTO vtipolector
FROM lector 
WHERE lector_id = vLector_id;
CASE
  WHEN UPPER(vtipolector) = 'TL1' THEN
    IF vresello < 1 THEN
      UPDATE prestamo 
      SET fecharesello = SYSDATE, fechaPrestamo = SYSDATE, FECHAVENCIMIENTO = SYSDATE + 8, resello = resello + 1
      WHERE prestamo_id = vprestamo_id;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Favor de devolver el libro');
    END IF;
  WHEN UPPER(vtipolector) = 'TL2' THEN
    IF vresello < 2 THEN
      UPDATE prestamo 
      SET fecharesello = SYSDATE, fechaPrestamo = SYSDATE, FECHAVENCIMIENTO = SYSDATE + 15, resello = resello + 1
      WHERE prestamo_id = vprestamo_id;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Favor de devolver el libro');
    END IF;
ELSE
    IF vresello < 3 THEN
      UPDATE prestamo 
      SET fecharesello = SYSDATE, fechaPrestamo = SYSDATE, FECHAVENCIMIENTO = SYSDATE + 30, resello = resello + 1
      WHERE prestamo_id = vprestamo_id;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Favor de devolver el libro');
    END IF;
END CASE;
END resello;
/

--------------------------------------------7.-MULTA. – Chavira
/*AltaMulta*/
CREATE OR REPLACE PROCEDURE AltaMulta(
  vPrestamo prestamo.prestamo_id%TYPE,
  vLector_id prestamo.lector_id%TYPE,
  vfechaVencimiento prestamo.fechaVencimiento%TYPE
)
AS
  vmulta_id CHAR(10);
  vdias_retraso NUMBER(15);
BEGIN
  IF (vfechaVencimiento < SYSDATE) THEN
    vmulta_id := 'MU' || SeqAltamulta.NEXTVAL;
    vdias_retraso := SYSDATE-vfechaVencimiento;
    INSERT INTO multa
    VALUES(vMulta_id, vLector_id, SYSDATE, vdias_retraso * 10, vdias_retraso);
    DBMS_OUTPUT.PUT_LINE('Se insertó una nueva multa con id: ' || vMulta_id);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Entregado en tiempo, no se genera multa');
  END IF;
  COMMIT;
END AltaMulta;
/

/*BajaMulta*/
CREATE OR REPLACE PROCEDURE BajaMulta(
  vMulta_id multa.multa_id%TYPE
)
AS
BEGIN
  DELETE FROM multa
  WHERE multa_id=vMulta_id;
  DBMS_OUTPUT.PUT_LINE('Se eliminó la multa con id: ' || vMulta_id);
END BajaMulta;
/

/*ActualizaMulta*/
CREATE OR REPLACE PROCEDURE ActualizaMulta(
    vMulta_id multa.multa_id%TYPE,
    vFechaMulta multa.fechaMulta%TYPE,
    vdiasRetraso multa.diasretraso%TYPE
)
AS
BEGIN
  UPDATE multa
  SET fechaMulta = vFechaMulta, monto = vdiasRetraso*10, diasretraso = vdiasRetraso
  WHERE vMulta_id = multa_id;
END ActualizaMulta;
/


--------------------------------------------8.-GRADO ACADEMICO. –- Joya
/*AltaGradoAcademico*/
CREATE OR REPLACE PROCEDURE AltaGradoAcademico(
  vdescripcionGA IN gradoAcademico.descripcionGA%TYPE
)
AS
  vgrado_id CHAR(10);
BEGIN
  vgrado_id := 'GA' || SeqAltaGradoAcademico.NEXTVAL;
  INSERT INTO gradoAcademico
  VALUES (vgrado_id, vdescripcionGA);
  DBMS_OUTPUT.PUT_LINE('Se inserto un nuevo grado academico con id:  ' || vgrado_id);
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
--------------------------------------------EXTRA Procedimiento para dar de alta a un autor
prompt altaautor
create or replace procedure AltaAutor(
  pNombreAutor in VARCHAR2,
  pApPaternoAutor in VARCHAR2,
  pApMaternoAutor in VARCHAR2,
  pNacionalidad in VARCHAR2
)
is
  vId char(10);
begin
  vId:='A'||to_char(SeqAltaAutor.nextval);
  insert into autor(autor_id,nombreAutor,apPaternoAutor,apMaternoAutor,nacionalidad)
  values(vId,pNombreAutor,pApPaternoAutor,pApMaternoAutor,pNacionalidad);
  dbms_output.put_line('Se dió de alta al autor '||vId);
end;
/
