unit uDM_MVC;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Comp.DataSet,uDMConexao, uClienteModel,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDMMVC = class(TDataModule)
    qryPesquisar: TFDQuery;
    qryInserir: TFDQuery;
    qryAlterar: TFDQuery;
    qryExcluir: TFDQuery;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarID: TIntegerField;
    cdsPesquisarNOME: TStringField;
    cdsPesquisarTELEFONE: TStringField;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    qryPesquisarID: TIntegerField;
    qryPesquisarNOME: TStringField;
    qryPesquisarTELEFONE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function gerarID: Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarCliente(oCLiente: TCliente; iCodigo: Integer);
    function Inseir(oCliente: TCliente; out sErro : string): Boolean;
    function Alterar(oCliente: TCliente; out sErro : string): Boolean;
    function Excluir(iCodigo: Integer; out sErro: string): Boolean;
  end;

var
  DMMVC: TDMMVC;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMMVC }

function TDMMVC.Alterar(oCliente: TCliente; out sErro: string): Boolean;
begin
  with qryAlterar, oCliente do
  begin
    Params[4].AsInteger := ID;
    Params[0].AsString  := Nome;
    Params[1].AsString  := Tipo;
    Params[2].AsString  := Documento;
    Params[3].AsString  := Telefone;

    try
      ExecSQL;
      Result := True;

    except on E: Exception do
           begin
             sErro := 'Ocooreu um erro ao alterar Cliente.' + sLineBreak + E.Message;
             Result := False;
           end;
    end;
  end;
end;

procedure TDMMVC.CarregarCliente(oCLiente: TCliente; iCodigo: Integer);
var qryCliente : TFDQuery;
begin
  qryCliente := TFDQuery.Create(nil);
  with qryCliente do
  try
    Connection := DMConexao.conMVC;
    SQL.Add('select * from cad_cliente where (id = ' + IntToStr(iCodigo)+ ')');
    Open;
    with oCLiente do
    begin
      id   := FieldByName('id').AsInteger;
      Nome := FieldByName('nome').AsString;
      Tipo := FieldByName('Tipo').AsString;
      Documento := FieldByName('Documento').AsString;
      Telefone := FieldByName('Telefone').AsString;
    end;


  finally
    qryCliente.Free;
  end;
end;

function TDMMVC.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
  with qryExcluir do
  begin
    Params[0].AsInteger := iCodigo;

    try
      ExecSQL;
      Result := True;

    except on E: Exception do
           begin
             sErro := 'Ocooreu um erro ao excluir Cliente.' + sLineBreak + E.Message;
             Result := False;
           end;
    end;
  end;
end;

function TDMMVC.gerarID: Integer;
var qrySequencia: TFDQuery;
begin
  qrySequencia := TFDQuery.Create(nil);
  with qrySequencia do
  try
    Connection := DMConexao.conMVC;
    SQL.Clear;
    SQL.Add('select coalesce (max(id),0)+1 as seq from cad_cliente');
    Open;

    Result :=  FieldByName('seq').AsInteger;
  finally
    qrySequencia.Free;
  end;
end;

function TDMMVC.Inseir(oCliente: TCliente;
  out sErro: string): Boolean;
begin
  with qryInserir, oCliente do
  begin
    Params[0].AsInteger := gerarID;
    Params[1].AsString  := Nome;
    Params[2].AsString  := Tipo;
    Params[3].AsString  := Documento;
    Params[4].AsString  := Telefone;

    try
      ExecSQL;
      Result := True;

    except on E: Exception do
           begin
             sErro := 'Ocooreu um erro ao inserir Cliente.' + sLineBreak + E.Message;
             Result := False;
           end;
    end;
  end;
end;

procedure TDMMVC.Pesquisar(sNome: string);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;

  cdsPesquisar.Params[0].AsString := '%'+sNome+'%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
