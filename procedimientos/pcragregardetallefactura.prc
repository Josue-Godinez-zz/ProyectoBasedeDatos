create or replace noneditionable procedure pcragregardetallefactura(idfactura in detallefactura.id_factura%type,
                                                             estado in detallefactura.estado%type,
                                                             valor in detallefactura.valor%type,
                                                             subtotal in detallefactura.subtotal%type,
                                                             total in detallefactura.total%type,
                                                             descuento in detallefactura.descuento%type,
                                                             referencia in detallefactura.referencia%type,             
                                                             valor_referente in detallefactura.valor_referencia%type,
                                                             msg out varchar2) is
  montodebido number;
  cliente clientes%rowtype;
  CURSOR detalles is
         select t.* from DETALLEFACTURA t join facturas f on f.id_factura = t.id_factura where f.estado like 'N' and f.valor_referencia = cliente.id_cliente; 
begin
       select c.* into cliente from clientes c join facturas f on f.valor_referencia = c.id_cliente where f.id_factura = idfactura;  
        montodebido := total;
        FOR n IN detalles LOOP
          montodebido := montodebido + n.total;
        end loop;
       if(cliente.credito_maximo < montodebido) then
          update detallefactura d set d.estado = 'C' where d.id_factura = idfactura;
          update facturas f set f.estado = 'Ca' where f.id_factura = idfactura;
          update facturasporpagar f set f.estado = 'C' where f.id_factura = idfactura;
          msg := 'Lo sentimos ya sobrepaso el credito establecido';                      
       end if;
       if(cliente.credito_maximo > montodebido) then
          insert into detallefactura(id_detalle_factura,referencia,valor_referencia, valor,subtotal, total,descuento,fecha_venta,estado,id_factura)
          values(seq_detallefacturas0.nextval,referencia,valor_referente,valor,subtotal,total,descuento,sysdate,estado,idfactura);
          msg := 'Detalle de factura agregado correctamente';                      

       end if;
       commit;
end pcr_creditomaximo;
/
