object fmBuscarProf: TfmBuscarProf
  Left = 142
  Top = 130
  Width = 544
  Height = 372
  Caption = 'N'#243'mina de Profesionales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 217
      Top = 4
      Width = 35
      Height = 13
      Caption = 'Criterio:'
    end
    object Label2: TLabel
      Left = 361
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Expresi'#243'n:'
    end
    object DBNavigator: TDBNavigator
      Left = 1
      Top = 0
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
      TabOrder = 1
    end
    object criterio: TComboBox
      Left = 255
      Top = 1
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Nombre'
      Items.Strings = (
        'Nombre'
        'C'#243'digo')
    end
    object expresion: TMaskEdit
      Left = 413
      Top = 1
      Width = 123
      Height = 21
      TabOrder = 0
      OnChange = expresionChange
      OnKeyDown = expresionKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 536
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 536
      Height = 301
      Align = alClient
      BorderStyle = bsNone
      DataSource = DTS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 326
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object DTS: TDataSource
    Left = 288
    Top = 64
  end
end
