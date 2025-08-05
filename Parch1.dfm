object Form1: TForm1
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 8
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'd:\sidelphi32\sgen\ccomputoscb\arch'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 513
    Height = 305
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 288
    Top = 8
    Width = 75
    Height = 25
    Caption = 'conectar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 8
    Width = 89
    Height = 25
    Caption = 'actualizar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Table1: TTable
    OnCalcFields = Table1CalcFields
    DatabaseName = 'd:\sidelphi32\sgen\ccomputoscb\arch'
    TableName = 'detfact.DB'
    Left = 216
    Top = 120
    object Table1Periodo: TStringField
      FieldName = 'Periodo'
      Size = 7
    end
    object Table1Idprof: TStringField
      FieldName = 'Idprof'
      Size = 5
    end
    object Table1Codos: TStringField
      FieldName = 'Codos'
      Size = 6
    end
    object Table1Items: TStringField
      FieldName = 'Items'
      Size = 3
    end
    object Table1Orden: TStringField
      FieldName = 'Orden'
      Size = 4
    end
    object Table1Codpac: TStringField
      FieldName = 'Codpac'
      Size = 4
    end
    object Table1Nombre: TStringField
      FieldName = 'Nombre'
    end
    object Table1Codanalisis: TStringField
      FieldName = 'Codanalisis'
      Size = 4
    end
    object Table1N: TStringField
      FieldKind = fkCalculated
      FieldName = 'N'
      Calculated = True
    end
  end
  object Table2: TTable
    DatabaseName = 'd:\sidelphi32\sgen\ccomputoscb\arch'
    TableName = 'paciente.DB'
    Left = 248
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 192
    Top = 120
  end
end
