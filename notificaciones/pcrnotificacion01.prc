create or replace procedure pcrnotificacion01(idcliente in clientes.id_cliente%type, msg out varchar2) is
  montodebido number;
  cliente clientes%rowtype;
  CURSOR detalles is
         select fa.* from facturasporpagar fa join facturas f on f.id_factura = fa.id_factura where fa.estado like 'A' and f.valor_referencia = idcliente;
begin
   montodebido := 0;
   select c.* into cliente from clientes c where c.id_cliente = idcliente;
   FOR n IN detalles LOOP
     montodebido := montodebido + n.monto_total;
   end loop;
   msg:='aun puede comprar mas';
   if((cliente.credito_maximo*0.85) <= montodebido)then
                                    msg:= '85% o mas';
   end if;           
end pcrnotificacion01;
/
