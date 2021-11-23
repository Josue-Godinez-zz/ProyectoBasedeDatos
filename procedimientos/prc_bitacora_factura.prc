create or replace noneditionable procedure prc_bitacora_factura(idFactura in facturas.id_factura%type,
                        campo in bitacorafacturas.campo_modificado%type,
                        valorAntiguo in bitacorafacturas.valor_antiguo%type,
                        valorNuevo in bitacorafacturas.nuevo_valor%type) is
      begin
        insert into bitacorafacturas(id_factura,
                                     fecha_cambio,
                                     campo_modificado,
                                     nuevo_valor,
                                     valor_antiguo)
               values(idFactura, sysdate, campo, valorNuevo, valorAntiguo);
     end prc_bitacora_factura;
/
