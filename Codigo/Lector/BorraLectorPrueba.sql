--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba Procedimiento BorraLector
prompt ====================Prueba Borrar lector sin prestamos ===============

declare
  vLector_id char(4) := 'L4';
  vCantidadPrestamos number(4,0);
begin
  dbms_output.put_line('Eliminando al usuario recientemente creado, sin prestamos');
  select count(*)
  into vCantidadPrestamos
  from prestamo
  where lector_id=vLector_id;

  dbms_output.put_line('Hay '
    ||vCantidadPrestamos
    ||' prestamos para el lector '
    ||vLector_id);
  dbms_output.put_line('No se esperan errores');
  BorraLector(vLector_id);
end;
/

select * from lector;

prompt ====================Prueba Borrar lector con prestamos ===============
declare
  vLector_id char(4) := 'L1';
  vCantidadPrestamos number(4,0);
begin
  dbms_output.put_line('Eliminando al usuario con prestamos');
  select count(*)
  into vCantidadPrestamos
  from prestamo
  where lector_id=vLector_id;

  dbms_output.put_line('Hay '
    ||vCantidadPrestamos
    ||' prestamos para el lector '
    ||vLector_id);
  dbms_output.put_line('Se esperan una Excepcion');
  BorraLector(vLector_id);
exception
  when others then
    if sqlcode = -20054 then
      dbms_output.put_line('Se generó la excepcion correctamente');
    end if;
  raise;
end;
/

select * from lector;