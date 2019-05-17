--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba trigger tgValidaReselloPrestamo

declare
begin
  dbms_output.put_line('Se crea un usuario y se le agrega un prestamo');

  insert into ejemplar values('EJ2','M1','ES1');

  AltaLector('1212121212','nombre x','apellido x','apellido y','estado x','x',
    'calle x','colonia x','delegacion x','TL1');

  insert into prestamo values('P10',0,null,sysdate,sysdate+10,'L4','EJ2','M1');

  dbms_output.put_line('Se hace un resello, no se espera excepcion');
  update prestamo set resello=1 where prestamo_id = 'P10';

  dbms_output.put_line('Se hace otro resello, se espera excepcion');
  update prestamo set resello=2 where prestamo_id='P10';

exception
  when others then
    if sqlcode = -20057 then
      dbms_output.put_line('Excepcion generada bien');
    else 
      raise;
    end if;
end;
/

select * from prestamo;
rollback;
