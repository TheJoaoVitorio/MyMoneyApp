program MyMoneyApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uLogin.View in 'view\uLogin.View.pas' {FLogin},
  uHome.View in 'view\uHome.View.pas' {FHome},
  u99Permissions in 'commons\u99Permissions.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFHome, FHome);
  Application.Run;
end.
