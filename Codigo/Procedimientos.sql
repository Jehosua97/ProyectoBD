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
/*BajaTesis*/
/*ActualizaTesis*/
--------------------------------------------3.-DIRECTOR DE TESIS.--Chavira
/*AltaDirTesis*/
/*BajaDirTesis*/
/*ActualizaDirTesis*/
--------------------------------------------4.-EJEMPLAR.--Joya
/*AltaEjemplar*/
/*BajaEjemplar*/
/*ActualizaEjemplar*/
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
/*BajaPrestamo*/
/*ActualizaPrestamo*/
--------------------------------------------7.-MULTA. – Chavira
/*AltaMulta*/
/*BajaMulta*/
/*ActualizaMulta*/
--------------------------------------------8.-GRADO ACADEMICO. –- Joya
/*AltaGradoAcademico*/
/*BajaGradoAcademico*/
/*ActualizaGradoAcademico*/