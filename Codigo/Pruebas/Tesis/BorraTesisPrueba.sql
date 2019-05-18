SELECT * FROM tesis;

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Borrando tesis');
  BajaTesis(
    v_material_id  =>  'M7'
    );
end;
/
SELECT * FROM tesis;
