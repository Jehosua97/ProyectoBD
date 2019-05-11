--------------------1.- OSCAR       Vista de los catálogos de LIBRO. 
--------------------2.- CHAVIRA     Vista de los catálogos de TESIS. 
--------------------3.- JOYA        Vista de los catálogos de AUTOR con su tipo de material.
--------------------4.- LAZARO      Vista de estatus del MATERIAL.
create or replace view EstatusMaterial(
  titulo,ejemplar,estatus
) as
select titulo,noEjemplar,descripcione
from material 
join ejemplar using(material_id)
join estatus using(estatus_id);

--------------------5.- OSCAR       Vista de LECTOR por tipo.
