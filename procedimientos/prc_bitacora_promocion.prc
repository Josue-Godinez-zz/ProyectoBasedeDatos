create or replace noneditionable procedure prc_bitacora_promocion(idPromocion in promociones.id_promocion%type,
                        campo in bitacorapromociones.campo_modificado%type,
                        valorAntiguo in bitacorapromociones.valor_antiguo%type,
                        valorNuevo in bitacorapromociones.valor_nuevo%type) is
      begin
        insert into bitacorapromociones(id_promocion,
                                        valor_antiguo,
                                        valor_nuevo,
                                        campo_modificado,
                                        fecha_cambio)
               values(idPromocion, valorAntiguo, valorNuevo, campo, sysdate);
     end prc_bitacora_promocion;
/
