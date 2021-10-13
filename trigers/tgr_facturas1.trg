create or replace trigger tgr_facturas1
  after insert
  on detallefactura 
  for each row
declare
  factura facturas%rowtype;
begin
  select f.* into factura from facturas f where f.id_factura = :new.id_factura;
  if factura.estado = 'N' then
    update facturasporpagar fp set fp.monto_total = fp.monto_total + :new.total where fp.id_factura = :new.id_factura; 
    /*if factura.referencia = 'clientes' then
       update clientes c set c.credito_favor = c.credito_favor - :new.total where c.id_cliente= factura.valor_referencia;
    end if;
    if factura.referencia = 'proveedores' then
       update creditonegocios c set c.credito_actual = c.credito_actual - :new.total where c.id_negocio = factura.id_negocio and c.id_proveedor = factura.valor_referencia;
    end if; */
  end if;
end tgr_facturas1;
/
