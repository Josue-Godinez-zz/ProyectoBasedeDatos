create or replace procedure prc_procedimiento_semanal is
cursor negocio is
select n.* from negocios n;
begin
    FOR n IN negocio LOOP
        pcrnotificacion02(n.id_negocio);
        pcrnotificacion03(n.id_negocio);
        pcrnotificacion04(n.id_negocio);
        pcrnotificacion05(n.id_negocio);
  end loop;
end prc_procedimiento_semanal;
/
