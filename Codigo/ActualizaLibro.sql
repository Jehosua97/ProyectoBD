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