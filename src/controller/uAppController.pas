unit uAppController;

interface

uses
  uUsuarioVO,uInstanceController, FMX.Dialogs, System.SysUtils,
  FireDAC.Comp.Client,IdHashSHA, IdGlobal,System.Hash;

type
    TAppController = class
      private



      public
        function TesteConenxao: Boolean;

        function GerarHashSHA256(const Senha: string): string;
        function CadastraUsuario: Boolean;
        function ValidaUsuario(Email , Senha : String) : Boolean;
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
      HashSenhaInserida := GerarHashSHA256(Senha);

      vQuery := TFDQuery.Create(nil);
      try
          with vQuery do
          begin
              Close;
              Connection := TInstanceController.GetInstance().AcessarConexao.GetConexao;

              SQL.Text   := 'SELECT'+
                              'USUARIOS.EMAIL'+
                              'USUARIOS.SENHA'+
                            'FROM USUARIOS' +
                            'WHERE SENHA = :SENHA';

              ParamByName('SENHA').AsString := HashSenhaInserida;

          end;


      finally

      end;
      //HashSenhaUser     :=

      if HashSenhaInserida = HashSenhaUser then
        ShowMessage('Login bem-sucedido!')  //result
      else
        ShowMessage('Nome de usu�rio ou senha incorretos.');  //result

end;


function TAppController.GerarHashSHA256(const Senha: string): string;
begin
     Result := THashSHA2.GetHashString(Senha);
end;


function TAppController.CadastraUsuario : Boolean;
var
  vQuery : TFDQuery;
begin
      Result := False;

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
      end;


end;


function TAppController.TesteConenxao : Boolean;
begin

      TInstanceController.GetInstance().AcessarConexao.ConfiguraConexao;


end;


end.
