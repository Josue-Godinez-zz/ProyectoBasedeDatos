create or replace noneditionable procedure pcrabonos(idfactura in facturas.id_factura%type,monto in number,observacion varchar2, msg out varchar2) is
facturaporpagar facturasporpagar%rowtype;
montopagado number;
montodebido number;
begin
  select f.* into facturaporpagar from facturasporpagar f where f.id_factura = idfactura;
  insert into abonos(id_factura_por_pagar,monto_abonado,fecha_abono,observacion)
                     values(facturaporpagar.id_factura_por_pagar,monto,sysdate,observacion);
  montodebido := facturaporpagar.monto_total;
  montopagado := facturaporpagar.monto_pagado + monto;
  if(montodebido <= montopagado)then
      update facturasporpagar f set f.monto_pagado = f.monto_pagado + monto, f.estado = 'P' 
            where f.id_factura_por_pagar = facturaporpagar.id_factura_por_pagar;
      update facturasporpagar f set f.estado = 'P' where f.id_factura = idfactura;
      update facturas f set f.estado = 'C' where f.id_factura = idfactura;
      update detallefactura d set d.estado = 'P' where d.id_factura = idfactura;
  else
      update facturasporpagar f set f.monto_pagado = f.monto_pagado + monto 
          where f.id_factura_por_pagar = facturaporpagar.id_factura_por_pagar;
  end if;    
  msg := 'Abono realizado correctamnete';
  commit;                      
end pcrabonos;
/
