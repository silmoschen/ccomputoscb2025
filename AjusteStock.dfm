object fmAjusteStock: TfmAjusteStock
  Left = 239
  Top = 251
  Width = 410
  Height = 110
  BorderStyle = bsSizeToolWin
  Caption = 'Ajuste de Stock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 83
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 10
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo:'
    end
    object Label2: TLabel
      Left = 11
      Top = 53
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compra/Venta:'
    end
    object Label3: TLabel
      Left = 262
      Top = 53
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cantidad:'
    end
    object codart: TLabel
      Left = 87
      Top = 11
      Width = 18
      Height = 13
      Caption = '      '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object descrip: TLabel
      Left = 125
      Top = 11
      Width = 27
      Height = 13
      Caption = '         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 31
      Top = 27
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Existencia:'
    end
    object existencia: TLabel
      Left = 87
      Top = 28
      Width = 33
      Height = 13
      Caption = '           '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object tipoper: TEditValid
      Left = 86
      Top = 51
      Width = 17
      Height = 21
      MaxLength = 1
      TabOrder = 0
      OnKeyDown = tipoperKeyDown
      Valid = tvEnteroPos
    end
    object cantidad: TEditValid
      Left = 310
      Top = 51
      Width = 75
      Height = 21
      TabOrder = 1
      OnKeyDown = cantidadKeyDown
      Valid = tvDecimalPos
    end
  end
end
