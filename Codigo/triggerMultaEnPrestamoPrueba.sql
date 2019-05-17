--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba trigger tgMultaLectorEnPrestamo

prompt ingresando un ejemplar doomy

insert into ejemplar values('EJ2','M1','ES1');
declare
  vLector_id char(10);
  vCantidadMultas number(4,0);
begin
  dbms_output.put_line('Generando usuario para prueba, sin prestamos ni multas');
  AltaLector(vLector_id,'1212121212','nombre x','apellido x','apellido y','estado x',
    'x','calle x','colonia x','delegacion x','TL1');
  select count(*)
  into vCantidadMultas
  from multa
  where lector_id=vLector_id;

  dbms_output.put_line('El lector '
    ||vLector_id
    ||' cuenta con '
    ||vCantidadMultas
    ||' Multas, no se espera excepcion al borrarlo');
  dbms_output.put_line('Se procede a prestarle al lector');
  insert into prestamo values((select 'P'||to_char(count(*)+1) from prestamo),0,
    null,sysdate,sysdate+10,vLector_id,'EJ2','M1');

end;
/
select * from prestamo;

insert into ejemplar values('EJ2','M1','ES1');
declare
  vLector_id char(10);
  vCantidadMultas number(4,0);
begin
  dbms_output.put_line('Generando usuario para prueba, con multas');  
  AltaLector(vLector_id,'1212121212','nombre x','apellido x','apellido y','estado x',
    'x','calle x','colonia x','delegacion x','TL1');

  dbms_output.put_line('Se ingresa una multa');
  insert into multa 
  values((select 'M'||to_char(count(*)) from multa),vLector_id,sysdate,100,2);

  select count(*)
  into vCantidadMultas
  from multa
  where lector_id=vLector_id;

  dbms_output.put_line('El lector '
    ||vLector_id
    ||' cuenta con '
    ||vCantidadMultas
    ||' Multas, se espera excepcion al borrarlo');
  
  dbms_output.put_line('Se procede a prestarle al lector');
  insert into prestamo values((select 'P'||to_char(count(*)+1) from prestamo),0,
    null,sysdate,sysdate+10,vLector_id,'EJ2','M1');

end;
/
select * from prestamo;

rollback;
