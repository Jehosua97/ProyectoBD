--drop user proyecto cascade;
--Creando el usuario proyecto desde "scott" y dándole permisos
CREATE USER proyecto IDENTIFIED BY proyecto;
GRANT create table to proyecto;
GRANT create sequence to proyecto;
GRANT create view to proyecto;
GRANT create trigger to proyecto;
GRANT create procedure to proyecto;
GRANT create ROLLBACK segment to proyecto;
GRANT alter tablespace to proyecto;
GRANT create session to proyecto;
GRANT UNLIMITED TABLESPACE TO proyecto;

CONNECT proyecto/proyecto
SET SERVEROUTPUT ON
/*Para iniciar desde cero teclear desde scott drop user proyecto cascade;*/

--Desde usuario "proyecto"
--Actualizar la tabla Multa en el modelo relacional*****************************************************
CREATE TABLE autor(
  autor_id CHAR(10) NOT NULL,
  nombreAutor VARCHAR2(20) NOT NULL,
  apPaternoAutor VARCHAR2(20) NOT NULL,
  apMaternoAutor VARCHAR2(20) NULL,
  nacionalidad VARCHAR2(15) NOT NULL,
  CONSTRAINT Pkautor PRIMARY KEY (autor_id)
  );

CREATE TABLE material(
  material_id CHAR(5) NOT NULL,
  ubicacion VARCHAR2(20) NOT NULL,
  colocacion VARCHAR2(20) NOT NULL,
  titulo VARCHAR2(20) NOT NULL,
  tipoMaterial CHAR(1) NOT NULL,
  CONSTRAINT PkMaterial PRIMARY KEY (material_id),
  CONSTRAINT CktipoMaterial CHECK (tipoMaterial = 'L' OR tipoMaterial = 'T')
  );

CREATE TABLE escribe(
  material_id CHAR(5) NOT NULL,
  autor_id CHAR(10) NOT NULL,
  CONSTRAINT Pkescribe PRIMARY KEY (material_id, autor_id),
  CONSTRAINT Fkmaterial_id FOREIGN KEY (material_id)
  REFERENCES material ON DELETE SET NULL,
  CONSTRAINT Fkautor_id FOREIGN KEY (autor_id)
  REFERENCES autor ON DELETE SET NULL
  );

CREATE TABLE libro(
  material_id CHAR(5) NOT NULL,
  noAdquisicion CHAR(10) NOT NULL,
  ISBN CHAR(10) NOT NULL,
  tema VARCHAR2(20) NOT NULL,
  edicion VARCHAR2(20) NOT NULL,
  CONSTRAINT PkLibro PRIMARY KEY (material_id),
  CONSTRAINT FkLibro FOREIGN KEY (material_id)
  REFERENCES material ON DELETE SET NULL,
  CONSTRAINT AkLibro1 UNIQUE(noAdquisicion),
  CONSTRAINT AkLibro2 UNIQUE (ISBN)
  );

CREATE TABLE gradoAcademico(
  gradoAcademico_id VARCHAR2(15) NOT NULL,
  descripcionGA VARCHAR2(20) NOT NULL,
  CONSTRAINT PkgradoAcademico PRIMARY KEY (gradoAcademico_id)
  );

CREATE TABLE directorTesis(
  director_id CHAR(10) NOT NULL,
  nombreDirector VARCHAR2(20) NOT NULL,
  apPaternoDirector VARCHAR2(20) NOT NULL,
  apMaternoDirector VARCHAR2(20) NULL,
  gradoAcademico_id VARCHAR2(15) NOT NULL,
  CONSTRAINT PkdirectorTesis PRIMARY KEY (director_id),
  CONSTRAINT FkgradoAcademico FOREIGN KEY (gradoAcademico_id)
  REFERENCES gradoAcademico ON DELETE SET NULL
  );


CREATE TABLE tesis(
  material_id CHAR(5) NOT NULL,
  tesis_id CHAR(10) NOT NULL,
  carreraTema VARCHAR2(20) NOT NULL,
  anoPublicacion VARCHAR2(4) NOT NULL,
  director_id CHAR(10) NULL,
  CONSTRAINT PkTesis PRIMARY KEY (material_id),
  CONSTRAINT FkTesis FOREIGN KEY (material_id)
  REFERENCES material ON DELETE SET NULL,
  CONSTRAINT Fktesis_id FOREIGN KEY (director_id)
  REFERENCES directorTesis ON DELETE SET NULL
  );

