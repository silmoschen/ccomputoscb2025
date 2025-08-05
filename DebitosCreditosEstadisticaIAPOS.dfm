object fmAjustesDepositosRetiros: TfmAjustesDepositosRetiros
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Ajustes de Dep'#243'sitos y Retiros'
  ClientHeight = 271
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 15
    Top = 8
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Per'#237'odo:'
  end
  object perliq: TLabel
    Left = 59
    Top = 8
    Width = 60
    Height = 13
    Caption = '                    '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 7
    Top = 35
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Concepto:'
  end
  object Label2: TLabel
    Left = 23
    Top = 59
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha:'
  end
  object Label3: TLabel
    Left = 213
    Top = 59
    Width = 159
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tipo Mov. (1. D'#233'bito / 2. Cr'#233'dito):'
  end
  object Label4: TLabel
    Left = 23
    Top = 88
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Monto:'
  end
  object concepto: TMaskEdit
    Left = 59
    Top = 32
    Width = 334
    Height = 21
    TabOrder = 0
    OnKeyDown = conceptoKeyDown
  end
  object fecha: TMaskEdit
    Left = 60
    Top = 57
    Width = 62
    Height = 21
    EditMask = '99/99/99;1; '
    MaxLength = 8
    TabOrder = 1
    Text = '  /  /  '
    OnKeyDown = fechaKeyDown
  end
  object tipomov: TEditValid
    Left = 375
    Top = 57
    Width = 18
    Height = 21
    TabOrder = 2
    OnKeyDown = tipomovKeyDown
    Valid = tvEnteroPos
  end
  object monto: TEditValid
    Left = 59
    Top = 84
    Width = 94
    Height = 21
    TabOrder = 3
    OnKeyDown = montoKeyDown
    Valid = tvDecimal
  end
  object E: TStringGrid
    Left = 0
    Top = 111
    Width = 429
    Height = 160
    Align = alBottom
    BorderStyle = bsNone
    DefaultRowHeight = 15
    FixedCols = 0
    RowCount = 5000
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 4
    OnDblClick = EDblClick
    OnKeyDown = EKeyDown
    ColWidths = (
      60
      228
      67
      69
      64)
  end
end
