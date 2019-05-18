--@Autor:           Mendoza Toledo Oscar
--@Fecha creación:  18/05/2019
--@Descripción:     Prueba Procedimiento ActualizaTesis

set linesize 100
set serveroutput on
SELECT * FROM tesis;

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Actualizacion de tesis');
  ActualizaTesis(
    vMaterial_id  =>  'M7',
    vCampo        =>  'ANOPUBLICACION',
    vValor        =>  '2005'
    );
end;
/

SELECT * FROM tesis;

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Actualizacion de tesis');
  ActualizaTesis(
    vMaterial_id  =>  'M7',
    vCampo        =>  'DIRECTOR_ID',
    vValor        =>  'D3'
    );
end;
/

SELECT * FROM tesis;
