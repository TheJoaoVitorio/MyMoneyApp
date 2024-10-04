unit uHome.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFHome = class(TForm)
    lyHeaderHome: TLayout;
    imgMenuHeaderHome: TImage;
    crImgPerfilHeaderHome: TCircle;
    Label1: TLabel;
    lySaldoConta: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    lyGastos: TLayout;
    lyGastosDespesas: TLayout;
    Image1: TImage;
    Layout3: TLayout;
    lblValorDespesas: TLabel;
    Label5: TLabel;
    lyGastosReceitas: TLayout;
    Image2: TImage;
    Layout2: TLayout;
    lblValorReceitas: TLabel;
    Label6: TLabel;
    lyNavbar: TLayout;
    rtBtnHomeAcao: TRectangle;
    imgBtnAcao: TImage;
    rtContainer: TRectangle;
    Rectangle2: TRectangle;
    lyHeaderContainer: TLayout;
    Label4: TLabel;
    lblVerTodos: TLabel;
    lvLancamento: TListView;
    procedure FormShow(Sender: TObject);
  private
    procedure AddLancamento(ID_LANCAMENTO,DESCRICAO, CATEGORIA : String; VALOR : Double; FOTO: TStream;DT :TDateTime );

  public

  end;

var
  FHome: TFHome;

implementation

{$R *.fmx}

procedure TFHome.FormShow(Sender: TObject);
var
  foto : TStream;
begin
      foto := nil;
      AddLancamento('1','COMPRA','TRANSPORTE', -45,foto,20/08);
end;




procedure TFHome.AddLancamento(ID_LANCAMENTO,DESCRICAO, CATEGORIA : String; VALOR : Double; FOTO: TStream;DT :TDateTime );
var
  txt : TListItemText;
  img : TListItemImage;
  bmp : TBitmap;
begin
     with lvLancamento.Items.Add do
        begin
            txt      := TListItemText(Objects.FindDrawable('txtDESCRICAO'));
            txt.Text := DESCRICAO;

            TListItemText(Objects.FindDrawable('txtCATEGORIA')).Text        := CATEGORIA;
            TListItemText(Objects.FindDrawable('txtVALOR')).Text            := FormatFloat('#,##0.00',VALOR);
            TListItemText(Objects.FindDrawable('txtDATA')).Text             := FormatDateTime('dd//mm',DT);
            img := TListItemImage(Objects.FindDrawable('imgICONE'));

            if foto <> nil then
              begin
                    bmp := TBitmap.Create;
                    bmp.LoadFromStream(foto);

                    img.OwnsBitmap := True; //usa-se quando estiver instanciando o bitmap
                    img.Bitmap     := bmp;
              end;
        end;

end;

end.
