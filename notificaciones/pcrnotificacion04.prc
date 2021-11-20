create or replace procedure pcrnotificacion04(idnegocio in negocios.id_negocio%type, msg out varchar2) is
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
begin
  msg:='';
  FOR n IN clientessinabonos LOOP
    info := 'Informacion del cliente: ';
    info := concat(info,'Cedula -> ');
    info := concat(info,n.cedula);
    info := concat(info,'Nombre -> ');
    info := concat(info,n.nombre);
    info := concat(info,'Primer apellido -> ');
    info := concat(info,n.papellido);
    info := concat(info,'Numero telefonico -> ');
    info := concat(info,n.telefono);
    info := concat(info,'Email -> ');
    info := concat(info,n.email);
    msg := concat(msg,info);
  END LOOP;
  FOR n IN clientesabonosatrasados LOOP
    info := 'Informacion del cliente: ';
    info := concat(info,'Cedula -> ');
    info := concat(info,n.cedula);
    info := concat(info,'Nombre -> ');
    info := concat(info,n.nombre);
    info := concat(info,'Primer apellido -> ');
    info := concat(info,n.papellido);
    info := concat(info,'Numero telefonico -> ');
    info := concat(info,n.telefono);
    info := concat(info,'Email -> ');
    info := concat(info,n.email);
    msg := concat(msg,info);    
  END LOOP;
end pcrnotificacion04;
/
