unit uConexao;

interface

uses
  FireDAC.Comp.Client, System.SysUtils , Vcl.Dialogs;

type
  TConexao = class
    private
      FConexao : TFDConnection;
      FQuery   : TFDQuery;
    public
      procedure AfterConstruction ; override;
      procedure BeforeDestruction ; override;
      procedure ConfiguraConexao;

      function GetConexao: TFDConnection;
      function QueryConexao: TFDQuery;

  end;

implementation

{ TConexao }

procedure TConexao.AfterConstruction;
begin
      if not Assigned(FConexao) then
        begin
          FConexao := TFDConnection.Create(nil);

          ConfiguraConexao;
        end;

      if not Assigned(FQuery) then
          FQuery   := TFDQuery.Create(nil);

end;

procedure TConexao.BeforeDestruction;
begin
      if Assigned(FConexao) then
          FreeAndNil(FConexao);

      if Assigned(FQuery) then
          FreeAndNil(FQuery);
end;

procedure TConexao.ConfiguraConexao;
begin

      with FConexao do
        begin
              Params.UserName := 'root';
              Params.Password := '';
              Params.DriverID := 'SQLITE';
        end;

        {$IFDEF ANDROID}
            try
              FConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.sql');
              FConexao.Params.Values['Database'] := GetHomePath + PathDeLim + 'database.sql';
              FConexao.Connected := True;
            except
              on E : Exception do
                begin
                  raise Exception.Create('Erro ao conectar ao banco de dados.');
                end;
            end;
        {$ENDIF}


        {$IFDEF MSWINDOWS}
          try
            FConexao.Params.Database := 'C:\Users\joaov\OneDrive\Desktop\MyMoney\MyMoneyApp\MyMoneyApp\src\database\database.sql';
          except
            on E: Exception do
              begin
                raise Exception.Create('Erro ao conectar ao banco de dados.');
              end;
          end;
        {$ENDIF}


end;

function TConexao.GetConexao: TFDConnection;
begin

end;

function TConexao.QueryConexao: TFDQuery;
begin

end;

end.
