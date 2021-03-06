object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tela de Pedidos - WK'
  ClientHeight = 515
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalvar: TSpeedButton
    Left = 669
    Top = 426
    Width = 108
    Height = 75
    Caption = '&Salvar'
    OnClick = btnSalvarClick
  end
  object btnCancelar: TSpeedButton
    Left = 555
    Top = 426
    Width = 108
    Height = 75
    Caption = '&Cancelar'
    OnClick = btnCancelarClick
  end
  object sGroupBox1: TsGroupBox
    Left = 14
    Top = 12
    Width = 766
    Height = 65
    Caption = ' Cliente* '
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 293
      Top = 28
      Width = 39
      Height = 13
      Caption = 'Cidade:'
    end
    object Label3: TLabel
      Left = 471
      Top = 28
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object btnPesquisar: TSpeedButton
      Left = 655
      Top = 25
      Width = 90
      Height = 21
      Caption = '(F2) - Pesquisar'
      OnClick = btnPesquisarClick
    end
    object edtCliNome: TDBEdit
      Left = 60
      Top = 25
      Width = 229
      Height = 21
      DataField = 'cli_nome'
      DataSource = dsCliente
      ReadOnly = True
      TabOrder = 0
    end
    object edtCliCidade: TDBEdit
      Left = 338
      Top = 25
      Width = 127
      Height = 21
      DataField = 'cli_cidade'
      DataSource = dsCliente
      ReadOnly = True
      TabOrder = 1
    end
    object edtCliUF: TDBEdit
      Left = 494
      Top = 25
      Width = 155
      Height = 21
      DataField = 'cli_uf'
      DataSource = dsCliente
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 83
    Width = 766
    Height = 266
    Caption = ' Produtos do Pedido '
    TabOrder = 1
    object Label7: TLabel
      Left = 546
      Top = 237
      Width = 199
      Height = 13
      Alignment = taRightJustify
      Caption = '(F5 - Inserir) - (F6 - Editar) - (F7 - Excluir)'
    end
    object gdPedido: TDBGrid
      Left = 23
      Top = 32
      Width = 722
      Height = 199
      DataSource = dsPedidoProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = ppPedido
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = gdPedidoDblClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 11
    Top = 355
    Width = 766
    Height = 65
    Caption = ' Informa'#231#245'es Gerais '
    TabOrder = 2
    object Label4: TLabel
      Left = 23
      Top = 28
      Width = 94
      Height = 13
      Caption = 'Total de Produtos:'
    end
    object Label5: TLabel
      Left = 289
      Top = 28
      Width = 57
      Height = 13
      Caption = 'Valor Total:'
    end
    object Label6: TLabel
      Left = 513
      Top = 28
      Width = 83
      Height = 13
      Caption = 'Data do Pedido:'
    end
    object edtValorTotal: TDBEdit
      Left = 352
      Top = 25
      Width = 155
      Height = 21
      DataField = 'VALOR'
      DataSource = dsSoma
      ReadOnly = True
      TabOrder = 0
    end
    object edtDataDoPedido: TDBEdit
      Left = 602
      Top = 25
      Width = 146
      Height = 21
      DataField = 'ped_data'
      DataSource = dsPedido
      ReadOnly = True
      TabOrder = 1
    end
    object edtTotalProdutos: TDBEdit
      Left = 123
      Top = 25
      Width = 160
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = dsSoma
      ReadOnly = True
      TabOrder = 2
    end
  end
  object edtCodigo: TEdit
    Left = 8
    Top = 486
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object qryPedido: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PEDIDO'
      'WHERE PED_CODIGO = 0')
    Left = 579
    Top = 220
    object qryPedidoped_codigo: TIntegerField
      FieldName = 'ped_codigo'
    end
    object qryPedidoped_data: TWideStringField
      FieldName = 'ped_data'
      Size = 10
    end
    object qryPedidoped_cli_codigo: TIntegerField
      FieldName = 'ped_cli_codigo'
    end
    object qryPedidoped_valor: TBCDField
      FieldName = 'ped_valor'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object dsPedido: TDataSource
    DataSet = qryPedido
    OnDataChange = dsPedidoDataChange
    Left = 635
    Top = 220
  end
  object qryCliente: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'WHERE CLI_CODIGO = 0')
    Left = 579
    Top = 268
    object qryClientecli_codigo: TAutoIncField
      FieldName = 'cli_codigo'
      ReadOnly = True
    end
    object qryClientecli_nome: TWideStringField
      FieldName = 'cli_nome'
      Size = 45
    end
    object qryClientecli_cidade: TWideStringField
      FieldName = 'cli_cidade'
      Size = 45
    end
    object qryClientecli_uf: TWideStringField
      FieldName = 'cli_uf'
      Size = 45
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 635
    Top = 268
  end
  object qryPedidoProduto: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT PRO.PRO_CODIGO, PRO.PRO_DESCRICAO, PRO.PRO_VALOR,'
      
        'PPRO.PRO_QUANTIDADE, PPRO.PRO_CODIGO AS CODIGO_PRODUTO, (PRO.PRO' +
        '_VALOR * PPRO.PRO_QUANTIDADE) FROM PEDIDO_PRODUTO PPRO'
      'LEFT JOIN PRODUTO PRO'
      'ON PPRO.PRO_PRO_CODIGO = PRO.PRO_CODIGO'
      'WHERE PPRO.PRO_CODIGO = 0')
    Left = 582
    Top = 163
    object qryPedidoProdutoPRO_CODIGO: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'PRO_CODIGO'
      ReadOnly = True
    end
    object qryPedidoProdutoPRO_DESCRICAO: TWideStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 45
      FieldName = 'PRO_DESCRICAO'
      Size = 45
    end
    object qryPedidoProdutoPRO_VALOR: TBCDField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'PRO_VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 10
      Size = 2
    end
    object qryPedidoProdutoPRO_QUANTIDADE: TBCDField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 14
      FieldName = 'PRO_QUANTIDADE'
      DisplayFormat = '###,###,##0'
      Precision = 10
      Size = 2
    end
    object qryPedidoProdutoPROPRO_VALORPPROPRO_QUANTIDADE: TFMTBCDField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 20
      FieldName = '(PRO.PRO_VALOR * PPRO.PRO_QUANTIDADE)'
      DisplayFormat = '###,###,##0.00'
      Precision = 20
      Size = 4
    end
    object qryPedidoProdutoCODIGO_PRODUTO: TAutoIncField
      FieldName = 'CODIGO_PRODUTO'
      ReadOnly = True
      Visible = False
    end
  end
  object dsPedidoProduto: TDataSource
    DataSet = qryPedidoProduto
    OnDataChange = dsPedidoProdutoDataChange
    Left = 630
    Top = 163
  end
  object qryPesquisar: TADOQuery
    Active = True
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 675
    Top = 68
    object qryPesquisarcli_nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'cli_nome'
      Size = 45
    end
    object qryPesquisarcli_cidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cli_cidade'
      Size = 45
    end
    object qryPesquisarcli_uf: TWideStringField
      DisplayLabel = 'UF'
      DisplayWidth = 18
      FieldName = 'cli_uf'
      Size = 45
    end
    object qryPesquisarcli_codigo: TAutoIncField
      FieldName = 'cli_codigo'
      ReadOnly = True
      Visible = False
    end
  end
  object dsPesquisar: TDataSource
    DataSet = qryPesquisar
    Left = 731
    Top = 68
  end
  object qryCodigo: TJvADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT PED_CODIGO AS CODIGO FROM PEDIDO'
      'ORDER BY PED_CODIGO DESC'
      'LIMIT 1')
    DialogOptions.FormStyle = fsNormal
    Left = 43
    Top = 436
    object qryCodigoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object ppPedido: TPopupMenu
    Left = 366
    Top = 203
    object btnInserir: TMenuItem
      Caption = 'Inserir'
      OnClick = btnInserirClick
    end
    object btnEditar: TMenuItem
      Caption = 'Editar'
      OnClick = btnEditarClick
    end
    object btnExcluir: TMenuItem
      Caption = 'Excluir'
      OnClick = btnExcluirClick
    end
  end
  object qrySoma: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT SUM(PPRO.PRO_QUANTIDADE) AS QUANTIDADE ,'
      'SUM(PPRO.PRO_QUANTIDADE * PRO.PRO_VALOR) AS VALOR'
      'FROM TESTEWK.PEDIDO_PRODUTO PPRO'
      'LEFT JOIN TESTEWK.PRODUTO PRO'
      'ON PPRO.PRO_PRO_CODIGO = PRO.PRO_CODIGO'
      'WHERE PPRO.PRO_PED_CODIGO = 0')
    Left = 235
    Top = 348
    object qrySomaQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ReadOnly = True
      DisplayFormat = '###,###,##0'
      Precision = 32
      Size = 2
    end
    object qrySomaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 42
      Size = 4
    end
  end
  object qryProduto: TADOQuery
    Active = True
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTO'
      'WHERE PRO_CODIGO = 0')
    Left = 342
    Top = 259
    object qryProdutopro_codigo: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 35
      FieldName = 'pro_codigo'
      ReadOnly = True
    end
    object qryProdutopro_descricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 74
      FieldName = 'pro_descricao'
      Size = 45
    end
    object qryProdutopro_valor: TBCDField
      FieldName = 'pro_valor'
      Visible = False
      Precision = 10
      Size = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 390
    Top = 259
  end
  object qryAdicionar: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PEDIDO_PRODUTO'
      'WHERE PRO_CODIGO = 0')
    Left = 339
    Top = 316
    object qryAdicionarpro_codigo: TAutoIncField
      FieldName = 'pro_codigo'
      ReadOnly = True
    end
    object qryAdicionarpro_pro_codigo: TIntegerField
      FieldName = 'pro_pro_codigo'
    end
    object qryAdicionarpro_quantidade: TBCDField
      FieldName = 'pro_quantidade'
      Precision = 10
      Size = 2
    end
    object qryAdicionarpro_ped_codigo: TIntegerField
      FieldName = 'pro_ped_codigo'
    end
  end
  object dsSoma: TDataSource
    DataSet = qrySoma
    OnDataChange = dsSomaDataChange
    Left = 275
    Top = 348
  end
end
