create or replace noneditionable procedure prc_bitacora_inventario(idLote in lotes.id_lote%type,
                        valorAntiguo in movimientosinventarios.vieja_ubicacion%type,
                        valorNuevo in movimientosinventarios.nueva_ubicacion%type) is
      begin
        insert into movimientosinventarios(id_lote,
                                           nueva_ubicacion,
                                           vieja_ubicacion,
                                           fecha_movimiento)
               values(idLote, valorNuevo,valorAntiguo, sysdate);
     end prc_bitacora_inventario;
/
