create or replace procedure prc_mejorespornegocio is
cursor negocio is
select n.* from negocios n;
begin
  FOR n IN negocio LOOP
    prc_mejoresclientes(n.id_negocio);
  end loop;
end prc_mejorespornegocio;
/
