create or replace procedure prc_notificacion01(idcliente in clientes.id_cliente%type) is
  montodebido number;
  msg varchar2(9000); 
  negocioEnvia negocios%rowtype;
  cliente clientes%rowtype;
  persona personas%rowtype;
  negocio negocios%rowtype;
  crlf varchar2(2) := UTL_TCP.CRLF;
  CURSOR detalles is
         select fa.* from facturasporpagar fa join facturas f on f.id_factura = fa.id_factura where fa.estado like 'A' and f.valor_referencia = idcliente;
begin
   montodebido := 0;
   select c.* into cliente from clientes c where c.id_negocio = idcliente;
   select n.* into negocioEnvia from negocios n where n.id_negocio = cliente.id_negocio;
   if(cliente.referencia = 'Personas')then
          select p.* into persona from personas p where p.id_persona = cliente.valor_referencia;
   else
          select n.* into negocio from negocios n where n.id_negocio = cliente.valor_referencia;
   end if;
   FOR n IN detalles LOOP
     montodebido := montodebido + n.monto_total;
   end loop;
   msg:='';
   if((cliente.credito_maximo*0.85) <= montodebido)then
      msg:= 'De parte de ';
      msg:= concat(msg,negocioEnvia.Nombre_Negocio || crlf);                              
      msg:= 'Se le informa que ya cuenta con un 85% o mas de su credito disponible.';
      if(cliente.referencia = 'Personas')then
           sys.prc_correos(persona.email,msg);
      else
           sys.prc_correos(negocio.correo_negocio,msg);      
      end if;
   end if;           
end prc_notificacion01;
/
