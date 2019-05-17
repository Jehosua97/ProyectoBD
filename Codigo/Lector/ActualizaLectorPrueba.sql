--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Prueba Procedimiento ActualizaLector
set serveroutput on
set linesize 200

prompt =========== Actualizacion de Fecha Alta Lector ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'fechaaltalector';
  vValor varchar2(20) := sysdate;
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de telefono lector ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'telefonolector';
  vValor varchar2(20) := '0000000000';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de nombre lector ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'nombrelector';
  vValor varchar2(20) := 'Nombre nuevo';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de apellido paterno ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'appaternolector';
  vValor varchar2(20) := 'Paterno nuevo';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de apellido materno ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'apmaternolector';
  vValor varchar2(20) := 'Materno nuevo';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de adeudo lector ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'adeudolector';
  vValor varchar2(20) := 5000;
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de estado ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'estado';
  vValor varchar2(20) := 'estado nuevo';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de numero ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'numero';
  vValor varchar2(20) := 'Y';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de Fecha calle ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'calle';
  vValor varchar2(20) := 'calle nueva';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de Colonia ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'colonia';
  vValor varchar2(20) := 'colonia nueva';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de delegacion ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'delegacion';
  vValor varchar2(20) := 'delegacion nueva';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de tipo lector  ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'tipolector_id';
  vValor varchar2(20) := 'TL2';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
end;
/

select * from lector where lector_id='L1';

prompt =========== Actualizacion de campo invalido ==================
declare
  vLector_id char(4) := 'L1';
  vCampo varchar2(20) := 'titulo';
  vValor varchar2(20) := 'doctor';
begin
  dbms_output.put_line('Actualizando '||vCampo||' de '||vLector_id||' a '||vValor);
  dbms_output.put_line('Se espera error');
  ActualizaLector(
    vLector_id => vLector_id,
    vCampo     => vCampo,
    vValor     => vValor
    );
exception
  when others then
    if sqlcode = -20054 then
      dbms_output.put_line('Excepcion generada exitosamente');
    end if;
  raise;
end;
/

select * from lector where lector_id='L1';

rollback;