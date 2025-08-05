object fmConfigurarFTP: TfmConfigurarFTP
  Left = 0
  Top = 0
  Caption = 'Configuraci'#243'n de Accesos Remotos'
  ClientHeight = 201
  ClientWidth = 546
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 201
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Label8: TLabel
      Left = 54
      Top = 41
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Host:'
    end
    object Label1: TLabel
      Left = 56
      Top = 68
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'FTP:'
    end
    object Label2: TLabel
      Left = 40
      Top = 95
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usuario:'
    end
    object Label3: TLabel
      Left = 22
      Top = 122
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contrase'#241'a:'
    end
    object Label4: TLabel
      Left = 64
      Top = 15
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 'Id.:'
    end
    object host: TMaskEdit
      Left = 83
      Top = 38
      Width = 430
      Height = 21
      TabOrder = 0
    end
    object nftp: TMaskEdit
      Left = 83
      Top = 65
      Width = 430
      Height = 21
      TabOrder = 1
    end
    object usuario: TMaskEdit
      Left = 83
      Top = 92
      Width = 350
      Height = 21
      TabOrder = 2
    end
    object pass: TMaskEdit
      Left = 83
      Top = 119
      Width = 350
      Height = 21
      TabOrder = 3
    end
    object btnRegistrar: TButton
      Left = 40
      Top = 161
      Width = 75
      Height = 25
      Caption = 'Registrar'
      TabOrder = 4
      OnClick = btnRegistrarClick
    end
    object DBNavigator: TDBNavigator
      Left = 403
      Top = 161
      Width = 110
      Height = 24
      DataSource = DTS
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Flat = True
      Hints.Strings = (
        'Primer Registro'
        'Registro Anterior'
        'Registro Siguiente'
        'Ultimo Registro'
        'Refrescar')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = DBNavigatorClick
    end
    object id: TMaskEdit
      Left = 83
      Top = 12
      Width = 29
      Height = 21
      EditMask = '99;1; '
      MaxLength = 2
      TabOrder = 6
      Text = '  '
    end
  end
  object DTS: TDataSource
    Left = 488
    Top = 81
  end
end
