program MyMoneyApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin.View in 'view\uLogin.View.pas' {FLogin},
  u99Permissions in 'commons\u99Permissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
