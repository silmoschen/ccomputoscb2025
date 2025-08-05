object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Dividir un archivo'
  ClientHeight = 137
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Archivo:'
  end
  object Label2: TLabel
    Left = 200
    Top = 10
    Width = 52
    Height = 13
    Caption = 'Segmento:'
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 33
    Height = 13
    Caption = '           '
  end
  object Label4: TLabel
    Left = 8
    Top = 91
    Width = 9
    Height = 13
    Caption = '   '
  end
  object archivo: TEdit
    Left = 58
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'PAD-200909.txt'
  end
  object Button1: TButton
    Left = 8
    Top = 33
    Width = 113
    Height = 25
    Caption = 'Dividir Archivo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object tope: TEdit
    Left = 258
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '75000'
  end
end
