create or replace trigger tgr_facturas2
  after update
  on facturasporpagar 
  for each row
declare
  -- local variables here
begin
  if :new.monto_total = :new.monto_pagado then
     update facturas f set f.estado = 'C' where f.id_factura = :old.id_factura;
     update facturasporpagar f set f.estado = 'P' where f.id_factura = :old.id_factura;  
  end if;
end tgr_facturas2;


/*
Cuando una factura sea cancelada totalmente, deberá automáticamente cambiar el 
estado de pendiente a cancelada.
*/
/
