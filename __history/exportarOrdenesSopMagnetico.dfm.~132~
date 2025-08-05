object fmExportarOrdenesSoporteMagnetico: TfmExportarOrdenesSoporteMagnetico
  Left = 0
  Top = 0
  Caption = 'Exportaci'#243'n Facturaci'#243'n Soporte Magn'#233'tico'
  ClientHeight = 437
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 56
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 418
    Width = 579
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 579
    Height = 418
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Exportaci'#243'n por Obra Social'
      object TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 390
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel1: TPanel
          Left = 6
          Top = 6
          Width = 559
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 31
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'O. Social:'
          end
          object Label28: TLabel
            Left = 22
            Top = 7
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object listaOS: TComboBox
            Left = 66
            Top = 29
            Width = 311
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = listaOSChange
          end
          object idos: TComboBox
            Left = 233
            Top = 29
            Width = 49
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            Text = 'listaOS'
            Visible = False
          end
          object Panel2: TPanel
            Left = 398
            Top = 0
            Width = 161
            Height = 55
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object btnMontos: TButton
              Left = 2
              Top = 6
              Width = 153
              Height = 25
              Caption = '&Recalcular Montos'
              TabOrder = 0
              OnClick = btnMontosClick
            end
          end
          object periodo: TMaskEdit
            Left = 66
            Top = 4
            Width = 57
            Height = 21
            EditMask = '99/9999;1; '
            MaxLength = 7
            TabOrder = 3
            Text = '  /    '
            OnKeyDown = periodoKeyDown
          end
          object idregla: TComboBox
            Left = 328
            Top = 4
            Width = 49
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            Text = 'listaOS'
            Visible = False
          end
        end
        object Panel3: TPanel
          Left = 6
          Top = 61
          Width = 559
          Height = 323
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 1
          object Panel5: TPanel
            Left = 0
            Top = 218
            Width = 559
            Height = 105
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Label2: TLabel
              Left = 15
              Top = 7
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo y N'#250'mero'
            end
            object Label3: TLabel
              Left = 5
              Top = 20
              Width = 81
              Height = 13
              Alignment = taRightJustify
              Caption = 'de Comprobante:'
            end
            object Label4: TLabel
              Left = 51
              Top = 39
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha:'
            end
            object Label7: TLabel
              Left = 35
              Top = 81
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Selecci'#243'n:'
            end
            object sucursal: TMaskEdit
              Left = 125
              Top = 10
              Width = 41
              Height = 21
              EditMask = '9999;1; '
              MaxLength = 4
              TabOrder = 0
              Text = '    '
              OnKeyDown = sucursalKeyDown
            end
            object numero: TMaskEdit
              Left = 173
              Top = 10
              Width = 86
              Height = 21
              EditMask = '99999999;1; '
              MaxLength = 8
              TabOrder = 1
              Text = '        '
              OnKeyDown = numeroKeyDown
            end
            object Panel7: TPanel
              Left = 376
              Top = 0
              Width = 183
              Height = 105
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object Label5: TLabel
                Left = 4
                Top = 7
                Width = 27
                Height = 13
                Caption = 'Total:'
              end
              object totalfact: TLabel
                Left = 166
                Top = 7
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Left = 4
                Top = 25
                Width = 66
                Height = 13
                Caption = 'Total Archivo:'
              end
              object montoexport: TLabel
                Left = 166
                Top = 25
                Width = 6
                Height = 13
                Alignment = taRightJustify
                Caption = '0'
              end
              object btnEnviar: TButton
                Left = 4
                Top = 75
                Width = 168
                Height = 25
                Caption = '&Generar Archivo Exportaci'#243'n'
                Enabled = False
                TabOrder = 0
                OnClick = btnEnviarClick
              end
              object btnAll: TButton
                Left = 4
                Top = 46
                Width = 168
                Height = 25
                Caption = 'Aplicar Fecha y Compr a ...'
                TabOrder = 1
                OnClick = btnAllClick
              end
            end
            object tipo: TMaskEdit
              Left = 90
              Top = 10
              Width = 27
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 1
              TabOrder = 3
              OnKeyDown = tipoKeyDown
            end
            object fecha: TMaskEdit
              Left = 90
              Top = 37
              Width = 75
              Height = 21
              EditMask = '99/99/99;1; '
              MaxLength = 8
              TabOrder = 4
              Text = '  /  /  '
              OnKeyDown = fechaKeyDown
            end
            object listProfesionales: TComboBox
              Left = 89
              Top = 79
              Width = 264
              Height = 21
              ItemHeight = 13
              TabOrder = 5
              OnChange = listProfesionalesChange
            end
            object listprof: TComboBox
              Left = 256
              Top = 79
              Width = 49
              Height = 21
              ItemHeight = 13
              TabOrder = 6
              Text = 'listaProf'
              Visible = False
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 559
            Height = 218
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object A: TStringGrid
              Left = 2
              Top = 2
              Width = 555
              Height = 214
              Align = alClient
              BorderStyle = bsNone
              ColCount = 14
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 50000
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
              TabOrder = 0
              OnDblClick = ADblClick
              ColWidths = (
                68
                96
                96
                49
                81
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Exportaci'#243'n por Regla'
      ImageIndex = 1
      object TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 390
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object reglasExport: TComboBox
          Left = 16
          Top = 16
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'FE SALUD (Regla 10)'
          OnChange = reglasExportChange
          Items.Strings = (
            'FE SALUD (Regla 10)')
        end
        object reglaNumero: TComboBox
          Left = 16
          Top = 43
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = '10'
          Visible = False
          Items.Strings = (
            'FE SALUD (Regla 10)')
        end
        object Panel4: TPanel
          Left = 400
          Top = 6
          Width = 165
          Height = 378
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object btnProcesarExportacion: TButton
            Left = 4
            Top = 8
            Width = 153
            Height = 25
            Caption = '&Procesar Exportaci'#243'n'
            TabOrder = 0
            OnClick = btnProcesarExportacionClick
          end
          object btnMostrarDatos: TButton
            Left = 4
            Top = 39
            Width = 153
            Height = 25
            Caption = '&Mostrar Datos'
            TabOrder = 1
            OnClick = btnMostrarDatosClick
          end
          object btnGenerarArch: TButton
            Left = 4
            Top = 79
            Width = 153
            Height = 25
            Caption = '&Generar Archivo Exportaci'#243'n'
            Enabled = False
            TabOrder = 2
            OnClick = btnGenerarArchClick
          end
        end
      end
    end
  end
end
