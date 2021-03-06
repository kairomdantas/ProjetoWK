unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, sGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvADOQuery, Vcl.Menus;

type
  TfrmPedido = class(TForm)
    sGroupBox1: TsGroupBox;
    Label1: TLabel;
    edtCliNome: TDBEdit;
    Label2: TLabel;
    edtCliCidade: TDBEdit;
    Label3: TLabel;
    edtCliUF: TDBEdit;
    btnPesquisar: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edtValorTotal: TDBEdit;
    Label5: TLabel;
    edtDataDoPedido: TDBEdit;
    Label6: TLabel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    qryPedido: TADOQuery;
    dsPedido: TDataSource;
    qryPedidoped_data: TWideStringField;
    qryPedidoped_cli_codigo: TIntegerField;
    qryPedidoped_valor: TBCDField;
    qryCliente: TADOQuery;
    dsCliente: TDataSource;
    qryClientecli_codigo: TAutoIncField;
    qryClientecli_nome: TWideStringField;
    qryClientecli_cidade: TWideStringField;
    qryClientecli_uf: TWideStringField;
    qryPedidoProduto: TADOQuery;
    dsPedidoProduto: TDataSource;
    qryPedidoProdutoPRO_DESCRICAO: TWideStringField;
    qryPedidoProdutoPRO_VALOR: TBCDField;
    qryPedidoProdutoPRO_QUANTIDADE: TBCDField;
    qryPedidoProdutoPROPRO_VALORPPROPRO_QUANTIDADE: TFMTBCDField;
    gdPedido: TDBGrid;
    qryPesquisar: TADOQuery;
    dsPesquisar: TDataSource;
    qryCodigo: TJvADOQuery;
    qryPedidoped_codigo: TIntegerField;
    Label7: TLabel;
    qryPedidoProdutoPRO_CODIGO: TAutoIncField;
    qryPesquisarcli_codigo: TAutoIncField;
    qryPesquisarcli_nome: TWideStringField;
    qryPesquisarcli_cidade: TWideStringField;
    qryPesquisarcli_uf: TWideStringField;
    ppPedido: TPopupMenu;
    btnInserir: TMenuItem;
    btnEditar: TMenuItem;
    btnExcluir: TMenuItem;
    qrySoma: TADOQuery;
    qryProduto: TADOQuery;
    dsProduto: TDataSource;
    qryProdutopro_codigo: TAutoIncField;
    qryProdutopro_descricao: TWideStringField;
    qryProdutopro_valor: TBCDField;
    qryAdicionar: TADOQuery;
    qryAdicionarpro_codigo: TAutoIncField;
    qryAdicionarpro_pro_codigo: TIntegerField;
    qryAdicionarpro_quantidade: TBCDField;
    qryAdicionarpro_ped_codigo: TIntegerField;
    qryPedidoProdutoCODIGO_PRODUTO: TAutoIncField;
    edtCodigo: TEdit;
    qryCodigoCODIGO: TIntegerField;
    edtTotalProdutos: TDBEdit;
    qrySomaQUANTIDADE: TFMTBCDField;
    qrySomaVALOR: TFMTBCDField;
    dsSoma: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsPedidoProdutoDataChange(Sender: TObject; Field: TField);
    procedure gdPedidoDblClick(Sender: TObject);
    procedure dsSomaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses uDados, uPrincipal, uPesCliente, uPesProduto, uPesProdutoQuantidade;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedido.btnEditarClick(Sender: TObject);
begin
  if qryPedidoProdutoPRO_QUANTIDADE.Text <> '' then
  begin
    If (frmPesProdutoQuantidade = Nil) Then
      frmPesProdutoQuantidade := TfrmPesProdutoQuantidade.Create(Application);
    frmPesProdutoQuantidade.edtQuantidade.Text := qryPedidoProdutoPRO_QUANTIDADE.Text;
    frmPesProdutoQuantidade.Showmodal;
  end;
end;

procedure TfrmPedido.btnExcluirClick(Sender: TObject);
begin
  if qryPedidoProdutoCODIGO_PRODUTO.Text <> '' then
    if Application.MessageBox('Deseja remover o produto selecionado?','WK System',MB_YESNO+MB_ICONEXCLAMATION) = mrYes then
    begin
      dmDados.qrySQL.SQL.Clear;
      dmDados.qrySQL.SQL.Add('DELETE FROM PEDIDO_PRODUTO WHERE PRO_CODIGO = 0' + qryPedidoProdutoCODIGO_PRODUTO.Text);
      dmDados.qrySQL.ExecSQL;
    end;
end;

procedure TfrmPedido.btnInserirClick(Sender: TObject);
begin
  try
    If (frmPesProduto = Nil) Then
      frmPesProduto := TfrmPesProduto.Create(Application);
    frmPesProduto.Showmodal;
  finally
    if qryProdutopro_codigo.Text <> '' then
    begin

      //N?O FOI FEITO TRATAMENTO DE PRODUTO REPETIDO - CRIT?RIO 11
      qryAdicionar.Active := True;
      qryAdicionar.Insert;
      qryAdicionarpro_pro_codigo.Text := qryProdutopro_codigo.Text;
      qryAdicionarpro_quantidade.Text := '1';
      qryAdicionarpro_ped_codigo.Text := edtCodigo.Text;
      qryAdicionar.Post;

      qryPedidoProduto.Active := False;
      qryPedidoProduto.Active := True;

      If (frmPesProdutoQuantidade = Nil) Then
        frmPesProdutoQuantidade := TfrmPesProdutoQuantidade.Create(Application);
      frmPesProdutoQuantidade.edtAcao.Text := 'Insert';
      frmPesProdutoQuantidade.Showmodal;

    end;
  end;
