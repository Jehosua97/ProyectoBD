--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba Procedimiento AltaLector
set linesize 100

declare
begin
  dbms_output.put_line('Dando de alta un lector, no se esperan erorres');
  AltaLector(
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
end;
/
