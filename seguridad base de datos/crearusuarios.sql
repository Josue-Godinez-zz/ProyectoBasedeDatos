alter session set "_ORACLE_SCRIPT"=true;
--Gerente
create user USUARIO_GERENTE
identified by oracle
default tablespace USERS
temporary tablespace TEMP;

grant resource to USUARIO_GERENTE;
grant connect to USUARIO_GERENTE;
grant dba to USUARIO_GERENTE;

alter user USUARIO_GERENTE
default role resource, connect; 

--Coordinador

create user USUARIO_COORDINADOR
identified by oracle
default tablespace USERS
temporary tablespace TEMP;

grant resource to USUARIO_COORDINADOR;
grant connect to USUARIO_COORDINADOR;
grant dba to USUARIO_COORDINADOR;

alter user USUARIO_COORDINADOR
default role resource, connect; 

--Cajero

create user USUARIO_CAJERO
identified by oracle
default tablespace USERS
temporary tablespace TEMP;

grant resource to USUARIO_CAJERO;
grant connect to USUARIO_CAJERO;
grant dba to USUARIO_CAJERO;

alter user USUARIO_CAJERO
default role resource, connect; 

--Encargado de inventario

create user USUARIO_ENCARGADO_INVENTARIO
identified by oracle
default tablespace USERS
temporary tablespace TEMP;

grant resource to USUARIO_ENCARGADO_INVENTARIO;
grant connect to USUARIO_ENCARGADO_INVENTARIO;
grant dba to USUARIO_ENCARGADO_INVENTARIO;

alter user USUARIO_ENCARGADO_INVENTARIO
default role resource, connect;
