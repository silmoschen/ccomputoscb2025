object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 124
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 64
    Width = 153
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Table1: TTable
    DatabaseName = 'datos'
    TableName = 'NBU.DB'
    Left = 40
    Top = 24
  end
  object Table2: TTable
    DatabaseName = 'datos'
    TableName = 'NBUONLINE.DB'
    Left = 80
    Top = 24
  end
end
