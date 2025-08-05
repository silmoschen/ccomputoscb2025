object fmFactOnLine: TfmFactOnLine
  Left = 0
  Top = 0
  Caption = 'Facturaci'#243'n Ordenes On Line de Obras Sociales'
  ClientHeight = 472
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 453
    Width = 670
    Height = 19
    Panels = <
      item
        Width = 285
      end
      item
        Text = 'F5 Buscar'
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 670
    Height = 453
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Procesamiento de Ordenes'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 662
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel2: TPanel
          Left = 6
          Top = 6
          Width = 650
          Height = 129
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            Left = 340
            Top = 77
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object Label5: TLabel
            Left = 441
            Top = 77
            Width = 54
            Height = 13
            Caption = '(a Facturar)'
          end
          object estado: TLabel
            Left = 96
            Top = 59
            Width = 3
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 37
            Top = 77
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Laboratorio'
          end
          object Label3: TLabel
            Left = 3
            Top = 104
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden de Auditoria'
          end
          object Label7: TLabel
            Left = 35
            Top = 88
            Width = 54
            Height = 13
            Caption = '(a Facturar)'
          end
          object Panel3: TPanel
            Left = 512
            Top = 0
            Width = 138
            Height = 129
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Si: TSpeedButton
              Left = 75
              Top = 72
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
              Left = 93
              Top = 72
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
              Left = 111
              Top = 72
              Width = 18
              Height = 25
              Hint = 'Seleccionar Todos'
              Caption = '&T'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = TodosClick
            end
            object btnCerrar: TButton
              Left = 9
              Top = 36
              Width = 120
              Height = 25
              Caption = 'Cerrar'
              TabOrder = 0
              OnClick = btnCerrarClick
            end
            object btnFacturar: TButton
              Left = 9
              Top = 6
              Width = 120
              Height = 25
              Caption = 'Facturar Ordenes'
              Enabled = False
              TabOrder = 1
              OnClick = btnFacturarClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 0
            Width = 297
            Height = 51
            Caption = 'Recuperar Ordenes '
            TabOrder = 1
            object Label1: TLabel
              Left = 12
              Top = 24
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde:'
            end
            object Label2: TLabel
              Left = 122
              Top = 24
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta Fecha:'
            end
            object SpeedButton1: TSpeedButton
              Left = 265
              Top = 19
              Width = 18
              Height = 25
              Hint = 'Recargar Ordenes'
              Caption = '?'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton1Click
            end
            object hasta: TMaskEdit
              Left = 191
              Top = 21
              Width = 69
              Height = 21
              EditMask = '99/99/99;1; '
              MaxLength = 8
              TabOrder = 0
              Text = '  /  /  '
              OnKeyDown = hastaKeyDown
            end
            object desde: TMaskEdit
              Left = 50
              Top = 21
              Width = 69
              Height = 21
              EditMask = '99/99/99;1; '
              MaxLength = 8
              TabOrder = 1
              Text = '  /  /  '
              OnKeyDown = desdeKeyDown
            end
          end
          object periodo: TMaskEdit
            Left = 386
            Top = 74
            Width = 51
            Height = 21
            EditMask = '99/9999;1; '
            MaxLength = 7
            TabOrder = 2
            Text = '  /    '
            OnClick = periodoClick
            OnKeyDown = periodoKeyDown
          end
          object btnDescargar: TButton
            Left = 311
            Top = 5
            Width = 134
            Height = 25
            Caption = 'Descargar Ordenes'
            TabOrder = 3
            OnClick = btnDescargarClick
          end
          object listLaboratorio: TComboBox
            Left = 96
            Top = 74
            Width = 239
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            OnChange = listLaboratorioChange
          end
          object listCodigo: TComboBox
            Left = 267
            Top = 74
            Width = 42
            Height = 21
            ItemHeight = 13
            TabOrder = 5
            Visible = False
          end
          object btnFiltrarOs: TButton
            Left = 312
            Top = 33
            Width = 133
            Height = 28
            Caption = 'Filtrar Obras Sociales'
            TabOrder = 6
            OnClick = btnFiltrarOsClick
          end
          object txtBuscar: TEdit
            Left = 96
            Top = 99
            Width = 236
            Height = 21
            TabOrder = 7
            OnChange = txtBuscarChange
            OnKeyDown = txtBuscarKeyDown
          end
          object Button1: TButton
            Left = 339
            Top = 99
            Width = 125
            Height = 25
            Caption = 'Buscar'
            TabOrder = 8
            OnClick = Button1Click
          end
        end
        object TPanel
          Left = 6
          Top = 135
          Width = 650
          Height = 284
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object P: TStringGrid
            Left = 2
            Top = 2
            Width = 646
            Height = 280
            Align = alClient
            BorderStyle = bsNone
            ColCount = 7
            Ctl3D = True
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 2500
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnKeyDown = PKeyDown
            ColWidths = (
              117
              68
              68
              15
              259
              64
              64)
          end
          object C: TStringGrid
            Left = 224
            Top = 136
            Width = 406
            Height = 113
            BorderStyle = bsNone
            ColCount = 15
            Ctl3D = True
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 100000
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Visible = False
            ColWidths = (
              51
              62
              58
              63
              64
              64
              64
              64
              64
              64
              64
              64
              64
              64
              64)
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Par'#225'metros'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 662
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 16
          Top = 14
          Width = 425
          Height = 129
          Caption = ' Par'#225'metros '
          TabOrder = 0
          object Label8: TLabel
            Left = 42
            Top = 18
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Host:'
          end
          object Label9: TLabel
            Left = 44
            Top = 45
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'FTP:'
          end
          object Label10: TLabel
            Left = 28
            Top = 72
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario:'
          end
          object Label11: TLabel
            Left = 10
            Top = 99
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contrase'#241'a:'
          end
          object host: TEdit
            Left = 73
            Top = 15
            Width = 328
            Height = 21
            TabOrder = 0
            Text = 'http://www.centrobq.com.ar'
          end
          object ftp: TEdit
            Left = 73
            Top = 42
            Width = 328
            Height = 21
            TabOrder = 1
            Text = 'ftp.centrobq.com.ar'
          end
          object usuario: TEdit
            Left = 73
            Top = 69
            Width = 208
            Height = 21
            TabOrder = 2
            Text = 'actualizar@centrobq.com.ar'
          end
          object pass: TMaskEdit
            Left = 73
            Top = 98
            Width = 208
            Height = 21
            PasswordChar = '*'
            TabOrder = 3
            Text = 'Centrobq09'
          end
        end
        object btnAplicarCambios: TButton
          Left = 465
          Top = 14
          Width = 120
          Height = 25
          Caption = 'Aplicar Cambios'
          TabOrder = 1
          OnClick = btnAplicarCambiosClick
        end
      end
    end
  end
  object IdLogDebug1: TIdLogDebug
    LogTime = False
    Left = 488
    Top = 142
  end
  object IdFTP1: TIdFTP
    AutoLogin = True
    Passive = True
    Password = 'idftp@client.com'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 520
    Top = 142
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 552
    Top = 142
  end
end
