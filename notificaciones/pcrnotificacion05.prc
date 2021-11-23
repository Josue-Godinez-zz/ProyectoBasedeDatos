create or replace noneditionable procedure pcrnotificacion05(idnegocio in negocios.id_negocio%type) is
    cursor productosvencidos is
       select t.id_lote,p.nombre,(t.cantidad_productos*p.precio_compra) as costo,t.cantidad_productos,p.precio_compra,t.estado_ubicacion 
       from LOTES t join productos p on p.id_producto=t.id_producto join bodegas b on b.id_bodega = t.id_bodega join negocios n on n.id_negocio = b.id_negocio 
       where t.fecha_caduca < sysdate and n.id_negocio= idnegocio;
    info varchar2(32000); 
    bandera boolean;
    persona personas%rowtype;  
    msg varchar2(30000);
    crlf varchar2(2) := UTL_TCP.CRLF;
begin
  msg:='';
  info:='';
  bandera:= false;
    select t.* into persona from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Coordinador' and e.id_negocio = idnegocio;
    
    msg := 'Una lista de productos vencidos = ';
  FOR n IN productosvencidos LOOP
    bandera := true;
    info := 'Productos vencidos = ' || crlf;
    info := concat(info,'ID lote = ');
    info := concat(info,n.id_lote || crlf);
    info := concat(info,' Nombre del producto = ');
    info := concat(info,n.nombre || crlf);
    info := concat(info,' Precios unitario = ');
    info := concat(info,n.precio_compra || crlf);
    info := concat(info,' Costo total = ');
    info := concat(info,n.costo || crlf);
    info := concat(info,' Cantidad de productos = ');
    info := concat(info,n.cantidad_productos || crlf);
    info := concat(info,' Ubicacion = ');
    info := concat(info,n.estado_ubicacion || crlf);
    msg := concat(msg,info || crlf);
  END LOOP;
  if(bandera)then
      sys.prc_correos(persona.email,msg);
  end if;
end pcrnotificacion05;
/
