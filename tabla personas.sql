-- Create table
create table PERSONAS
(
  id_persona        NUMBER not null,
  cedula            VARCHAR2(30) not null,
  nombre            VARCHAR2(30) not null,
  papellido         VARCHAR2(30) not null,
  sapellido         VARCHAR2(30),
  tipo_persona      VARCHAR2(1),
  estado_civil      VARCHAR2(1),
  direccion_trabajo VARCHAR2(150),
  direccion_casa    VARCHAR2(150),
  telefono          VARCHAR2(15),
  nacionalidad      VARCHAR2(30),
  residencia        VARCHAR2(30),
  fax               VARCHAR2(15),
  email             VARCHAR2(150),
  sexo              VARCHAR2(1),
  fecha_nacimiento  DATE,
  puesto            VARCHAR2(30),
  empresa           VARCHAR2(30),
  asegurado         VARCHAR2(1),
  escolaridad       VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create unique index IND_ID_PERSONA on PERSONAS (CEDULA)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PERSONAS
  add constraint PK_ID_PERSONA primary key (ID_PERSONA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );