create or replace trigger tgMultaLectorEnLector
  before delete
  on lector
  for each row
declare
  vCantidadDeMultas number(4,0);
begin
  select count(*)
  into vCantidadDeMultas
  from multa
  join prestamo using(prestamo_id)
  where lector_id=:old.lector_id;

  if vCantidadDeMultas != 0 then
    raise_application_error(-20056,'ERROR No se puede dar de baja al 
      usuario indicado dado que se encontraron '
      ||vCantidadDeMultas
      ||' multas registradas a su perfil');
  end if;
end;
/
show errors;