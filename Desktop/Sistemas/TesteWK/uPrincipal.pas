unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TfrmPrincipal = class(TForm)
    gpPainel: TGroupBox;
    btnCancelar: TSpeedButton;
    btnAbrir: TSpeedButton;
    btnNovo: TSpeedButton;
    gpPedidos: TGroupBox;
    gdPedidos: TDBGrid;
    sbPrincipal: TStatusBar;
    tmrHora: TTimer;
    qryPedido: TADOQuery;
    dsPedido: TDataSource;
    qryPedidoped_data: TWideStringField;
    qryPedidoped_cli_codigo: TIntegerField;
    qryPedidoped_valor: TBCDField;
    qryPedidocli_codigo: TAutoIncField;
    qryPedidocli_nome: TWideStringField;
    qryPedidocli_cidade: TWideStringField;
    qryPedidocli_uf: TWideStringField;
    qryPedidoped_codigo: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure tmrHoraTimer(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure gdPedidosDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAbrirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDados, uPedido;

procedure TfrmPrincipal.btnAbrirClick(Sender: TObject);
begin
  if qryPedidoped_data.Text <> '' then
  begin
    If (frmPedido = Nil) Then
      frmPedido := TfrmPedido.Create(Application);

    frmPedido.qryPedido.Active := False;
    frmPedido.qryPedido.SQL.Clear;
    frmPedido.qryPedido.SQL.Add('SELECT * FROM PEDIDO WHERE PED_CODIGO = 0' + qryPedidoped_codigo.Text);
    frmPedido.qryPedido.Active := True;

    frmPedido.qryPedido.Edit;

    frmPedido.ShowModal;
  end;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  if qryPedidoped_data.Text <> '' then
    if Application.MessageBox('Deseja cancelar este pedido?','WK System',MB_YESNO+MB_ICONINFORMATION) = mrYes then
    begin
      dmDados.qrySQL.SQL.Clear;
      dmDados.qrySQL.SQL.Add('DELETE FROM PEDIDO_PRODUTO WHERE PRO_PED_CODIGO = 0' + qryPedidoped_codigo.Text);
      dmDados.qrySQL.ExecSQL;
      dmDados.qrySQL.SQL.Clear;
      dmDados.qrySQL.SQL.Add('DELETE FROM PEDIDO WHERE PED_CODIGO = 0' + qryPedidoped_codigo.Text);
      dmDados.qrySQL.ExecSQL;
      qryPedido.Active := False;
      qryPedido.Active := True;
    end;
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  If (frmPedido = Nil) Then
    frmPedido := TfrmPedido.Create(Application);

  frmPedido.qryPedido.Active := True;
  frmPedido.qryPedido.Insert;
  frmPedido.qryPedidoped_data.Text := DateToStr(Now);
  frmPedido.qryPedidoped_valor.Text := '0';

  frmPedido.qryCodigo.Active := False;
  frmPedido.qryCodigo.Active := True;

  dmDados.qrySQL.SQL.Clear;
  dmDados.qrySQL.SQL.Add('DELETE FROM PEDIDO WHERE PED_CODIGO = 0' + frmPedido.qryPedidoped_codigo.Text);
  dmDados.qrySQL.ExecSQL;

  frmPedido.ShowModal;
end;

procedure TfrmPrincipal.gdPedidosDblClick(Sender: TObject);
begin
  btnAbrir.Click;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnAbrir.Click;
  if Key = VK_DELETE then
    btnCancelar.Click;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //PREENCHE O STATUSBAR
  sbPrincipal.Panels[0].Text := ' Usu?rio: Kairom Dantas';
  sbPrincipal.Panels[1].Text := DateTimeToStr(Now) + ' ';
  qryPedido.Active := True;
end;

procedure TfrmPrincipal.tmrHoraTimer(Sender: TObject);
begin
  //INFORMA O HOR?RIO POR SEGUNDOS
  sbPrincipal.Panels[1].Text := DateTimeToStr(Now) + ' ';
end;

end.
