create or replace trigger Productos
  before update
  on productos 
  for each row
declare
  -- local variables here
begin
  if not :old.precio_compra = :new.precio_compra then
    /*insert into bitacora_productos;*/
  end if;
end Productos;
/
