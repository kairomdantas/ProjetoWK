object frmPesProdutoQuantidade: TfrmPesProdutoQuantidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Produto (Quantidade) - WK'
  ClientHeight = 101
  ClientWidth = 359
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 13
    Width = 331
    Height = 75
    Caption = ' Digite a Quantidade '
    TabOrder = 0
    object btnOK: TSpeedButton
      Left = 223
      Top = 32
      Width = 82
      Height = 21
      Caption = 'OK (Enter)'
      OnClick = btnOKClick
    end
    object edtQuantidade: TEdit
      Left = 24
      Top = 32
      Width = 193
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '1'
    end
  end
  object edtAcao: TEdit
    Left = 96
    Top = 40
    Width = 52
    Height = 21
    TabOrder = 1
    Text = 'edtAcao'
    Visible = False
  end
end
