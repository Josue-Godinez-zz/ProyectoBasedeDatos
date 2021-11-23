create or replace procedure prc_procedimientos_dia is
cursor negocio is
select n.* from negocios n;
begin
  FOR n IN negocio LOOP
     prc_notificacion06(n.id_negocio);
     sys.prc_notificacion07(n.id_negocio);
     sys.prc_notificacion08(n.id_negocio);
     sys.prc_notificacion09(n.id_negocio);
  end loop;  
end prc_procedimientos_dia;
/
