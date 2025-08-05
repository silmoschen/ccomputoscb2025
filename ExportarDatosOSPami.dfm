object fmSoporteMagPAMI: TfmSoporteMagPAMI
  Left = 253
  Top = 119
  Width = 548
  Height = 360
  Caption = 'Generaci'#243'n Datos Soporte Magn'#233'tico'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 314
    Width = 540
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label25: TLabel
      Left = 327
      Top = 4
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Buscar:'
    end
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 0
      Width = 113
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alLeft
      Flat = True
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 366
      Top = 1
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'Nombre'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Nombre'
        'Nro.Doc.')
    end
    object expresion: TMaskEdit
      Left = 442
      Top = 1
      Width = 91
      Height = 21
      TabOrder = 2
      OnChange = expresionChange
      OnKeyDown = expresionKeyDown
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 22
    Width = 540
    Height = 292
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = '&Efector'
      ImageIndex = 1
      OnShow = TabSheet1Show
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 264
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel3: TPanel
          Left = 6
          Top = 6
          Width = 520
          Height = 142
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            Left = 9
            Top = 7
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'C.U.I.T. Efector:'
          end
          object Label7: TLabel
            Left = 191
            Top = 2
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Boca At.'
          end
          object Label8: TLabel
            Left = 34
            Top = 25
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. PAMI'
          end
          object Label9: TLabel
            Left = 261
            Top = 1
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dependencia'
          end
          object Label10: TLabel
            Left = 20
            Top = 53
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Raz'#243'n Social:'
          end
          object Label19: TLabel
            Left = 262
            Top = 15
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Admin. (1 a 8):'
          end
          object Label20: TLabel
            Left = 196
            Top = 15
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Efector:'
          end
          object Label21: TLabel
            Left = 49
            Top = 39
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Efector:'
          end
          object Label34: TLabel
            Left = 254
            Top = 31
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'UGL Efector:'
          end
          object Label37: TLabel
            Left = 28
            Top = 77
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obra Social:'
          end
          object os: TLabel
            Left = 172
            Top = 79
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
          object cuitefector: TMaskEdit
            Left = 91
            Top = 5
            Width = 92
            Height = 21
            EditMask = '99-99999999-9;1; '
            MaxLength = 13
            TabOrder = 1
            Text = '  -        - '
            OnKeyDown = cuitefectorKeyDown
          end
          object bocaefector: TMaskEdit
            Left = 236
            Top = 5
            Width = 21
            Height = 21
            MaxLength = 3
            TabOrder = 2
            OnKeyDown = bocaefectorKeyDown
          end
          object codefector: TMaskEdit
            Left = 91
            Top = 28
            Width = 92
            Height = 21
            MaxLength = 13
            TabOrder = 3
            OnKeyDown = codefectorKeyDown
          end
          object depenefector: TMaskEdit
            Left = 333
            Top = 4
            Width = 21
            Height = 21
            EditMask = '9;1; '
            MaxLength = 1
            TabOrder = 4
            Text = ' '
            OnKeyDown = depenefectorKeyDown
          end
          object rsocialefector: TMaskEdit
            Left = 91
            Top = 51
            Width = 264
            Height = 21
            TabOrder = 5
            OnKeyDown = rsocialefectorKeyDown
          end
          object GroupBox1: TGroupBox
            Left = 5
            Top = 95
            Width = 208
            Height = 44
            Caption = ' Generar Informaci'#243'n '
            TabOrder = 0
            object Label29: TLabel
              Left = 8
              Top = 20
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per'#237'odo:'
            end
            object periodo: TMaskEdit
              Left = 52
              Top = 17
              Width = 52
              Height = 21
              EditMask = '99/9999;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
              OnKeyDown = periodoKeyDown
            end
            object btnProcesar: TButton
              Left = 112
              Top = 15
              Width = 90
              Height = 24
              Caption = '&Procesar Datos'
              Enabled = False
              TabOrder = 1
              OnClick = btnProcesarClick
            end
          end
          object uglefector: TMaskEdit
            Left = 320
            Top = 28
            Width = 34
            Height = 21
            TabOrder = 6
            OnKeyDown = uglefectorKeyDown
          end
          object codos: TMaskEdit
            Left = 91
            Top = 74
            Width = 54
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 7
            Text = '      '
            OnKeyDown = idprofKeyDown
          end
          object BuscarOS: TBitBtn
            Left = 148
            Top = 74
            Width = 20
            Height = 22
            Hint = 'Buscar Obra Social'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
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
          object GroupBox4: TGroupBox
            Left = 215
            Top = 95
            Width = 208
            Height = 44
            Caption = ' Emulaci'#243'n Sistema de Efectores '
            TabOrder = 9
            object Label40: TLabel
              Left = 8
              Top = 20
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per'#237'odo:'
            end
            object periodoemu: TMaskEdit
              Left = 52
              Top = 17
              Width = 52
              Height = 21
              EditMask = '99/9999;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
              OnKeyDown = periodoemuKeyDown
            end
            object btnProcesarEmu: TButton
              Left = 112
              Top = 15
              Width = 90
              Height = 24
              Caption = '&Procesar Datos'
              Enabled = False
              TabOrder = 1
              OnClick = btnProcesarEmuClick
            end
          end
        end
        object Panel4: TPanel
          Left = 6
          Top = 148
          Width = 520
          Height = 110
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel4'
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 2
            Top = 2
            Width = 516
            Height = 106
            Align = alClient
            BorderStyle = bsNone
            DataSource = DTS1
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Profesionales'
      OnShow = TabSheet2Show
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 264
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel6: TPanel
          Left = 6
          Top = 6
          Width = 520
          Height = 166
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 15
            Top = 7
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'C.U.I.T. Prfesional:'
          end
          object Label2: TLabel
            Left = 198
            Top = 7
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Boca Atenci'#243'n Prof.:'
          end
          object Label3: TLabel
            Left = 325
            Top = 7
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. PAMI Profes.:'
          end
          object Label4: TLabel
            Left = 7
            Top = 30
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Documento:'
          end
          object Label5: TLabel
            Left = 340
            Top = 28
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apellido:'
          end
          object Label11: TLabel
            Left = 147
            Top = 29
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Documento:'
          end
          object Label12: TLabel
            Left = 64
            Top = 52
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre:'
          end
          object Label13: TLabel
            Left = 203
            Top = 52
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prestaci'#243'n:'
          end
          object Label14: TLabel
            Left = 384
            Top = 52
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Especialidad:'
          end
          object Label15: TLabel
            Left = 11
            Top = 75
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Matr'#237'cula Nacional:'
          end
          object Label16: TLabel
            Left = 184
            Top = 76
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Matr'#237'cula Provincial:'
          end
          object Label17: TLabel
            Left = 392
            Top = 75
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Nac.:'
          end
          object Label18: TLabel
            Left = 427
            Top = 145
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sexo (1,2,3):'
          end
          object Label27: TLabel
            Left = 23
            Top = 99
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Profesional:'
          end
          object nprof: TLabel
            Left = 193
            Top = 100
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
          object Label41: TLabel
            Left = 77
            Top = 121
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calle:'
          end
          object Label42: TLabel
            Left = 250
            Top = 121
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puerta:'
          end
          object Label43: TLabel
            Left = 58
            Top = 144
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tel'#233'fono:'
          end
          object cuitprof: TMaskEdit
            Left = 107
            Top = 4
            Width = 84
            Height = 21
            EditMask = '99-99999999-9;1; '
            MaxLength = 13
            TabOrder = 0
            Text = '  -        - '
            OnKeyDown = cuitprofKeyDown
          end
          object bocaprof: TMaskEdit
            Left = 299
            Top = 4
            Width = 20
            Height = 21
            MaxLength = 3
            TabOrder = 1
            OnKeyDown = bocaprofKeyDown
          end
          object codprof: TMaskEdit
            Left = 420
            Top = 3
            Width = 91
            Height = 21
            MaxLength = 13
            TabOrder = 2
            OnKeyDown = codprofKeyDown
          end
          object docprof: TMaskEdit
            Left = 107
            Top = 27
            Width = 31
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 3
            TabOrder = 3
            OnKeyDown = docprofKeyDown
          end
          object apellidoprof: TMaskEdit
            Left = 387
            Top = 26
            Width = 125
            Height = 21
            TabOrder = 4
            OnKeyDown = apellidoprofKeyDown
          end
          object nrodocprof: TMaskEdit
            Left = 235
            Top = 27
            Width = 85
            Height = 21
            MaxLength = 13
            TabOrder = 5
            OnKeyDown = nrodocprofKeyDown
          end
          object nombreprof: TMaskEdit
            Left = 107
            Top = 50
            Width = 91
            Height = 21
            TabOrder = 6
            OnKeyDown = nombreprofKeyDown
          end
          object prestacionprof: TMaskEdit
            Left = 259
            Top = 50
            Width = 120
            Height = 21
            TabOrder = 7
            OnKeyDown = prestacionprofKeyDown
          end
          object especialidadprof: TMaskEdit
            Left = 454
            Top = 50
            Width = 59
            Height = 21
            TabOrder = 8
            OnKeyDown = especialidadprofKeyDown
          end
          object matriculanacprof: TMaskEdit
            Left = 107
            Top = 73
            Width = 70
            Height = 21
            TabOrder = 9
            OnKeyDown = matriculanacprofKeyDown
          end
          object matriculaprovprof: TMaskEdit
            Left = 288
            Top = 73
            Width = 91
            Height = 21
            TabOrder = 10
            OnKeyDown = matriculaprovprofKeyDown
          end
          object fechanacprof: TMaskEdit
            Left = 454
            Top = 73
            Width = 59
            Height = 21
            EditMask = '99/99/99;1; '
            MaxLength = 8
            TabOrder = 11
            Text = '  /  /  '
            OnKeyDown = fechanacprofKeyDown
          end
          object sexoprof: TMaskEdit
            Left = 491
            Top = 142
            Width = 22
            Height = 21
            TabOrder = 12
            OnKeyDown = sexoprofKeyDown
          end
          object idprof: TMaskEdit
            Left = 107
            Top = 96
            Width = 59
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 13
            Text = '      '
            OnKeyDown = idprofKeyDown
          end
          object BuscarProf: TBitBtn
            Left = 169
            Top = 96
            Width = 20
            Height = 22
            Hint = 'Buscar Profesional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
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
          object d_calle: TMaskEdit
            Left = 107
            Top = 119
            Width = 125
            Height = 21
            TabOrder = 15
            OnKeyDown = d_calleKeyDown
          end
          object d_puerta: TMaskEdit
            Left = 287
            Top = 119
            Width = 91
            Height = 21
            TabOrder = 16
            OnKeyDown = d_puertaKeyDown
          end
          object telefono: TMaskEdit
            Left = 107
            Top = 142
            Width = 125
            Height = 21
            TabOrder = 17
            OnKeyDown = telefonoKeyDown
          end
        end
        object Panel7: TPanel
          Left = 6
          Top = 172
          Width = 520
          Height = 86
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel4'
          TabOrder = 1
          object DBGrid2: TDBGrid
            Left = 2
            Top = 2
            Width = 516
            Height = 82
            Align = alClient
            BorderStyle = bsNone
            DataSource = DTS2
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid2DblClick
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Afiliados'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 264
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel9: TPanel
          Left = 6
          Top = 6
          Width = 520
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label22: TLabel
            Left = 370
            Top = 14
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Beneficio:'
          end
          object Label23: TLabel
            Left = 169
            Top = 2
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grado de'
          end
          object Label26: TLabel
            Left = 12
            Top = 34
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre:'
          end
          object Label28: TLabel
            Left = 159
            Top = 15
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Parentesco:'
          end
          object Label30: TLabel
            Left = 255
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de'
          end
          object Label31: TLabel
            Left = 254
            Top = 15
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Docum.:'
          end
          object Label32: TLabel
            Left = 12
            Top = 15
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Docum.:'
          end
          object Label33: TLabel
            Left = 14
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. de'
          end
          object Label24: TLabel
            Left = 382
            Top = 1
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. de'
          end
          object nrobeneficioafil: TMaskEdit
            Left = 422
            Top = 4
            Width = 92
            Height = 21
            MaxLength = 13
            TabOrder = 1
            OnKeyDown = nrobeneficioafilKeyDown
          end
          object gradoparenafil: TMaskEdit
            Left = 219
            Top = 5
            Width = 21
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnKeyDown = gradoparenafilKeyDown
          end
          object nombreafil: TMaskEdit
            Left = 55
            Top = 31
            Width = 272
            Height = 21
            TabOrder = 3
            OnKeyDown = nombreafilKeyDown
          end
          object tipodocafil: TMaskEdit
            Left = 298
            Top = 5
            Width = 28
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnKeyDown = tipodocafilKeyDown
          end
          object nrodocafil: TMaskEdit
            Left = 55
            Top = 5
            Width = 99
            Height = 21
            TabOrder = 0
            OnKeyDown = nrodocafilKeyDown
          end
        end
        object Panel10: TPanel
          Left = 6
          Top = 62
          Width = 520
          Height = 196
          Align = alClient
          BevelInner = bvLowered
          Caption = 'Panel4'
          TabOrder = 1
          object DBGrid3: TDBGrid
            Left = 2
            Top = 2
            Width = 516
            Height = 192
            Align = alClient
            BorderStyle = bsNone
            DataSource = DTS3
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid3DblClick
            OnKeyDown = DBGrid3KeyDown
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&Consultar Datos'
      ImageIndex = 3
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 264
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel12: TPanel
          Left = 6
          Top = 6
          Width = 101
          Height = 252
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Label35: TLabel
            Left = 33
            Top = 175
            Width = 55
            Height = 13
            Caption = 'Nros. Audit.'
          end
          object Label36: TLabel
            Left = 8
            Top = 189
            Width = 80
            Height = 13
            Caption = 'No Encontrados:'
          end
          object Button1: TButton
            Left = 5
            Top = 5
            Width = 95
            Height = 25
            Caption = '&Afiliados'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 5
            Top = 31
            Width = 95
            Height = 25
            Caption = '&Operaciones'
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 5
            Top = 57
            Width = 95
            Height = 25
            Caption = '&Profesionales'
            TabOrder = 2
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 5
            Top = 83
            Width = 95
            Height = 25
            Caption = '&Efectores'
            TabOrder = 3
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 4
            Top = 206
            Width = 95
            Height = 25
            Caption = '&List. Rechazados'
            TabOrder = 4
            OnClick = Button5Click
          end
        end
        object Panel13: TPanel
          Left = 107
          Top = 6
          Width = 419
          Height = 252
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel14: TPanel
            Left = 0
            Top = 168
            Width = 419
            Height = 84
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object S: TStringGrid
              Left = 2
              Top = 2
              Width = 415
              Height = 80
              Align = alClient
              BorderStyle = bsNone
              ColCount = 1
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 5000
              TabOrder = 0
              ColWidths = (
                152)
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 168
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object DBGrid4: TDBGrid
              Left = 2
              Top = 2
              Width = 415
              Height = 164
              Align = alClient
              BorderStyle = bsNone
              DataSource = DTS4
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
              OnKeyDown = DBGrid3KeyDown
            end
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Par'#225'metros'
      ImageIndex = 5
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 532
        Height = 264
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 12
          Top = 8
          Width = 117
          Height = 129
          Caption = ' C'#243'digos a Excluir '
          TabOrder = 0
          object Label38: TLabel
            Left = 10
            Top = 18
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object codigo1: TMaskEdit
            Left = 50
            Top = 15
            Width = 57
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 0
            Text = '      '
            OnKeyDown = codigo1KeyDown
          end
          object ListBox1: TListBox
            Left = 8
            Top = 40
            Width = 100
            Height = 81
            ItemHeight = 13
            TabOrder = 1
            OnKeyDown = ListBox1KeyDown
          end
        end
        object GroupBox3: TGroupBox
          Left = 136
          Top = 8
          Width = 117
          Height = 129
          Caption = ' C'#243'digos a Incluir  '
          TabOrder = 1
          object Label39: TLabel
            Left = 10
            Top = 18
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object codigo2: TMaskEdit
            Left = 50
            Top = 15
            Width = 57
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 0
            Text = '      '
            OnKeyDown = codigo2KeyDown
          end
          object ListBox2: TListBox
            Left = 8
            Top = 40
            Width = 100
            Height = 81
            ItemHeight = 13
            TabOrder = 1
            OnKeyDown = ListBox2KeyDown
          end
        end
      end
    end
  end
  object DTS1: TDataSource
    Left = 288
    Top = 248
  end
  object DTS2: TDataSource
    Left = 328
    Top = 248
  end
  object DTS3: TDataSource
    Left = 368
    Top = 248
  end
  object DTS4: TDataSource
    Left = 224
    Top = 248
  end
end
