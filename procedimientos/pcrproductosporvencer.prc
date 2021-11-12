create or replace procedure pcrproductosporvencer(listaXsemana out varchar2, listaXbodega out varchar2) is
 
 CURSOR productosMeses is
        select p.* from lotes p where p.fecha_registro < ADD_MONTHS(sysdate,  -6) and p.estado_ubicacion like 'B'; 
 CURSOR productosSemana is                                     
        select p.* from lotes p where p.fecha_caduca < sysdate + 8 and p.fecha_caduca > sysdate;  
begin
  listaXsemana := 'Productos proximo a vencer -> ';
  listaXbodega := 'Productos con mas de 6 meses en bodega -> ';
  FOR n IN productosMeses LOOP
      listaXbodega := concat(listaXbodega, n.id_lote); 
  end loop;
  
  FOR n IN productosSemana LOOP
      listaXsemana := concat(listaXbodega, n.id_lote);
  end loop;  
end pcrproductosporvencer;
/
