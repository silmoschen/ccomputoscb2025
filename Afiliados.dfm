object fmAfiliados: TfmAfiliados
  Left = 233
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Afiliados'
  ClientHeight = 151
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 132
    Width = 450
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 23
    Width = 450
    Height = 109
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    OnResize = Panel2Resize
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 438
      Height = 97
      HorzScrollBar.Increment = 1
      HorzScrollBar.Margin = 1
      HorzScrollBar.Range = 10
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 10
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 20
        Top = 17
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nro. Doc.'
      end
      object Label18: TLabel
        Left = 30
        Top = 29
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Afiliado:'
      end
      object Label4: TLabel
        Left = 26
        Top = 46
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nombre:'
      end
      object Label5: TLabel
        Left = 19
        Top = 2
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ob.Social:'
      end
      object codos: TLabel
        Left = 72
        Top = 2
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object os: TLabel
        Left = 114
        Top = 2
        Width = 60
        Height = 13
        Caption = '                    '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 69
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observaci'#243'n:'
      end
      object Label3: TLabel
        Left = 272
        Top = 17
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha de'
      end
      object Label6: TLabel
        Left = 262
        Top = 29
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nacimiento:'
      end
      object nrodoc: TMaskEdit
        Left = 68
        Top = 21
        Width = 91
        Height = 21
        TabOrder = 0
        OnKeyDown = nrodocKeyDown
      end
      object nombre: TMaskEdit
        Left = 68
        Top = 44
        Width = 314
        Height = 21
        TabOrder = 1
        OnKeyDown = nombreKeyDown
      end
      object observacion: TMaskEdit
        Left = 68
        Top = 67
        Width = 314
        Height = 21
        TabOrder = 2
        OnKeyDown = observacionKeyDown
      end
      object fechanac: TMaskEdit
        Left = 321
        Top = 21
        Width = 60
        Height = 21
        EditMask = '99/99/99;1; '
        MaxLength = 8
        TabOrder = 3
        Text = '  /  /  '
        OnKeyDown = fechanacKeyDown
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 450
      Height = 22
      Caption = 'ToolBar1'
      Images = contenedorImg.ImagenesForms
      TabOrder = 0
      object DBNavigator: TDBNavigator
        Left = 0
        Top = 0
        Width = 96
        Height = 22
        DataSource = DTS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primer Registro'
          'Registro Anterior'
          'Registro Siguiente'
          'Ultimo Registro')
        TabOrder = 0
        OnClick = DBNavigatorClick
      end
      object Alta: TToolButton
        Left = 96
        Top = 0
        Hint = 'Agregar Registro'
        Caption = 'Alta'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
      end
      object Baja: TToolButton
        Left = 119
        Top = 0
        Hint = 'Eliminar Registro'
        Caption = 'Baja'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = BajaClick
      end
      object Modificar: TToolButton
        Left = 142
        Top = 0
        Hint = 'Modificar Datos'
        Caption = 'Modificar'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
      end
      object Buscar: TToolButton
        Left = 165
        Top = 0
        Hint = 'Buscar ...'
        Caption = 'Buscar'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
      end
      object Deshacer: TToolButton
        Left = 188
        Top = 0
        Hint = 'Deshacer'
        Caption = 'Deshacer'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
      end
      object Salir: TToolButton
        Left = 211
        Top = 0
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = SalirClick
      end
    end
  end
  object DTS: TDataSource
    Left = 352
  end
end
