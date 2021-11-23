create or replace noneditionable procedure pcrnotificacion03(idnegocio in negocios.id_negocio%type) is
       persona personas%rowtype;
       msg varchar(9000);
       bandera boolean;
       crlf varchar2(2) := UTL_TCP.CRLF;
       CURSOR provedoresSobrecredito is
       select t.* from PROVEEDORES t join creditonegocios c on c.id_proveedor = t.id_proveedor join negocios n on n.id_negocio = c.id_negocio
       where c.credito_actual >= (c.credito_max * 0.70) and n.id_negocio = idnegocio;
begin
    bandera := false; 
    select t.* into persona from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
           where p.nombre_rol like 'Gerente' and e.id_negocio = idnegocio;
  msg:= 'Se le informa que se sobrepaso el 70% con los siguientes proveedores = ' || crlf;
  FOR n IN provedoresSobrecredito LOOP
    bandera:= true;
    msg:=concat(msg,'Nombre proveedor = ');
    msg:=concat(msg,n.nombre_proveedor || crlf);
    msg:=concat(msg,'Cedula juridica = ');
    msg:=concat(msg,n.cedula_juridica || crlf);
  END LOOP;
  if(bandera) then 
    sys.prc_correos(persona.email,msg);          
  end if;
  
end pcrnotificacion03;
/
