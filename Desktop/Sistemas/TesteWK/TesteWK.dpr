program TesteWK;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uPedido in 'uPedido.pas' {frmPedido},
  uPesCliente in 'uPesCliente.pas' {frmPesCliente},
  uPesProduto in 'uPesProduto.pas' {frmPesProduto},
  uPesProdutoQuantidade in 'uPesProdutoQuantidade.pas' {frmPesProdutoQuantidade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
