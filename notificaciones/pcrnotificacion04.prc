create or replace noneditionable procedure pcrnotificacion04(idnegocio in negocios.id_negocio%type) is
CURSOR clientessinabonos is
  select p.* from personas p join clientes c on c.valor_referencia = p.id_persona join facturas f on f.valor_referencia = c.id_cliente 
  join FACTURASPORPAGAR t on  t.id_factura = f.id_factura where t.fecha_ingreso < ADD_MONTHS(sysdate,  -1) 
  and (select count(ab.id_factura_por_pagar) from abonos ab where ab.id_factura_por_pagar = t.id_factura_por_pagar) = 0
  and t.id_negocio = idnegocio;
  
CURSOR clientesabonosatrasados is  
  select p.* from personas p join clientes c on c.valor_referencia = p.id_persona join facturas f on f.valor_referencia = c.id_cliente 
  join FACTURASPORPAGAR t on  t.id_factura = f.id_factura join abonos a on a.id_factura_por_pagar = t.id_factura_por_pagar 
  where a.fecha_abono < ADD_MONTHS(sysdate,  -1) and t.id_negocio = idnegocio;
  info varchar2(1000);
  persona1 personas%rowtype;
  persona2 personas%rowtype;
  bandera boolean;
  crlf varchar2(2) := UTL_TCP.CRLF;
  msg varchar2(30000);
begin
  bandera:= false;
  msg:='Los siguientes clientes tienen un mes o mas de no realizar un abono en sus facturas a credito = ' || crlf;
  select t.* into persona1 from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
  select t.* into persona2 from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Gerente' and e.id_negocio = idnegocio;      
  FOR n IN clientessinabonos LOOP
    bandera:= true;
    info := 'Informacion del cliente = ';
    info := concat(info,'Cedula = ');
    info := concat(info,n.cedula || crlf);
    info := concat(info,'Nombre = ');
    info := concat(info,n.nombre || crlf);
    info := concat(info,'Primer apellido = ');
    info := concat(info,n.papellido || crlf);
    info := concat(info,'Numero telefonico = ');
    info := concat(info,n.telefono || crlf);
    info := concat(info,'Email = ');
    info := concat(info,n.email || crlf);
    msg := concat(msg,info || crlf);
  END LOOP;
  FOR n IN clientesabonosatrasados LOOP
    bandera:= true;
    info := 'Informacion del cliente: ';
    info := concat(info,'Cedula = ');
    info := concat(info,n.cedula || crlf);
    info := concat(info,'Nombre = ');
    info := concat(info,n.nombre || crlf);
    info := concat(info,'Primer apellido = ');
    info := concat(info,n.papellido || crlf);
    info := concat(info,'Numero telefonico = ');
    info := concat(info,n.telefono || crlf);
    info := concat(info,'Email = ');
    info := concat(info,n.email || crlf);
    msg := concat(msg,info || crlf);    
  END LOOP;
  if(bandera)then
      sys.prc_correos(persona1.email,msg);
      sys.prc_correos(persona2.email,msg);
  end if;
end pcrnotificacion04;
/
