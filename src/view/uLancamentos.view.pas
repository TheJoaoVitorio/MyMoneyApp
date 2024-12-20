unit uLancamentos.view;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, uCadLancamentos.view;

type
  TFLancamento = class(TForm)
    lyListaMeses: TLayout;
    lyNavbarBottom: TLayout;
    lyHeader: TLayout;
    Image1: TImage;
    Label1: TLabel;
    imgVoltarMesLancamento: TImage;
    imgAvancarMesLancamento: TImage;
    RoundRect1: TRoundRect;
    lblMesLancamento: TLabel;
    rtNavbarBottom: TRectangle;
    lyBtnNavbarBottom: TLayout;
    rtBtnHomeAcao: TRectangle;
    imgBtnAcao: TImage;
    lyNavbarBottomContainer: TLayout;
    Layout3: TLayout;
    lblValorDespesas: TLabel;
    Label5: TLabel;
    Layout2: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Layout4: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    lvLancamento: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure EditarLancamento(IdLancamento: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancamento: TFLancamento;

implementation

uses
  uHome.View;

{$R *.fmx}

procedure TFLancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := TCloseAction.caFree;
      FLancamento := nil;
end;

procedure TFLancamento.FormShow(Sender: TObject);
begin
      FHome.AddLancamento(lvLancamento,'1','COMPRA','TRANSPORTE', -45,nil,20/08);
      FHome.AddLancamento(lvLancamento,'2','HAMBURGUER','TRANSPORTE', -10,nil,20/08);
end;

procedure TFLancamento.EditarLancamento( IdLancamento : String );
begin

      if not Assigned(FCadLancamentos) then
        Application.CreateForm(TFCadLancamentos, FCadLancamentos);

      FCadLancamentos.Show;
end;

procedure TFLancamento.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
      FHome.SetupLancamento(FLancamento.lvLancamento,AItem);
end;

end.
