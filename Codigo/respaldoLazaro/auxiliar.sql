declare
  vTipoLector char(3);
begin
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('0983813282', 'Carey', 'Rustan', 'Ansell', 'CDMX', '4', 'calle-75', 'colonia-00', 'delegacion-48', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('1953180047', 'Casey', 'Sapsforde', 'Wroe', 'CDMX', '5', 'calle-50', 'colonia-72', 'delegacion-00', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('6886594908', 'Alisun', 'Eckery', 'Linner', 'BC', '4', 'calle-89', 'colonia-52', 'delegacion-20', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('5707838082', 'Krissie', 'Houndson', 'Lafee', 'CDMX', '4', 'calle-94', 'colonia-46', 'delegacion-55', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('4568285599', 'Danit', 'Yitzhakov', 'Letessier', 'BC', '7', 'calle-46', 'colonia-56', 'delegacion-20', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('7112882060', 'Mychal', 'Wooffinden', 'Barkworth', 'BC', '7', 'calle-76', 'colonia-33', 'delegacion-10', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('0028418167', 'Neysa', 'Bytheway', 'Readwing', 'CDMX', '7', 'calle-42', 'colonia-70', 'delegacion-13', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('4509672820', 'Erna', 'Jozwicki', 'Duerdin', 'CDMX', '0', 'calle-70', 'colonia-52', 'delegacion-42', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('3759962312', 'Tynan', 'Murrey', 'Philipsen', 'Puebla', '2', 'calle-30', 'colonia-75', 'delegacion-33', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;
AltaLector('8702003894', 'Sacha', 'Scading', 'McLagan', 'Puebla', '4', 'calle-52', 'colonia-22', 'delegacion-33', vTipoLector);
select tipolector_id into vTipoLector from (select tipolector_id from tipolector order by dbms_random.value) where rownum=1;

end;
/