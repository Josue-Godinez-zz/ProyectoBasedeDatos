create or replace noneditionable trigger tgr_facturas1
  after insert
  on detallefactura
  for each row
declare
  factura facturas%rowtype;

begin
  select f.* into factura from facturas f where f.id_factura = :new.id_factura;
  if factura.estado = 'N' then
    update facturasporpagar fp set fp.monto_total = fp.monto_total + :new.total where fp.id_factura = :new.id_factura;
  end if;
end tgr_facturas1;

/*Complemento de tgr_facturas0*/
/
