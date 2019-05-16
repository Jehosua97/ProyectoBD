-----------1.- LAZARO         Si un lector tiene una multa, no se le podrán prestar materiales ni eliminar lector hasta que la haya liquidado la multa.
create or replace trigger tgMultaLectorEnLector
  before delete
  on lector
  for each row
declare
  vCantidadDeMultas number(4,0);
begin
  select count(*)
  into vCantidadDeMultas
  from multa
  join prestamo using(prestamo_id)
  where lector_id=:old.lector_id;

  if vCantidadDeMultas != 0 then
    raise_application_error(-20056,'ERROR No se puede dar de baja al
      usuario indicado dado que se encontraron '
      ||vCantidadDeMultas
      ||' multas registradas a su perfil');
  end if;
end;
/
show errors;

create or replace trigger tgMultaLectorEnPrestamo
  before insert
  on prestamo
  for each row
declare
  vCantidadDeMultas number(4,0);
begin
  select count(*)
  into vCantidadDeMultas
  from multa
  join prestamo using(prestamo_id)
  where lector_id=:new.lector_id;

  if vCantidadDeMultas != 0 then
    raise_application_error(-20055,'ERROR No se pueden realizar prestamos al
      usuario indicado dado que se encontraron '
      ||vCantidadDeMultas
      ||' multas registradas a su perfil');
  end if;

end;
/
show errors;


-----------2.- OSCAR          Al realizarse el préstamo de un ejemplar, se deberá de modificar su estatus automáticamente. -- Oscar

CREATE OR REPLACE TRIGGER T_prestamo_ejemplar
BEFORE INSERT
ON prestamo
FOR EACH ROW
DECLARE
  v_estatus_id VARCHAR2 := 'ES2';
  v_noEjemplar CHAR;
  v_material_id CHAR;
BEGIN

  SELECT noEjemplar, material_id INTO v_noEjemplar, v_material_id
  FROM ejemplar
  WHERE :NEW.material_id = material_id
  AND :NEW.noEjemplar = noEjemplar;

  UPDATE estatus_id SET estatus_id = v_estatus_id
  WHERE :NEW.material_id = v_material_id
  AND :NEW.noEjemplar = v_noEjemplar;

  DBMS_OUTPUT.PUT_LINE('Se cambio el estatus a prestado del ejemplar: ' ||  :NEW.noEjemplar);

END T_prestamo_ejemplar;
/

-----------3.- CHAVIRA        El resello de un material se realiza únicamente en la fecha de vencimiento del préstamo en función del tipo de lector. -- Chavira
-----------4.- JOYA           Al realizarse una devolución en tiempo, se eliminará el préstamo y/o se generará una multa. 
  CREATE OR REPLACE PACKAGE pkprestamo
    AS
      PRESTAMO_ID CHAR(5),
      RESELLO NUMBER,
      FECHARESELLO DATE,
      FECHAPRESTAMO DATE,
      FECHAVENCIMIENTO DATE,
      LECTOR_ID CHAR(10),
      NOEJEMPLAR CHAR(10),
      MATERIAL_ID CHAR(5)
  END;

  CREATE OR REPLACE TRIGGER tgDevolEliminPrest
  BEFORE DELETE
  ON prestamo
  FOR EACH ROW
  DECLARE
    vprestamo_id CHAR(5);
    vfechaVenci DATE;
  BEGIN
    SELECT prestamo_id, fechaVencimiento INTO vprestamo_id, vfechaVenci
    FROM prestamo
    WHERE prestamo_id = :old.prestamo_id;
    IF vfechaVenci >= SYSDATE THEN
      DBMS_OUTPUT.PUT_LINE('Se eliminó prestamo con id ' ||  :old.prestamo_id);
    ELSE
      INSERT INTO multa
      VALUES('MU4', :old.prestamo_id, SYSDATE, (SYSDATE - :old.fechaVencimiento)*10, SYSDATE - :old.fechaVencimiento);
    END IF;
  END tgDevolEliminPrest;
  /

-----------5.- LAZARO         Al resellar el préstamo de un material, la fecha del préstamo cambiará a la fecha en la que se resella, la fecha de vencimiento se volverá a calcular dependiendo del tipo de lector y se actualizará el número de refrendo. -- Lázaro
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

-----------6.- CHAVIRA          Fecha de vigencia de usuario, préstamo y refrendo de material a dicho usuario.
