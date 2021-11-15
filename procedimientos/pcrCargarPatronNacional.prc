create or replace procedure pcrCargarPatronNacional is
 
 archivo UTL_FILE.FILE_TYPE;
 registro VARCHAR2 (1000);
 cedula VARCHAR2(30);
 nombre VARCHAR2(120);
 PAPELLIDO VARCHAR2(120);
 sapellido VARCHAR2(120);

begin
  
  archivo := UTL_FILE.FOPEN ('DIRECTORIO_PATRON_NACIONAL', 'PADRON_COMPLETO.TXT', 'R');
  IF UTL_FILE.IS_OPEN(archivo) THEN
  LOOP
  BEGIN
  UTL_FILE.GET_LINE(archivo, registro, 1000);
  IF registro IS NULL THEN
  EXIT;
  END IF;
  cedula := REGEXP_SUBSTR(registro, '[^,]+', 1, 1);
  NOMBRE := REGEXP_SUBSTR(registro, '[^,]+', 1, 6);
  PAPELLIDO := REGEXP_SUBSTR(registro, '[^,]+', 1, 7);
  SAPELLIDO := REGEXP_SUBSTR(registro, '[^,]+', 1, 8);

  INSERT INTO shernandez.personas (cedula,nombre,papellido,sapellido,tipo_persona,nacionalidad) 
         VALUES( cedula, nombre,papellido, sapellido,'N','Costarrisence');
  COMMIT;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
    EXIT;
  END;
 END LOOP;
 END IF;
 UTL_FILE.FCLOSE(archivo);

end pcrCargarPatronNacional;
/
