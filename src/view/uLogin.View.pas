unit uLogin.View;

interface

uses
  u99Permissions,

  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants,FMX.Types,
  FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs,FMX.Layouts, System.Skia,
  FMX.Skia, FMX.Objects,FMX.Controls.Presentation,
  FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.MediaLibrary.Actions,


  {$IFDEF ANDROID}
  FMX.VirtualKeyboard,FMX.Platform,
  {$ENDIF}
  FMX.StdActns, uAppController, uUsuarioVO;

type
  TFLogin = class(TForm)
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabCriarConta: TTabItem;
    lyCriarConta: TLayout;
    lyCabecalho: TLayout;
    SkAnimatedImage1: TSkAnimatedImage;
    lyFormCriarConta: TLayout;
    lyNomeCadastroLogin: TLayout;
    RoundRect1: TRoundRect;
    edtNomeCadastroLogin: TEdit;
    lySenhaCadastroLogin: TLayout;
    RoundRect2: TRoundRect;
    edtSenhaCadastroLogin: TEdit;
    lyLogin: TLayout;
    lyLottieLogin: TLayout;
    SkAnimatedImage2: TSkAnimatedImage;
    lyFormLogin: TLayout;
    lyFormEntrarEmail: TLayout;
    RoundRect4: TRoundRect;
    edtEmailLogin: TEdit;
    lyFormSenhaLogin: TLayout;
    RoundRect5: TRoundRect;
    edtSenhaLogin: TEdit;
    lyBtnEntrarLogin: TLayout;
    rrBtnEntrarLogin: TRoundRect;
    lblEntrarLogin: TLabel;
    lyEmailCadastroLogin: TLayout;
    RoundRect6: TRoundRect;
    edtEmailCadastroLogin: TEdit;
    lyBtnCadastroLogin: TLayout;
    rrBtnCriarConta: TRoundRect;
    lblBtnCadastroLogin: TLabel;
    TabFotoCadastro: TTabItem;
    lyAddFotoCadastro: TLayout;
    RoundRect7: TRoundRect;
    SkAnimatedImage3: TSkAnimatedImage;
    lblTextoFoto: TLabel;
    Layout1: TLayout;
    Layout4: TLayout;
    rrBtnProximoFotoCadastro: TRoundRect;
    Label1: TLabel;
    TabEscolherFoto: TTabItem;
    lyEscolherFoto: TLayout;
    lblTituloEscolherFoto: TLabel;
    lyTirarFoto: TLayout;
    lyEscolherFotoGaleria: TLayout;
    imgTirarFoto: TImage;
    imgEscolherFoto: TImage;
    lyContainerEscolherFoto: TLayout;
    lyHeader: TLayout;
    Image1: TImage;
    lyFooter: TLayout;
    lyFooterContent: TLayout;
    lblLogin: TLabel;
    lblCriarConta: TLabel;
    ActionList1: TActionList;
    ActEscolher: TChangeTabAction;
    ActFoto: TChangeTabAction;
    ActLogin: TChangeTabAction;
    ActCriarConta: TChangeTabAction;
    RoundRect9: TRoundRect;
    lyFooterCriarConta: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    RoundRect10: TRoundRect;
    Layout2: TLayout;
    Image2: TImage;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActCamera: TTakePhotoFromCameraAction;
    TabVerPreviewPerfil: TTabItem;
    lyTexto: TLayout;
    lyHeaderPreviewFoto: TLayout;
    Image3: TImage;
    lyBtnCriarContaPreviewFoto: TLayout;
    RoundRect3: TRoundRect;
    lbCriarContaPreviewFoto: TLabel;
    lyPreviewFoto: TLayout;
    rrPreviewFoto: TRoundRect;
    SkAnimatedImage4: TSkAnimatedImage;
    lblPreviewNome: TLabel;
    lblPreviewEmail: TLabel;
    ActPreviewFoto: TChangeTabAction;
    lyBtnNaoTemFoto: TLayout;
    rrPularAcao: TRoundRect;
    lblPular: TLabel;
    procedure rrBtnEntrarLoginMouseEnter(Sender: TObject);
    procedure rrBtnEntrarLoginMouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure rrBtnProximoFotoCadastroClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure rrBtnEntrarLoginClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure rrBtnCriarContaMouseEnter(Sender: TObject);
    procedure rrBtnCriarContaMouseLeave(Sender: TObject);
    procedure rrBtnProximoFotoCadastroMouseEnter(Sender: TObject);
    procedure rrBtnProximoFotoCadastroMouseLeave(Sender: TObject);
    procedure rrBtnCriarContaClick(Sender: TObject);
    procedure lblCriarContaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgTirarFotoClick(Sender: TObject);
    procedure imgEscolherFotoClick(Sender: TObject);
    procedure ActLibraryDidFinishTaking(Image: TBitmap);
    procedure ActCameraDidFinishTaking(Image: TBitmap);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabControl1Change(Sender: TObject);
    procedure rrPularAcaoClick(Sender: TObject);
  private
    FOTO_PERFIL     : TImage;
    COLOR_BTN       : TAlphaColor;
    COLOR_HOVER_BTN : TAlphaColor;

    PERMISSAO : T99Permissions;
    procedure TratarErroPermissao(Sender: TObject);
    procedure IrParaHome;
  public
    constructor Create(AOwner : TComponent);override;
  end;

var
  FLogin: TFLogin;

implementation

uses
  uHome.View;

{$R *.fmx}


