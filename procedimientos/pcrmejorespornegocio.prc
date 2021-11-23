create or replace procedure pcrmejorespornegocio is
cursor negocio is
select n.* from negocios n;
begin
  FOR n IN negocio LOOP
    pcrmejoresclientes(n.id_negocio);
  end loop;
end pcrmejorespornegocio;
/
