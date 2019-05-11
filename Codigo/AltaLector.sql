create or replace procedure AltaLector(
  vLector_id out char,
  vTelefono in varchar2,
  vNombre in varchar2,
  vApPaternoLector in varchar2,
  vApMaternoLector in varchar2,
  vEstado in varchar2,
  vNumero in varchar2,
  vCalle in varchar2,
  vColonia in varchar2,
  vDelegacion in varchar2,
  vTipoLector_id in char 
)
is
  vCantidadDeTipos number;
begin
  select count(*)
  into vCantidadDeTipos
  from tipolector
  where tipolector_id = vTipoLector_id;

  select 'L'||count(*)+1
  into vLector_id
  from lector;

  if vCantidadDeTipos != 0 then
    insert into lector (lector_id,fechaAltaLector,telefonoLector,fechaVigenciaLector,
      nombreLector,apPaternoLector,apMaternoLector,AdeudoLector,estado,numero,calle,
      colonia,delegacion,tipolector_id)
    values(vLector_id,sysdate,vTelefono,sysdate+365,vNombre,vApPaternoLector,
      vApMaternoLector,0,vEstado,vNumero,vCalle,vColonia,vDelegacion,vTipoLector_id);
    dbms_output.put_line('Alta de Usuario '
      ||vLector_id
      ||' exitosa');
  else
    raise_application_error(-20052,'ERROR Ese tipo de lector no existe');
  end if;
end;
/
show errors