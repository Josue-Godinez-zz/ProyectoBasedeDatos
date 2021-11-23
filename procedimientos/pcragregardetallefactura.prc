create or replace noneditionable procedure pcragregardetallefactura(idfactura in detallefactura.id_factura%type,
                                                             estado in detallefactura.estado%type,
                                                             valor in detallefactura.valor%type,
                                                             descuento in detallefactura.descuento%type,
                                                             referencia in detallefactura.referencia%type,             
                                                             valor_referente in detallefactura.valor_referencia%type,
                                                             clienteoproveedor in facturas.referencia%type,
                                                             idclienteoprovedor in facturas.valor_referencia%type,
                                                             msg out varchar2) is
  montodebido number;
  quitarmonto number;
  factura facturas%rowtype;
  negocio negocios%rowtype;
  cliente clientes%rowtype;
  montopagar number;
  montofinal number;
  producto productos%rowtype;
  servicio servicios%rowtype;
  proveedor proveedores%rowtype;
  creditonegocio creditonegocios%rowtype;
  CURSOR detalles is
         select t.* from DETALLEFACTURA t join facturas f on f.id_factura = t.id_factura where f.estado like 'N' 
         and f.valor_referencia = idclienteoprovedor and f.referencia like clienteoproveedor; 
begin
         
        select f.* into factura from facturas f where f.id_factura = idfactura; 
        
        if(referencia = 'Productos')then
           select p.* into producto from productos p where p.id_producto = valor_referente;
           if(producto.impuesto <= 0)then
                  montopagar := valor;
           else
                  montopagar := valor + (valor*(producto.impuesto/100));
           end if;
                      montofinal := montopagar - (valor*(descuento/100));
        end if;
        if(referencia = 'Servicios')then
            select p.* into servicio from servicios p where p.id_servicio = valor_referente;
            montopagar := valor;          
            montofinal := montopagar - (montopagar*(descuento/100));
        end if;
        
        
        if (factura.referencia = 'Clientes') then
           select c.* into cliente from clientes c join facturas f on f.valor_referencia = c.id_cliente where f.id_factura = idfactura;  
           montodebido := montofinal;
           FOR n IN detalles LOOP
             montodebido := montodebido + n.total;
           end loop;
           if(estado = 'N')then
              if(cliente.credito_maximo < montodebido) then
               update detallefactura d set d.estado = 'C' where d.id_factura = idfactura;
               update facturas f set f.estado = 'Ca' where f.id_factura = idfactura;
               update facturasporpagar f set f.estado = 'C' where f.id_factura = idfactura;
               msg := 'Lo sentimos ya sobrepaso el credito establecido';                      
              end if;
              if(cliente.credito_maximo > montodebido) then
                 insert into detallefactura(referencia,valor_referencia, valor,subtotal, total,descuento,fecha_venta,estado,id_factura)
                 values(referencia,valor_referente,valor,montopagar,montofinal,descuento,sysdate,estado,idfactura);
                 msg := 'Detalle de factura agregado correctamente';  
              end if;
           else
                 insert into detallefactura(referencia,valor_referencia, valor,subtotal, total,descuento,fecha_venta,estado,id_factura)
                 values(referencia,valor_referente,valor,montopagar,montofinal,descuento,sysdate,estado,idfactura);
                 msg := 'Detalle de factura agregado correctamente';            
           end if;
          pcrnotificacion01(cliente.id_cliente);
        end if;
        if(factura.referencia = 'Proveedores')then
            select p.* into proveedor from proveedores p where p.id_proveedor = idclienteoprovedor;
            select n.* into negocio from negocios n join sucursales s on s.id_negocio = n.id_negocio 
            join facturas f on f.id_sucursal = s.id_sucursal where f.id_factura = factura.id_factura;
            montodebido := montofinal;
            select c.* into creditonegocio from creditonegocios c where c.id_negocio = negocio.id_negocio and c.id_proveedor = proveedor.id_proveedor;   
            FOR n IN detalles LOOP
              montodebido := montodebido + n.total;
            end loop;
            if(estado = 'N')then
               if(creditonegocio.credito_max < montodebido)then
                  quitarmonto :=0;
                  FOR n IN detalles LOOP
                      if(n.id_factura = idfactura)then
                          quitarmonto := quitarmonto + n.total;            
                      end if;
                  end loop;                           
                  update detallefactura d set d.estado = 'C' where d.id_factura = idfactura;
                  update facturas f set f.estado = 'Ca' where f.id_factura = idfactura;
                  update facturasporpagar f set f.estado = 'C' where f.id_factura = idfactura;
                  update creditonegocios c set c.credito_actual = (c.credito_actual - quitarmonto) 
                         where c.id_negocio = creditonegocio.id_negocio and c.id_proveedor = creditonegocio.id_proveedor; 
                  msg := 'Lo sentimos ya sobrepaso el credito establecido';                                              
               end if;
               if(creditonegocio.credito_max >= montodebido)then
                  insert into detallefactura(referencia,valor_referencia, valor,subtotal, total,descuento,fecha_venta,estado,id_factura)
                  values(referencia,valor_referente,valor,montopagar,montofinal,descuento,sysdate,estado,idfactura);
                  msg := 'Detalle de factura agregado correctamente';
                  if(referencia = 'Productos')then
                      pcr_cambio_precio(valor_referente,montofinal); 
                  end if;                                                  
               end if;
            else
                insert into detallefactura(referencia,valor_referencia, valor,subtotal, total,descuento,fecha_venta,estado,id_factura)
                       values(referencia,valor_referente,valor,montopagar,montofinal,descuento,sysdate,estado,idfactura);
                msg := 'Detalle de factura agregado correctamente'; 
                  if(referencia = 'Productos')then
                      pcr_cambio_precio(valor_referente,montofinal); 
                  end if;  
            end if; 
            pcrnotificacion03(negocio.id_negocio );           
        end if;
        
       commit;
end pcragregardetallefactura;
/
