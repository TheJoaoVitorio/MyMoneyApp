program MyMoneyApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uLogin.View in 'view\uLogin.View.pas' {FLogin},
  uHome.View in 'view\uHome.View.pas' {FHome},
  u99Permissions in 'commons\u99Permissions.pas',
  uUsuarioVO in 'VO\uUsuarioVO.pas',
  uAppController in 'controller\uAppController.pas',
  uConexao in 'connection\uConexao.pas',
  uInstanceController in 'controller\uInstanceController.pas',
  uLancamentos.view in 'view\uLancamentos.view.pas' {FLancamento},
  uCadLancamentos.view in 'view\uCadLancamentos.view.pas' {FCadLancamentos};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFLancamento, FLancamento);
  Application.CreateForm(TFCadLancamentos, FCadLancamentos);
  Application.Run;
end.
