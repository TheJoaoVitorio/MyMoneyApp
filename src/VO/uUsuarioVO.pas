unit uUsuarioVO;

interface

type
  TUsuarioVO = class
    private
      fId         : Integer;
      fNomeUsuario: String;
      fEmail      : String;
      fSenha      : String;
      fDataCriacao: String;
      fIsActive   : Integer;

    public
      property Id          : Integer     read fId              write fId;
      property NomeUsuario : String      read fNomeUsuario     write fNomeUsuario;
      property Email       : String      read fEmail           write fEmail;
      property Senha       : String      read fSenha           write fSenha;
      property DataCriacao : String      read fDataCriacao     write fDataCriacao;
      property IsActive    : Integer     read fIsActive        write fIsActive;
  end;

var
  iUsuarioVO : TUsuarioVO;

implementation

end.
