object fmActMontosFijosNBU: TfmActMontosFijosNBU
  Left = 294
  Top = 162
  Width = 507
  Height = 393
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Actualizaci'#243'n de Montos Fijos NBU'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 347
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    OnResize = Panel2Resize
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 487
      Height = 335
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 487
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 1
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'd. Obra'
        end
        object Label2: TLabel
          Left = 21
          Top = 12
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Social:'
        end
        object nos: TLabel
          Left = 131
          Top = 8
          Width = 57
          Height = 13
          Caption = '                   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 49
          Top = 31
          Width = 3
          Height = 13
          Alignment = taRightJustify
        end
        object codos: TMaskEdit
          Left = 56
          Top = 4
          Width = 49
          Height = 21
          EditMask = '999999;1; '
          MaxLength = 6
          TabOrder = 0
          Text = '      '
          OnKeyDown = codosKeyDown
        end
        object BuscarObraSocial: TBitBtn
          Left = 108
          Top = 4
          Width = 20
          Height = 22
          Hint = 'Buscar Obra Social'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BuscarObraSocialClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFF000FFFFFFFFFFFF0BB00FFFFFFFFFFF0BB00FFFFFFFFFFFF00FFF
            FFFFFFFFFF0B00FFFFFFFFFFFF0B00FFFFFFFFFFFF0B00FFFFFFFFFFFF0BB00F
            FFFFFFFF00F0BB00FFFFFFF0B00F0BB00FFFFFF0B00FF0B00FFFFFF0BB000BB0
            0FFFFFFF0BBBBB00FFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFF}
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 29
        Width = 487
        Height = 277
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object A: TStringGrid
          Left = 2
          Top = 2
          Width = 483
          Height = 273
          Align = alClient
          BorderStyle = bsNone
          DefaultRowHeight = 15
          FixedCols = 0
          RowCount = 50000
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
          TabOrder = 0
          OnKeyDown = AKeyDown
          ColWidths = (
            31
            62
            240
            64
            64)
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 306
        Width = 487
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object reg: TLabel
          Left = 101
          Top = 8
          Width = 36
          Height = 13
          Caption = '            '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 7
          Top = 0
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vigente a'
        end
        object Label4: TLabel
          Left = 11
          Top = 13
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Partir de:'
        end
        object btnBuscarArchivo: TButton
          Left = 133
          Top = 3
          Width = 92
          Height = 23
          Caption = '&Abrir Archivo'
          TabOrder = 0
          OnClick = btnBuscarArchivoClick
        end
        object Panel5: TPanel
          Left = 354
          Top = 0
          Width = 133
          Height = 29
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object btnCerrar: TButton
            Left = 69
            Top = 2
            Width = 60
            Height = 23
            Caption = '&Cerrar'
            Enabled = False
            TabOrder = 0
            OnClick = btnCerrarClick
          end
          object btnActualizar: TButton
            Left = 6
            Top = 2
            Width = 60
            Height = 23
            Caption = '&Actualizar'
            Enabled = False
            TabOrder = 1
            OnClick = btnActualizarClick
          end
        end
        object periodo: TMaskEdit
          Left = 58
          Top = 4
          Width = 55
          Height = 21
          EditMask = '99/9999;1; '
          MaxLength = 7
          TabOrder = 2
          Text = '  /    '
          OnKeyDown = periodoKeyDown
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 347
    Width = 499
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object OpenDialog: TOpenDialog
    Left = 200
    Top = 216
  end
end
