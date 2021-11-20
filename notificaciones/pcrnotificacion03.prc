create or replace procedure pcrnotificacion03(idnegocio in negocios.id_negocio%type, msg out varchar2) is
       CURSOR provedoresSobrecredito is
       select t.* from PROVEEDORES t join creditonegocios c on c.id_proveedor = t.id_proveedor join negocios n on n.id_negocio = c.id_negocio 
       where c.credito_actual >= (c.credito_max * 0.70) and n.id_negocio = idnegocio;
begin
  FOR n IN provedoresSobrecredito LOOP
     msg:=concat(msg,n.cedula);
  END LOOP;
end pcrnotificacion03;
/
