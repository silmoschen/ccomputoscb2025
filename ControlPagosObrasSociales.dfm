object frmControlPagos: TfrmControlPagos
  Left = 192
  Top = 107
  Width = 590
  Height = 449
  Caption = 'Control de Pagos de Obras Sociales'
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
    Width = 582
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
      OnClick = SalirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 403
    Width = 582
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
    Width = 582
    Height = 378
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = '&Registraci'#243'n Pagos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 350
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 6
          Top = 6
          Width = 562
          Height = 338
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
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 562
            Height = 338
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 257
              Width = 562
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object Panel11: TPanel
              Left = 0
              Top = 68
              Width = 562
              Height = 75
              Align = alTop
              BevelOuter = bvNone
              BorderWidth = 3
              TabOrder = 0
              object GroupBox1: TGroupBox
                Left = 3
                Top = 3
                Width = 493
                Height = 69
                Align = alClient
                Caption = ' Detalle de Cheques '
                Enabled = False
                TabOrder = 0
                object Label25: TLabel
                  Left = 11
                  Top = 14
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Nro de'
                end
                object Label26: TLabel
                  Left = 13
                  Top = 38
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fecha'
                end
                object Label27: TLabel
                  Left = 3
                  Top = 50
                  Width = 42
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Present.:'
                end
                object Label28: TLabel
                  Left = 150
                  Top = 20
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Banco:'
                end
                object entbco: TLabel
                  Left = 242
                  Top = 10
                  Width = 66
                  Height = 13
                  Caption = '                      '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 109
                  Top = 46
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Monto:'
                end
                object Label30: TLabel
                  Left = 222
                  Top = 46
                  Width = 49
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Concepto:'
                end
                object Label31: TLabel
                  Left = 5
                  Top = 25
                  Width = 40
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cheque:'
                end
                object Label36: TLabel
                  Left = 322
                  Top = 26
                  Width = 74
                  Height = 13
                  Caption = 'Tot. Distribuido:'
                end
                object totd: TLabel
                  Left = 422
                  Top = 26
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = '                      '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object nrocheque: TMaskEdit
                  Left = 48
                  Top = 16
                  Width = 89
                  Height = 21
                  TabOrder = 0
                  OnKeyDown = nrochequeKeyDown
                end
                object fechacheque: TMaskEdit
                  Left = 48
                  Top = 42
                  Width = 56
                  Height = 21
                  EditMask = '99/99/99;1; '
                  MaxLength = 8
                  TabOrder = 1
                  Text = '  /  /  '
                  OnKeyDown = fechachequeKeyDown
                end
                object codbanco: TMaskEdit
                  Left = 186
                  Top = 17
                  Width = 28
                  Height = 21
                  EditMask = '999;1; '
                  MaxLength = 3
                  TabOrder = 2
                  Text = '   '
                  OnKeyDown = codbancoKeyDown
                end
                object BuscarBanco: TBitBtn
                  Left = 219
                  Top = 17
                  Width = 20
                  Height = 22
                  Hint = 'Buscar Entidad Bancaria'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = BuscarBancoClick
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
                object montocheque: TEditValid
                  Left = 145
                  Top = 42
                  Width = 72
                  Height = 21
                  TabOrder = 4
                  OnKeyDown = montochequeKeyDown
                  Valid = tvDecimalPos
                end
                object conceptocheque: TMaskEdit
                  Left = 273
                  Top = 42
                  Width = 216
                  Height = 21
                  TabOrder = 5
                  OnKeyDown = conceptochequeKeyDown
                end
              end
              object Panel13: TPanel
                Left = 496
                Top = 3
                Width = 63
                Height = 69
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object btnRegistrarCheque: TButton
                  Left = 5
                  Top = 0
                  Width = 55
                  Height = 21
                  Caption = '&Registrar'
                  Enabled = False
                  TabOrder = 0
                  OnClick = btnRegistrarChequeClick
                end
                object btnCancelarCheque: TButton
                  Left = 5
                  Top = 22
                  Width = 55
                  Height = 21
                  Caption = '&Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelarChequeClick
                end
                object btnGuardarCheques: TButton
                  Left = 5
                  Top = 45
                  Width = 55
                  Height = 23
                  Caption = '&Guardar'
                  Enabled = False
                  TabOrder = 2
                  OnClick = btnGuardarChequesClick
                end
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 562
              Height = 68
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel12: TPanel
                Left = 499
                Top = 0
                Width = 63
                Height = 68
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object btnRegistrarPago: TButton
                  Left = 4
                  Top = 7
                  Width = 55
                  Height = 25
                  Caption = '&Registrar'
                  Enabled = False
                  TabOrder = 0
                  OnClick = btnRegistrarPagoClick
                end
                object btnCancelarPago: TButton
                  Left = 4
                  Top = 34
                  Width = 55
                  Height = 24
                  Caption = '&Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelarPagoClick
                end
              end
              object Panel15: TPanel
                Left = 0
                Top = 0
                Width = 499
                Height = 68
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Panel16: TPanel
                  Left = 0
                  Top = 0
                  Width = 499
                  Height = 25
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label1: TLabel
                    Left = 16
                    Top = 1
                    Width = 23
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Obra'
                  end
                  object osp: TLabel
                    Left = 115
                    Top = 7
                    Width = 66
                    Height = 13
                    Caption = '                      '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label2: TLabel
                    Left = 361
                    Top = 0
                    Width = 35
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Nro. de'
                  end
                  object Label32: TLabel
                    Left = 361
                    Top = 12
                    Width = 37
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Recibo:'
                  end
                  object Label33: TLabel
                    Left = 6
                    Top = 12
                    Width = 32
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Social:'
                  end
                  object codosp: TMaskEdit
                    Left = 42
                    Top = 3
                    Width = 47
                    Height = 21
                    EditMask = '999999;1; '
                    MaxLength = 6
                    TabOrder = 0
                    Text = '      '
                    OnKeyDown = codospKeyDown
                  end
                  object btnBuscarOSP: TBitBtn
                    Left = 92
                    Top = 3
                    Width = 20
                    Height = 22
                    Hint = 'Buscar Obra Social'
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = btnBuscarOSPClick
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
                  object sucursalp: TMaskEdit
                    Left = 400
                    Top = 3
                    Width = 34
                    Height = 21
                    EditMask = '9999;1; '
                    MaxLength = 4
                    TabOrder = 2
                    Text = '    '
                    OnKeyDown = sucursalpKeyDown
                  end
                  object numerop: TMaskEdit
                    Left = 435
                    Top = 3
                    Width = 61
                    Height = 21
                    EditMask = '99999999;1; '
                    MaxLength = 8
                    TabOrder = 3
                    Text = '        '
                    OnKeyDown = numeropKeyDown
                  end
                end
                object Panel17: TPanel
                  Left = 0
                  Top = 25
                  Width = 499
                  Height = 43
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 2
                  TabOrder = 1
                  object GroupBox3: TGroupBox
                    Left = 2
                    Top = 2
                    Width = 495
                    Height = 39
                    Align = alClient
                    Caption = ' Pagos '
                    Enabled = False
                    TabOrder = 0
                    object Label4: TLabel
                      Left = 126
                      Top = 15
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Fecha:'
                    end
                    object Label23: TLabel
                      Left = 18
                      Top = 15
                      Width = 28
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pago:'
                    end
                    object Label24: TLabel
                      Left = 223
                      Top = 15
                      Width = 49
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Concepto:'
                    end
                    object fechap: TMaskEdit
                      Left = 161
                      Top = 12
                      Width = 58
                      Height = 21
                      EditMask = '99/99/99;1; '
                      MaxLength = 8
                      TabOrder = 0
                      Text = '  /  /  '
                      OnKeyDown = fechapKeyDown
                    end
                    object montop: TEditValid
                      Left = 49
                      Top = 12
                      Width = 72
                      Height = 21
                      TabOrder = 1
                      OnKeyDown = montopKeyDown
                      Valid = tvDecimalPos
                    end
                    object conceptop: TMaskEdit
                      Left = 274
                      Top = 12
                      Width = 216
                      Height = 21
                      TabOrder = 2
                      OnKeyDown = conceptopKeyDown
                    end
                  end
                end
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 143
              Width = 562
              Height = 114
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 2
              object P: TStringGrid
                Left = 2
                Top = 2
                Width = 558
                Height = 110
                Align = alClient
                BorderStyle = bsNone
                ColCount = 4
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 500
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
                TabOrder = 0
                OnDblClick = EditarItemsFactura1Click
                ColWidths = (
                  84
                  58
                  314
                  80)
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 260
              Width = 562
              Height = 78
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 3
              object D: TStringGrid
                Left = 2
                Top = 2
                Width = 558
                Height = 74
                Align = alClient
                BorderStyle = bsNone
                ColCount = 7
                DefaultRowHeight = 15
                FixedCols = 0
                RowCount = 500
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
                PopupMenu = PopupMenuCheques
                TabOrder = 0
                OnDblClick = EditarCheque1Click
                OnKeyDown = DKeyDown
                ColWidths = (
                  18
                  72
                  195
                  80
                  202
                  64
                  64)
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Ing/Mod. Facturas'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 350
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox: TScrollBox
          Left = 6
          Top = 6
          Width = 562
          Height = 338
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
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 562
            Height = 121
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Panel5: TPanel
              Left = 0
              Top = 26
              Width = 562
              Height = 95
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel6: TPanel
                Left = 498
                Top = 0
                Width = 64
                Height = 95
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object btnRegistrarF: TButton
                  Left = 1
                  Top = 10
                  Width = 60
                  Height = 24
                  Caption = '&Registrar'
                  Enabled = False
                  TabOrder = 0
                  OnClick = btnRegistrarFClick
                end
                object btnCancelarF: TButton
                  Left = 1
                  Top = 39
                  Width = 60
                  Height = 24
                  Caption = '&Cancelar'
                  TabOrder = 1
                  OnClick = btnCancelarFClick
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 0
                Width = 498
                Height = 95
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 2
                TabOrder = 1
                object GroupBox2: TGroupBox
                  Left = 2
                  Top = 2
                  Width = 494
                  Height = 91
                  Align = alClient
                  Caption = ' Datos de la Factura '
                  Enabled = False
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 289
                    Top = 13
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fecha:'
                  end
                  object Label5: TLabel
                    Left = 33
                    Top = 11
                    Width = 35
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Nro. de'
                  end
                  object Label7: TLabel
                    Left = 184
                    Top = 12
                    Width = 30
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Monto'
                  end
                  object Label8: TLabel
                    Left = 30
                    Top = 23
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Factura:'
                  end
                  object Label9: TLabel
                    Left = 177
                    Top = 24
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Factura:'
                  end
                  object Label11: TLabel
                    Left = 8
                    Top = 63
                    Width = 60
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Observacion'
                  end
                  object Label12: TLabel
                    Left = 295
                    Top = 25
                    Width = 27
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fact.:'
                  end
                  object Label13: TLabel
                    Left = 390
                    Top = 13
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fecha:'
                  end
                  object Label14: TLabel
                    Left = 401
                    Top = 25
                    Width = 22
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Vto.:'
                  end
                  object Label15: TLabel
                    Left = 36
                    Top = 36
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fecha:'
                  end
                  object Label16: TLabel
                    Left = 34
                    Top = 48
                    Width = 35
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '2'#186' Vto.:'
                  end
                  object Label17: TLabel
                    Left = 157
                    Top = 36
                    Width = 33
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Fecha:'
                  end
                  object Label18: TLabel
                    Left = 136
                    Top = 48
                    Width = 54
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Ultimo Vto.:'
                  end
                  object Label19: TLabel
                    Left = 259
                    Top = 37
                    Width = 63
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Por. Recargo'
                  end
                  object Label20: TLabel
                    Left = 279
                    Top = 50
                    Width = 43
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '1er. Vto.:'
                  end
                  object Label21: TLabel
                    Left = 383
                    Top = 37
                    Width = 63
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Por. Recargo'
                  end
                  object Label22: TLabel
                    Left = 400
                    Top = 50
                    Width = 46
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '2do. Vto.:'
                  end
                  object Label10: TLabel
                    Left = 17
                    Top = 74
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Operaci'#243'n:'
                  end
                  object fechaf: TMaskEdit
                    Left = 325
                    Top = 16
                    Width = 55
                    Height = 21
                    EditMask = '99/99/99;1; '
                    MaxLength = 8
                    TabOrder = 0
                    Text = '  /  /  '
                    OnKeyDown = fechafKeyDown
                  end
                  object sucursalf: TMaskEdit
                    Left = 72
                    Top = 14
                    Width = 36
                    Height = 21
                    EditMask = '9999;1; '
                    MaxLength = 4
                    TabOrder = 1
                    Text = '    '
                    OnKeyDown = sucursalfKeyDown
                  end
                  object numerof: TMaskEdit
                    Left = 111
                    Top = 14
                    Width = 61
                    Height = 21
                    EditMask = '99999999;1; '
                    MaxLength = 8
                    TabOrder = 2
                    Text = '        '
                    OnKeyDown = numerofKeyDown
                  end
                  object montof: TEditValid
                    Left = 217
                    Top = 14
                    Width = 69
                    Height = 21
                    TabOrder = 3
                    OnKeyDown = montofKeyDown
                    Valid = tvDecimalPos
                  end
                  object conceptof: TMaskEdit
                    Left = 71
                    Top = 65
                    Width = 416
                    Height = 21
                    TabOrder = 4
                    OnKeyDown = conceptofKeyDown
                  end
                  object fechavto1: TMaskEdit
                    Left = 428
                    Top = 16
                    Width = 58
                    Height = 21
                    EditMask = '99/99/99;1; '
                    MaxLength = 8
                    TabOrder = 5
                    Text = '  /  /  '
                    OnKeyDown = fechavto1KeyDown
                  end
                  object fechavto2: TMaskEdit
                    Left = 71
                    Top = 39
                    Width = 52
                    Height = 21
                    EditMask = '99/99/99;1; '
                    MaxLength = 8
                    TabOrder = 6
                    Text = '  /  /  '
                    OnKeyDown = fechavto2KeyDown
                  end
                  object fechavtou: TMaskEdit
                    Left = 191
                    Top = 39
                    Width = 54
                    Height = 21
                    EditMask = '99/99/99;1; '
                    MaxLength = 8
                    TabOrder = 7
                    Text = '  /  /  '
                    OnKeyDown = fechavtouKeyDown
                  end
                  object recargovto1: TEditValid
                    Left = 325
                    Top = 40
                    Width = 39
                    Height = 21
                    TabOrder = 8
                    OnKeyDown = recargovto1KeyDown
                    Valid = tvDecimalPos
                  end
                  object recargovto2: TEditValid
                    Left = 448
                    Top = 40
                    Width = 39
                    Height = 21
                    TabOrder = 9
                    OnKeyDown = recargovto2KeyDown
                    Valid = tvDecimalPos
                  end
                end
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 562
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label3: TLabel
                Left = 10
                Top = 7
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Obra Social:'
              end
              object osf: TLabel
                Left = 145
                Top = 8
                Width = 66
                Height = 13
                Caption = '                      '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object codosf: TMaskEdit
                Left = 72
                Top = 4
                Width = 47
                Height = 21
                EditMask = '999999;1; '
                MaxLength = 6
                TabOrder = 0
                Text = '      '
                OnKeyDown = codosfKeyDown
              end
              object BuscarObraSocialF: TBitBtn
                Left = 122
                Top = 4
                Width = 20
                Height = 22
                Hint = 'Buscar Obra Social'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BuscarObraSocialFClick
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
          object Panel7: TPanel
            Left = 0
            Top = 121
            Width = 562
            Height = 217
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object F: TStringGrid
              Left = 2
              Top = 2
              Width = 558
              Height = 213
              Align = alClient
              BorderStyle = bsNone
              ColCount = 9
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 500
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              PopupMenu = PopupMenuFacturas
              TabOrder = 0
              OnDblClick = EditarItemsFactura1Click
              ColWidths = (
                87
                51
                83
                55
                54
                57
                42
                40
                165)
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Informes'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 350
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox2: TScrollBox
          Left = 6
          Top = 6
          Width = 562
          Height = 338
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
          object Label37: TLabel
            Left = 8
            Top = 11
            Width = 114
            Height = 13
            Alignment = taRightJustify
            Caption = 'Listar Pagos a la Fecha:'
          end
          object hFecha: TMaskEdit
            Left = 125
            Top = 8
            Width = 65
            Height = 21
            EditMask = '99/99/99;1; '
            MaxLength = 8
            TabOrder = 0
            Text = '  /  /  '
            OnKeyDown = hFechaKeyDown
          end
          object btnObrasSociales: TButton
            Left = 21
            Top = 37
            Width = 169
            Height = 25
            Caption = '&Elecci'#243'n Obras Sociales'
            TabOrder = 1
            OnClick = btnObrasSocialesClick
          end
          object Panel21: TPanel
            Left = 408
            Top = 0
            Width = 154
            Height = 338
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object btnDispositivo: TButton
              Left = 16
              Top = 8
              Width = 129
              Height = 25
              Caption = '&Dispositivo de Salida'
              TabOrder = 0
              OnClick = btnDispositivoClick
            end
            object btnEmitir: TButton
              Left = 16
              Top = 42
              Width = 129
              Height = 25
              Caption = '&Generar Informe'
              TabOrder = 1
            end
            object Panel22: TPanel
              Left = 0
              Top = 288
              Width = 154
              Height = 50
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object Button1: TButton
                Left = 16
                Top = 16
                Width = 129
                Height = 25
                Caption = '&Cerrar'
                TabOrder = 0
                OnClick = Button1Click
              end
            end
          end
          object GroupBox5: TGroupBox
            Left = 8
            Top = 72
            Width = 184
            Height = 81
            Caption = ' Informes '
            TabOrder = 3
            object infPagos: TBorRadio
              Left = 8
              Top = 16
              Width = 121
              Height = 20
              Caption = 'Resumen de Pagos'
              Checked = True
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              TabStop = True
              OnKeyDown = infPagosKeyDown
            end
            object infSaldos: TBorRadio
              Left = 8
              Top = 40
              Width = 121
              Height = 20
              Caption = 'Planilla de Saldos'
              Color = clBtnFace
              ParentColor = False
              TabOrder = 1
              OnKeyDown = infPagosKeyDown
            end
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&Par'#225'metros'
      ImageIndex = 3
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 350
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel2'
        TabOrder = 0
        object ScrollBox3: TScrollBox
          Left = 6
          Top = 6
          Width = 562
          Height = 338
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
          object GroupBox4: TGroupBox
            Left = 7
            Top = 5
            Width = 242
            Height = 96
            Caption = ' Ajustar Definir Numeraci'#243'n Recibos '
            TabOrder = 0
            object Label34: TLabel
              Left = 29
              Top = 22
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Expendio:'
            end
            object Label35: TLabel
              Left = 6
              Top = 48
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ultimo Recibo:'
            end
            object ajExpendio: TMaskEdit
              Left = 79
              Top = 20
              Width = 33
              Height = 21
              EditMask = '9999;1; '
              MaxLength = 4
              TabOrder = 0
              Text = '    '
              OnKeyDown = ajExpendioKeyDown
            end
            object ajRecibo: TMaskEdit
              Left = 79
              Top = 45
              Width = 61
              Height = 21
              EditMask = '99999999;1; '
              MaxLength = 8
              TabOrder = 1
              Text = '        '
              OnKeyDown = ajReciboKeyDown
            end
            object btnAplicarRecibo: TButton
              Left = 176
              Top = 24
              Width = 57
              Height = 25
              Caption = '&Aplicar'
              Enabled = False
              TabOrder = 2
              OnClick = btnAplicarReciboClick
            end
            object editarRecibo: TBorCheck
              Left = 30
              Top = 72
              Width = 147
              Height = 17
              Caption = 'Editar N'#250'mero de Recibo'
              ParentColor = False
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object DTSF: TDataSource
    Left = 512
    Top = 8
  end
  object PopupMenuFacturas: TPopupMenu
    Left = 544
    Top = 8
    object EditarItemsFactura1: TMenuItem
      Caption = 'Editar Items Factura'
      OnClick = EditarItemsFactura1Click
    end
    object BorrarItems1: TMenuItem
      Caption = 'Borrar Items'
      OnClick = BorrarItems1Click
    end
  end
  object PopupMenuCheques: TPopupMenu
    Left = 456
    Top = 272
    object EditarCheque1: TMenuItem
      Caption = 'Editar Cheque'
      OnClick = EditarCheque1Click
    end
    object BorrarCheque1: TMenuItem
      Caption = 'Borrar Cheque'
      OnClick = BorrarCheque1Click
    end
  end
end
