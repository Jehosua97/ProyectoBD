-----------1.- LAZARO         Si un lector tiene una multa, no se le podrán prestar materiales ni eliminar lector hasta que la haya liquidado la multa.
create or replace trigger tgMultaLectorEnLector
  before delete
  on lector
  for each row
declare
  PRAGMA AUTONOMOUS_TRANSACTION;
  vCantidadDeMultas number(4,0);
  cursor cur_multa is
    select count(*) as multas
    from multa
    where lector_id=:old.lector_id;
    
begin
  for r in cur_multa loop
    vCantidadDeMultas:=r.multas;
  end loop;

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

CREATE OR REPLACE TRIGGER tgPrestamoEjemplar
BEFORE INSERT
ON prestamo
FOR EACH ROW
DECLARE
  vEstatus_id ejemplar.estatus_id%TYPE;
BEGIN
  SELECT estatus_id INTO vEstatus_id
  FROM ejemplar
  WHERE noEjemplar = :NEW.noEjemplar AND material_id = :NEW.material_id;

  IF vEstatus_id = 'ES1' THEN
    UPDATE ejemplar SET estatus_id = 'ES2'
    WHERE material_id = :NEW.material_id
    AND noEjemplar = :NEW.noEjemplar;
    DBMS_OUTPUT.PUT_LINE('Se cambio el estatus a prestado del ejemplar: ' ||  :NEW.noEjemplar);

  ELSIF vEstatus_id = 'ES2' THEN
    RAISE_APPLICATION_ERROR(-20096, 'El ejemplar '|| :NEW.noEjemplar || ' del material ' || :NEW.material_id || 'ya se encuentra prestado.');

  ELSIF vEstatus_id = 'ES3' THEN
    RAISE_APPLICATION_ERROR(-20095, 'El ejemplar '|| :NEW.noEjemplar || ' del material ' || :NEW.material_id || 'no sale de la biblioteca.');
  
  ELSE
    RAISE_APPLICATION_ERROR(-20094, 'El ejemplar '|| :NEW.noEjemplar || ' del material ' || :NEW.material_id || 'está en mantenimiento.');
  END IF;
END tgPrestamoEjemplar;
/

--Pruebas para ejecutar
--INSERT INTO prestamo VALUES ('P'||SeqAltaPrestamo.NEXTVAL, 0, '08/10/16', SYSDATE, '10/10/16', 'L1', 'EJ1', 'M1');
--SELECT * FROM ejemplar e JOIN estatus s ON e.estatus_id=s.estatus_id;

-----------3.- CHAVIRA        El resello de un material se realiza únicamente en la fecha de vencimiento del préstamo en función del tipo de lector. -- Chavira
CREATE OR REPLACE TRIGGER tgRevisarResello
BEFORE UPDATE ON prestamo
FOR EACH ROW
BEGIN
  IF TRUNC(:OLD.fechaResello-SYSDATE)=0 THEN
    DBMS_OUTPUT.PUT_LINE('La fecha de resello coincide con la fecha actual.');
  ELSIF :OLD.fechaResello<SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20097,'Este libro ya pasó su fecha de resello. Debe expedirse una multa.');
  ELSE
    RAISE_APPLICATION_ERROR(-20098, 'Este libro sólo se puede resellar el día de su fecha de resello.');
  END IF;
END tgRevisarResello;
/
ALTER TRIGGER tgRevisarResello DISABLE;

-----------4.- JOYA           Al realizarse una devolución en tiempo, se eliminará el préstamo.
CREATE OR REPLACE TRIGGER tgDevolEliminPrest
  AFTER DELETE
  ON prestamo
  FOR EACH ROW
  DECLARE
    vprestamo_id CHAR(5);
    vfechaVenci DATE;
  BEGIN
    IF :old.fechaVencimiento >= SYSDATE THEN
      DBMS_OUTPUT.PUT_LINE('Se eliminó prestamo con id ' ||  :old.prestamo_id);
    ELSE
      INSERT INTO multa
      VALUES('MU' || seqAltaMulta.NEXTVAL, :old.lector_id, SYSDATE, (TRUNC(SYSDATE - :old.fechaVencimiento))*10, TRUNC(SYSDATE - :old.fechaVencimiento));
    END IF;
    UPDATE ejemplar SET estatus_id='ES1'
    WHERE noEjemplar=:old.noEjemplar;
  END tgDevolEliminPrest;
  /

