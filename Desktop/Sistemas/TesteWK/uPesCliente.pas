unit uPesCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmPesCliente = class(TForm)
    GroupBox1: TGroupBox;
    edtPesquisa: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ck50: TRadioButton;
    ckTodos: TRadioButton;
    cbOrdenar: TComboBox;
    ckCrescente: TRadioButton;
    ckDescrescente: TRadioButton;
    GroupBox4: TGroupBox;
    ckNome: TRadioButton;
    ckCidade: TRadioButton;
    ckUF: TRadioButton;
    GroupBox5: TGroupBox;
    gdResultado: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gdResultadoDblClick(Sender: TObject);
    procedure ckCrescenteClick(Sender: TObject);
    procedure ckDescrescenteClick(Sender: TObject);
    procedure ck50Click(Sender: TObject);
    procedure ckTodosClick(Sender: TObject);
    procedure ckNomeClick(Sender: TObject);
    procedure ckCidadeClick(Sender: TObject);
    procedure ckUFClick(Sender: TObject);
    procedure cbOrdenarChange(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesCliente: TfrmPesCliente;
  campo, ordenar_1, ordenar_2, quantidade, pesquisa: String;
  Fechar: Integer;

implementation

{$R *.dfm}

uses uPedido;

procedure ExecutaSQL;
begin
  frmPedido.qryPesquisar.Active := False;
  frmPedido.qryPesquisar.SQL.Clear;
  if frmPesCliente.edtPesquisa.Text = '' then
    frmPedido.qryPesquisar.SQL.Add('SELECT ' + ' * FROM CLIENTE WHERE (' + campo + ' LIKE ' + pesquisa + ' OR ' + campo + ' IS NULL) ORDER BY ' + ordenar_1 + ordenar_2 + quantidade)
  else
    frmPedido.qryPesquisar.SQL.Add('SELECT ' + ' * FROM CLIENTE WHERE ' + campo + ' LIKE ' + pesquisa + ' ORDER BY ' + ordenar_1 + ordenar_2 + quantidade);
  frmPedido.qryPesquisar.Active := True;
end;

procedure TfrmPesCliente.cbOrdenarChange(Sender: TObject);
begin
  case cbOrdenar.ItemIndex of
  0: ordenar_1 := ' CLI_NOME ';
  1: ordenar_1 := ' CLI_CIDADE ';
  2: ordenar_1 := ' CLI_UF ';
  end;
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ck50Click(Sender: TObject);
begin
  quantidade := ' LIMIT 50 ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckCidadeClick(Sender: TObject);
begin
  campo := ' CLI_CIDADE ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckCrescenteClick(Sender: TObject);
begin
  ordenar_2 := '';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckDescrescenteClick(Sender: TObject);
begin
  ordenar_2 := ' DESC ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckNomeClick(Sender: TObject);
begin
  campo := ' CLI_NOME ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckTodosClick(Sender: TObject);
begin
  quantidade := ' ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.ckUFClick(Sender: TObject);
begin
  campo := ' CLI_UF ';
  edtPesquisa.SetFocus;
  ExecutaSQL;
end;

procedure TfrmPesCliente.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) or (Key = VK_UP)then
  begin
    case Key of
    VK_UP:begin
      Key := 0;
      frmPedido.qryPesquisar.Prior;
    end;
    VK_DOWN:begin
      Key := 0;
      frmPedido.qryPesquisar.Next;
    end;
    end;
  end;
end;

procedure TfrmPesCliente.edtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not((Key = VK_RETURN) or (Key = VK_UP) or (Key = VK_DOWN)) then
  begin
    pesquisa := QuotedStr('%' + edtPesquisa.Text + '%');
    ExecutaSQL;
  end;
end;

procedure TfrmPesCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar = 0 then
  begin
    frmPedido.qryPesquisar.Active := False;
    frmPedido.qryPesquisar.SQL.Clear;
    frmPedido.qryPesquisar.SQL.Add('SELECT * FROM CLIENTE WHERE CLI_CODIGO = 0');
    frmPedido.qryPesquisar.Active := True;
  end;
  Action := caFree;
  frmPesCliente := Nil;
end;

procedure TfrmPesCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Fechar := 1;
    Close;
  end;
end;

procedure TfrmPesCliente.FormShow(Sender: TObject);
begin
  pesquisa := QuotedStr('%');
  ordenar_2 := '';
  quantidade := ' LIMIT 50 ';
  fechar := 0;
  campo := ' CLI_NOME ';
  ordenar_1 := ' CLI_NOME ';
  ExecutaSQL;
  edtPesquisa.SetFocus;
end;

procedure TfrmPesCliente.gdResultadoDblClick(Sender: TObject);
begin
  Fechar := 1;
  Close;
end;

end.
