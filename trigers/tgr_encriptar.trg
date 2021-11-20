create or replace trigger tgr_encriptar
  after insert
  on shernandez.parametros 
  for each row
declare
  -- local variables here
begin
  update shernandez.parametros p set p.clave = encriptar(:new.clave) where p.id_parametro = :new.id_parametro;
end tgr_encriptar;
/
