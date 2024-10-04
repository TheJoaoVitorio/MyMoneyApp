unit uLogin.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, System.Skia, FMX.Skia, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList;

type
  TForm4 = class(TForm)
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
  private
    COLOR_BTN       : TAlphaColor;
    COLOR_HOVER_BTN : TAlphaColor;
  public
    constructor Create(AOwner : TComponent);override;
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

constructor TForm4.Create(AOwner: TComponent);
begin
      inherited Create(AOwner);
      COLOR_BTN       := $FF5A4FFF;
      COLOR_HOVER_BTN := $FF7168FE;

end;







procedure TForm4.rrBtnEntrarLoginClick(Sender: TObject);
begin
      if (edtEmailLogin.Text <> '') and (edtSenhaLogin.Text <> '' ) then
        ActFoto.Execute;
end;





procedure TForm4.Image1Click(Sender: TObject);
begin
      ActFoto.Execute;
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
      ActLogin.Execute;
end;

procedure TForm4.Label2Click(Sender: TObject);
begin
      ActLogin.Execute;
end;

procedure TForm4.lblCriarContaClick(Sender: TObject);
begin
      ActCriarConta.Execute;
end;

procedure TForm4.rrBtnProximoFotoCadastroClick(Sender: TObject);
begin
      ActEscolher.Execute;
end;



procedure TForm4.rrBtnProximoFotoCadastroMouseEnter(Sender: TObject);
begin
      rrBtnProximoFotoCadastro.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TForm4.rrBtnProximoFotoCadastroMouseLeave(Sender: TObject);
begin
      rrBtnProximoFotoCadastro.Fill.Color := COLOR_BTN;
end;




procedure TForm4.rrBtnCriarContaClick(Sender: TObject);
begin
    if (edtNomeCadastroLogin.Text <> '') and (edtEmailCadastroLogin.Text <> '' ) and (edtSenhaCadastroLogin.Text <> '') then
        ActFoto.Execute;
end;

procedure TForm4.rrBtnCriarContaMouseEnter(Sender: TObject);
begin
      rrBtnCriarConta.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TForm4.rrBtnCriarContaMouseLeave(Sender: TObject);
begin
      rrBtnCriarConta.Fill.Color := COLOR_BTN;
end;




procedure TForm4.rrBtnEntrarLoginMouseEnter(Sender: TObject);
begin
      rrBtnEntrarLogin.Fill.Color := COLOR_HOVER_BTN;
end;

procedure TForm4.rrBtnEntrarLoginMouseLeave(Sender: TObject);
begin
      rrBtnEntrarLogin.Fill.Color := COLOR_BTN;
end;





end.
