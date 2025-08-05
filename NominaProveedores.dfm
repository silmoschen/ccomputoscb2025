object fmListProveedores: TfmListProveedores
  Left = 102
  Top = 118
  Width = 602
  Height = 380
  Caption = 'Proveedores de Insumos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 78
    Width = 594
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 334
    Width = 594
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      594
      25)
    object SpeedButton1: TSpeedButton
      Left = 115
      Top = 0
      Width = 42
      Height = 24
      Anchors = [akLeft, akTop, akBottom]
      Caption = '&Nuevo'
      Flat = True
      Layout = blGlyphTop
      Margin = 4
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 157
      Top = 0
      Width = 42
      Height = 24
      Anchors = [akLeft, akTop, akBottom]
      Caption = '&Editar'
      Flat = True
      Layout = blGlyphTop
      Margin = 4
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 199
      Top = 0
      Width = 42
      Height = 24
      Anchors = [akLeft, akTop, akBottom]
      Caption = '&Borrar'
      Flat = True
      Layout = blGlyphTop
      Margin = 4
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 241
      Top = 0
      Width = 41
      Height = 24
      Anchors = [akLeft, akTop, akBottom]
      Caption = '&Listar'
      Flat = True
      Layout = blGlyphTop
      Margin = 4
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = SpeedButton4Click
    end
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 115
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
      TabOrder = 0
    end
    object Panel7: TPanel
      Left = 317
      Top = 0
      Width = 277
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 0
        Top = 5
        Width = 35
        Height = 13
        Caption = 'Criterio:'
      end
      object Label2: TLabel
        Left = 118
        Top = 5
        Width = 49
        Height = 13
        Caption = 'Expresi'#243'n:'
      end
      object criterio: TComboBox
        Left = 36
        Top = 1
        Width = 77
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Nombre'
        OnChange = criterioChange
        OnClick = criterioClick
        Items.Strings = (
          'Nombre'
          'C'#243'digo')
      end
      object expresion: TMaskEdit
        Left = 168
        Top = 1
        Width = 105
        Height = 21
        TabOrder = 0
        OnChange = expresionChange
        OnKeyDown = expresionKeyDown
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 594
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = Panel2Resize
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 594
      Height = 254
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
      OnDblClick = SpeedButton2Click
      OnKeyDown = DBGridKeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 25
    Width = 594
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Label4: TLabel
      Left = 5
      Top = 5
      Width = 107
      Height = 13
      Caption = 'Orden - Tipo de salida:'
    end
    object Label5: TLabel
      Left = 147
      Top = 6
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filtro Desde:'
    end
    object Label6: TLabel
      Left = 175
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label7: TLabel
      Left = 339
      Top = 11
      Width = 99
      Height = 13
      Caption = 'Dispositivo de salida:'
    end
    object desde: TMaskEdit
      Left = 209
      Top = 3
      Width = 128
      Height = 21
      TabOrder = 0
      OnKeyDown = desdeKeyDown
    end
    object hasta: TMaskEdit
      Left = 209
      Top = 26
      Width = 128
      Height = 21
      TabOrder = 1
      OnKeyDown = hastaKeyDown
    end
    object dispositivo: TComboBox
      Left = 343
      Top = 26
      Width = 135
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Presentaci'#243'n Preliminar'
      OnKeyDown = dispositivoKeyDown
      Items.Strings = (
        'Presentaci'#243'n Preliminar'
        'Impresora')
    end
    object Panel4: TPanel
      Left = 518
      Top = 0
      Width = 76
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object emitir: TBitBtn
        Left = 1
        Top = 2
        Width = 71
        Height = 22
        Caption = '&Emitir'
        TabOrder = 0
        OnClick = emitirClick
      end
      object cerrar: TBitBtn
        Left = 1
        Top = 26
        Width = 71
        Height = 21
        Caption = '&Cerrar'
        TabOrder = 1
        OnClick = cerrarClick
      end
    end
    object Panel5: TPanel
      Left = 5
      Top = 18
      Width = 135
      Height = 18
      BevelOuter = bvNone
      TabOrder = 4
      object codigo: TRadioButton
        Left = 0
        Top = 0
        Width = 55
        Height = 17
        Caption = '&C'#243'digo'
        TabOrder = 0
        OnClick = codigoClick
        OnKeyDown = codigoKeyDown
      end
      object alfabetico: TRadioButton
        Left = 64
        Top = 0
        Width = 70
        Height = 17
        Caption = '&Alfab'#233'tico'
        TabOrder = 1
        OnClick = alfabeticoClick
        OnKeyDown = alfabeticoKeyDown
      end
    end
    object Panel6: TPanel
      Left = 5
      Top = 34
      Width = 135
      Height = 17
      BevelOuter = bvNone
      TabOrder = 5
      object entorno: TRadioButton
        Left = 0
        Top = 0
        Width = 55
        Height = 17
        Caption = '&Entorno'
        TabOrder = 0
      end
      object exclusion: TRadioButton
        Left = 64
        Top = 0
        Width = 70
        Height = 17
        Caption = 'E&xclusi'#243'n'
        TabOrder = 1
      end
    end
  end
  object DTS: TDataSource
    Left = 32
    Top = 169
  end
end
