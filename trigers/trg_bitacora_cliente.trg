create or replace noneditionable trigger trg_bitacora_cliente
  after insert or update or delete
  on clientes
  for each row
declare
  id clientes.id_cliente%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :new.id_cliente;
  if inserting then
    campo := 'insert';
    vAntiguo := ' ';
    vNuevo := :new.id_cliente;
    elsif deleting then
      id := :old.id_cliente;
      campo := 'delete';
      vAntiguo := :old.id_cliente;
      vNuevo := ' ';
    else
      if updating('id_negocio') then
         campo := 'id_negocio'; vAntiguo := :old.id_negocio; vNuevo := :new.id_negocio;
         elsif updating('credito_maximo') then
           campo := 'credito_maximo'; vAntiguo := :old.credito_maximo; vNuevo := :new.credito_maximo;
         elsif updating('credito_favor') then
           campo := 'credito_favor'; vAntiguo := :old.credito_favor; vNuevo := :new.credito_favor;
         elsif updating('referencia') then
           campo := 'referencia'; vAntiguo := :old.referencia; vNuevo := :new.referencia;
         elsif updating('valor_referencia') then
           campo := 'valor_referencia'; vAntiguo := :old.valor_referencia; vNuevo := :new.valor_referencia;
         elsif updating('estado_cliente') then
           campo := 'estado_cliente'; vAntiguo := :old.estado_cliente; vNuevo := :new.estado_cliente;
         elsif updating('fecha_ingreso') then
           campo := 'fecha_ingreso'; vAntiguo := :old.fecha_ingreso; vNuevo := :new.fecha_ingreso;
      end if;
  end if;
  prc_bitacora_cliente(idCliente  => id,
                        campo        => campo,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
end trg_bitacora_cliente;
/
