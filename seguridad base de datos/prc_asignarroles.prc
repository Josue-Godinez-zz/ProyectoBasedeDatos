create or replace procedure prc_asignarroles AUTHID CURRENT_USER is
  clave varchar(500);
  decencriptado varchar2(2000);
begin
  
  IF(USER = 'USUARIO_CAJERO') THEN
    
    SELECT p.clave
    INTO clave
    FROM shernandez.parametros p
    WHERE p.nombre_rol = 'Cajero';
    
            SELECT UTL_RAW.CAST_TO_varchar2(DBMS_CRYPTO.decrypt(clave, 
    4353, UTL_RAW.CAST_TO_RAW ('Proyecto')))
    INTO decencriptado 
    FROM dual;
      
    dbms_session.set_role('ROL_CAJERO IDENTIFIED BY ' || decencriptado);
  
  END IF;
  
  
  IF(USER = 'USUARIO_GERENTE') THEN
    
    SELECT p.clave
    INTO clave
    FROM shernandez.parametros p
    WHERE p.nombre_rol = 'Gerente';
      
            SELECT UTL_RAW.CAST_TO_varchar2(DBMS_CRYPTO.decrypt(clave, 
    4353, UTL_RAW.CAST_TO_RAW ('Proyecto')))
    INTO decencriptado 
    FROM dual;
    
    dbms_session.set_role('ROL_GERENTE IDENTIFIED BY ' ||decencriptado);
  
  END IF;
  
  
  IF(USER = 'USUARIO_COORDINADOR') THEN
    
    SELECT p.clave
    INTO clave
    FROM shernandez.parametros p
    WHERE p.nombre_rol = 'Coordinador';
      
            SELECT UTL_RAW.CAST_TO_varchar2(DBMS_CRYPTO.decrypt(clave, 
    4353, UTL_RAW.CAST_TO_RAW ('Proyecto')))
    INTO decencriptado 
    FROM dual;
    
    dbms_session.set_role('ROL_COORDINADOR IDENTIFIED BY ' || decencriptado);
  
  END IF;
  
  
  IF(USER = 'USUARIO_ENCARGADO_INVENTARIO') THEN
    
    SELECT p.clave
    INTO clave
    FROM shernandez.parametros p
    WHERE p.nombre_rol = 'Encargado_Inventario';
      
            SELECT UTL_RAW.CAST_TO_varchar2(DBMS_CRYPTO.decrypt(clave, 
    4353, UTL_RAW.CAST_TO_RAW ('Proyecto')))
    INTO decencriptado 
    FROM dual;
    
    dbms_session.set_role('ROL_ENCARGADO_INVENTARIO IDENTIFIED BY ' || decencriptado);
  
  END IF;
end prc_asignarroles;
/
