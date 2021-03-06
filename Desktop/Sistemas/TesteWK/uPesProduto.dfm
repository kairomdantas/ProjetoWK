object frmPesProduto: TfrmPesProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Produto - WK'
  ClientHeight = 490
  ClientWidth = 788
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
  object GroupBox1: TGroupBox
    Left = 15
    Top = 12
    Width = 756
    Height = 65
    Caption = ' Pesquisar por: '
    TabOrder = 0
    object edtPesquisa: TEdit
      Left = 24
      Top = 24
      Width = 704
      Height = 21
      TabOrder = 0
      OnKeyDown = edtPesquisaKeyDown
      OnKeyUp = edtPesquisaKeyUp
    end
  end
  object GroupBox2: TGroupBox
    Left = 198
    Top = 83
    Width = 193
    Height = 122
    Caption = ' Ordenar por: '
    TabOrder = 1
    object cbOrdenar: TComboBox
      Left = 23
      Top = 82
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = 'Descri'#231#227'o'
      OnChange = cbOrdenarChange
      Items.Strings = (
        'Descri'#231#227'o'
        'C'#243'digo')
    end
    object ckCrescente: TRadioButton
      Left = 23
      Top = 28
      Width = 122
      Height = 17
      Caption = 'Crescente'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = ckCrescenteClick
    end
    object ckDescrescente: TRadioButton
      Left = 23
      Top = 54
      Width = 114
      Height = 17
      Caption = 'Descrescente'
      TabOrder = 2
      OnClick = ckDescrescenteClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 397
    Top = 83
    Width = 218
    Height = 90
    Caption = ' Quantidade de Resultados: '
    TabOrder = 2
    object ck50: TRadioButton
      Left = 24
      Top = 28
      Width = 153
      Height = 17
      Caption = '50 Primeiros (Mais r'#225'pido)'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = ck50Click
    end
    object ckTodos: TRadioButton
      Left = 24
      Top = 54
      Width = 153
      Height = 17
      Caption = 'Todos (Mais lento)'
      TabOrder = 1
      OnClick = ckTodosClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 15
    Top = 83
    Width = 177
    Height = 122
    Caption = ' Campo de Pesquisa '
    TabOrder = 3
    object ckNome: TRadioButton
      Left = 24
      Top = 28
      Width = 81
      Height = 17
      Caption = 'C'#243'digo'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = ckNomeClick
    end
    object ckCidade: TRadioButton
      Left = 24
      Top = 54
      Width = 81
      Height = 17
      Caption = 'Descri'#231#227'o'
      TabOrder = 1
      OnClick = ckCidadeClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 15
    Top = 211
    Width = 756
    Height = 266
    Caption = ' Resultado '
    TabOrder = 4
    object gdResultado: TDBGrid
      Left = 24
      Top = 32
      Width = 706
      Height = 210
      DataSource = frmPedido.dsProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = gdResultadoDblClick
    end
  end
end
