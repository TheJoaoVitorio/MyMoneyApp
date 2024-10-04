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
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHome: TFHome;

implementation

{$R *.fmx}

end.
