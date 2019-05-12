--------------------1.- OSCAR       Vista de los catálogos de LIBRO. 
--------------------2.- CHAVIRA     Vista de los catálogos de TESIS. 
--------------------3.- JOYA        Vista de los catálogos de AUTOR con su tipo de material.
CREATE OR REPLACE VIEW CatalogoAutor(
  AutorId, NombreAutor, ApPaterno, Titulo, TipoMaterial
)
AS
SELECT e.autor_id, a.nombreAutor, a.apPaternoAutor, m.titulo, m.tipoMaterial 
FROM autor a
JOIN escribe e ON (e.autor_id = a.autor_id)
JOIN material m ON (e.material_id = m.material_id);

--------------------4.- LAZARO      Vista de estatus del MATERIAL.
create or replace view EstatusMaterial(
  titulo,ejemplar,estatus
) as
select titulo,noEjemplar,descripcione
from material 
join ejemplar using(material_id)
join estatus using(estatus_id);
--------------------5.- OSCAR       Vista de LECTOR por tipo.
