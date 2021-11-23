create or replace noneditionable trigger trg_bitacora_descuento
  after insert or update or delete
  on descuentos
  for each row
declare
  id descuentos.id_descuento%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :new.id_descuento;
  if inserting then
    campo := 'insert';
    vAntiguo := ' ';
    vNuevo := :new.id_descuento;
    elsif deleting then
      id := :old.id_descuento;
      campo := 'delete';
      vAntiguo := :old.id_descuento;
      vNuevo := ' ';
    else
      if updating('ID_FAMILIA') then
           campo := 'id_familia'; vAntiguo := :old.id_familia; vNuevo := :new.id_familia;
         elsif updating('ID_PROVEEDOR') then
           campo := 'id_proveedor'; vAntiguo := :old.ID_PROVEEDOR; vNuevo := :new.ID_PROVEEDOR;
         elsif updating('FECHA_INICIO') then
           campo := 'fecha_inicio'; vAntiguo := :old.FECHA_INICIO; vNuevo := :new.FECHA_INICIO;
         elsif updating('FECHA_VENCIMIENTO') then
           campo := 'fecha_vencimiento'; vAntiguo := :old.FECHA_VENCIMIENTO; vNuevo := :new.FECHA_VENCIMIENTO;
         elsif updating('DESCUENTO') then
           campo := 'descuento'; vAntiguo := :old.DESCUENTO; vNuevo := :new.DESCUENTO;
      end if;
  end if;
  prc_bitacora_descuento(idDescuento  => id,
                        campo        => campo,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
end trg_bitacora_descuento;
/
