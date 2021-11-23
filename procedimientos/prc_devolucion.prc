create or replace procedure prc_devolucion(idfactura in detallefactura.id_factura%type, idproducto in productos.id_producto%type) is
cursor detalle is
       select d.* from detallefactura d where d.id_factura = idfactura and d.valor_referencia = idproducto 
       and d.referencia like 'Productos';
    bandera boolean;   
begin
  bandera := false;
  FOR n IN detalle LOOP
    if(bandera = false)then
      update detallefactura d set d.estado = 'D' where d.id_detalle_factura=n.id_detalle_factura;
      bandera:= true;                  
    end if;
  end loop;
end prc_devolucion;
/
