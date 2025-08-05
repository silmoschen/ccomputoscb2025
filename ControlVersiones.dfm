object fmVersiones: TfmVersiones
  Left = 314
  Top = 186
  Width = 368
  Height = 364
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Control de Versiones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 360
    Height = 337
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 348
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DBNavigator: TDBNavigator
        Left = 196
        Top = 0
        Width = 152
        Height = 18
        DataSource = DTS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Flat = True
        Hints.Strings = (
          'Primer Registro'
          'Registro Anterior'
          'Registro Siguiente'
          'Ultimo Registro')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 24
      Width = 348
      Height = 307
      Align = alClient
      BevelInner = bvLowered
      Caption = 'Panel3'
      TabOrder = 1
      object DBGrid: TDBGrid
        Left = 2
        Top = 2
        Width = 344
        Height = 303
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
      end
    end
  end
  object DTS: TDataSource
    Left = 104
    Top = 64
  end
end
