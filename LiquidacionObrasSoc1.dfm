object fmLiquidacionOS: TfmLiquidacionOS
  Left = 161
  Top = 130
  Width = 508
  Height = 375
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Liquidaci'#243'n Pagos Obras Sociales'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 500
    Height = 25
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = True
    Images = contenedorImg.ImagenesForms
    TabOrder = 1
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
      Hint = 'Eliminar Operaciones'
      AutoSize = True
      DropdownMenu = PopupMenu
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
    end
    object Modificar: TToolButton
      Left = 155
      Top = 0
      Hint = 'Modificar Datos'
      Caption = 'Modificar'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
    end
    object Buscar: TToolButton
      Left = 178
      Top = 0
      Hint = 'Buscar ...'
      Caption = 'Buscar'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
    end
    object Deshacer: TToolButton
      Left = 201
      Top = 0
      Hint = 'Deshacer'
      Caption = 'Deshacer'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
    end
    object Salir: TToolButton
      Left = 224
      Top = 0
      Hint = 'Salir'
      Caption = 'Salir'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = SalirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 500
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 25
    Width = 500
    Height = 304
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Ajustes Individuales'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 276
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox: TScrollBox
          Left = 6
          Top = 6
          Width = 480
          Height = 264
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
            Width = 480
            Height = 76
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 109
              Top = 2
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Obra'
            end
            object Label2: TLabel
              Left = 2
              Top = 2
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per'#237'odo'
            end
            object Label3: TLabel
              Left = 101
              Top = 13
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Social:'
            end
            object Label6: TLabel
              Left = 99
              Top = 27
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Porcent.'
            end
            object Label7: TLabel
              Left = 90
              Top = 39
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'que Paga:'
            end
            object Label8: TLabel
              Left = 2
              Top = 25
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Monto'
            end
            object montofact: TLabel
              Left = 36
              Top = 28
              Width = 59
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object nos: TLabel
              Left = 206
              Top = 8
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
            object Label12: TLabel
              Left = 13
              Top = 13
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fact.:'
            end
            object Label4: TLabel
              Left = 209
              Top = 27
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Importe'
            end
            object Label5: TLabel
              Left = 215
              Top = 39
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ajust.:'
            end
            object Label16: TLabel
              Left = 333
              Top = 56
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Operaci'#243'n:'
            end
            object Label9: TLabel
              Left = 5
              Top = 37
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fact.:'
            end
            object Label15: TLabel
              Left = 32
              Top = 56
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Monto a Pagar:'
            end
            object dist: TLabel
              Left = 254
              Top = 32
              Width = 83
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object codos: TMaskEdit
              Left = 135
              Top = 5
              Width = 47
              Height = 21
              EditMask = '######;1; '
              MaxLength = 6
              TabOrder = 1
              Text = '      '
              OnKeyDown = codosKeyDown
            end
            object periodo: TMaskEdit
              Left = 42
              Top = 5
              Width = 53
              Height = 21
              EditMask = '##/####;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
              OnKeyDown = periodoKeyDown
            end
            object porcentaje: TEditValid
              Left = 141
              Top = 30
              Width = 41
              Height = 21
              TabOrder = 2
              OnKeyDown = porcentajeKeyDown
              Valid = tvDecimal
            end
            object BuscarObraSocial: TBitBtn
              Left = 184
              Top = 5
              Width = 20
              Height = 22
              Hint = 'Buscar Obra Social'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
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
            object fecha: TMaskEdit
              Left = 420
              Top = 53
              Width = 56
              Height = 21
              EditMask = '##/##/##;1; '
              MaxLength = 8
              TabOrder = 4
              Text = '  /  /  '
              OnKeyDown = fechaKeyDown
            end
            object importeing: TEditValid
              Left = 108
              Top = 54
              Width = 74
              Height = 21
              TabOrder = 5
              OnKeyDown = importeingKeyDown
              Valid = tvDecimal
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 76
            Width = 480
            Height = 93
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 1
            object GroupBox1: TGroupBox
              Left = 3
              Top = 3
              Width = 474
              Height = 87
              Align = alClient
              Caption = ' Ajustes Individuales '
              Enabled = False
              TabOrder = 0
              object Label11: TLabel
                Left = 13
                Top = 41
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Concepto:'
              end
              object Label14: TLabel
                Left = 23
                Top = 64
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe:'
              end
              object Label13: TLabel
                Left = 273
                Top = 63
                Width = 119
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe Total Distribu'#237'do:'
              end
              object totd: TLabel
                Left = 400
                Top = 63
                Width = 68
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = '0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label19: TLabel
                Left = 343
                Top = 33
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tot. Fact.:'
              end
              object importefact: TLabel
                Left = 393
                Top = 33
                Width = 75
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = '0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label20: TLabel
                Left = 349
                Top = 49
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'a Cobrar:'
              end
              object impcobrar: TLabel
                Left = 393
                Top = 49
                Width = 75
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = '0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Left = 7
                Top = 19
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Profesional:'
              end
              object nprof: TLabel
                Left = 146
                Top = 19
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
              object concepto: TMaskEdit
                Left = 64
                Top = 38
                Width = 236
                Height = 21
                Enabled = False
                TabOrder = 0
                OnKeyDown = conceptoKeyDown
              end
              object importe: TEditValid
                Left = 64
                Top = 61
                Width = 73
                Height = 21
                Enabled = False
                TabOrder = 1
                OnKeyDown = importeKeyDown
                Valid = tvDecimal
              end
              object idprof: TMaskEdit
                Left = 64
                Top = 15
                Width = 57
                Height = 21
                EditMask = '######;1; '
                MaxLength = 6
                TabOrder = 2
                Text = '      '
                OnKeyDown = idprofKeyDown
              end
              object BuscarProf: TBitBtn
                Left = 123
                Top = 15
                Width = 20
                Height = 22
                Hint = 'Buscar Profesional'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = BuscarProfClick
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
              object Button1: TButton
                Left = 232
                Top = 8
                Width = 75
                Height = 25
                Caption = 'Button1'
                TabOrder = 4
                OnClick = Button1Click
              end
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 169
            Width = 480
            Height = 95
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 368
              Height = 95
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 0
              object F: TStringGrid
                Left = 2
                Top = 2
                Width = 364
                Height = 91
                Align = alClient
                BorderStyle = bsNone
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 200
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                ParentFont = False
                PopupMenu = PopupMenuModif
                TabOrder = 0
                OnDblClick = FDblClick
                OnKeyDown = FKeyDown
                ColWidths = (
                  29
                  39
                  183
                  77
                  15)
              end
            end
            object Panel6: TPanel
              Left = 368
              Top = 0
              Width = 112
              Height = 95
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object registrar: TBitBtn
                Left = 7
                Top = 31
                Width = 101
                Height = 25
                Caption = '&Guardar'
                Enabled = False
                TabOrder = 0
                OnClick = registrarClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                  33333333333F8888883F33330000324334222222443333388F3833333388F333
                  000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                  F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                  223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                  3338888300003AAAAAAA33333333333888888833333333330000333333333333
                  333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                  00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                  F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                  22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                  33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                  3333333333338888883333330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object Cancelar: TBitBtn
                Left = 7
                Top = 67
                Width = 101
                Height = 25
                Cancel = True
                Caption = 'Cancelar'
                Enabled = False
                TabOrder = 1
                OnClick = CancelarClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333911833333983333333388F333333F3333000033391118333911833333
                  38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                  911118111118333338F3338F833338F3000033333911111111833333338F3338
                  3333F8330000333333911111183333333338F333333F83330000333333311111
                  8333333333338F3333383333000033333339111183333333333338F333833333
                  00003333339111118333333333333833338F3333000033333911181118333333
                  33338333338F333300003333911183911183333333383338F338F33300003333
                  9118333911183333338F33838F338F33000033333913333391113333338FF833
                  38F338F300003333333333333919333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object finalizar: TBitBtn
                Left = 6
                Top = 4
                Width = 102
                Height = 25
                Caption = '&Fianlizar Ingr.'
                Enabled = False
                TabOrder = 2
                OnClick = finalizarClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000014000000120000000100
                  040000000000D800000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000F000
                  0000000FFFFFFFFF0000FFFFFFFFFF2FFFFF2FFF0000F0F000000F02FFF2FFFF
                  0000FFFFFFFFFF0F2F2FFFFF0000F0F000008F0FF2FFFFFF0000FFFFFFFF0000
                  2F2FFFFF0000F0F0000111127772FFFF0000FFFFFFF1414844812FFF0000F000
                  0081818888810FFF0000FFFFFFF1414844810FFF0000F4F44481818888810FFF
                  0000FFFFFFF1111111110FFF0000FFFFFFF1818888810FFF0000FFFFFFF11111
                  1111FFFF0000FFFFFFFFFFFFFFFFFFFF0000}
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'D'#233'bitos y Cr'#233'ditos Ind.'
      ImageIndex = 1
      OnHide = TabSheet2Hide
      OnShow = TabSheet2Show
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 276
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 6
          Top = 6
          Width = 480
          Height = 264
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
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 480
            Height = 93
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 0
            object Panel8: TPanel
              Left = 3
              Top = 35
              Width = 474
              Height = 55
              Align = alClient
              BevelOuter = bvNone
              Caption = '   '
              Enabled = False
              TabOrder = 0
              object Label23: TLabel
                Left = 3
                Top = 13
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'd. Ajuste:'
              end
              object Label24: TLabel
                Left = 21
                Top = 36
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe:'
              end
              object BuscarAjuste: TBitBtn
                Left = 94
                Top = 10
                Width = 20
                Height = 22
                Hint = 'Buscar Profesional'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BuscarAjusteClick
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
              object idajuste: TMaskEdit
                Left = 64
                Top = 10
                Width = 27
                Height = 21
                EditMask = '##;1; '
                MaxLength = 2
                TabOrder = 0
                Text = '  '
                OnKeyDown = idajusteKeyDown
              end
              object descripaj: TMaskEdit
                Left = 117
                Top = 11
                Width = 241
                Height = 21
                TabOrder = 2
                Text = '     '
                OnKeyDown = descripajKeyDown
              end
              object importeaj: TEditValid
                Left = 64
                Top = 34
                Width = 81
                Height = 21
                TabOrder = 3
                OnKeyDown = importeajKeyDown
                Valid = tvDecimal
              end
            end
            object Panel20: TPanel
              Left = 3
              Top = 3
              Width = 474
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label22: TLabel
                Left = 5
                Top = 6
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Per. Fact.:'
              end
              object Label21: TLabel
                Left = 105
                Top = 5
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Profesional:'
              end
              object nprofdc: TLabel
                Left = 246
                Top = 6
                Width = 69
                Height = 13
                Caption = '                       '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object periododc: TLabel
                Left = 57
                Top = 6
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
              object idprofdc: TMaskEdit
                Left = 163
                Top = 2
                Width = 57
                Height = 21
                EditMask = '######;1; '
                MaxLength = 6
                TabOrder = 0
                Text = '      '
                OnKeyDown = idprofdcKeyDown
              end
              object BuscarProfes: TBitBtn
                Left = 222
                Top = 2
                Width = 19
                Height = 22
                Hint = 'Buscar Profesional'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BuscarProfesClick
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
          end
          object Panel10: TPanel
            Left = 0
            Top = 93
            Width = 480
            Height = 171
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 379
              Height = 171
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 0
              object D: TStringGrid
                Left = 2
                Top = 2
                Width = 375
                Height = 167
                Align = alClient
                BorderStyle = bsNone
                ColCount = 4
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 200
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                ParentFont = False
                PopupMenu = PopupMenuModifDet
                TabOrder = 0
                OnDblClick = DDblClick
                OnKeyDown = DKeyDown
                ColWidths = (
                  29
                  25
                  223
                  77)
              end
            end
            object Panel12: TPanel
              Left = 379
              Top = 0
              Width = 101
              Height = 171
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object registraraj: TBitBtn
                Left = 3
                Top = 32
                Width = 95
                Height = 25
                Caption = '&Guardar'
                Enabled = False
                TabOrder = 0
                OnClick = registrarajClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                  33333333333F8888883F33330000324334222222443333388F3833333388F333
                  000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                  F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                  223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                  3338888300003AAAAAAA33333333333888888833333333330000333333333333
                  333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                  00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                  F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                  22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                  33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                  3333333333338888883333330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object cancelaraj: TBitBtn
                Left = 3
                Top = 78
                Width = 95
                Height = 25
                Cancel = True
                Caption = 'Cancelar'
                Enabled = False
                TabOrder = 1
                OnClick = cancelarajClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333911833333983333333388F333333F3333000033391118333911833333
                  38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                  911118111118333338F3338F833338F3000033333911111111833333338F3338
                  3333F8330000333333911111183333333338F333333F83330000333333311111
                  8333333333338F3333383333000033333339111183333333333338F333833333
                  00003333339111118333333333333833338F3333000033333911181118333333
                  33338333338F333300003333911183911183333333383338F338F33300003333
                  9118333911183333338F33838F338F33000033333913333391113333338FF833
                  38F338F300003333333333333919333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object finalizaraj: TBitBtn
                Left = 4
                Top = 4
                Width = 93
                Height = 25
                Caption = '&Fianlizar Ingr.'
                Enabled = False
                TabOrder = 2
                OnClick = finalizarajClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000014000000120000000100
                  040000000000D800000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000F000
                  0000000FFFFFFFFF0000FFFFFFFFFF2FFFFF2FFF0000F0F000000F02FFF2FFFF
                  0000FFFFFFFFFF0F2F2FFFFF0000F0F000008F0FF2FFFFFF0000FFFFFFFF0000
                  2F2FFFFF0000F0F0000111127772FFFF0000FFFFFFF1414844812FFF0000F000
                  0081818888810FFF0000FFFFFFF1414844810FFF0000F4F44481818888810FFF
                  0000FFFFFFF1111111110FFF0000FFFFFFF1818888810FFF0000FFFFFFF11111
                  1111FFFF0000FFFFFFFFFFFFFFFFFFFF0000}
              end
            end
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'D'#233'bitos y Cr'#233'd. Generales'
      ImageIndex = 4
      OnShow = TabSheet5Show
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 276
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox4: TScrollBox
          Left = 6
          Top = 6
          Width = 480
          Height = 264
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
          object Panel26: TPanel
            Left = 0
            Top = 0
            Width = 480
            Height = 97
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Panel27: TPanel
              Left = 352
              Top = 0
              Width = 128
              Height = 97
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object generarAjustes: TBitBtn
                Left = 23
                Top = 7
                Width = 101
                Height = 25
                Caption = '&Gen. Ajustes'
                Enabled = False
                TabOrder = 0
                OnClick = generarAjustesClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                  33333333333F8888883F33330000324334222222443333388F3833333388F333
                  000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                  F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                  223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                  3338888300003AAAAAAA33333333333888888833333333330000333333333333
                  333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                  00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                  F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                  22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                  33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                  3333333333338888883333330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object Panel29: TPanel
                Left = 0
                Top = 40
                Width = 128
                Height = 57
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 1
                object profpros: TLabel
                  Left = 8
                  Top = 8
                  Width = 48
                  Height = 13
                  Caption = '                '
                end
                object itemspros: TLabel
                  Left = 8
                  Top = 24
                  Width = 44
                  Height = 13
                  Caption = 'itemspros'
                end
              end
            end
            object Panel28: TPanel
              Left = 0
              Top = 0
              Width = 352
              Height = 97
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object IT: TStringGrid
                Left = 0
                Top = 0
                Width = 352
                Height = 97
                Align = alClient
                BorderStyle = bsNone
                ColCount = 4
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 200
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                ParentFont = False
                PopupMenu = PopupMenuSelItems
                TabOrder = 0
                OnDblClick = FDblClick
                OnKeyDown = ITKeyDown
                ColWidths = (
                  224
                  25
                  19
                  64)
              end
            end
          end
          object Panel22: TPanel
            Left = 0
            Top = 97
            Width = 480
            Height = 3
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
          object Panel23: TPanel
            Left = 0
            Top = 100
            Width = 480
            Height = 144
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Panel24: TPanel
              Left = 352
              Top = 0
              Width = 128
              Height = 144
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object Label18: TLabel
                Left = 9
                Top = 125
                Width = 41
                Height = 13
                Caption = 'Per'#237'odo:'
              end
              object per: TLabel
                Left = 53
                Top = 126
                Width = 42
                Height = 13
                Caption = '              '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel25: TPanel
              Left = 0
              Top = 0
              Width = 352
              Height = 144
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object PR: TStringGrid
                Left = 0
                Top = 0
                Width = 352
                Height = 144
                Align = alClient
                BorderStyle = bsNone
                ColCount = 3
                DefaultRowHeight = 15
                Enabled = False
                FixedCols = 0
                RowCount = 200
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                ParentFont = False
                PopupMenu = PopupMenuSelProf
                TabOrder = 0
                OnDblClick = FDblClick
                OnKeyDown = PRKeyDown
                ColWidths = (
                  253
                  60
                  19)
              end
            end
          end
          object Panel30: TPanel
            Left = 0
            Top = 244
            Width = 480
            Height = 20
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Retenciones'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 276
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox2: TScrollBox
          Left = 6
          Top = 6
          Width = 480
          Height = 264
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
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 480
            Height = 93
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 0
            object TPanel
              Left = 3
              Top = 3
              Width = 474
              Height = 32
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label25: TLabel
                Left = 5
                Top = 6
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Per. Fact.:'
              end
              object Label26: TLabel
                Left = 112
                Top = 6
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Profesional:'
              end
              object nprofret: TLabel
                Left = 251
                Top = 7
                Width = 69
                Height = 13
                Caption = '                       '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object perret: TLabel
                Left = 57
                Top = 6
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
              object idprofret: TMaskEdit
                Left = 169
                Top = 3
                Width = 57
                Height = 21
                EditMask = '######;1; '
                MaxLength = 6
                TabOrder = 0
                Text = '      '
                OnKeyDown = idprofretKeyDown
              end
              object BuscarProfRet: TBitBtn
                Left = 228
                Top = 3
                Width = 20
                Height = 22
                Hint = 'Buscar Profesional'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BuscarProfRetClick
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
            object Panel15: TPanel
              Left = 3
              Top = 35
              Width = 474
              Height = 55
              Align = alClient
              BevelOuter = bvNone
              Caption = '   '
              Enabled = False
              TabOrder = 1
              object Label29: TLabel
                Left = 3
                Top = 13
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'd. Ajuste:'
              end
              object Label30: TLabel
                Left = 14
                Top = 36
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Por. Ret.:'
              end
              object Label17: TLabel
                Left = 207
                Top = 36
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe Ret.:'
              end
              object BuscarRet: TBitBtn
                Left = 100
                Top = 10
                Width = 20
                Height = 22
                Hint = 'Buscar Profesional'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BuscarRetClick
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
              object idret: TMaskEdit
                Left = 64
                Top = 10
                Width = 31
                Height = 21
                EditMask = '##;1; '
                MaxLength = 2
                TabOrder = 1
                Text = '  '
                OnKeyDown = idretKeyDown
              end
              object DescripRet: TMaskEdit
                Left = 124
                Top = 11
                Width = 241
                Height = 21
                TabOrder = 2
                Text = '     '
              end
              object PorcentajeRet: TEditValid
                Left = 64
                Top = 34
                Width = 56
                Height = 21
                TabOrder = 3
                OnKeyDown = PorcentajeRetKeyDown
                Valid = tvDecimal
              end
              object importeret: TEditValid
                Left = 273
                Top = 34
                Width = 92
                Height = 21
                TabOrder = 4
                OnKeyDown = importeretKeyDown
              end
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 93
            Width = 480
            Height = 171
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 382
              Height = 171
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 0
              object T: TStringGrid
                Left = 2
                Top = 2
                Width = 378
                Height = 167
                Align = alClient
                BorderStyle = bsNone
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 200
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
                TabOrder = 0
                OnDblClick = TDblClick
                OnKeyDown = FKeyDown
                ColWidths = (
                  17
                  25
                  187
                  38
                  90)
              end
            end
            object Panel18: TPanel
              Left = 382
              Top = 0
              Width = 98
              Height = 171
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object finalizarret: TBitBtn
                Left = 2
                Top = 4
                Width = 93
                Height = 25
                Caption = '&Fianlizar Ingr.'
                Enabled = False
                TabOrder = 0
                OnClick = finalizarretClick
                Glyph.Data = {
                  4E010000424D4E01000000000000760000002800000014000000120000000100
                  040000000000D800000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000F000
                  0000000FFFFFFFFF0000FFFFFFFFFF2FFFFF2FFF0000F0F000000F02FFF2FFFF
                  0000FFFFFFFFFF0F2F2FFFFF0000F0F000008F0FF2FFFFFF0000FFFFFFFF0000
                  2F2FFFFF0000F0F0000111127772FFFF0000FFFFFFF1414844812FFF0000F000
                  0081818888810FFF0000FFFFFFF1414844810FFF0000F4F44481818888810FFF
                  0000FFFFFFF1111111110FFF0000FFFFFFF1818888810FFF0000FFFFFFF11111
                  1111FFFF0000FFFFFFFFFFFFFFFFFFFF0000}
              end
              object guardarret: TBitBtn
                Left = 2
                Top = 32
                Width = 93
                Height = 25
                Caption = '&Guardar'
                Enabled = False
                TabOrder = 1
                OnClick = guardarretClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                  33333333333F8888883F33330000324334222222443333388F3833333388F333
                  000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                  F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                  223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                  3338888300003AAAAAAA33333333333888888833333333330000333333333333
                  333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                  00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                  F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                  22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                  33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                  3333333333338888883333330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
              object cancelarret: TBitBtn
                Left = 2
                Top = 78
                Width = 93
                Height = 25
                Cancel = True
                Caption = 'Cancelar'
                Enabled = False
                TabOrder = 2
                OnClick = cancelarretClick
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333911833333983333333388F333333F3333000033391118333911833333
                  38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                  911118111118333338F3338F833338F3000033333911111111833333338F3338
                  3333F8330000333333911111183333333338F333333F83330000333333311111
                  8333333333338F3333383333000033333339111183333333333338F333833333
                  00003333339111118333333333333833338F3333000033333911181118333333
                  33338333338F333300003333911183911183333333383338F338F33300003333
                  9118333911183333338F33838F338F33000033333913333391113333338FF833
                  38F338F300003333333333333919333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                NumGlyphs = 2
              end
            end
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Utiles'
      ImageIndex = 3
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 276
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox3: TScrollBox
          Left = 6
          Top = 6
          Width = 480
          Height = 264
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
        end
      end
    end
  end
  object PopupMenu: TPopupMenu
    Left = 264
    Top = 65533
    object BorrarMovProf: TMenuItem
      Caption = '&Borrar Movimientos &Profesional'
      Enabled = False
      OnClick = BorrarMovProfClick
    end
    object BorrarMovObraSocial: TMenuItem
      Caption = 'Borrar Operaciones &Obra Social'
      Enabled = False
      OnClick = BorrarMovObraSocialClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object BorrarPeriodo: TMenuItem
      Caption = '&Todas las Operaciones del Per'#237'odo'
      Enabled = False
      OnClick = BorrarPeriodoClick
    end
  end
  object PopupMenuModif: TPopupMenu
    Left = 296
    Top = 65533
    object InsertarRegistro1: TMenuItem
      Caption = 'Insertar Items'
      OnClick = InsertarRegistro1Click
    end
    object ModificarItems1: TMenuItem
      Caption = 'Modificar Items'
      OnClick = FDblClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object BorrarItems1: TMenuItem
      Caption = 'Borrar Items'
      OnClick = BorrarItems1Click
    end
  end
  object PopupMenuModifDet: TPopupMenu
    Left = 328
    Top = 65533
    object MenuItem1: TMenuItem
      Caption = 'Insertar Items'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Modificar Items'
      OnClick = DDblClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Caption = 'Borrar Items'
      OnClick = MenuItem4Click
    end
  end
  object PopupMenuSelItems: TPopupMenu
    Left = 360
    object SiNoSeleccin1: TMenuItem
      Caption = 'Si/No Selecci'#243'n'
      OnClick = SiNoSeleccin1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object odos1: TMenuItem
      Caption = 'Seleccionar Todos'
      OnClick = odos1Click
    end
    object QuitarSelaTodos1: TMenuItem
      Caption = 'Ninguno'
      OnClick = QuitarSelaTodos1Click
    end
  end
  object PopupMenuSelProf: TPopupMenu
    Left = 392
    object MenuItem5: TMenuItem
      Caption = 'Si/No Selecci'#243'n'
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Caption = 'Seleccionar Todos'
      OnClick = MenuItem7Click
    end
    object MenuItem8: TMenuItem
      Caption = 'Ninguno'
      OnClick = MenuItem8Click
    end
  end
end
