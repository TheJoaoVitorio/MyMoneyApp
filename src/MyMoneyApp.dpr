program MyMoneyApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin.View in 'view\uLogin.View.pas' {Form4},
  u99Permissions in 'commons\u99Permissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