CREATE TABLE estatus(
  estatus_id VARCHAR2(20) NOT NULL,
  descripcionE VARCHAR2(20) NOT NULL,
  CONSTRAINT Pkestatus PRIMARY KEY (estatus_id)
  );

CREATE TABLE ejemplar(
  noEjemplar CHAR(10) NOT NULL,
  material_id CHAR(5) NOT NULL,
  estatus_id VARCHAR2(20) NOT NULL,
  CONSTRAINT Pkejemplar PRIMARY KEY (noEjemplar, material_id),
  CONSTRAINT Fkmaterial FOREIGN KEY (material_id)
  REFERENCES material ON DELETE SET NULL,
  CONSTRAINT Fkestatus_id FOREIGN KEY (estatus_id)
  REFERENCES estatus ON DELETE SET NULL
  );

CREATE TABLE tipoLector(
  tipolector_id CHAR(3) NOT NULL,
  descripcionTipoLector VARCHAR2(20) NOT NULL,
  limiteDeMateriales CHAR(5) NOT NULL,
  refrendos CHAR(5) NOT NULL,
  diasPrestamo CHAR(5) NOT NULL,
  CONSTRAINT PktipoLector PRIMARY KEY (tipolector_id)
  );

CREATE TABLE lector(
  lector_id CHAR(10) NOT NULL,
  fechaAltaLector DATE NOT NULL,
  telefonoLector VARCHAR2(12) NOT NULL,
  fechaVigenciaLector DATE NOT NULL,
  nombreLector VARCHAR2(20) NOT NULL,
  apPaternoLector VARCHAR2(20) NOT NULL,
  apMaternoLector VARCHAR2(20) NULL,
  adeudoLector NUMBER(8,2) NOT NULL,
  estado VARCHAR2(15) NOT NULL,
  numero VARCHAR2(8) NOT NULL,
  calle VARCHAR2(15) NOT NULL,
  colonia VARCHAR2(15) NOT NULL,
  delegacion VARCHAR2(20) NOT NULL,
  tipolector_id CHAR(3) NOT NULL,
  CONSTRAINT Pklector PRIMARY KEY (lector_id),
  CONSTRAINT FktipoLector_id FOREIGN KEY (tipolector_id)
  REFERENCES tipoLector ON DELETE SET NULL
  );

CREATE TABLE prestamo(
  prestamo_id CHAR(5) NOT NULL,
  resello NUMBER NOT NULL,
  fechaResello DATE NULL,
  fechaPrestamo DATE DEFAULT SYSDATE NOT NULL,
  fechaVencimiento DATE NOT NULL,
  lector_id CHAR(10) NOT NULL,
  noEjemplar CHAR(10) NOT NULL,
  material_id CHAR(5) NOT NULL,
  CONSTRAINT Pkprestamo PRIMARY KEY (prestamo_id),
  CONSTRAINT Fklector FOREIGN KEY (lector_id)
  REFERENCES lector ON DELETE SET NULL,
  CONSTRAINT Fkejemplar FOREIGN KEY (noEjemplar, material_id)
  REFERENCES ejemplar ON DELETE SET NULL
  );

CREATE TABLE prestamo_aux(
  prestamo_id CHAR(5) NOT NULL,
  resello NUMBER NOT NULL,
  fechaResello DATE NULL,
  fechaPrestamo DATE DEFAULT SYSDATE NOT NULL,
  fechaVencimiento DATE NOT NULL,
  lector_id CHAR(10) NOT NULL,
  noEjemplar CHAR(10) NOT NULL,
  material_id CHAR(5) NOT NULL
  );

CREATE TABLE multa(
  multa_id CHAR(10) NOT NULL,
  lector_id CHAR(10) NOT NULL,
  fechaMulta DATE DEFAULT SYSDATE NOT NULL,
  monto NUMBER(10,2),
  diasRetraso CHAR(6),
  CONSTRAINT Pkmulta PRIMARY KEY (multa_id),
  CONSTRAINT FkLectorId FOREIGN KEY (lector_id)
  REFERENCES lector(lector_id) ON DELETE set null
  );
@Secuencias.sql
@Procedimientos.sql
@Triggers.sql
@Vistas.sql

