create or replace noneditionable procedure prc_procedimiento_semanal is
cursor negocio is
select n.* from negocios n;
begin
    FOR n IN negocio LOOP
        prc_notificacion02(n.id_negocio);
        prc_notificacion03(n.id_negocio);
        prc_notificacion04(n.id_negocio);
        prc_notificacion05(n.id_negocio);
  end loop;
end prc_procedimiento_semanal;
/
