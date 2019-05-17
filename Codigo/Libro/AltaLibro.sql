--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     correciónes al procedimiento AltaLIbro 
set serveroutput on
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
  vNoAdquisicion in char,
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

    if vNoAdquisicion is null then
      select count(*)+1
      into vCantidadDeAdquisiciones
      from libro;
    else
      vCantidadDeAdquisiciones:=vNoAdquisicion;
    end if;

    --se asigna a la variable pertinente
    vMaterial_id:= 'M'||(vCantidadDeLibros+1);
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
show errors;