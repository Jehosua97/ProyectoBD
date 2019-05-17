--@Autor:           Lázaro Martínez Abraham Josué
--@Fecha creación:  16/05/2019
--@Descripción:     Actualizacion trigger tgValidaReselloPrestamo

create or replace view EstatusMaterial as
select titulo,noEjemplar,descripcione
from material
join ejemplar using(material_id)
join estatus using(estatus_id);