create or replace procedure prc_enviarcorreo(correo in varchar2,msg in varchar2) is
begin
    sys.prc_correos(correo,msg);
    
end prc_enviarcorreo;
/
