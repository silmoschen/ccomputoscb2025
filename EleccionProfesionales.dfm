object fmEleProfesional: TfmEleProfesional
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Elecci'#243'n de Profesionales'
  ClientHeight = 332
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 332
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 353
      Height = 320
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
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 353
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Si: TSpeedButton
          Left = 1
          Top = 0
          Width = 18
          Height = 25
          Hint = 'S'#237'/No Selecci'#243'n'
          Caption = '&S'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SiClick
        end
        object Ninguno: TSpeedButton
          Left = 19
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Quitar Todos'
          Caption = '&N'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = NingunoClick
        end
        object Todos: TSpeedButton
          Left = 37
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Seleccionar Todos'
          Caption = '&T'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = TodosClick
        end
        object P: TSpeedButton
          Left = 55
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Primer Registro'
          Caption = '<<'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = PClick
        end
        object A: TSpeedButton
          Left = 73
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Registro Anterior'
          Caption = '<'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = PClick
        end
        object S: TSpeedButton
          Left = 91
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Registro Siguiente'
          Caption = '>'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = PClick
        end
        object U: TSpeedButton
          Left = 109
          Top = 0
          Width = 18
          Height = 25
          Hint = 'Ultimo Registro'
          Caption = '>>'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = PClick
        end
        object Label1: TLabel
          Left = 179
          Top = 6
          Width = 36
          Height = 13
          Caption = 'Buscar:'
        end
        object Label3: TLabel
          Left = 156
          Top = 16
          Width = 6
          Height = 13
          Caption = '1'
          Visible = False
        end
        object Actualizar: TSpeedButton
          Left = 127
          Top = 0
          Width = 20
          Height = 25
          Hint = 'Actualizar N'#243'mina de Obras Sociales'
          Caption = '&R'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = ActualizarClick
        end
        object buscar: TMaskEdit
          Left = 217
          Top = 3
          Width = 133
          Height = 21
          TabOrder = 0
          OnChange = buscarChange
          OnKeyDown = buscarKeyDown
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 25
        Width = 353
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object todosprof: TRadioButton
          Left = 5
          Top = 4
          Width = 60
          Height = 17
          Caption = '&Todos'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = todosprofClick
        end
        object RadioButton1: TRadioButton
          Left = 70
          Top = 4
          Width = 195
          Height = 17
          Caption = '&Profesionales que Retienene I.V.A.'
          TabOrder = 1
          OnClick = todosprofClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 48
        Width = 353
        Height = 272
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 2
        OnResize = Panel3Resize
        object F: TStringGrid
          Left = 2
          Top = 2
          Width = 349
          Height = 268
          Align = alClient
          BorderStyle = bsNone
          ColCount = 4
          DefaultRowHeight = 15
          FixedCols = 0
          RowCount = 10000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentFont = False
          TabOrder = 0
          OnKeyDown = FKeyDown
          ColWidths = (
            269
            41
            16
            286)
        end
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 168
    Top = 72
    object Seleccionar1: TMenuItem
      Caption = 'Seleccionar'
      OnClick = SiClick
    end
    object odos1: TMenuItem
      Caption = 'Todos'
      OnClick = TodosClick
    end
    object Ninguno1: TMenuItem
      Caption = 'Ninguno'
      OnClick = NingunoClick
    end
  end
end
