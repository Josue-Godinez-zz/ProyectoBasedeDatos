create or replace procedure pcrnotificacion07(msg out varchar2) is

disponible number;
total number;

begin
   SELECT ROUND(sum(bytes)/1024/1024,0) INTO disponible FROM dba_free_space  
   WHERE tablespace_name LIKE '%USERS%' GROUP BY tablespace_name;
   
    SELECT ROUND(sum(BYTES/1024/1024),0)INTO total FROM dba_data_files b
    WHERE tablespace_name LIKE '%USERS%' GROUP BY b.tablespace_name;
    
    if((total-disponible) > (total*0.85))then
        msg := 'El tablespace sobrepasa el 85%';                  
    end if;
end pcrnotificacion07;
/
