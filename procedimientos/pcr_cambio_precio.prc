create or replace procedure pcr_cambio_precio(idproducto in productos.id_producto%type, precio in number) is
producto productos%rowtype;
begin
  select p.* into producto from productos p where p.id_producto = idproducto;
  if(producto.precio_compra != precio)then
  insert into historialprecios(id_producto,precio_antiguo,precio_nuevo,fecha_cambio)
                                   values(idproducto,producto.precio_compra,precio,sysdate);
       update productos p set p.precio_compra = precio where p.id_producto = idproducto;                     
  end if;
  
end pcr_cambio_precio;
/
