program CRUD_POO_MCV_DAO;

uses
  Vcl.Forms,
  uFrmPrincipal in 'VIEW\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadCliente in 'VIEW\uFrmCadCliente.pas' {frmCadCliente},
  uClienteModel in 'MODEL\uClienteModel.pas',
  uClienteControler in 'CONTROLER\uClienteControler.pas',
  uDM_MVC in 'DAO\uDM_MVC.pas' {DMMVC: TDataModule},
  uDMConexao in 'DAO\uDMConexao.pas' {DMConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
