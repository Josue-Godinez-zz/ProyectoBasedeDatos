create or replace procedure pcrnotificacion06(msg out varchar2) is
cursor cierregeneral is
      select n.id_negocio,n.nombre_negocio,(select count(d.id_detalle_factura) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura
      where s.id_negocio = n.id_negocio and f.estado like 'C' and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as cantidad,(select count(d.id_detalle_factura) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura
      where s.id_negocio = n.id_negocio and d.estado like 'D'and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as Devolciones,(select sum(d.total) from sucursales s  
      join facturas f on f.id_sucursal = s.id_sucursal join detallefactura d on d.id_factura = f.id_factura 
      where s.id_negocio = n.id_negocio and f.estado like 'C' and TRUNC(f.fecha_venta_realizada) = TRUNC(sysdate)) as total,(sysdate) as Fecha from NEGOCIOS n;
info varchar2(2000);
begin 
  msg:='';
  FOR n IN cierregeneral LOOP
    info :='Empresa:';
    info := concat(info,n.nombre_negocio);
    info := concat(info,' Cantidad de productos ->');
    info := concat(info, n.cantidad);
    info := concat(info,' Devoluciones');
    info := concat(info,n.devolciones);
    info := concat(info,' Total vendido ->');
    info := concat(info,n.total);
    info := concat(info, ' Fecha ->');
    info := concat(info,n.fecha);
    msg:=concat(msg,info);
  end loop;
end pcrnotificacion06;
/
