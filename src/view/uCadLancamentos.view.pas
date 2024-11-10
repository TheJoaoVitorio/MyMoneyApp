unit uCadLancamentos.view;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls, System.Skia, FMX.Skia;

type
  TFCadLancamentos = class(TForm)
    lyHeader: TLayout;
    Label1: TLabel;
    lyNavbar: TLayout;
    Rectangle2: TRectangle;
    rtBtnHomeAcao: TRectangle;
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
    SkSvg1: TSkSvg;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
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
