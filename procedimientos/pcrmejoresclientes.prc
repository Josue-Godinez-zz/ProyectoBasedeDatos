create or replace procedure pcrmejoresclientes(idnegocio in negocios.id_negocio%type) is
   cliente clientes%rowtype;
   msg varchar2(9000);
   persona personas%rowtype;    
   negocio negocios%rowtype;
   coordinador personas%rowtype;
   crlf varchar2(2) := UTL_TCP.CRLF;
   CURSOR facturasmejores is 
    select c.id_cliente,c.referencia,c.valor_referencia,( select sum(de.total) 
    from facturas fa join detallefactura de on de.id_factura = fa.id_factura where fa.valor_referencia = 1 and fa.referencia = 'Clientes') as total
    from clientes c join facturas f on f.valor_referencia = c.id_cliente 
    WHERE ROWNUM <= 10 and f.referencia like 'Clientes' and c.id_negocio = idnegocio 
    and f.fecha_venta_realizada  > ADD_MONTHS(sysdate,  -6) group by c.id_cliente,c.referencia,c.valor_referencia ORDER BY TOTAL DESC;
begin
  msg := 'Los 10 ganadores de los 100 mil colones son = ';
  select t.* into coordinador from PERSONAS t join empleados e on e.id_persona = t.id_persona join parametros p on p.id_parametro = e.id_parametro 
    where p.nombre_rol like 'Coordinador';
  /*SELECT  * into clien FROM (SELECT * FROM negocios n ORDER BY n.id_negocio desc)WHERE rownum <= 10 ORDER BY id_negocio;*/ 
  FOR n IN facturasmejores LOOP
     select * into cliente from clientes c where c.id_cliente = n.id_cliente;
     if(cliente.referencia = 'Personas') then
        select * into persona from personas p where p.id_persona = cliente.valor_referencia;
        msg := concat(msg,'Nombre = ');                                          
        msg := concat(msg,persona.nombre || persona.papellido || crlf);
        msg := concat(msg,'Cedula = ');
        msg := concat(msg,persona.cedula || crlf);
        msg := concat(msg,'Numero de telefono o celular = ');
        msg := concat(msg,persona.telefono || crlf);
     end if;
     if(cliente.referencia = 'Negocios') then
        select * into negocio from negocios ne where ne.id_negocio = cliente.valor_referencia;                   
        msg := concat(msg,'Nombre empresa = ');
        msg := concat(msg,negocio.nombre_negocio || crlf);
        msg := concat(msg,'Correo al cual comunicarse = ');
        msg := concat(msg,negocio.correo_negocio || crlf);
     end if;
       update clientes ce set ce.credito_favor = ce.credito_favor + 100000 where ce.id_cliente = cliente.id_cliente;
       commit;
   END LOOP;
   pcrenviarcorreo(coordinador.email,msg);
end pcrmejoresclientes;

/*por hacer notificar*/
/
