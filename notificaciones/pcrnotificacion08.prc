create or replace noneditionable procedure pcrnotificacion08(idnegocio in shernandez.negocios.id_negocio%type) is
cursor invalidos is
    SELECT OWNER, OBJECT_NAME, OBJECT_TYPE
    FROM DBA_OBJECTS
    WHERE OWNER NOT IN ('SYS','SYSTEM') AND STATUS = 'INVALID'
    ORDER BY OWNER,OBJECT_TYPE,OBJECT_NAME;
persona1 shernandez.personas%rowtype;
persona2 shernandez.personas%rowtype; 
msg varchar2(9000);
crlf varchar2(2) := UTL_TCP.CRLF;
bandera boolean;   
begin
  bandera:=false;
  msg :='Objetos invalidos en = ';
  select t.* into persona1 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
  select t.* into persona2 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Gerente' and e.id_negocio = idnegocio;  
  FOR n IN invalidos LOOP
    bandera := true;
    msg:=concat(msg,'Objetos invalidos' || crlf );
    msg:=concat(msg,'Tipo = ');
    msg := concat(msg, n.object_type || crlf);
    msg:=concat(msg,'Nombre = ');
    msg := concat(msg, n.object_name || crlf);
  end loop;
  
  if(bandera)then
      sys.prc_correos(persona1.email,msg);
      sys.prc_correos(persona2.email,msg);
  end if;    
      
end pcrnotificacion08;
/
