unit uLancamentos.view;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, uCadLancamentos.view, System.Skia, FMX.Skia;

type
  TFLancamento = class(TForm)
    lyListaMeses: TLayout;
    lyNavbarBottom: TLayout;
    lyHeader: TLayout;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    rtNavbarBottom: TRectangle;
    lyBtnNavbarBottom: TLayout;
    rtBtnHomeAcao: TRectangle;
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
    rtHeader: TRectangle;
    SkSvg1: TSkSvg;
    SkSvg3: TSkSvg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure rtBtnHomeAcaoClick(Sender: TObject);
    procedure lvLancamentoItemClick(const Sender: TObject;
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

procedure TFLancamento.lvLancamentoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
      EditarLancamento(''); // AQUI DEVE PASSA O ID DO ITEM
end;

procedure TFLancamento.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
      FHome.SetupLancamento(FLancamento.lvLancamento,AItem);
end;

procedure TFLancamento.rtBtnHomeAcaoClick(Sender: TObject);
begin
      EditarLancamento('');
end;

end.
