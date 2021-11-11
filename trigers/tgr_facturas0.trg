create or replace trigger SHERNANDEZ.tgr_facturas0
  after insert
  on shernandez.facturas
  for each row
declare

begin
  if :new.estado = 'N' then
     insert into facturasporpagar(id_factura_por_pagar,monto_total,monto_pagado,estado,
                                             fecha_ingreso, id_negocio,id_factura)
                                             values(seq_facturasporpagar0.nextval,0,0,'A',sysdate,:new.id_sucursal,:new.id_factura);
  end if;
end tgr_facturas0;
/*
 Cuando se ingrese una factura en estado pendiente de cancelar, aumentar 
automáticamente el saldo del cliente que debe el cliente y agregar esta factura al 
detalle, cuentas por cobrar
*/
/
