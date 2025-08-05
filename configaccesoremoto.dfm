object fmConfigFirebird: TfmConfigFirebird
  Left = 203
  Top = 0
  Caption = 'Configuraci'#243'n Acceso Remoto'
  ClientHeight = 210
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 210
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 466
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 5
        Top = 2
        Width = 240
        Height = 18
        DataSource = DataSource1
        Enabled = False
        Flat = True
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 297
        Top = 2
        Width = 51
        Height = 17
        Caption = 'Editar'
        TabOrder = 1
        OnClick = CheckBox1Click
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 27
      Width = 466
      Height = 177
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 462
        Height = 173
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 424
    Top = 16
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    FieldDefs = <
      item
        Name = 'MODULO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'HOST'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PASS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DIR_REMOTO'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <
      item
        Name = 'FIREBIRD0'
        Fields = 'MODULO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'FIREBIRD'
    Left = 400
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 392
    Top = 48
  end
end
