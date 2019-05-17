--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     prueba para generacion el procedimiento AltaLibro

declare
  vNoAdquisicion number;
begin
  select count(*)+1
  into vNoAdquisicion
  from libro;

  dbms_output.put_line('No se esperan problemas o excepciones');
  AltaLibro(
    vUbicacion        => 'Primer Piso',
    vColocacion       => 'Arriba',
    vTitulo           => 'Hansel y Grettell',
    vTipo             => 'L',
    vAutor_id         => 'A1',
    vNoAdquisicion    => null/*vNoAdquisicion*/,--se puede poner null aquí y 
    --aun así el procedimiento completa el campo
    vISBN             => 'ISBN5',
    vTema             => 'Novelas',
    vEdicion          => 'Quinta');
  end;
/
select * 
from material 
join libro using(material_id);

declare
  vNoAdquisicion number;
begin
  select count(*)+1
  into vNoAdquisicion
  from libro;
  dbms_output.put_line('Se espera error por tipo de material');
  AltaLibro(
    vUbicacion        => 'Primer Piso',
    vColocacion       => 'Arriba',
    vTitulo           => 'Hansel y Grettell',
    vTipo             => 'T',
    vAutor_id         => 'A1',
    vNoAdquisicion    => vNoAdquisicion,
    vISBN             => 'ISBN5',
    vTema             => 'Novelas',
    vEdicion          => 'Quinta');
exception
  when others then
    if sqlcode = -20049 then
      dbms_output.put_line('Se generó la excepcion con exito, no se permite
        agregar una tesis a la tabla libro, o por otro lado, no se puede
        ocupar este procedimiento para generar un material');
    end if;
    raise;
end;
/

declare
  vNoAdquisicion number;
begin
  select count(*)+1
  into vNoAdquisicion
  from libro;
  dbms_output.put_line('Se espera error por Id de autor invalida');
  AltaLibro(
    vUbicacion        => 'Primer Piso',
    vColocacion       => 'Arriba',
    vTitulo           => 'Hansel y Grettell',
    vTipo             => 'L',
    vAutor_id         => 'A20',
    vNoAdquisicion    => vNoAdquisicion,
    vISBN             => 'ISBN5',
    vTema             => 'Novelas',
    vEdicion          => 'Quinta');
exception
  when others then
    if sqlcode = -20050 then
      dbms_output.put_line('Se Generó exitosamente la excepcion por id de autor');
    end if;
    raise;
end;
/

prompt prueba finalizada