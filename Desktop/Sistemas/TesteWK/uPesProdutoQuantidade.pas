unit uPesProdutoQuantidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPesProdutoQuantidade = class(TForm)
    GroupBox1: TGroupBox;
    edtQuantidade: TEdit;
    edtAcao: TEdit;
    btnOK: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesProdutoQuantidade: TfrmPesProdutoQuantidade;

implementation

{$R *.dfm}

uses uPedido;

procedure TfrmPesProdutoQuantidade.btnOKClick(Sender: TObject);
begin
  if (edtQuantidade.Text = '') or (edtQuantidade.Text = '0') then
    Application.MessageBox('O valor digitado deve ser maior que 0(Zero).','WK System',MB_OK+MB_ICONEXCLAMATION)
  else
  begin
    if (edtAcao.Text = 'Insert') and (edtQuantidade.Text <> '1') then
    begin
      //NOVO PRODUTO
      frmPedido.qryAdicionar.Edit;
      frmPedido.qryAdicionarpro_quantidade.Text := edtQuantidade.Text;
      frmPedido.qryAdicionar.Post;
      frmPedido.qryPedidoProduto.Active := False;
      frmPedido.qryPedidoProduto.Active := True;
    end
    else
    begin
      //EST? EDITANDO A QUANTIDADE DO PRODUTO
      if (frmPedido.qryPedidoProdutoPRO_QUANTIDADE.Value <> StrToInt(edtQuantidade.Text)) then
      begin
        frmPedido.qryPedidoProduto.Edit;
        frmPedido.qryPedidoProdutoPRO_QUANTIDADE.Text := edtQuantidade.Text;
        frmPedido.qryPedidoProduto.Post;
      end;
      Close;
    end;

  Close;
  end;
end;

procedure TfrmPesProdutoQuantidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesProdutoQuantidade := Nil;
end;

procedure TfrmPesProdutoQuantidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnOK.Click
  end;
end;

end.
