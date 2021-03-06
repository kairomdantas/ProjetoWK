unit uPesProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmPesProduto = class(TForm)
    GroupBox1: TGroupBox;
    edtPesquisa: TEdit;
    GroupBox2: TGroupBox;
    cbOrdenar: TComboBox;
    ckCrescente: TRadioButton;
    ckDescrescente: TRadioButton;
    GroupBox3: TGroupBox;
    ck50: TRadioButton;
    ckTodos: TRadioButton;
    GroupBox4: TGroupBox;
    ckNome: TRadioButton;
    ckCidade: TRadioButton;
    GroupBox5: TGroupBox;
    gdResultado: TDBGrid;
    procedure ckNomeClick(Sender: TObject);
    procedure cbOrdenarChange(Sender: TObject);
    procedure ck50Click(Sender: TObject);
    procedure ckTodosClick(Sender: TObject);
    procedure ckCidadeClick(Sender: TObject);
    procedure ckCrescenteClick(Sender: TObject);
    procedure ckDescrescenteClick(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gdResultadoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesProduto: TfrmPesProduto;
  campo, ordenar_1, ordenar_2, quantidade, pesquisa: String;
  Fechar: Integer;

implementation

{$R *.dfm}

uses uDados, uPedido;

procedure ExecutaSQL;
begin
  frmPedido.qryProduto.Active := False;
  frmPedido.qryProduto.SQL.Clear;
  if frmPesProduto.edtPesquisa.Text = '' then
    frmPedido.qryProduto.SQL.Add('SELECT ' + ' * FROM PRODUTO WHERE (' + campo + ' LIKE ' + pesquisa + ' OR ' + campo + ' IS NULL) ORDER BY ' + ordenar_1 + ordenar_2 + quantidade)
  else
    frmPedido.qryProduto.SQL.Add('SELECT ' + ' * FROM PRODUTO WHERE ' + campo + ' LIKE ' + pesquisa + ' ORDER BY ' + ordenar_1 + ordenar_2 + quantidade);
  frmPedido.qryProduto.Active := True;
end;

procedure TfrmPesProduto.cbOrdenarChange(Sender: TObject);
begin
  case cbOrdenar.ItemIndex of
  0: ordenar_1 := ' PRO_DESCRICAO ';
  1: ordenar_1 := ' PRO_CODIGO ';
  end;
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ck50Click(Sender: TObject);
begin
  quantidade := ' LIMIT 50 ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ckCidadeClick(Sender: TObject);
begin
  campo := ' PRO_DESCRICAO ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ckCrescenteClick(Sender: TObject);
begin
  ordenar_2 := '';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ckDescrescenteClick(Sender: TObject);
begin
  ordenar_2 := ' DESC ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ckNomeClick(Sender: TObject);
begin
  campo := ' PRO_CODIGO ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.ckTodosClick(Sender: TObject);
begin
  quantidade := ' ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesProduto.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) or (Key = VK_UP)then
  begin
    case Key of
    VK_UP:begin
      Key := 0;
      frmPedido.qryProduto.Prior;
    end;
    VK_DOWN:begin
      Key := 0;
      frmPedido.qryProduto.Next;
    end;
    end;
  end;

end;

procedure TfrmPesProduto.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not((Key = VK_RETURN) or (Key = VK_UP) or (Key = VK_DOWN)) then
  begin
    pesquisa := QuotedStr('%' + edtPesquisa.Text + '%');
    ExecutaSQL;
  end;
end;

procedure TfrmPesProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar = 0 then
  begin
    frmPedido.qryProduto.Active := False;
    frmPedido.qryProduto.SQL.Clear;
    frmPedido.qryProduto.SQL.Add('SELECT * FROM PRODUTO WHERE PRO_CODIGO = 0');
    frmPedido.qryProduto.Active := True;
  end;
  Action := caFree;
  frmPesProduto := Nil;
end;

procedure TfrmPesProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Fechar := 1;
    Close;
  end;
end;

procedure TfrmPesProduto.FormShow(Sender: TObject);
begin
  pesquisa := QuotedStr('%');
  ordenar_2 := '';
  quantidade := ' LIMIT 50 ';
  fechar := 0;
  campo := ' PRO_CODIGO ';
  ordenar_1 := ' PRO_DESCRICAO ';
  ExecutaSQL;
  edtPesquisa.SetFocus;
end;

procedure TfrmPesProduto.gdResultadoDblClick(Sender: TObject);
begin
  Fechar := 1;
  Close;
end;

end.
