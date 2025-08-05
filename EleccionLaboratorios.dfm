object fmEleLaboratorios: TfmEleLaboratorios
  Left = 192
  Top = 107
  Width = 373
  Height = 365
  Caption = 'Elección de Laboratorios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 319
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 353
      Height = 307
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
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 353
        Height = 21
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 21
        Caption = 'ToolBar1'
        EdgeBorders = []
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = '&S'
          OnClick = ToolButton1Click
        end
        object ToolButton2: TToolButton
          Left = 18
          Top = 0
          AutoSize = True
          Caption = '&T'
          OnClick = ToolButton2Click
        end
        object ToolButton3: TToolButton
          Left = 36
          Top = 0
          AutoSize = True
          Caption = '&N'
          OnClick = ToolButton3Click
        end
        object P: TToolButton
          Left = 55
          Top = 0
          AutoSize = True
          Caption = '<<'
          ImageIndex = 0
          OnClick = PClick
        end
        object A: TToolButton
          Left = 78
          Top = 0
          AutoSize = True
          Caption = '<'
          ImageIndex = 1
          OnClick = PClick
        end
        object S: TToolButton
          Left = 95
          Top = 0
          AutoSize = True
          Caption = '>'
          ImageIndex = 2
          OnClick = PClick
        end
        object U: TToolButton
          Left = 112
          Top = 0
          AutoSize = True
          Caption = '>>'
          ImageIndex = 3
          OnClick = PClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 281
        Width = 353
        Height = 26
        Align = alBottom
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 6
          Width = 36
          Height = 13
          Caption = 'Buscar:'
        end
        object Label2: TLabel
          Left = 270
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Letra:'
        end
        object Label3: TLabel
          Left = 264
          Top = 5
          Width = 6
          Height = 13
          Caption = '1'
          Visible = False
        end
        object buscar: TMaskEdit
          Left = 45
          Top = 2
          Width = 217
          Height = 21
          Color = clBtnFace
          TabOrder = 0
          OnChange = buscarChange
          OnKeyDown = buscarKeyDown
        end
        object letra: TComboBox
          Left = 302
          Top = 2
          Width = 36
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'A'
          OnChange = letraChange
          Items.Strings = (
            'A'
            'B'
            'C'
            'D'
            'E'
            'F'
            'G'
            'H'
            'I'
            'J'
            'K'
            'L'
            'M'
            'N'
            'Ñ'
            'O'
            'P'
            'Q'
            'R'
            'S'
            'T'
            'U'
            'V'
            'W'
            'X'
            'Y'
            'Z')
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 21
        Width = 353
        Height = 260
        Align = alClient
        TabOrder = 2
        object F: TStringGrid
          Left = 1
          Top = 1
          Width = 351
          Height = 258
          Align = alClient
          ColCount = 3
          DefaultRowHeight = 15
          FixedCols = 0
          RowCount = 10000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentFont = False
          TabOrder = 0
          OnKeyDown = FKeyDown
          ColWidths = (
            269
            41
            16)
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 319
    Width = 365
    Height = 19
    Panels = <
      item
        Width = 280
      end
      item
        Text = 'Normal'
        Width = 50
      end>
    SimplePanel = False
  end
end
