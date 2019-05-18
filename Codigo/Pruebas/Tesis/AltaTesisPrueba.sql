--@Autor:           Mendoza Toledo Oscar
--@Fecha creación:  18/05/2019
--@Descripción:     Prueba Procedimiento AltaTesis
/*SI LO INSERTÓ BIEN, NADAMAS QUE AL PRINCIPIO MARCA ERROR POR
LOS REGISROS QUE SE METIERON EN POBLACION DE TABLAS*/
set linesize 100
set serveroutput on
SELECT * FROM tesis;

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Alta de tesis');
  AltaTesis(
    v_carreraTema     =>  'Ingenieria',
    v_anoPublicacion  =>  '2019',
    v_director_id     =>   'D1',
    v_ubicacion       =>  'Mexico',
    v_colocacion      =>  'Abajo',
    v_titulo          =>  'Algebra1',
    v_autor_id        =>  'A3'
    );
end;
/

SELECT * FROM tesis;
