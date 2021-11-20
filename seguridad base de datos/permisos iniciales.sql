-- Permisos sobre la tabla parametros

GRANT SELECT, INSERT, UPDATE, DELETE ON shernandez.parametros TO USUARIO_GERENTE;

GRANT SELECT, INSERT, UPDATE, DELETE ON shernandez.parametros TO USUARIO_CAJERO;

GRANT SELECT, INSERT, UPDATE, DELETE ON shernandez.parametros TO USUARIO_COORDINADOR;

GRANT SELECT, INSERT, UPDATE, DELETE ON shernandez.parametros TO USUARIO_ENCARGADO_INVENTARIO;



-- Permisos sobre el procedimiento de asignar roles

GRANT EXECUTE, DEBUG ON pcrasignarroles TO USUARIO_GERENTE;

GRANT EXECUTE, DEBUG ON pcrasignarroles TO USUARIO_COORDINADOR;

GRANT EXECUTE, DEBUG ON pcrasignarroles TO USUARIO_CAJERO;

GRANT EXECUTE, DEBUG ON pcrasignarroles TO USUARIO_ENCARGADO_INVENTARIO;



-- Permisos para iniciar seccion

GRANT CREATE SESSION TO USUARIO_GERENTE;

GRANT CREATE SESSION TO USUARIO_COORDINADOR;

GRANT CREATE SESSION TO USUARIO_CAJERO;

GRANT CREATE SESSION TO USUARIO_ENCARGADO_INVENTARIO;



-- Permisos para acceder a dbms_crypto

grant execute on sys.dbms_crypto to USUARIO_GERENTE;

grant execute on sys.dbms_crypto to USUARIO_COORDINADOR;

grant execute on sys.dbms_crypto to USUARIO_CAJERO;

grant execute on sys.dbms_crypto to USUARIO_ENCARGADO_INVENTARIO;
