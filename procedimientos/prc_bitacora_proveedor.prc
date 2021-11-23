create or replace noneditionable procedure prc_bitacora_proveedor(idProveedor in proveedores.id_proveedor%type,
                        campo in bitacoraproveedores.campo_modificado%type,
                        valorAntiguo in bitacoraproveedores.viejo_valor%type,
                        valorNuevo in bitacoraproveedores.nuevo_valor%type) is
      begin
        insert into bitacoraproveedores(id_proveedor,
                                        nuevo_valor,
                                        viejo_valor,
                                        fecha_cambio,
                                        campo_modificado)
               values(idProveedor,valorNuevo,valorAntiguo, sysdate, campo);
     end prc_bitacora_proveedor;
/
