create or replace procedure BorraLector(
  vLector_id in char
)
is
  vCantidadDePrestamos number(4,0);
begin
  --se cuenta cuantos prestamos tiene el lector
  select count(*)
  into vCantidadDePrestamos
  from prestamo
  where lector_id=vLector_id;
  --si no tiene prestamos, se puede eliminar, en otro caso no se puede y se
  --lanza la excepcion
  if vCantidadDePrestamos = 0 then
    delete from lector where lector_id=vLector_id;
  else
    raise_application_error(-20054,'ERROR No se puede eliminar al lector 
      mientras tenga prestamos en curso, se encontraron '
      ||vCantidadDePrestamos
      ||' prestamos registrados');
  end if;
end;
/
show errors;