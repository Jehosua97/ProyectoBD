create or replace procedure ActualizaLibro(
  --parametros para la tabla material
  vMaterial_id in char,
  vUbicacion in varchar2 default null,
  vColocacion in varchar2 default null,
  vTitulo in varchar2 default null,
  --parametros para agregar a la tabla libro
  vNoAdquisicion in char default null,
  vISBN in char default null,
  vTema in varchar2 default null,
  vEdicion in varchar2 default null
)
is
  vBanderaMaterial number := 0;
  vBanderaLibro number := 0;
  vUbicacionDef material.ubicacion%type;
  vColocacionDef material.colocacion%type;
  vTituloDef material.titulo%type;

  vNoAdquisicionDef libro.noAdquisicion%type;
  vISBNDef libro.ISBN%type;
  vTemaDef libro.tema%type;
  vEdicionDef libro.edicion%type;
begin
  --se les cambia el valor a las banderas para validar en que tabla
  --se puede o no hacer la actualizacion
  if vUbicacion is null and vColocacion is null and vTitulo is null then
    vBanderaMaterial:=1;
  end if;

  if vNoAdquisicion is null and vISBN is null and vTema is null and
    vEdicion is null then
    vBanderaLibro:=1;
  end if;
  -- se inicializan los parametros en caso de ser nulos
  if vBanderaMaterial = 0 then

    if vUbicacion is null then
      select ubicacion 
      into vUbicacionDef
      from material
      where material_id=vMaterial_id;
    else
      vUbicacionDef := vUbicacion;
    end if;

    if vColocacion is null then
      select colocacion 
      into vColocacionDef
      from material
      where material_id=vMaterial_id;
    else
      vColocacionDef:= vColocacion;
    end if;

    if vTitulo is null then
      select titulo 
      into vTituloDef
      from material
      where material_id=vMaterial_id;
    else
      vTituloDef:=vTitulo;
    end if;

    update material set 
    ubicacion = vUbicacionDef,
    colocacion = vColocacionDef,
    titulo = vTituloDef
    where material_id = vMaterial_id;

  end if;

  if vBanderaLibro = 0 then
    if vNoAdquisicion is null then
      select noAdquisicion 
      into vNoAdquisicionDef
      from libro
      where material_id = vMaterial_id;
    else
      vNoAdquisicionDef:= vNoAdquisicion;
    end if;

    if vISBN is null then
      select ISBN 
      into vISBNDef
      from libro
      where material_id = vMaterial_id;
    else
      vISBNDef:= vISBN;
    end if;

    if vTema is null then
      select tema 
      into vTemaDef
      from libro
      where material_id = vMaterial_id;
    else
      vTemaDef:= vTema;
    end if;

    if vEdicion is null then
      select edicion 
      into vEdicionDef
      from libro
      where material_id = vMaterial_id;
    else
      vEdicionDef:= vEdicion;
    end if;

    update libro set 
    noAdquisicion = vNoAdquisicion,
    ISBN = vISBNDef,
    tema = vTemaDef,
    edicion = vEdicionDef
    where material_id=vMaterial_id;
    
  end if;

end;
/
show errors;