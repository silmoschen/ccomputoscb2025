object fmMontosFacturados: TfmMontosFacturados
  Left = 175
  Top = 217
  Width = 408
  Height = 148
  Caption = 'Ingreso de Montos Facturados'
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
  object Panel5: TPanel
    Left = 0
    Top = 22
    Width = 400
    Height = 80
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object ScrollBox1: TScrollBox
      Left = 6
      Top = 6
      Width = 388
      Height = 68
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
      object Label7: TLabel
        Left = 9
        Top = 20
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Obra Social:'
      end
      object Label9: TLabel
        Left = 36
        Top = 37
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Monto'
      end
      object codos: TLabel
        Left = 70
        Top = 20
        Width = 39
        Height = 13
        Caption = '             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object descrip: TLabel
        Left = 121
        Top = 20
        Width = 51
        Height = 13
        Caption = '                 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 26
        Top = 5
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
      end
      object periodo: TLabel
        Left = 70
        Top = 5
        Width = 39
        Height = 13
        Caption = '             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 15
        Top = 49
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Facturado:'
      end
      object monto: TEditValid
        Left = 70
        Top = 38
        Width = 97
        Height = 21
        TabOrder = 0
        OnKeyDown = montoKeyDown
        Valid = tvDecimalPos
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 102
    Width = 400
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 400
      Height = 22
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
        OnClick = SalirClick
      end
    end
  end
end
