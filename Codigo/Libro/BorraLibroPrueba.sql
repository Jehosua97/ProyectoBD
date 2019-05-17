--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Pruebas para el procedimiento BorraLibro

declare
  vCantidadPrestamos number(4,0);
begin
  select count(*)
  into vCantidadPrestamos
  from prestamo
  where material_id = 'M1';

  dbms_output.put_line('Se encuentran '
    ||vCantidadPrestamos
    ||' prestamos del libro M1, se intentará borrar, se espera error por ello');

  BorraLibro(vMaterial_id   => 'M1');

exception 
  when others then
    if sqlcode = -20051 then
      dbms_output.put_line('Se generó la excepcion exitosamente');
    end if;
  raise;
end;
/

declare
  vCantidadPrestamos number(4,0);
begin
  select count(*)
  into vCantidadPrestamos
  from prestamo
  where material_id = 'M4';

  dbms_output.put_line('Se encuentran '
    ||vCantidadPrestamos
    ||' prestamos del libro M4, se intentará borrar, no se espera error por ello');

  BorraLibro(vMaterial_id   => 'M4');

exception 
  when others then
    if sqlcode = -20051 then
      dbms_output.put_line('Se generó la excepcion exitosamente');
    end if;
  raise;
end;
/
select * 
from material 
join libro using(material_id);

prompt prueba finalizada