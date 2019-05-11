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