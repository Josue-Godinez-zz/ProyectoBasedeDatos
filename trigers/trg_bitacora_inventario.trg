create or replace noneditionable trigger trg_bitacora_inventario
  after update
  on lotes
  for each row
declare
  id lotes.id_lote%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :old.id_lote;
  if inserting then
    campo := 'insert';
    vAntiguo := ' ';
    vNuevo := :new.id_lote;
    elsif deleting then
      id := :old.id_lote;
      campo := 'delete';
      vAntiguo := :old.id_lote;
      vNuevo := ' ';
    else
      if updating('estado_ubicacion') then
         campo := 'estado_ubicacion'; vAntiguo := :old.estado_ubicacion; vNuevo := :new.estado_ubicacion;
         prc_bitacora_inventario(idLote  => id,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
      end if;
  end if;

end trg_bitacora_inventario;
/
