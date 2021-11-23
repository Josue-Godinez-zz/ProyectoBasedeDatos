create or replace noneditionable procedure prc_bitacora_cliente(idCliente in clientes.id_cliente%type,
                        campo in bitacoraclientes.campo_modificado%type,
                        valorAntiguo in bitacoraclientes.valor_antiguo%type,
                        valorNuevo in bitacoraclientes.valor_nuevo%type) is
      begin
        insert into bitacoraclientes(id_cliente,
                                     fecha_cambio,
                                     campo_modificado,
                                     valor_nuevo,
                                     valor_antiguo)
               values(idCliente, sysdate, campo,valorNuevo,valorAntiguo);
     end prc_bitacora_cliente;
/
