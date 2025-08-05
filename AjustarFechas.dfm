object fmAjustarFechas: TfmAjustarFechas
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Ajustar Fechas'
  ClientHeight = 82
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
    Top = 11
    Width = 111
    Height = 13
    Caption = 'Ajustar Fecha de Pago:'
  end
  object fecha: TMaskEdit
    Left = 123
    Top = 8
    Width = 88
    Height = 21
    EditMask = '99/99/99;1; '
    MaxLength = 8
    TabOrder = 0
    Text = '  /  /  '
    OnKeyDown = fechaKeyDown
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 48
    Width = 195
    Height = 17
    Caption = '&Aplicar a Todos los Profesionales'
    TabOrder = 1
  end
end