constructor TFLogin.Create(AOwner: TComponent);
begin
      inherited Create(AOwner);
      COLOR_BTN       := $FF5A4FFF;
      COLOR_HOVER_BTN := $FF7168FE;

      PERMISSAO       := T99Permissions.Create;
      FOTO_PERFIL     := TImage.Create(nil);

      if not Assigned(iAppController) then
        iAppController := TAppController.Create;

      if not iAppController.TesteConenxao then
        ShowMessage('Desconectado');



end;


procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := TCloseAction.caFree;
      FLogin := nil;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
      PERMISSAO.DisposeOf;
end;


procedure TFLogin.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
{$IFDEF ANDROID}
var
  FService : IFMXVirtualKeyboardService;
{$ENDIF}
begin

        {$IFDEF ANDROID}
        if (Key = vkHardwareBack) then
          begin
                TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                                  IInterface(FService));
                if (FService <> nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
                  begin

                  end
                else
                  begin
                          //botao back pressionado e teclado N�O VISIVEL...
                        if TabControl1.ActiveTab = TabCriarConta then
                          begin
                                Key := 0;
                                ActLogin.Execute
                          end
                        else if TabControl1.ActiveTab = TabFotoCadastro then
                          begin
                                Key := 0;
                                ActCriarConta.Execute
                          end
                        else if TabControl1.ActiveTab = TabEscolherFoto then
                          begin
                                Key := 0;
                                ActEscolher.Execute;
                          end;

                  end;

          end;
         {$ENDIF}



end;

procedure TFLogin.TabControl1Change(Sender: TObject);
begin
      if TabControl1.ActiveTab = TabVerPreviewPerfil then
      begin
            lblPreviewNome.Text   := iUsuarioVO.NomeUsuario;
            lblPreviewEmail.Text  := iUsuarioVO.Email;
      end;

end;

procedure TFLogin.TratarErroPermissao(Sender: TObject);
begin
      ShowMessage('Voc� n�o possui permiss�o de acesso para esse recurso!');
end;







procedure TFLogin.rrBtnEntrarLoginClick(Sender: TObject);
begin

      if (edtEmailLogin.Text = '') or (edtSenhaLogin.Text = '' ) then
        begin
            ShowMessage('Preencha os campos!');
            Exit;
        end

      else
        begin

            if iAppController.ValidaUsuario(edtEmailLogin.Text, edtSenhaLogin.Text) then
              IrParaHome
            else
              begin
                  Exit;
              end;

        end;

end;


procedure TFLogin.IrParaHome;
begin

    try
        if Assigned(FHome) then
        begin
            FreeAndNil(FHome);
        end;
        Application.CreateForm(TFHome, FHome);
        Application.MainForm := FHome;
        FHome.Show;
    finally
        Self.Close;
    end;

end;


procedure TFLogin.ActCameraDidFinishTaking(Image: TBitmap);
begin
      rrPreviewFoto.Fill.Bitmap.Bitmap := Image;
      ActPreviewFoto.Execute;
end;

procedure TFLogin.ActLibraryDidFinishTaking(Image: TBitmap);
begin
      rrPreviewFoto.Fill.Bitmap.Bitmap := Image;
      ActPreviewFoto.Execute;
end;


procedure TFLogin.Image1Click(Sender: TObject);
begin
      ActFoto.Execute;
end;

procedure TFLogin.Image2Click(Sender: TObject);
begin
      ActLogin.Execute;
end;


procedure TFLogin.imgEscolherFotoClick(Sender: TObject);
begin
      PERMISSAO.PhotoLibrary(ActLibrary, TratarErroPermissao);
end;

procedure TFLogin.imgTirarFotoClick(Sender: TObject);
begin
      PERMISSAO.Camera(ActCamera, TratarErroPermissao );
end;

procedure TFLogin.Label2Click(Sender: TObject);
begin
      ActLogin.Execute;
end;

procedure TFLogin.lblCriarContaClick(Sender: TObject);
begin
      ActCriarConta.Execute;
end;

procedure TFLogin.rrBtnProximoFotoCadastroClick(Sender: TObject);
begin
      //ActEscolher.Execute;
      IrParaHome;
end;



procedure TFLogin.rrBtnProximoFotoCadastroMouseEnter(Sender: TObject);
begin
      rrBtnProximoFotoCadastro.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TFLogin.rrBtnProximoFotoCadastroMouseLeave(Sender: TObject);
begin
      rrBtnProximoFotoCadastro.Fill.Color := COLOR_BTN;
end;




procedure TFLogin.rrPularAcaoClick(Sender: TObject);
begin
      IrParaHome;
end;

procedure TFLogin.rrBtnCriarContaClick(Sender: TObject);
begin
    if (edtNomeCadastroLogin.Text <> '') and (edtEmailCadastroLogin.Text <> '' ) and (edtSenhaCadastroLogin.Text <> '') then
        ActFoto.Execute;
end;

procedure TFLogin.rrBtnCriarContaMouseEnter(Sender: TObject);
begin
      rrBtnCriarConta.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TFLogin.rrBtnCriarContaMouseLeave(Sender: TObject);
begin
      rrBtnCriarConta.Fill.Color := COLOR_BTN;
end;




procedure TFLogin.rrBtnEntrarLoginMouseEnter(Sender: TObject);
begin
      rrBtnEntrarLogin.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TFLogin.rrBtnEntrarLoginMouseLeave(Sender: TObject);
begin
      rrBtnEntrarLogin.Fill.Color := COLOR_BTN;
end;





end.
