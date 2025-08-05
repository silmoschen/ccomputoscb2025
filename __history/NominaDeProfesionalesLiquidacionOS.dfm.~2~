object fmListProfesionalesLiq: TfmListProfesionalesLiq
  Left = 174
  Top = 109
  Caption = 'N'#243'mina de Profesionales'
  ClientHeight = 347
  ClientWidth = 555
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
    Width = 555
    Height = 2
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 563
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 328
    Width = 555
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      555
      25)
    object SpeedButton1: TSpeedButton
      Left = 101
      Top = 0
      Width = 40
      Height = 24
      Hint = 'Nuevo Registro'
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
      Left = 141
      Top = 0
      Width = 40
      Height = 24
      Hint = 'Editar Registro Actual'
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
      Left = 181
      Top = 0
      Width = 40
      Height = 24
      Hint = 'Borrar Registro Actual'
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
    object Label1: TLabel
      Left = 306
      Top = 4
      Width = 35
      Height = 13
      Caption = 'Criterio:'
    end
    object Label2: TLabel
      Left = 415
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Expr.:'
    end
    object SpeedButton4: TSpeedButton
      Left = 221
      Top = 0
      Width = 40
      Height = 24
      Hint = 'Borrar Registro Actual'
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
    object email: TSpeedButton
      Left = 261
      Top = 0
      Width = 40
      Height = 24
      Hint = 'Borrar Registro Actual'
      Anchors = [akLeft, akTop, akBottom]
      Caption = '&EMail'
      Flat = True
      Layout = blGlyphTop
      Margin = 4
      ParentShowHint = False
      PopupMenu = PopupMenu
      ShowHint = True
      Spacing = 2
      OnClick = SpeedButton4Click
    end
    object DBNavigator: TDBNavigator
      Left = 1
      Top = 0
      Width = 100
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
      Left = 342
      Top = 1
      Width = 70
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Nombre'
      OnChange = criterioChange
      OnClick = criterioClick
      Items.Strings = (
        'Nombre'
        'C'#243'digo')
    end
    object expresion: TMaskEdit
      Left = 444
      Top = 1
      Width = 115
      Height = 21
      TabOrder = 0
      OnChange = expresionChange
      OnClick = expresionClick
      OnKeyDown = expresionKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 555
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = Panel2Resize
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 555
      Height = 248
      Align = alClient
      BorderStyle = bsNone
      DataSource = DTS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu
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
    Width = 555
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
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 107
      Height = 13
      Caption = 'Orden - Tipo de salida:'
    end
    object Label4: TLabel
      Left = 147
      Top = 6
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filtro Desde:'
    end
    object Label5: TLabel
      Left = 175
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object Label6: TLabel
      Left = 343
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
      OnClick = desdeClick
      OnKeyDown = desdeKeyDown
    end
    object hasta: TMaskEdit
      Left = 209
      Top = 26
      Width = 128
      Height = 21
      TabOrder = 1
      OnClick = hastaClick
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
      Left = 479
      Top = 0
      Width = 76
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object emitir: TBitBtn
        Left = 1
        Top = 0
        Width = 71
        Height = 24
        Caption = '&Emitir'
        TabOrder = 0
        OnClick = emitirClick
      end
      object cerrar: TBitBtn
        Left = 1
        Top = 26
        Width = 71
        Height = 23
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
        OnKeyDown = codigoKeyDown
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
    Left = 480
    Top = 97
  end
  object PopupMenu: TPopupMenu
    Left = 408
    Top = 120
    object Para1: TMenuItem
      Caption = 'Para'
      OnClick = Para1Click
    end
    object CC1: TMenuItem
      Caption = 'CC'
      OnClick = CC1Click
    end
    object CCO1: TMenuItem
      Caption = 'CCO'
      OnClick = CCO1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RedactarMensaje1: TMenuItem
      Caption = 'Redactar Mensaje ...'
      OnClick = RedactarMensaje1Click
    end
  end
end
