create or replace noneditionable procedure pcrnotificacion07(idnegocio in shernandez.negocios.id_negocio%type) is

disponible number;
msg varchar2(9000);
total number;
persona1 shernandez.personas%rowtype;
persona2 shernandez.personas%rowtype;
begin
   SELECT ROUND(sum(bytes)/1024/1024,0) INTO disponible FROM dba_free_space  
   WHERE tablespace_name LIKE '%USERS%' GROUP BY tablespace_name;
   
    SELECT ROUND(sum(BYTES/1024/1024),0)INTO total FROM dba_data_files b
    WHERE tablespace_name LIKE '%USERS%' GROUP BY b.tablespace_name;
    
    select t.* into persona1 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
    select t.* into persona2 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Gerente' and e.id_negocio = idnegocio;  
    
    if((total-disponible) > (total*0.85))then
        msg := 'El tablespace users sobrepasa el 85% del espacio.';
        sys.prc_correos(persona1.email,msg);
        sys.prc_correos(persona2.email,msg);                  
    end if;
end pcrnotificacion07;
/
