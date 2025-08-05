object fmEstadisticasIAPOS: TfmEstadisticasIAPOS
  Left = 0
  Top = 0
  Caption = 'Estad'#237'sticas IAPOS'
  ClientHeight = 358
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 339
    Width = 478
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 478
    Height = 339
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Generaci'#243'n de Informes'
      OnShow = TabSheet1Show
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 470
        Height = 311
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        OnCanResize = Panel4CanResize
        object Label3: TLabel
          Left = 12
          Top = 42
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Obra Social:'
        end
        object os1: TLabel
          Left = 147
          Top = 43
          Width = 30
          Height = 13
          Caption = '          '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 29
          Top = 15
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Per'#237'odo:'
        end
        object codos1: TMaskEdit
          Left = 74
          Top = 38
          Width = 47
          Height = 21
          EditMask = '999999;1; '
          MaxLength = 6
          TabOrder = 1
          Text = '      '
          OnKeyDown = codos1KeyDown
        end
        object BuscarOS1: TBitBtn
          Left = 124
          Top = 39
          Width = 20
          Height = 22
          Hint = 'Buscar Obra Social'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BuscarOS1Click
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
        object periodo1: TMaskEdit
          Left = 74
          Top = 12
          Width = 48
          Height = 21
          EditMask = '99/9999;1; '
          MaxLength = 7
          TabOrder = 0
          Text = '  /    '
          OnKeyDown = periodo1KeyDown
        end
        object GroupBox1: TGroupBox
          Left = 10
          Top = 73
          Width = 154
          Height = 129
          Caption = ' Tipo de Salida '
          TabOrder = 3
          object Button1: TButton
            Left = 9
            Top = 18
            Width = 134
            Height = 25
            Caption = '&Dispositivo de Salida'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 9
            Top = 49
            Width = 134
            Height = 25
            Caption = '&Generaci'#243'n del Informe'
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 9
            Top = 92
            Width = 134
            Height = 25
            Caption = '&Exportar a Excel'
            TabOrder = 2
            OnClick = Button3Click
          end
        end
        object CheckBox1: TCheckBox
          Left = 12
          Top = 214
          Width = 169
          Height = 17
          Caption = '&Recalcular Totales Facturados'
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Resumen y Detalle Prestadores'
      ImageIndex = 1
      OnHide = TabSheet2Hide
      OnShow = TabSheet2Show
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 470
        Height = 311
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel6: TPanel
          Left = 6
          Top = 165
          Width = 458
          Height = 75
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel3'
          TabOrder = 0
          object R: TStringGrid
            Left = 2
            Top = 2
            Width = 454
            Height = 71
            Align = alClient
            BorderStyle = bsNone
            ColCount = 7
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 5000
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnKeyDown = SKeyDow
            ColWidths = (
              50
              185
              68
              66
              64
              64
              64)
          end
        end
        object Panel7: TPanel
          Left = 6
          Top = 119
          Width = 458
          Height = 46
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object Label7: TLabel
            Left = 4
            Top = 3
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object perliq: TLabel
            Left = 48
            Top = 3
            Width = 60
            Height = 13
            Caption = '                    '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 97
            Top = 3
            Width = 133
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tot. Obra Social (dist. Prof.):'
          end
          object totos: TLabel
            Left = 272
            Top = 3
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = '                    '
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Button4: TButton
            Left = 215
            Top = 19
            Width = 119
            Height = 25
            Caption = '&Dispositivo de Salida'
            TabOrder = 0
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 336
            Top = 19
            Width = 119
            Height = 25
            Caption = '&Generar Informe'
            TabOrder = 1
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 3
            Top = 19
            Width = 198
            Height = 25
            Caption = 'D&etalle de Ajustes Dep'#243'sitos/Retiro'
            TabOrder = 2
            OnClick = Button6Click
          end
        end
        object Panel8: TPanel
          Left = 6
          Top = 6
          Width = 458
          Height = 113
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Panel3'
          TabOrder = 2
          object E: TStringGrid
            Left = 2
            Top = 2
            Width = 454
            Height = 109
            Align = alClient
            BorderStyle = bsNone
            ColCount = 4
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 5000
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnClick = EDblClick
            OnKeyDown = EKeyDown
            ColWidths = (
              64
              228
              72
              69)
          end
        end
        object Panel9: TPanel
          Left = 6
          Top = 240
          Width = 458
          Height = 65
          Align = alBottom
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 3
          object Button7: TButton
            Left = 3
            Top = 3
            Width = 157
            Height = 25
            Caption = '&Cargar D'#233'bitos/Pagos al Prof.'
            TabOrder = 0
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 162
            Top = 4
            Width = 121
            Height = 25
            Caption = '&Ajustar Fecha de Pago'
            TabOrder = 1
            OnClick = Button8Click
          end
          object Button9: TButton
            Left = 286
            Top = 4
            Width = 146
            Height = 25
            Caption = '&Sinc. T. Fact con T. Pagado'
            TabOrder = 2
            OnClick = Button9Click
          end
          object CheckBox2: TCheckBox
            Left = 6
            Top = 42
            Width = 224
            Height = 17
            Caption = '&Ajustar Porcentaje que se Paga al Efector'
            TabOrder = 3
            OnClick = CheckBox2Click
          end
          object btnRecalcular: TButton
            Left = 287
            Top = 37
            Width = 145
            Height = 25
            Caption = '&Recalcular Montos'
            Enabled = False
            TabOrder = 4
            OnClick = btnRecalcularClick
          end
          object porcentaje: TEditValid
            Left = 228
            Top = 39
            Width = 53
            Height = 21
            Enabled = False
            TabOrder = 5
            Text = '100'
            Valid = tvDecimalPos
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Unidades de Referencia'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 470
        Height = 311
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel2: TPanel
          Left = 6
          Top = 6
          Width = 458
          Height = 58
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            Left = 6
            Top = 9
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obra Social:'
          end
          object os: TLabel
            Left = 141
            Top = 9
            Width = 30
            Height = 13
            Caption = '          '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 23
            Top = 34
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object Label2: TLabel
            Left = 145
            Top = 34
            Width = 101
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor U.B. Referente:'
          end
          object codos: TMaskEdit
            Left = 67
            Top = 5
            Width = 48
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 0
            Text = '      '
            OnKeyDown = codosKeyDown
          end
          object BuscarOS: TBitBtn
            Left = 118
            Top = 5
            Width = 20
            Height = 22
            Hint = 'Buscar Obra Social'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BuscarOSClick
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
          object periodo: TMaskEdit
            Left = 67
            Top = 31
            Width = 48
            Height = 21
            EditMask = '99/9999;1; '
            MaxLength = 7
            TabOrder = 2
            Text = '  /    '
            OnKeyDown = periodoKeyDown
          end
          object unidad: TEditValid
            Left = 250
            Top = 31
            Width = 78
            Height = 21
            TabOrder = 3
            OnKeyDown = unidadKeyDown
            Valid = tvDecimalPos
          end
        end
        object Panel3: TPanel
          Left = 6
          Top = 64
          Width = 458
          Height = 241
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel3'
          TabOrder = 1
          object S: TStringGrid
            Left = 2
            Top = 2
            Width = 454
            Height = 237
            Align = alClient
            BorderStyle = bsNone
            ColCount = 2
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 5000
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnDblClick = SDblClick
            OnKeyDown = SKeyDow
            ColWidths = (
              64
              135)
          end
        end
      end
    end
  end
end
