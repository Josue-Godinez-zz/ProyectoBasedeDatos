create or replace trigger tgr_facturas1
  after insert
  on detallefactura
  for each row
declare
  factura facturas%rowtype;
  facturaxpagar facturasporpagar%rowtype;
  cliente clientes%rowtype;
  negocio negocios%rowtype;
  CURSOR detallefacturas is
               select d.* from detallefactura d where d.id_factura = :new.id_factura;
begin
  select f.* into factura from facturas f where f.id_factura = :new.id_factura;
  if factura.estado = 'N' then
    update facturasporpagar fp set fp.monto_total = fp.monto_total + :new.total where fp.id_factura = :new.id_factura;
    select f.* into facturaxpagar from facturasporpagar f where f.id_factura = :new.id_factura;
    select n.* into negocio from negocios n join sucursales s on s.id_negocio = n.id_negocio where s.id_sucursal = factura.id_sucursal;
    select c.* into cliente from clientes c where c.id_negocio = negocio.id_negocio;
    
    if(cliente.credito_maximo < facturaxpagar.monto_total)then
        update facturasporpagar fp set fp.estado = 'C' where fp.id_factura = :new.id_factura; 
        update facturas fc set fc.estado = 'Ca' where fc.id_factura = factura.id_factura;
        FOR n IN detallefacturas LOOP
             update detallefactura d set d.estado = 'C' where d.id_detalle_factura = n.id_detalle_factura;           
        end loop;                      
    end if; 
  end if;
  commit;
end tgr_facturas1;

/*Complemento de tgr_facturas0*/
/