end;

procedure TfrmPedido.btnPesquisarClick(Sender: TObject);
begin
  try
    If (frmPesCliente = Nil) Then
      frmPesCliente := TfrmPesCliente.Create(Application);
    frmPesCliente.Showmodal;
  finally
    if qryPesquisarcli_codigo.Text <> '' then
    begin

      qryCliente.Active := False;
      qryCliente.SQL.Clear;
      qryCliente.SQL.Add('SELECT * FROM CLIENTE WHERE CLI_CODIGO = 0' + qryPesquisarcli_codigo.Text);
      qryCliente.Active := True;

      qryPedidoped_cli_codigo.Text := qryPesquisarcli_codigo.Text;
    end;
  end;
end;

procedure TfrmPedido.btnSalvarClick(Sender: TObject);
begin
  if edtCliNome.Text = '' then
    Application.MessageBox('O Cliente ? obrigat?rio preencher.','WK System',MB_OK+MB_ICONINFORMATION)
  else
  begin
    if dsPedido.State = dsInsert then
      qryPedidoped_codigo.Text := edtCodigo.Text;
    qryPedido.Post;
    frmPrincipal.qryPedido.Active := False;
    frmPrincipal.qryPedido.Active := True;
    Close;
  end;
end;

procedure TfrmPedido.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  qryCliente.Active := False;
  qryCliente.SQL.Clear;
  qryCliente.SQL.Add('SELECT * FROM CLIENTE WHERE CLI_CODIGO = 0' + qryPedidoped_cli_codigo.Text);
  qryCliente.Active := True;
end;

procedure TfrmPedido.dsPedidoProdutoDataChange(Sender: TObject; Field: TField);
begin
  //FAZ OS C?LCULOS DE VALOR E QUANTIDADE
  qrySoma.Active := False;
  qrySoma.SQL.Clear;
  qrySoma.SQL.Add('SELECT SUM(PPRO.PRO_QUANTIDADE) AS QUANTIDADE , ' +
                  ' SUM(PPRO.PRO_QUANTIDADE * PRO.PRO_VALOR) AS VALOR ' +
                  ' FROM TESTEWK.PEDIDO_PRODUTO PPRO ' +
                  ' LEFT JOIN TESTEWK.PRODUTO PRO ' +
                  ' ON PPRO.PRO_PRO_CODIGO = PRO.PRO_CODIGO ' +
                  ' WHERE PPRO.PRO_PED_CODIGO = 0' + edtCodigo.Text);
  qrySoma.Active := True;
end;

procedure TfrmPedido.dsSomaDataChange(Sender: TObject; Field: TField);
begin
  if dsPedido.State = dsInsert then
    qryPedidoped_valor.Text := qrySomaVALOR.Text
  else
  begin
    if qryPedidoped_valor.Value <> qrySomaVALOR.Value then
    begin
      qryPedido.Edit;
      qryPedidoped_valor.Text := qrySomaVALOR.Text;
      qryPedido.Post;
      qryPedido.Edit;
    end;
  end;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPedido := Nil;
end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    btnPesquisar.Click;
  if key = vk_f5 then
    btnInserir.Click;
  if (key = vk_f6) or (key = VK_RETURN) then
    btnEditar.Click;
  if (key = vk_f7) or (key = VK_DELETE) then
    btnExcluir.Click;


end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  qryCodigo.Active := True;

  //DELETA POSS?VEIS PRODUTOS QUE ESTEJAM NA MEM?RIA SEM PEDIDO CADASTRADO
  if (dsPedido.State = dsInsert) then
  begin
    edtCodigo.Text := IntToStr(qryCodigoCODIGO.Value + 1);
    dmDados.qrySQL.SQL.Clear;
    dmDados.qrySQL.SQL.Add('DELETE FROM PEDIDO_PRODUTO WHERE PRO_PED_CODIGO = 0' + edtCodigo.Text);
    dmDados.qrySQL.ExecSQL;
    qryPedidoProduto.Active := False;
    qryPedidoProduto.Active := True;
  end
  else
    edtCodigo.Text := frmPrincipal.qryPedidoped_codigo.Text;

  //SELECIONA OS PRODUTOS DO PEDIDO
  qryPedidoProduto.Active := False;
  qryPedidoProduto.SQL.Clear;
  qryPedidoProduto.SQL.Add('SELECT PRO.PRO_CODIGO, PRO.PRO_DESCRICAO, PRO.PRO_VALOR, ' +
                           ' PPRO.PRO_QUANTIDADE, PPRO.PRO_CODIGO AS CODIGO_PRODUTO, (PRO.PRO_VALOR * PPRO.PRO_QUANTIDADE) FROM PEDIDO_PRODUTO PPRO ' +
                           ' LEFT JOIN PRODUTO PRO ' +
                           ' ON PPRO.PRO_PRO_CODIGO = PRO.PRO_CODIGO ' +
                           ' WHERE PPRO.PRO_PED_CODIGO = 0' + edtCodigo.Text);
  qryPedidoProduto.Active := True;

  gdPedido.SetFocus;
end;

procedure TfrmPedido.gdPedidoDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

end.
