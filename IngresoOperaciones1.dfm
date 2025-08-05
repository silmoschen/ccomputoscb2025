object fmIngreso: TfmIngreso
  Left = 77
  Top = 168
  Width = 544
  Height = 375
  Caption = 'Ingreso de Operaciones'
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
  object TLabel
    Left = 64
    Top = 2
    Width = 27
    Height = 13
    Caption = '         '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 80
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 299
    Width = 536
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 1
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per. que Paga:'
    end
    object periodo: TLabel
      Left = 88
      Top = 1
      Width = 27
      Height = 13
      Caption = '         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 23
      Top = 14
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obra Social:'
    end
    object codos: TLabel
      Left = 88
      Top = 15
      Width = 33
      Height = 13
      Caption = '           '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 171
      Top = 1
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha:'
    end
    object fecha: TLabel
      Left = 208
      Top = 1
      Width = 27
      Height = 13
      Caption = '         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object nos: TLabel
      Left = 136
      Top = 15
      Width = 33
      Height = 13
      Caption = '           '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 259
      Top = 1
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Items:'
    end
    object descrip: TLabel
      Left = 291
      Top = 1
      Width = 27
      Height = 13
      Caption = '         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 360
      Top = 0
      Width = 176
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 52
        Top = 1
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo Liq.:'
      end
      object perLiq: TLabel
        Left = 117
        Top = 1
        Width = 27
        Height = 13
        Caption = '         '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Guardar: TBitBtn
        Left = 52
        Top = 16
        Width = 84
        Height = 13
        Caption = '&Guardar'
        Enabled = False
        TabOrder = 0
        Visible = False
        OnClick = GuardarClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 536
    Height = 299
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Ajustes Individuales'
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 268
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox3: TScrollBox
          Left = 6
          Top = 6
          Width = 516
          Height = 256
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
            Width = 516
            Height = 256
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object A: TStringGrid
              Left = 0
              Top = 0
              Width = 516
              Height = 256
              Align = alClient
              BorderStyle = bsNone
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 100
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 0
              OnDrawCell = ADrawCell
              OnKeyDown = AKeyDown
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Retenciones'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 268
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox2: TScrollBox
          Left = 6
          Top = 6
          Width = 516
          Height = 256
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
          object T: TStringGrid
            Left = 0
            Top = 0
            Width = 516
            Height = 256
            Align = alClient
            BorderStyle = bsNone
            DefaultRowHeight = 15
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            OnDrawCell = TDrawCell
            OnKeyDown = TKeyDown
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Debitos y Creditos Individuales'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 528
        Height = 268
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 6
          Top = 6
          Width = 516
          Height = 256
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
          object D: TStringGrid
            Left = 0
            Top = 0
            Width = 516
            Height = 256
            Align = alClient
            BorderStyle = bsNone
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 100
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            OnDrawCell = DDrawCell
            OnKeyDown = DKeyDown
          end
          object Id: TStringGrid
            Left = 8
            Top = 136
            Width = 481
            Height = 96
            BorderStyle = bsNone
            DefaultRowHeight = 15
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            Visible = False
          end
        end
      end
    end
  end
  object mxCaptionBarButtons1: TmxCaptionBarButtons
    Buttons = <
      item
        Animate = True
        ButtonGlyph = bgHelp
        Down = False
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GroupIndex = 0
        Hint = 'Buscar Profesional, puede utilizar la tecla F5'
        Name = 'mxCaptionButton1'
        Separator = 0
        Tag = 0
        Visible = True
        Width = 0
        OnClick = mxCaptionBarButtons1Buttons0Click
      end>
    Version = '1.0'
    Left = 432
  end
end
