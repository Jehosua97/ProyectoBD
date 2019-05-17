--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba Procedimiento AltaLector
set linesize 100

declare
  vLector_id char(10);
begin
  dbms_output.put_line('Dando de alta un lector, no se esperan erorres');
  AltaLector(
    vLector_id       => vLector_id,
    vTelefono        => '5520181818',
    vNombre          => 'Abraham',
    vApPaternoLector => 'Lazaro',
    vApMaternoLector => 'Martinez',
    vEstado          => 'CDMX',
    vNumero          => 'X',
    vCalle           => 'Calle X',
    vColonia         => 'Colonia X',
    vDelegacion      => 'Delegacion X',
    vTipoLector_id   => 'TL1'
    );
  dbms_output.put_line('Se agrego exitosamente al lector '
    ||vLector_id);
end;
/
