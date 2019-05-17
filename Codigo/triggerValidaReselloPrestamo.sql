--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Actualizacion trigger tgValidaReselloPrestamo

create or replace trigger tgValidaReselloPrestamo
  before update of resello
  on prestamo
  for each row

declare
begin

  insert into prestamo_aux values(:old.prestamo_id,:old.resello,:old.fecharesello,
    :old.fechaPrestamo,:old.fechavencimiento,:old.lector_id,:old.noejemplar,
    :old.material_id);

end;
/
show errors

create or replace trigger tgValidaReselloPrestamoDos
  after update of resello
  on prestamo

declare
  vLimiteRefrendos number(1,0);
  vDiasPrestamo number(1,0);
  vCantidadResellos number(1,0);
  cursor cur_prestamos is
    select prestamo_id,lector_id,refrendos,diasprestamo,resello,fechavencimiento
    from prestamo_aux
    join lector using(lector_id)
    join tipolector using(tipolector_id);

begin

  for r in cur_prestamos loop
    vLimiteRefrendos:=r.refrendos;
    vDiasPrestamo:=r.diasprestamo;
    vCantidadResellos:=r.resello;

    dbms_output.put_line('Cantidad de resellos permitidos: '||vLimiteRefrendos);
    dbms_output.put_line('Cantidad de resellos hechos: '||vCantidadResellos);
    if vCantidadResellos<vLimiteRefrendos then
      update prestamo set
        fechaResello = sysdate,
        fechaPrestamo = sysdate,
        fechaVencimiento = r.fechaVencimiento + vDiasPrestamo
      where prestamo_id=r.prestamo_id;
    else
      raise_application_error(-20057,'ERROR El lector ya no puede hacer mas
        resellos debido a su tipo de lector');
    end if;
  end loop;
  delete from prestamo_aux;
end;
/
show errors