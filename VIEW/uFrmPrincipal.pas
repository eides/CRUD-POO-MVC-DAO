unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCliente: TButton;
    procedure btnClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFrmCadCliente;

{$R *.dfm}

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  try
    frmCadCliente := TfrmCadCliente.Create(self);
    frmCadCliente.ShowModal;
  finally
    frmCadCliente.Free;
  end;
end;

end.
