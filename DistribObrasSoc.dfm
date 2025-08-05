object fmLiquidacionOS: TfmLiquidacionOS
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Lidquidación Pagos Obras Sociales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 25
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = True
    Images = contenedorImg.ImagenesForms
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 96
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primer Registro'
        'Registro Anterior'
        'Registro Siguiente'
        'Ultimo Registro')
      TabOrder = 0
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 536
    Height = 304
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 524
      Height = 292
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
        Left = 10
        Top = 10
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cód. Comprobante:'
      end
      object Label2: TLabel
        Left = 42
        Top = 34
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripción:'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 240
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
