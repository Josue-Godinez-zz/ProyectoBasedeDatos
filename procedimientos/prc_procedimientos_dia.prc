create or replace procedure prc_procedimientos_dia is
cursor negocio is
select n.* from negocios n;
begin
  FOR n IN negocio LOOP
     pcrnotificacion06(n.id_negocio);
     sys.pcrnotificacion07(n.id_negocio);
     sys.pcrnotificacion08(n.id_negocio);
     sys.pcrnotificacion09(n.id_negocio);
  end loop;  
end prc_procedimientos_dia;
/
