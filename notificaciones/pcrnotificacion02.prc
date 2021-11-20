create or replace procedure pcrnotificacion02(idnegocio in clientes.id_negocio%type, msg out varchar2) is

CURSOR clientesSobrecredito is
       select p.nombre,p.papellido,p.cedula,p.email from CLIENTES c join Personas p on p.id_persona = c.valor_referencia 
              where c.id_negocio = idnegocio and (select sum(d.monto_total) from facturasporpagar d join facturas fc on fc.id_factura = d.id_factura  
              where fc.valor_referencia = c.id_cliente and d.estado like 'A') >= (c.credito_maximo*0.85);
begin
  FOR n IN clientesSobrecredito LOOP
     msg:=concat(msg,n.cedula);
  END LOOP;
end pcrnotificacion02;
/
