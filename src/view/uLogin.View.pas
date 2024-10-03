unit uLogin.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, System.Skia, FMX.Skia, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl;

type
  TForm4 = class(TForm)
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabCriarConta: TTabItem;
    lyCriarConta: TLayout;
    Layout2: TLayout;
    SkAnimatedImage1: TSkAnimatedImage;
    Layout3: TLayout;
    lyNomeCadastroLogin: TLayout;
    RoundRect1: TRoundRect;
    edtNomeLogin: TEdit;
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
    RoundRect3: TRoundRect;
    lblBtnCadastroLogin: TLabel;
    TabFotoCadastro: TTabItem;
    lyAddFotoCadastro: TLayout;
    RoundRect7: TRoundRect;
    SkAnimatedImage3: TSkAnimatedImage;
    lblTextoFoto: TLabel;
    Layout1: TLayout;
    Layout4: TLayout;
    RoundRect8: TRoundRect;
    Label1: TLabel;
    TabItem1: TTabItem;
    lyEscolherFoto: TLayout;
    lblTituloEscolherFoto: TLabel;
    lyTirarFoto: TLayout;
    lyEscolherFotoGaleria: TLayout;
    imgTirarFoto: TImage;
    imgEscolherFoto: TImage;
    lyContainerEscolherFoto: TLayout;
    Layout5: TLayout;
    Image1: TImage;
    procedure rrBtnEntrarLoginMouseEnter(Sender: TObject);
    procedure rrBtnEntrarLoginMouseLeave(Sender: TObject);
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

procedure TForm4.rrBtnEntrarLoginMouseEnter(Sender: TObject);
begin
    rrBtnEntrarLogin.Fill.Color := COLOR_BTN;
end;

procedure TForm4.rrBtnEntrarLoginMouseLeave(Sender: TObject);
begin
      rrBtnEntrarLogin.Fill.Color := COLOR_HOVER_BTN;
end;

end.
