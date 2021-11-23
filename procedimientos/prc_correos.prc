create or replace noneditionable procedure prc_correos(correo in varchar2, cuerpo in varchar2) is
connection utl_smtp.connection;
mail_host varchar2(100) := 'smtp.gmail.com';
mail_port number := 587;
begin
  connection := utl_smtp.open_connection(host => mail_host,
                                         port => mail_port,
                                         wallet_path => 'file:C:\wallet',
                                         wallet_password => 'pass1234',
                                         secure_connection_before_smtp => false);
  utl_smtp.ehlo(connection, mail_host);
  utl_smtp.starttls(connection);
  utl_smtp.command(connection, 'auth login');
  utl_smtp.command(connection, 'ZW1wcmVzYXJpYWxzZWd1cmlkYWQxNkBnbWFpbC5jb20=');
  utl_smtp.command(connection, 'ZW1wcmVzYXJpYWwxMjM=');
  utl_smtp.mail(connection, 'empresarialseguridad16@gmail.com');
  utl_smtp.rcpt(connection, correo);
  utl_smtp.data(connection, cuerpo || UTL_TCP.crlf || UTL_TCP.crlf);
  utl_smtp.quit(connection);
end prc_correos;
/
