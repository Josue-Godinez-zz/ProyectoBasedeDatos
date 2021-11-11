create or replace procedure pcrmejoresclientes(idnegocio in negocios.id_negocio%type,msg out varchar2) is
   cliente clientes%rowtype;
   persona personas%rowtype;    
   negocio negocios%rowtype;
   CURSOR facturasmejores is 
   Select n.*, (SELECT SUM(de.total)
        FROM detallefactura de
        WHERE de.id_factura = n.id_factura) as TOTAL
    FROM facturas n 
    join sucursales s on s.id_sucursal = n.id_sucursal 
    join negocios ne on ne.id_negocio = s.id_negocio
    WHERE ROWNUM <= 10 and n.referencia like 'Clientes' and n.fecha_venta_realizada  > ADD_MONTHS(sysdate,  -6) and ne.id_negocio = idnegocio
    ORDER BY TOTAL DESC;
begin
  msg := 'Los ganadores son = ';
  /*SELECT  * into clien FROM (SELECT * FROM negocios n ORDER BY n.id_negocio desc)WHERE rownum <= 10 ORDER BY id_negocio;*/ 
  FOR n IN facturasmejores LOOP
     select * into cliente from clientes c where c.id_cliente = n.valor_referencia;
     if(cliente.referencia = 'Personas') then
        select * into persona from personas p where p.id_persona = cliente.valor_referencia;                                          
        msg := concat(msg,persona.nombre);
     end if;
     if(cliente.referencia = 'Negocios') then
        select * into negocio from negocios ne where ne.id_negocio = cliente.valor_referencia;                   
        msg := concat(msg,negocio.nombre_negocio);
     end if;
       msg := concat(msg,'-');
       update clientes ce set ce.credito_favor = ce.credito_favor + 100000 where ce.id_cliente = cliente.id_cliente;
       commit;
   END LOOP;
end pcrmejoresclientes;

/*por hacer notificar*/
/
