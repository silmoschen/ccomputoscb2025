object fmActPOS: TfmActPOS
  Left = 294
  Top = 162
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Actualizaci'#243'n de Padrones'
  ClientHeight = 373
  ClientWidth = 499
  Color = clBtnFace
  Constraints.MaxWidth = 510
  Constraints.MinHeight = 400
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
    Height = 354
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
      Height = 342
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
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 5
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
        Top = 30
        Width = 487
        Height = 283
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object A: TStringGrid
          Left = 2
          Top = 2
          Width = 483
          Height = 279
          Align = alClient
          BorderStyle = bsNone
          ColCount = 3
          DefaultRowHeight = 15
          FixedCols = 0
          RowCount = 50000
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          TabOrder = 0
          OnKeyDown = AKeyDown
          ColWidths = (
            302
            98
            64)
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 313
        Width = 487
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnBuscarArchivo: TButton
          Left = 5
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
        object CheckBox1: TCheckBox
          Left = 103
          Top = 6
          Width = 187
          Height = 17
          Caption = '&Solo dar de Alta Nuevos Afiliados'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 499
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object OpenDialog: TOpenDialog
    Left = 200
    Top = 216
  end
end
