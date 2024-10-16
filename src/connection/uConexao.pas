unit uConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,System.IOUtils,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Comp.UI,
  System.SysUtils, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.DataSet,
  System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite;

type
  TConexao = class
    private
      FConexao       : TFDConnection;
      FQuery         : TFDQuery;
      FSqlDriverLink : TFDPhysSQLiteDriverLink;
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

      if not Assigned(FSqlDriverLink) then
          FSqlDriverLink := TFDPhysSQLiteDriverLink.Create(nil);

      if not Assigned(FQuery) then
          FQuery   := TFDQuery.Create(nil);

end;

procedure TConexao.BeforeDestruction;
begin
      if Assigned(FConexao) then
          FreeAndNil(FConexao);

      if Assigned(FQuery) then
          FreeAndNil(FQuery);

      if Assigned(FSqlDriverLink) then
          FreeAndNil(FSqlDriverLink);
end;

procedure TConexao.ConfiguraConexao;
begin

      with FConexao do
        begin
              Params.UserName := 'root';
              Params.Password := '';
              Params.DriverID := 'SQLITE';
              LoginPrompt     := False;
        end;

        {$IFDEF ANDROID}
          try
            FConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'database.db');
            //FConexao.Params.Values['Database'] := GetHomePath + PathDeLim + 'database.db';
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
            FConexao.Params.Database := 'C:\Users\joaov\OneDrive\Desktop\MyMoney2\src\database\database.db';
            FConexao.Connected := True;
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
      ConfiguraConexao;

      Result := FConexao;
end;

function TConexao.QueryConexao: TFDQuery;
begin
      FQuery.Connection := FConexao;
      Result := FQuery;
end;

end.
