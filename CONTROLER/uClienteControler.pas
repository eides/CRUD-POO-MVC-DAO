unit uClienteControler;

interface
uses
  uClienteModel, System.SysUtils;
 type
 TClienteControler = class
 private
   { private declarations }
 protected
   { protected declarations }
 public
   { public declarations }
   constructor Create;
   destructor Destroy; override;
   procedure Pesquisar(sNome: string);
   function Inserir(oCliente: TCliente; var sErro: string): Boolean;
   function Alterar(oCliente: TCliente; var sErro: string): Boolean;
   function Excluir(iCodigo: Integer; var sErro: string): Boolean;
   procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);

 published
   { published declarations }
 end;
implementation

uses
  uDM_MVC;



{ TClienteControler }

function TClienteControler.Alterar(oCliente: TCliente;
  var sErro: string): Boolean;
begin
  Result := DMMVC.Alterar(oCliente, sErro);
end;

procedure TClienteControler.CarregarCliente(oCliente: TCliente;
  iCodigo: Integer);
begin
  DMMVC.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteControler.Create;
begin
//  DMMVC := TDMMVC.Create(nil);
end;

destructor TClienteControler.Destroy;
begin
//  FreeAndNil(DMMVC);
  inherited;

end;

function TClienteControler.Excluir(iCodigo: Integer; var sErro: string): Boolean;
begin
  Result := DMMVC.Excluir(iCodigo, sErro);
end;

function TClienteControler.Inserir(oCliente: TCliente; var sErro: string): Boolean;
begin
  Result := DMMVC.Inseir(oCliente, sErro);
end;

procedure TClienteControler.Pesquisar(sNome: string);
begin
  DMMVC.Pesquisar(sNome);
end;

end.
