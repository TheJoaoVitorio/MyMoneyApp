unit uAppController;

interface

uses
  uUsuarioVO,uInstanceController, FMX.Dialogs, System.SysUtils,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,IdHashSHA, IdGlobal,System.Hash;

type
    TAppController = class
      private



      public
        procedure Logout(Id: Integer);

        function TesteConenxao: Boolean;

        function GerarHashSHA256(const Senha: string): string;
        function GerarUUID: string;

        function ValidaUsuario(Email , Senha : String) : Boolean;
        function ValidaEmailCadastro(Email: String): Boolean;
        function CadastraUsuario: Boolean;

    end;

var
  iAppController : TAppController;

implementation

{ TAppController }

function TAppController.ValidaUsuario(Email, Senha: String): Boolean;
var
  HashSenhaInserida, HashSenhaUser : String;
  vQuery : TFDQuery;
begin

      vQuery := TFDQuery.Create(nil);

      HashSenhaInserida := GerarHashSHA256(Senha);

      try
          with vQuery do
          begin
              Close;
              Connection := TInstanceController.GetInstance().AcessarConexao.GetConexao;

              SQL.Text   := 'SELECT '+
                              'USUARIOS.ID_USUARIO AS ID, '+
                              'USUARIOS.NOME AS NOME, '+
                              'USUARIOS.EMAIL AS EMAIL, '+
                              'USUARIOS.SENHA AS SENHA, '+
                              'USUARIOS.IS_ACTIVE AS IS_ATIVO '+
                            'FROM USUARIOS ' +
                            'WHERE SENHA = :SENHA';

              ParamByName('SENHA').AsString := HashSenhaInserida;

              Open;

          end;


          if not vQuery.IsEmpty then
            begin
                  iUsuarioVO := TUsuarioVO.Create;
                  iUsuarioVO.Id          := vQuery.FieldByName('ID').AsInteger;
                  iUsuarioVO.NomeUsuario := vQuery.FieldByName('NOME').AsString;
                  iUsuarioVO.IsActive    := vQuery.FieldByName('IS_ATIVO').AsInteger;

                  Result := True
            end
          else
            Result := False


      finally
        if Assigned(vQuery) then
          FreeAndNil(vQuery);

      end;



end;



function TAppController.GerarHashSHA256(const Senha: string): string;
begin
     Result := THashSHA2.GetHashString(Senha);
end;



function TAppController.GerarUUID: string;
var
  GUID: TGUID;         //por enquanto n utilizo
begin
      if CreateGUID(GUID) = 0 then
        Result := GUIDToString(GUID)
      else
        Result := '';
end;



function TAppController.ValidaEmailCadastro(Email : String) : Boolean;
var
  vQuery : TFDQuery;
begin

          vQuery := TFDQuery.Create(nil);

          try
              with vQuery do  //valida se já existe o email
              begin
                  Close;
                  Connection := TInstanceController.GetInstance().AcessarConexao.GetConexao;
                  SQL.Text   := 'SELECT '+
                                  'USUARIOS.EMAIL AS USER_EMAIL '+
                                'FROM '+
                                  'USUARIOS '+
                                'WHERE '+
                                  'USER_EMAIL = :EMAIL';

                      ParamByName('EMAIL').AsString := Email;

                  Open;

                  if vQuery.RecordCount > 0 then  // se for maior que 0, é pq existe
                    Result := True
                  else
                    Result := False;

              end;
          except
          end;

end;



function TAppController.CadastraUsuario : Boolean;
var
  vQuery : TFDQuery;
begin
      Result := False;

      if not ValidaEmailCadastro(iUsuarioVO.Email) then
          try
              vQuery := TFDQuery.Create(nil);

              try
                  with vQuery do
                  begin
                        Close;
                        Connection := TInstanceController.GetInstance().AcessarConexao.GetConexao;

                        SQL.Text   := 'INSERT INTO USUARIOS (NOME,EMAIL,SENHA,IS_ACTIVE)'+
                                             'VALUES (:NOME,:EMAIL,:SENHA,:IS_ACTIVE)';

                        ParamByName('NOME').AsString        := iUsuarioVO.NomeUsuario;
                        ParamByName('EMAIL').AsString       := iUsuarioVO.Email;
                        ParamByName('SENHA').AsString       := iUsuarioVO.Senha;
                        ParamByName('IS_ACTIVE').AsInteger  := 1;

                        ExecSQL;

                  end;


                  Result := True;

              except
                on E:Exception do
                  begin
                        Result := False;
                  end;
              end;


          finally
              if Assigned(vQuery) then
                  vQuery.Free;
          end

      else
        Result := False


end;



procedure TAppController.Logout(Id : Integer);
var
  vQuery : TFDQuery;
begin

      vQuery := TFDQuery.Create(nil);
      try
          with vQuery do
          begin
                Close;
                Connection := TInstanceController.GetInstance().AcessarConexao.GetConexao;

                SQL.Text   := 'UPDATE USUARIO '+
                              'SET IS_ACTIVE = 0'+
                              'WHERE ID_USUARIO = :ID';

                ParamByName('ID').AsInteger := Id;

                ExecSQL;
          end;



      finally
          if Assigned(vQuery) then
            FreeAndNil(vQuery);
      end;


end;



function TAppController.TesteConenxao : Boolean;
begin

      TInstanceController.GetInstance().AcessarConexao.ConfiguraConexao;

end;


end.
