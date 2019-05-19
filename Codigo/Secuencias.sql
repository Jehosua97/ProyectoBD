--Procedmineto AltaMulta
create sequence SeqAltaMulta
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;

--Procedmineto AltaMaterial
create sequence SeqAltaMaterial
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;

--sequencia AltaLibro
create sequence SeqAltalibro
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;

  --Procedmineto AltaTesis, para el tesis_id
create sequence SeqAltaTesis
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;

--Procedmineto AltaGradoAcademico
create sequence SeqAltaGradoAcademico
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;

create sequence SeqAltaPrestamo
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;
--secuencia para alta de autor
create sequence SeqAltaAutor
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;
--secuencia director tesis
create sequence SeqAltaDirectorTesis
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;
--secuencia altaejemplar
create sequence SeqAltaEjemplar
  start with 0
  increment by 1
  maxvalue 1000
  minvalue 0
  nocycle;
