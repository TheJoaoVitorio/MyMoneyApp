unit uInstanceController;

interface

uses
  uConexao, System.SysUtils;

type
  TInstanceController = class
    private
      fConexao: TConexao;
      class var iInstance : TInstanceController;

      constructor Create;
      destructor Destroy; override;
    public
      class function GetInstance : TInstanceController;

      property AcessarConexao : TConexao read fConexao write fConexao;
  end;

implementation

{ TInstanceController }

constructor TInstanceController.Create;
begin
      inherited Create;
      fConexao := TConexao.Create;
end;

destructor TInstanceController.Destroy;
begin
      FreeAndNil(fConexao);
      inherited;
end;

class function TInstanceController.GetInstance: TInstanceController;
begin
      if iInstance = nil then
          iInstance := TInstanceController.Create;

      Result := iInstance
end;

//initialization

//finalization
//  if iInstance <> nil then
//    iInstance.Free;

end.
