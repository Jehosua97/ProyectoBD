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

-----------4.- JOYA           Al realizarse una devolución en tiempo, se eliminará el préstamo.
CREATE OR REPLACE TRIGGER tgDevolEliminPrest
  AFTER DELETE
  ON prestamo
  FOR EACH ROW
  DECLARE
    vprestamo_id CHAR(5);
    vfechaVenci DATE;
  BEGIN
    --SELECT prestamo_id, fechaVencimiento INTO vprestamo_id, vfechaVenci
    --FROM prestamo
    --WHERE prestamo_id = :old.prestamo_id;
    IF :old.fechaVencimiento >= SYSDATE THEN
      DBMS_OUTPUT.PUT_LINE('Se eliminó prestamo con id ' ||  :old.prestamo_id);
    ELSE
      INSERT INTO multa
      VALUES('MU' || seqAltaMultas.NEXTVAL, :old.lector_id, SYSDATE, (TRUNC(SYSDATE - :old.fechaVencimiento))*10, TRUNC(SYSDATE - :old.fechaVencimiento));
    END IF;
  END tgDevolEliminPrest;
  /

-----------5.- LAZARO         Al resellar el préstamo de un material, la fecha del préstamo cambiará a la fecha en la que se resella, la fecha de vencimiento se volverá a calcular dependiendo del tipo de lector y se actualizará el número de refrendo. -- Lázaro
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

CREATE TABLE prestamo2(
  prestamo_id CHAR(5) NOT NULL,
  resello NUMBER NOT NULL,
  fechaResello DATE NULL,
  fechaPrestamo DATE DEFAULT SYSDATE NOT NULL,
  fechaVencimiento DATE NOT NULL,
  lector_id CHAR(10) NOT NULL,
  noEjemplar CHAR(10) NOT NULL,
  material_id CHAR(5) NOT NULL
  );

CREATE OR REPLACE TRIGGER tgPackagePrestamo
BEFORE UPDATE ON prestamo
DECLARE
  CURSOR cur_prestamo IS
    SELECT * FROM prestamo;
BEGIN
  DELETE prestamo2;
  FOR cCurso IN cur_prestamo LOOP
    INSERT INTO prestamo2 
    VALUES( cCurso.PRESTAMO_ID,
            cCurso.RESELLO,
            cCurso.FECHARESELLO,
            cCurso.FECHAPRESTAMO,
            cCurso.FECHAVENCIMIENTO,
            cCurso.LECTOR_ID,
            cCurso.NOEJEMPLAR,
            cCurso.MATERIAL_ID);
    END LOOP;
END tgPackagePrestamo;
/


create or replace trigger tgValidaReselloPrestamo
  before update
  on prestamo
  FOR EACH ROW
declare
  vtipoLector CHAR(4);
  vresello NUMBER(20);
  vprestamo_id CHAR(5);
begin
SELECT tipolector_id INTO vtipoLector
FROM lector
WHERE lector_id = :new.lector_id;
SELECT resello, prestamo_id INTO vresello, vprestamo_id
FROM prestamo2 
WHERE prestamo_id = :old.prestamo_id;
  CASE
    WHEN UPPER(vtipoLector) = 'TL1' THEN
      IF vresello < 1 THEN
        UPDATE prestamo 
        SET resello = vresello + 1, fechaResello = SYSDATE, fechaPrestamo = SYSDATE, fechaVencimiento = SYSDATE + 8
        WHERE prestamo_id = vprestamo_id;
      ELSE
        DBMS_OUTPUT.PUT_LINE('Limite máximo de resellos alcanzados, favor de devolver el ejemplar');
      END IF;
    WHEN UPPER(vtipoLector) = 'TL2' THEN
      IF vresello < 2 THEN
       UPDATE prestamo 
        SET resello = vresello + 1, fechaResello = SYSDATE, fechaPrestamo = SYSDATE, fechaVencimiento = SYSDATE + 15
        WHERE prestamo_id = vprestamo_id;
      ELSE
        DBMS_OUTPUT.PUT_LINE('Limite máximo de resellos alcanzados, favor de devolver el ejemplar');
      END IF;
    WHEN UPPER(vtipoLector) = 'TL3' THEN
      IF vresello < 3 THEN
       UPDATE prestamo 
        SET resello = vresello + 1, fechaResello = SYSDATE, fechaPrestamo = SYSDATE, fechaVencimiento = SYSDATE + 30
        WHERE prestamo_id = vprestamo_id;
      ELSE
        DBMS_OUTPUT.PUT_LINE('Limite máximo de resellos alcanzados, favor de devolver el ejemplar');
      END IF;
  ELSE
      raise_application_error(-20054,'ERROR No existe ese campo');
  END CASE;
end tgValidaReselloPrestamo;
/