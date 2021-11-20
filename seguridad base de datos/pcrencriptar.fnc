create or replace function pcrencriptar(texto varchar2) return varchar2 is
  tipo PLS_INTEGER := DBMS_CRYPTO.ENCRYPT_DES + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5;
  key RAW (32) := UTL_RAW.cast_to_raw('Proyecto');
  encriptado RAW (2000);
begin
  
  encriptado := DBMS_CRYPTO.ENCRYPT(src => UTL_RAW.CAST_TO_RAW (texto),typ => tipo,key => key);  
        
  return(encriptado);
end pcrencriptar;
/
