unit uCadLancamentos.view;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls;

type
  TFCadLancamentos = class(TForm)
    lyHeader: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    lyNavbar: TLayout;
    Rectangle2: TRectangle;
    rtBtnHomeAcao: TRectangle;
    imgBtnAcao: TImage;
    lyMain: TLayout;
    lyDescricao: TLayout;
    Label2: TLabel;
    Layout2: TLayout;
    RoundRect4: TRoundRect;
    edtDescricaoDespesa: TEdit;
    lyCategoria: TLayout;
    Layout4: TLayout;
    Label3: TLabel;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    lyValor: TLayout;
    Layout6: TLayout;
    Label4: TLabel;
    RoundRect2: TRoundRect;
    Edit2: TEdit;
    lyData: TLayout;
    lyDataContent: TLayout;
    Label5: TLabel;
    rrDataHoje: TRoundRect;
    rrDataOntem: TRoundRect;
    lblDataHoje: TLabel;
    lblDataOntem: TLabel;
    DateEdit1: TDateEdit;
    StyleBook1: TStyleBook;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadLancamentos: TFCadLancamentos;

implementation

{$R *.fmx}

end.
