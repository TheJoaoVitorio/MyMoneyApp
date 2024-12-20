unit uHome.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, uLancamentos.view;

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
    Layout1: TLayout;
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure lvLancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure rtBtnHomeAcaoMouseEnter(Sender: TObject);
    procedure rtBtnHomeAcaoMouseLeave(Sender: TObject);
    procedure lvLancamentoItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure lblVerTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private



  public
      procedure SetupLancamento(ListView: TListView; Item : TListViewItem);
      procedure AddLancamento(ListView : TListView;ID_LANCAMENTO,DESCRICAO, CATEGORIA : String; VALOR : Double; FOTO: TStream;DT :TDateTime );
  end;

var
  FHome: TFHome;

implementation

{$R *.fmx}

procedure TFHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if Assigned(FLancamento) then
        begin
              FLancamento.DisposeOf;
              FLancamento := nil;
        end;
end;

procedure TFHome.FormShow(Sender: TObject);
var
  foto : TStream;
begin
      foto := nil;

      AddLancamento(lvLancamento,'1','COMPRA','TRANSPORTE', -45,foto,20/08);
      AddLancamento(lvLancamento,'2','HAMBURGUER','TRANSPORTE', -10,foto,20/08);
end;




procedure TFHome.lblVerTodosClick(Sender: TObject);
begin
      if not Assigned(FLancamento) then
        Application.CreateForm(TFLancamento,FLancamento);

      FLancamento.Show;

end;

procedure TFHome.lvLancamentoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin

//      if TListView(Sender) .Selected <> nil then
//        begin
//              if ItemObject is TListItemImage then
//                begin
//                      ///......
//
//                end;
//
//        end;

end;

procedure TFHome.lvLancamentoPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
//      if lvLancamento.Items.Count > 0 then
//          if lvLancamento.GetItemRect( lvLancamento.Items.Count - 4 ).Bottom <= lvLancamento.Height then
//              begin
//                    AddLancamento('003','Supermercado','Transporte',-30,nil,09/10);
//                    AddLancamento('004','Supermercado','Transporte',-30,nil,09/10);
//                    AddLancamento('005','Supermercado','Transporte',-30,nil,09/10);
//                    AddLancamento('006','Supermercado','Transporte',-30,nil,09/10);
//                    AddLancamento('007','Supermercado','Transporte',-30,nil,09/10);
//              end;
end;




procedure TFHome.rtBtnHomeAcaoMouseEnter(Sender: TObject);
begin
      rtBtnHomeAcao.Fill.Color := $FF7168FE;
end;



procedure TFHome.rtBtnHomeAcaoMouseLeave(Sender: TObject);
begin
      rtBtnHomeAcao.Fill.Color := $FF5A4FFF;
end;



procedure TFHome.AddLancamento(ListView : TListView;
                               ID_LANCAMENTO,
                               DESCRICAO,
                               CATEGORIA : String;
                               VALOR : Double;
                               FOTO: TStream;
                               DT :TDateTime );
var
  txt : TListItemText;
  img : TListItemImage;
  bmp : TBitmap;
begin
     with ListView.Items.Add do
        begin
            TagString := ID_LANCAMENTO;
            txt       := TListItemText(Objects.FindDrawable('txtDESCRICAO'));
            txt.Text  := DESCRICAO;


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


procedure TFHome.SetupLancamento(ListView: TListView; Item : TListViewItem);
var
  txt : TListItemText;
  img : TListItemImage;
begin
      txt       := TListItemText(Item.Objects.FindDrawable('txtDESCRICAO'));

      txt.Width := ListView.Width - txt.PlaceOffset.X - 100;

      img       := TListItemImage(Item.Objects.FindDrawable('imgICONE'));

      if ListView.Width < 250 then
        begin
              img.Visible       := False;
              txt.PlaceOffset.X := 2;
        end
end;



procedure TFHome.lvLancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
      SetupLancamento(FHome.lvLancamento,AItem);
end;

end.
