--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Pruebas para el procedimiento ActualizaLibro

set linesize 300

prompt ============actualizacion de ubicacion==============
declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'ubicacion';
  vValor := 'Recepcion';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de colocacion==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'colocacion';
  vValor := 'abajo';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de titulo==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'titulo';
  vValor := 'otro libro';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de numero de adquisicion==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'noadquisicion';
  vValor := '1';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de isbn==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'isbn';
  vValor := 'ISBN18';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de tema==============
  
declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'tema';
  vValor := 'dibujo';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de edicion==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  vCampo := 'edicion';
  vValor := 'decima';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

end;
/

select * from material 
join libro using(material_id);

prompt ============actualizacion de campo invalido==============

declare
  vMaterial_id char(2) := 'M1';
  vCampo varchar2(30);
  vValor varchar2(30);
begin
  dbms_output.put_line('Se espera generar la exepcion por campo invalido');
  vCampo := 'nombre';
  vValor := 'libro cool';
  dbms_output.put_line('Actualizando '||vCampo||' de '||vMaterial_id||' a '||vValor);
  ActualizaLibro(
    vMaterial_id => vMaterial_id,
    vCampo       => vCampo,
    vValor       => vValor);
  select ubicacion into vValor
  from material where material_id=vMaterial_id;
  dbms_output.put_line(vMaterial_id||' '||vCampo||' '||vValor);

exception
  when others then
    if sqlcode = -20054 then
      dbms_output.put_line('Cool, se generó la excepcion');
    end if;
  raise;

end;
/

select * from material 
join libro using(material_id);


