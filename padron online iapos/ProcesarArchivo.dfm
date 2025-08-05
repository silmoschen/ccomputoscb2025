object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Padron IAPOS'
  ClientHeight = 247
  ClientWidth = 488
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
    Left = 105
    Top = 39
    Width = 6
    Height = 13
    Caption = '  '
  end
  object Label5: TLabel
    Left = 339
    Top = 44
    Width = 96
    Height = 13
    Caption = '                                '
  end
  object Button1: TButton
    Left = 8
    Top = 33
    Width = 89
    Height = 25
    Caption = 'Generar SQL'
    TabOrder = 0
    OnClick = Button1Click
  end
  object archivo: TEdit
    Left = 58
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'PAD-200909.txt'
  end
  object tope: TEdit
    Left = 258
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '3000000'
  end
  object codos: TEdit
    Left = 117
    Top = 36
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '121005'
  end
  object Button2: TButton
    Left = 258
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Ver Lineas'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 91
    Width = 137
    Height = 25
    Caption = 'Generar SQL PAMI'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 122
    Width = 137
    Height = 25
    Caption = 'Generar SQL Federada'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 168
    Width = 137
    Height = 25
    Caption = 'M'#233'dicos IAPOS'
    Enabled = False
    TabOrder = 7
    OnClick = Button5Click
  end
  object lista: TListBox
    Left = 168
    Top = 70
    Width = 225
    Height = 129
    ItemHeight = 13
    TabOrder = 8
  end
  object Button6: TButton
    Left = 8
    Top = 199
    Width = 137
    Height = 25
    Caption = 'M'#233'dicos IAPOS'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 224
    Top = 216
    Width = 177
    Height = 21
    TabOrder = 10
    Text = 'Edit1'
    Visible = False
  end
  object StringGrid1: TStringGrid
    Left = 151
    Top = 63
    Width = 320
    Height = 147
    RowCount = 50000
    TabOrder = 11
  end
  object OpenDialog1: TOpenDialog
    Left = 440
    Top = 112
  end
end
