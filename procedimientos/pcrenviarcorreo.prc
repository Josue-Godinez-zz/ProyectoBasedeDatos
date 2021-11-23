create or replace procedure pcrenviarcorreo(correo in varchar2,msg in varchar2) is
begin
    sys.prc_correos(correo,msg);
    
end pcrenviarcorreo;
/
