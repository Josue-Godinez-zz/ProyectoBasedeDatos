create or replace noneditionable trigger trg_bitacora_promocion
  after insert or update or delete
  on promociones
  for each row
declare
  id promociones.id_promocion%type;
  campo varchar2(30);
  vAntiguo varchar2(30);
  vNuevo varchar2(30);
begin
  id := :new.id_promocion;
  if inserting then
    campo := 'insert';
    vAntiguo := ' ';
    vNuevo := :new.id_promocion;
    elsif deleting then
      id := :old.id_promocion;
      campo := 'delete';
      vAntiguo := :old.id_promocion;
      vNuevo := ' ';
    else
      if updating('id_negocio') then
           campo := 'id_negocio'; vAntiguo := :old.id_negocio; vNuevo := :new.id_negocio;
         elsif updating('codigo_promocion') then
           campo := 'codigo_promocion'; vAntiguo := :old.codigo_promocion; vNuevo := :new.codigo_promocion;
         elsif updating('descuento') then
           campo := 'descuento'; vAntiguo := :old.descuento; vNuevo := :new.descuento;
         elsif updating('descripcion') then
           campo := 'descripcion'; vAntiguo := :old.descripcion; vNuevo := :new.descripcion;
         elsif updating('id_familia') then
           campo := 'id_familia'; vAntiguo := :old.id_familia; vNuevo := :new.id_familia;
         elsif updating('id_producto') then
           campo := 'id_producto'; vAntiguo := :old.id_producto; vNuevo := :new.id_producto;
         elsif updating('tipo_promocion') then
           campo := 'tipo_promocion'; vAntiguo := :old.tipo_promocion; vNuevo := :new.tipo_promocion;
         elsif updating('fecha_inicio') then
           campo := 'fecha_inicio'; vAntiguo := :old.fecha_inicio; vNuevo := :new.fecha_inicio;
         elsif updating('fecha_fin') then
           campo := 'fecha_fin'; vAntiguo := :old.fecha_fin; vNuevo := :new.fecha_fin;
         elsif updating('productos_minimos') then
           campo := 'productos_minimos'; vAntiguo := :old.productos_minimos; vNuevo := :new.productos_minimos;
      end if;
  end if;
  prc_bitacora_promocion(idPromocion  => id,
                        campo        => campo,
                        valorAntiguo => vAntiguo,
                        valorNuevo   => vNuevo);
end trg_bitacora_promocion;
/
