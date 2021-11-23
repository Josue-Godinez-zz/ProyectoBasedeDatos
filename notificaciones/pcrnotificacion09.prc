create or replace noneditionable procedure pcrnotificacion09(idnegocio in shernandez.negocios.id_negocio%type) is
indices_malos varchar(1000);
  cursor indicemalo is SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM DBA_OBJECTS
  WHERE OWNER NOT IN ('SYS','SYSTEM') AND STATUS = 'INVALID' AND OBJECT_TYPE = 'INDEX'
  ORDER BY OWNER,OBJECT_TYPE,OBJECT_NAME;
  persona1 shernandez.personas%rowtype;
  persona2 shernandez.personas%rowtype;
  bandera boolean; 
  msg varchar2(9000);  
  crlf varchar2(2) := UTL_TCP.CRLF;
begin
  bandera := false;
  msg:='';
  select t.* into persona1 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
  select t.* into persona2 from shernandez.PERSONAS t join shernandez.empleados e on e.id_persona = t.id_persona join shernandez.parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Gerente' and e.id_negocio = idnegocio;
  for n in indicemalo loop
     indices_malos := 'Indices dañados = ' || crlf;
     indices_malos := concat(indices_malos,'Propietario = ');
     indices_malos := concat(indices_malos,n.owner || crlf);
     indices_malos := concat(indices_malos,'Nombre = ');
     indices_malos := concat(indices_malos,n.object_name || crlf);
     indices_malos := concat(indices_malos,'Tipo = ');
     indices_malos := concat(indices_malos,n.OBJECT_TYPE || crlf);
     msg :=concat(msg,indices_malos || crlf);
  end loop;
  if(bandera)then
      sys.prc_correos(persona1.email,msg);
      sys.prc_correos(persona2.email,msg);
  end if; 

end pcrnotificacion09;
/
