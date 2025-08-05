object fmDeterminacionOnLine: TfmDeterminacionOnLine
  Left = 0
  Top = 0
  Caption = 'Agregar/Editar Determinaci'#243'n'
  ClientHeight = 46
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 3
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo de'
  end
  object des: TLabel
    Left = 130
    Top = 12
    Width = 36
    Height = 13
    Caption = '            '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label41: TLabel
    Left = 18
    Top = 16
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'An'#225'lisis:'
  end
  object Label1: TLabel
    Left = 26
    Top = 31
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Modo:'
  end
  object modo: TLabel
    Left = 59
    Top = 31
    Width = 15
    Height = 13
    Caption = '     '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object codanalisis: TMaskEdit
    Left = 58
    Top = 7
    Width = 46
    Height = 21
    EditMask = '999999;1; '
    MaxLength = 6
    TabOrder = 0
    Text = '      '
    OnKeyDown = codanalisisKeyDown
  end
  object BuscarAnalisis: TBitBtn
    Left = 107
    Top = 7
    Width = 20
    Height = 22
    Hint = 'Buscar An'#225'lisis'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BuscarAnalisisClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFF000FFFFFFFFFFFF0BB00FFFFFFFFFFF0BB00FFFFFFFFFFFF00FFF
      FFFFFFFFFF0B00FFFFFFFFFFFF0B00FFFFFFFFFFFF0B00FFFFFFFFFFFF0BB00F
      FFFFFFFF00F0BB00FFFFFFF0B00F0BB00FFFFFF0B00FF0B00FFFFFF0BB000BB0
      0FFFFFFF0BBBBB00FFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFF}
  end
end
