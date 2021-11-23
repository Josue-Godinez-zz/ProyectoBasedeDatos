create or replace noneditionable trigger trg_bitacora_factura
  after insert or update or delete
  on facturas
  for each row
declare
  id facturas.id_factura%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :new.id_factura;
  if inserting then
    campo := 'insert';
    vAntiguo := ' ';
    vNuevo := :new.id_factura;
    elsif deleting then
      id := :old.id_factura;
      campo := 'delete';
      vAntiguo := :old.id_factura;
      vNuevo := ' ';
    else
      if updating('MODALIDAD') then
           campo := 'MODALIDAD'; vAntiguo := :old.MODALIDAD; vNuevo := :new.MODALIDAD;
         elsif updating('TIPO_FACTURA') then
           campo := 'TIPO_FACTURA'; vAntiguo := :old.TIPO_FACTURA; vNuevo := :new.TIPO_FACTURA;
         elsif updating('REFERENCIA') then
           campo := 'REFERENCIA'; vAntiguo := :old.REFERENCIA; vNuevo := :new.REFERENCIA;
         elsif updating('VALOR_REFERENCIA') then
           campo := 'VALOR_REFERENCIA'; vAntiguo := :old.VALOR_REFERENCIA; vNuevo := :new.VALOR_REFERENCIA;
         elsif updating('OBSERVACION') then
           campo := 'OBSERVACION'; vAntiguo := :old.OBSERVACION; vNuevo := :new.OBSERVACION;
         elsif updating('FECHA_VENTA_REALIZADA') then
           campo := 'FECHA_VENTA_REALIZADA'; vAntiguo := :old.FECHA_VENTA_REALIZADA; vNuevo := :new.FECHA_VENTA_REALIZADA;
         elsif updating('ESTADO') then
           campo := 'ESTADO'; vAntiguo := :old.ESTADO; vNuevo := :new.ESTADO;
         elsif updating('ID_SUCURSAL') then
           campo := 'ID_SUCURSAL'; vAntiguo := :old.ID_SUCURSAL; vNuevo := :new.ID_SUCURSAL;
      end if;
  end if;
  prc_bitacora_factura(idFactura  => id,
                        campo        => campo,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
end trg_bitacora_factura;
/
