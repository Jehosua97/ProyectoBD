--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Actualizacion trigger tgMultaLectorEnLector

create or replace trigger tgMultaLectorEnLector
  before delete
  on lector
  for each row
declare
  PRAGMA AUTONOMOUS_TRANSACTION;
  vCantidadDeMultas number(4,0);
  cursor cur_multa is
    select count(*) as multas
    from multa
    where lector_id=:old.lector_id;
    
begin
  for r in cur_multa loop
    vCantidadDeMultas:=r.multas;
  end loop;

  if vCantidadDeMultas != 0 then
    raise_application_error(-20056,'ERROR No se puede dar de baja al
      usuario indicado dado que se encontraron '
      ||vCantidadDeMultas
      ||' multas registradas a su perfil');
  end if;
end;
/
show errors;