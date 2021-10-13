create or replace trigger tgr_Facturas3
  after insert
  on detallefactura 
  for each row
declare
 factura Facturas%rowtype;
begin
  select f.* into factura from facturas f join detallefactura d on d.id_factura = f.id_factura where d.id_factura = :new.id_factura;
    
    if factura.referencia = 'Clientes' then
      if :new.referencia = 'Productos' then
         update inventarios i set i.cantidad_productos = i.cantidad_productos - :new.cantidad where i.id_sucursal = factura.id_sucursal 
                            and i.id_producto = :new.valor_referencia; 
      end if;
    end if;
  
 if factura.referencia = 'Proveedor' then
   update productos p set  p.cantidad_disponibles = p.cantidad_disponibles + :new.cantidad where p.id_producto = :new.valor_referencia;
 end if;
end tgr_Facturas3;
/
