create or replace trigger SHERNANDEZ.tgr_facturas0
  after insert
  on shernandez.facturas
  for each row
declare

begin
  if :new.estado = 'N' then
     insert into shernandez.facturasporpagar(id_factura_por_pagar,monto_total,monto_pagado,estado,
                                             fecha_ultimo_abono, id_negocio,id_factura)
                                             values(shernandez.seq_facturasporpagar0.nextval,0,0,'A',sysdate,:new.id_negocio,:new.id_factura);
  end if;
end tgr_facturas0;
/
