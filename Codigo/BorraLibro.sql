create or replace procedure BorraLibro(
  vMaterial_id char
)
is
  vPrestamos number;
  vEjemplares number;
  vBandera number;
begin
  --se cuenta cuantos prestamos hay de ese libro
  select count(*)
  into vPrestamos
  from prestamo 
  where material_id=vMaterial_id;
  --se cuenta cuantos ejemplares hay de ese libro
  select count(*)
  into vEjemplares
  from ejemplar
  where material_id=vMaterial_id;
  --se compara si existen prestamos del libro, si existen prestamos no se puede
  --eliminar
  if vPrestamos != 0 then
    raise_application_error(-20051,'ERROR No puede eliminar ese libro mientras
      existan ejemplares del libro en prestamo, se encontraron '
      ||vPrestamos
      ||' prestamos');
  else
    --de acuerdo a la cantidad de ejemplares del libro, si es diferente de 0
    --se le pedirá al usuario que confirme si quiere eliminar o no
    --el libro con todos los ejemplares
    if vEjemplares!=0 then
      dbms_output.put_line('Existen '
        ||vEjemplares
        ||' ejemplares de ese libro, se borraran junto con el libro');

    end if;
    --se borrara el libro junto
    --con lo que contemple, borrar los ejemplares, su relacion en escribe,
    --su registro en libro y en material

    delete from ejemplar where material_id=vMaterial_id;
    delete from libro where material_id=vMaterial_id;
    delete from escribe where material_id=vMaterial_id;
    delete from material where material_id=vMaterial_id;

  end if;

end;
/
show errors