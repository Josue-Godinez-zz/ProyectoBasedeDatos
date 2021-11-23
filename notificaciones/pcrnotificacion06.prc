create or replace procedure pcrnotificacion06(idnegocio in negocios.id_negocio%type) is
cursor cierregeneral is
      select n.id_negocio,n.nombre_negocio,
      (select count(f.id_factura) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal
      where s.id_negocio = n.id_negocio and f.estado like 'C' and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as cantidad,
      (select count(d.id_detalle_factura) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura
      where s.id_negocio = n.id_negocio and d.estado like 'D'and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as devolciones,
      (select sum(d.total) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura 
      where s.id_negocio = n.id_negocio and f.estado like 'C' and d.estado like 'P' and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as total_vendido,
      (select sum(d.total) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura 
      where s.id_negocio = n.id_negocio and f.estado like 'C' and d.estado like 'D' and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as total_devuelto,
      (sysdate) as fecha 
      from NEGOCIOS n where n.id_negocio = idnegocio;
info varchar2(9000);
msg varchar2(9000);
persona1 personas%rowtype;
persona2 personas%rowtype;
crlf varchar2(2) := UTL_TCP.CRLF;
begin    
  msg:='';
    select t.* into persona1 from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
  select t.* into persona2 from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Gerente'  and e.id_negocio = idnegocio;
  FOR n IN cierregeneral LOOP
     
    info :='Empresa = ';
    info := concat(info,n.nombre_negocio || crlf);
    info := concat(info,' Cantidad de facturas realizadas = ');
    info := concat(info, n.cantidad || crlf);
    info := concat(info,' Devoluciones = ');
    info := concat(info,n.devolciones || crlf);
    info := concat(info,' Total vendido = ');
    info := concat(info,n.total_vendido || crlf);
    info := concat(info,' Total Devuelto = ');
    info := concat(info,n.total_devuelto || crlf);    
    info := concat(info, ' Fecha = ');
    info := concat(info,n.fecha || crlf);
    msg:=concat(msg,info || crlf);
    msg := concat(msg,fnnotificacion06(n.id_negocio) || crlf);
    pcrenviarcorreo(persona1.email,msg);
    pcrenviarcorreo(persona2.email,msg);
    msg:='';
  end loop;
end pcrnotificacion06;
/
