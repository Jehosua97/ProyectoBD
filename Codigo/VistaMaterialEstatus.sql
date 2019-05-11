create or replace view EstatusMaterial(
  titulo,ejemplar,estatus
) as
select titulo,noEjemplar,descripcione
from material 
join ejemplar using(material_id)
join estatus using(estatus_id);