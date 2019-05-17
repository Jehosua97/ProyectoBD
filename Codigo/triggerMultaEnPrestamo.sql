--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Actualizacion trigger tgMultaLectorEnPrestamo
create or replace trigger tgMultaLectorEnPrestamo
  before insert
  on prestamo
  for each row
declare
  vCantidadDeMultas number(4,0);
begin
  select count(*)
  into vCantidadDeMultas
  from multa
  where lector_id=:new.lector_id;

  if vCantidadDeMultas != 0 then
    raise_application_error(-20055,'ERROR No se pueden realizar prestamos al
      usuario indicado dado que se encontraron '
      ||vCantidadDeMultas
      ||' multas registradas a su perfil');
  end if;

end;
/
show errors;