--------------------1.- OSCAR       Vista de los catálogos de LIBRO.
CREATE OR REPLACE VIEW TipoLector(
  material_id,
  titulo,
  autor,
  tema,
  edicion
)
AS
SELECT m.material_id, m.titulo, a.autor, l.tema, l.edicion
FROM material m
JOIN libros l   ON l.material_id = m.material_id
JOIN escribe e  ON e.material_id = m.material_id
JOIN autor a    ON a.autor_id = e.autor_id;
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

CREATE OR REPLACE VIEW TipoLector(
  lector_id,
  nombreLector,
  apPaternoLector,
  descripcionTipoLector
)
AS
SELECT l.lecotr_id, l.nombreLector, l.apPaternoLector, tl.descripcionTipoLector 
FROM lector l
JOIN tipoLector tl
ON tl.tipoLector_id = l.tipoLector_id
ORDER BY tl.descripcionTipoLector;
