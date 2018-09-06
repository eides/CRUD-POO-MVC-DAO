unit uFrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TOperacao = (opNovo, opAlterar, opNavegar);
  TfrmCadCliente = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tsPesq: TTabSheet;
    tsDados: TTabSheet;
    pnlFiltro: TPanel;
    edlPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnMenulPesquisar: TPanel;
    btnNovo: TButton;
    btnDetalhe: TButton;
    btnExcluir: TButton;
    dbgrd1: TDBGrid;
    dsPesq: TDataSource;
    edlCodigo: TLabeledEdit;
    edlNome: TLabeledEdit;
    cbbTipo: TComboBox;
    edlDocumento: TLabeledEdit;
    edlTelefone: TLabeledEdit;
    lblTipo: TLabel;
    pnlCadadtro: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
   FOperacao : TOperacao;
   procedure Novo;
   procedure Detalhar;
   procedure Configuracoes;

   procedure Pesquisar;
   procedure CarregarCliente;
   procedure Listar;
   procedure Alterar;
   procedure Excluir;
   procedure Inserir;
   procedure Gravar;
   procedure HabilitarControles(aOperacao: TOperacao);

  public

    { Public declarations }




  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uClienteControler, uClienteModel, uDM_MVC;

{$R *.dfm}

procedure TfrmCadCliente.Alterar;
var oCliente: TCliente;
    oClienteControler: TClienteControler;
    sErro: string;
begin
  oCliente := TCliente.Create;
  oClienteControler := TClienteControler.Create;
  try
    with oCliente do
    begin
      id := StrToIntDef(edlCodigo.Text,0);
      Nome := edlNome.Text;
      Tipo := Copy(UpperCase(cbbTipo.Items[cbbTipo.ItemIndex]),1,1);
      Documento := edlDocumento.Text;
      Telefone := edlTelefone.Text;
    end;

    if not  oClienteControler.Alterar(oCliente, sErro) then
      raise Exception.Create(sErro)
    else
      ShowMessage('Alterado!');

  finally
      FreeAndNil(oCliente);
    FreeAndNil(oClienteControler);
  end;

end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TfrmCadCliente.btnDetalheClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmCadCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TfrmCadCliente.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TfrmCadCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  DMMVC := TDMMVC.Create(nil);
end;

procedure TfrmCadCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DMMVC);
end;

procedure TfrmCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
  Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmCadCliente.Gravar;
var oClienteControler: TClienteControler;
    sErro: string;
begin

  oClienteControler := TClienteControler.Create;
  try
    case FOperacao of

      opNovo: Inserir;
      opAlterar: Alterar;
    end;

    oClienteControler.Pesquisar(edlPesquisar.Text);

  finally
    FreeAndNil(oClienteControler);
  end;
end;

procedure TfrmCadCliente.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of

    opNovo,
    opAlterar:
    begin
     edlNome.Enabled := True;
     cbbTipo.Enabled := True;
     edlDocumento.Enabled := True;
     edlTelefone.Enabled := True;
     btnListar.Enabled := False;
     btnFechar.Enabled := False;
     btnAlterar.Enabled := False;
     btnGravar.Enabled := True;
     btnCancelar.Enabled := True;
    end;
    opNavegar:
    begin
     edlNome.Enabled := False;
     cbbTipo.Enabled := False;
     edlDocumento.Enabled := False;
     edlTelefone.Enabled := False;
     btnListar.Enabled := True;
     btnFechar.Enabled := True;
     btnAlterar.Enabled := True;
     btnGravar.Enabled := False;
     btnCancelar.Enabled := False;
    end;
  end;
end;

procedure TfrmCadCliente.Inserir;
var oCliente: TCliente;
    oClienteControler: TClienteControler;
    sErro: string;
begin

  oCliente := TCliente.Create;
  oClienteControler := TClienteControler.Create;
  try

    with oCliente do
    begin
      id := 0;
      Nome      := Trim(edlNome.Text);
      Tipo      := Copy(UpperCase(cbbTipo.Items[cbbTipo.ItemIndex]),1,1);
      Documento := edlDocumento.Text;
      Telefone  := edlTelefone.Text;
    end;

    if not (oClienteControler.Inserir(oCliente,sErro)) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteControler);
  end;
end;

procedure TfrmCadCliente.Listar;
begin
  pgcPrincipal.ActivePage := tsPesq;
end;

procedure TfrmCadCliente.CarregarCliente;
var oCliente: TCliente;
    oClienteControler: TClienteControler;
begin

    oCliente := TCliente.Create;
    oClienteControler := TClienteControler.Create;
  try
    oClienteControler.CarregarCliente(oCliente, dsPesq.DataSet.FieldByName('id').AsInteger);
    with oCliente do
    begin
      edlCodigo.Text := IntToStr(id);
      edlNome.Text := Nome;
      if Tipo = 'J' then
        cbbTipo.ItemIndex := 1
      else
      if Tipo = 'F' then
        cbbTipo.ItemIndex := 0
      else
        cbbTipo.ItemIndex := -1;

      edlDocumento.Text := Documento;
      edlTelefone.Text := Telefone;
    end;

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteControler);
  end;
end;

procedure TfrmCadCliente.Configuracoes;
begin
  tsPesq.TabVisible := False;
  tsDados.TabVisible := False;
  pgcPrincipal.ActivePage := tsPesq;
end;

procedure TfrmCadCliente.dbgrd1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmCadCliente.Detalhar;
begin
  CarregarCliente;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tsDados;
end;

procedure TfrmCadCliente.Excluir;
var oClienteControler: TClienteControler;
    sErro: string;
begin
  oClienteControler := TClienteControler.Create;
  try
    if (dsPesq.DataSet.Active) and (dsPesq.DataSet.RecordCount > 0) then
      if (MessageDlg('Deseja excluir este cliente?', mtConfirmation, [mbYes, mbNo],0) = IDYES) then
      begin
        if not (oClienteControler.Excluir(DMMVC.cdsPesquisarID.AsInteger, sErro))then
          raise Exception.Create(sErro)
        else
        begin
          oClienteControler.Pesquisar(edlNome.Text);
          ShowMessage('Excluído!');
        end;

      end
      else
      raise Exception.Create('Não há registros');
  finally
    FreeAndNil(oClienteControler);
  end;
end;

procedure TfrmCadCliente.Novo;
begin
 FOperacao := opNovo;
 pgcPrincipal.ActivePage := tsDados;
end;

procedure TfrmCadCliente.Pesquisar;
var oClienteControler: TClienteControler;
begin
  try
  oClienteControler := TClienteControler.Create;
  oClienteControler.Pesquisar(edlPesquisar.Text);
  finally
    FreeAndNil(oClienteControler);
  end;
end;

end.
