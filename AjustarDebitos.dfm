object fmAjustarDebitos: TfmAjustarDebitos
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'justar D'#233'bitos'
  ClientHeight = 106
  ClientWidth = 291
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
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 100
    Height = 13
    Caption = 'D'#233'bito al Profesional:'
  end
  object Label2: TLabel
    Left = 35
    Top = 43
    Width = 73
    Height = 13
    Caption = 'Monto Pagado:'
  end
  object Label3: TLabel
    Left = 24
    Top = 12
    Width = 95
    Height = 13
    Caption = 'Monto Facturado:'
  end
  object monto: TEditValid
    Left = 112
    Top = 69
    Width = 124
    Height = 21
    TabOrder = 2
    OnKeyDown = montoKeyDown
    Valid = tvDecimal
  end
  object pago: TEditValid
    Left = 112
    Top = 40
    Width = 124
    Height = 21
    TabOrder = 1
    OnKeyDown = pagoKeyDown
    Valid = tvDecimal
  end
  object montofact: TEditValid
    Left = 112
    Top = 9
    Width = 124
    Height = 21
    TabOrder = 0
    OnKeyDown = montofactKeyDown
    Valid = tvDecimal
  end
end
