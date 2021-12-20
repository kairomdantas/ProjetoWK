object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedidos de Venda - WK'
  ClientHeight = 454
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gpPainel: TGroupBox
    Left = 12
    Top = 12
    Width = 361
    Height = 124
    Caption = ' Painel de Controle '
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 234
      Top = 24
      Width = 103
      Height = 81
      Caption = '&Cancelar Pedido'
      OnClick = btnCancelarClick
    end
    object btnAbrir: TSpeedButton
      Left = 139
      Top = 24
      Width = 89
      Height = 81
      Caption = '&Abrir Pedido'
      OnClick = btnAbrirClick
    end
    object btnNovo: TSpeedButton
      Left = 21
      Top = 24
      Width = 89
      Height = 81
      Caption = '&Novo Pedido'
      OnClick = btnNovoClick
    end
  end
  object gpPedidos: TGroupBox
    Left = 12
    Top = 142
    Width = 804
    Height = 279
    Caption = ' Pedidos de Venda '
    TabOrder = 1
    object gdPedidos: TDBGrid
      Left = 16
      Top = 28
      Width = 760
      Height = 229
      DataSource = dsPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = gdPedidosDblClick
    end
  end
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 435
    Width = 835
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
    ExplicitTop = 429
    ExplicitWidth = 833
  end
  object tmrHora: TTimer
    OnTimer = tmrHoraTimer
    Left = 768
    Top = 16
  end
  object qryPedido: TADOQuery
    Connection = dmDados.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PEDIDO PED'
      'LEFT JOIN CLIENTE CLI'
      'ON PED.PED_CLI_CODIGO = CLI.CLI_CODIGO'
      'ORDER BY PED.PED_CODIGO DESC')
    Left = 408
    Top = 224
    object qryPedidoped_codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ped_codigo'
    end
    object qryPedidocli_nome: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 43
      FieldName = 'cli_nome'
      Size = 45
    end
    object qryPedidoped_data: TWideStringField
      DisplayLabel = 'Data do Pedido'
      DisplayWidth = 15
      FieldName = 'ped_data'
      Size = 10
    end
    object qryPedidoped_valor: TBCDField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 15
      FieldName = 'ped_valor'
      DisplayFormat = '###,###,##0.00'
      Precision = 10
      Size = 2
    end
    object qryPedidocli_cidade: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 32
      FieldName = 'cli_cidade'
      Size = 45
    end
    object qryPedidoped_cli_codigo: TIntegerField
      FieldName = 'ped_cli_codigo'
      Visible = False
    end
    object qryPedidocli_codigo: TAutoIncField
      FieldName = 'cli_codigo'
      ReadOnly = True
      Visible = False
    end
    object qryPedidocli_uf: TWideStringField
      FieldName = 'cli_uf'
      Visible = False
      Size = 45
    end
  end
  object dsPedido: TDataSource
    DataSet = qryPedido
    Left = 456
    Top = 224
  end
end
