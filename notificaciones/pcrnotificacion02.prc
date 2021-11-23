create or replace noneditionable procedure pcrnotificacion02(idnegocio in clientes.id_negocio%type) is
persona personas%rowtype;
msg varchar(9000);
bandera boolean;
crlf varchar2(2) := UTL_TCP.CRLF;
CURSOR clientesSobrecredito is
       select p.nombre,p.papellido,p.cedula,p.email from CLIENTES c join Personas p on p.id_persona = c.valor_referencia 
              where c.id_negocio = idnegocio and (select sum(d.monto_total) from facturasporpagar d join facturas fc on fc.id_factura = d.id_factura  
              where fc.valor_referencia = c.id_cliente and d.estado like 'A') >= (c.credito_maximo*0.85);
begin
  bandera:=true;
  select t.* into persona from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio; 
  msg := 'Se le informa que los siguientes clientes han sobrepasado el 85% de su credito = ' || crlf;  
  FOR n IN clientesSobrecredito LOOP
     bandera:=true;
     msg:=concat(msg,'Cedula = ');
     msg:=concat(msg,n.cedula || crlf);
     msg:=concat(msg,'Nombre = ');
     msg:=concat(msg,n.nombre || n.papellido || crlf);
     msg:=concat(msg,'Email = ');
     msg:=concat(msg,n.email || crlf);
  END LOOP;
  if(bandera)then
      sys.prc_correos(persona.email,msg);
  end if;    
end pcrnotificacion02;
/
