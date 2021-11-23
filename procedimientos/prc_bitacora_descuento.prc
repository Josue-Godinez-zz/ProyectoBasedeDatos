create or replace noneditionable procedure prc_bitacora_descuento(idDescuento in descuentos.id_descuento%type,
                         campo in bitacoradescuentos.campo_modificado%type,
                         valorAntiguo in bitacoradescuentos.valor_antiguo%type,
                         valorNuevo in bitacoradescuentos.valor_nuevo%type) is
       begin
         insert into bitacoradescuentos(id_descuento,
                                        campo_modificado,
                                        valor_antiguo,
                                        valor_nuevo,
                                        fecha_cambio)
                values (idDescuento,campo, valorAntiguo, valorNuevo, sysdate);
     end prc_bitacora_descuento;
/
