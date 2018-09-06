unit uClienteModel;

interface
 uses
 System.SysUtils;

 type
 TCliente = class
 private
    FID: Integer;
    FDocumento: String;
    FNome: String;
    FTipo: String;
    FTelefone: String;
    procedure SetNome(const Value: String);
   { private declarations }
 protected
   { protected declarations }
 public
   { public declarations }

   property id:        Integer read FID write FID;
   property Nome:      String read FNome write SetNome;
   property Tipo:      String read FTipo write FTipo;
   property Documento: String read FDocumento write FDocumento;
   property Telefone:  String read FTelefone write FTelefone;


 published
   { published declarations }
 end;
implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('Nome precisa ser preenchido');
  FNome := Value;
end;

end.
