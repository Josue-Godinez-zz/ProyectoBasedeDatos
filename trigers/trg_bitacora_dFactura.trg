create or replace noneditionable trigger trg_bitacora_dFactura
  after insert or update or delete
  on detallefactura
  for each row
declare
  id detallefactura.id_detalle_factura%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :new.id_detalle_factura;
  if inserting then
    campo := 'insert'; vAntiguo := ' '; vNuevo := :new.id_detalle_factura;
    elsif deleting then
      id := :old.id_detalle_factura; campo := 'delete'; vNuevo := ' ';
    else
      if updating('MODALIDAD') then
           campo := 'referencia'; vAntiguo := :old.referencia; vNuevo := :new.referencia;
         elsif updating('valor_referencia') then
           campo := 'valor_referencia'; vAntiguo := :old.valor_referencia; vNuevo := :new.valor_referencia;
         elsif updating('valor') then
           campo := 'valor'; vAntiguo := :old.valor; vNuevo := :new.valor;
         elsif updating('subtotal') then
           campo := 'subtotal'; vAntiguo := :old.subtotal; vNuevo := :new.subtotal;
         elsif updating('total') then
           campo := 'total'; vAntiguo := :old.total; vNuevo := :new.total;
         elsif updating('descuento') then
           campo := 'descuento'; vAntiguo := :old.descuento; vNuevo := :new.descuento;
         elsif updating('fecha_venta') then
           campo := 'fecha_venta'; vAntiguo := :old.fecha_venta; vNuevo := :new.fecha_venta;
         elsif updating('id_factura') then
           campo := 'id_factura'; vAntiguo := :old.id_factura; vNuevo := :new.id_factura;
         elsif updating('estado') then
           campo := 'estado'; vAntiguo := :old.estado; vNuevo := :new.estado;
      end if;
  end if;
  prc_bitacora_factura(idFactura  => id,
                        campo        => campo,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
end trg_bitacora_dFactura;
/
