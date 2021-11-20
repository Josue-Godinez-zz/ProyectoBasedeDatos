create or replace procedure pcrnotificacion05(idnegocio in negocios.id_negocio%type, msg out varchar2) is
    cursor productosvencidos is
       select t.id_lote,p.nombre,(t.cantidad_productos*p.precio_compra) as costo,t.cantidad_productos,p.precio_compra,t.estado_ubicacion 
       from LOTES t join productos p on p.id_producto=t.id_producto join bodegas b on b.id_bodega = t.id_bodega join negocios n on n.id_negocio = b.id_negocio 
       where t.fecha_caduca < sysdate and n.id_negocio= idnegocio;
    info varchar2(32000);   
begin
  msg:='';
  info:='';
  FOR n IN productosvencidos LOOP
    info := 'Productos vencidos:';
    info := concat(info,'ID lote ->');
    info := concat(info,n.id_lote);
    info := concat(info,' Nombre del producto ->');
    info := concat(info,n.nombre);
    info := concat(info,' Precios unitario ->');
    info := concat(info,n.precio_compra);
    info := concat(info,' Costo total ->');
    info := concat(info,n.costo);
    info := concat(info,' Cantidad de productos ->');
    info := concat(info,n.cantidad_productos);
    info := concat(info,' Ubicacion ->');
    info := concat(info,n.estado_ubicacion);
    msg := concat(msg,info);
  END LOOP;
end pcrnotificacion05;
/
