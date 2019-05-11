create or replace trigger tgValidaReselloPrestamo
  before update
  on prestamo
  for each row
declare
  vLimiteRefrendos number(1,0);
  vDiasPrestamo number(1,0);
  vCantidadResellos number(1,0);

begin
  select refrendos,diasPrestamo,resello
  into vLimiteRefrendos,vDiasPrestamo,vCantidadResellos
  from lector 
  join tipolector using(tipolector_id)
  join prestamo using(lector_id)
  where lector_id=:new.lector_id;

  if vCantidadResellos<vLimiteRefrendos then
    update prestamo set 
      fechaResello = sysdate,
      fechaPrestamo = sysdate,
      fechaVencimiento = :old.fechaVencimiento + vDiasPrestamo
    where prestamo_id=:new.prestamo_id;
  else
    raise_application_error(-20057,'ERROR El lector ya no puede hacer mas 
      resellos debido a su tipo de lector');
  end if;

end;
/
show errors