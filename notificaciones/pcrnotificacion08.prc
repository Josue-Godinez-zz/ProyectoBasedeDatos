create or replace procedure pcrnotificacion08(msg out varchar2) is
cursor invalidos is
    SELECT OWNER, OBJECT_NAME, OBJECT_TYPE
    FROM DBA_OBJECTS
    WHERE OWNER NOT IN ('SYS','SYSTEM') AND STATUS = 'INVALID'
    ORDER BY OWNER,OBJECT_TYPE,OBJECT_NAME;
begin
  msg :='';
  FOR n IN invalidos LOOP
    msg:=concat(msg,'Objetos invalidos');
    msg := concat(msg, n.object_type);
    msg:=concat(msg,'--');
    msg := concat(msg, n.object_name);
  end loop;
end pcrnotificacion08;
/
