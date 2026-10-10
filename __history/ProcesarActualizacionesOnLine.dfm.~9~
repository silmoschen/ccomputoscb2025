object fmActualizacionesOnline: TfmActualizacionesOnline
  Left = 263
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exportar Datos para Actualizaciones de Sistemas'
  ClientHeight = 272
  ClientWidth = 374
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
    Top = 253
    Width = 374
    Height = 19
    Panels = <
      item
        Width = 320
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 374
    Height = 253
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Servicio'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 366
        Height = 225
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        OnResize = Panel1Resize
        object Panel3: TPanel
          Left = 6
          Top = 6
          Width = 354
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel4: TPanel
            Left = 0
            Top = 139
            Width = 354
            Height = 74
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object estado: TMemo
              Left = 2
              Top = 2
              Width = 350
              Height = 70
              Align = alClient
              BorderStyle = bsNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 354
            Height = 139
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label26: TLabel
              Left = 9
              Top = 54
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidad a Exportar:'
            end
            object procesar: TButton
              Left = 6
              Top = 2
              Width = 169
              Height = 25
              Caption = '&Procesar Datos a Actualizar'
              TabOrder = 0
              OnClick = procesarClick
            end
            object transferir: TButton
              Left = 6
              Top = 112
              Width = 169
              Height = 25
              Caption = '&Iniciar Proceso de Transferencia'
              Enabled = False
              TabOrder = 1
              OnClick = transferirClick
            end
            object Panel11: TPanel
              Left = 280
              Top = 0
              Width = 74
              Height = 139
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object cerrar: TButton
                Left = 6
                Top = 5
                Width = 65
                Height = 25
                Caption = '&Cerrar'
                TabOrder = 0
                OnClick = cerrarClick
              end
            end
            object DriveComboBox: TDriveComboBox
              Left = 100
              Top = 53
              Width = 136
              Height = 19
              Enabled = False
              TabOrder = 3
            end
            object RadioButton1: TRadioButton
              Left = 6
              Top = 33
              Width = 169
              Height = 17
              Caption = '&Generar Disco de Distribuci'#243'n'
              Enabled = False
              TabOrder = 4
              OnClick = RadioButton1Click
            end
            object RadioButton2: TRadioButton
              Left = 6
              Top = 74
              Width = 243
              Height = 17
              Caption = '&Enviar Actualizaci'#243'n a Servidor FTP/NTFS'
              Checked = True
              Enabled = False
              TabOrder = 5
              TabStop = True
            end
            object RadioButton3: TRadioButton
              Left = 6
              Top = 92
              Width = 209
              Height = 17
              Caption = 'Enviar &Actualizaci'#243'n por Email'
              Enabled = False
              TabOrder = 6
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Configuraciones'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 366
        Height = 225
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 12
          Top = 9
          Width = 233
          Height = 121
          Caption = ' Conexi'#243'n '
          TabOrder = 0
          object Label1: TLabel
            Left = 52
            Top = 20
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Host:'
          end
          object Label2: TLabel
            Left = 38
            Top = 69
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario:'
          end
          object Label3: TLabel
            Left = 28
            Top = 94
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Password:'
          end
          object Label6: TLabel
            Left = 6
            Top = 44
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Directorio FTP:'
          end
          object ftphost: TMaskEdit
            Left = 80
            Top = 17
            Width = 143
            Height = 21
            TabOrder = 0
          end
          object usuario: TMaskEdit
            Left = 80
            Top = 66
            Width = 143
            Height = 21
            TabOrder = 1
          end
          object contrasenia: TMaskEdit
            Left = 80
            Top = 91
            Width = 143
            Height = 21
            PasswordChar = '*'
            TabOrder = 2
          end
          object dirftp: TMaskEdit
            Left = 80
            Top = 41
            Width = 143
            Height = 21
            TabOrder = 3
          end
        end
        object Panel6: TPanel
          Left = 273
          Top = 6
          Width = 87
          Height = 213
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Button1: TButton
            Left = 7
            Top = 8
            Width = 75
            Height = 25
            Caption = '&Aplicar'
            TabOrder = 0
            OnClick = Button1Click
          end
        end
        object conexiondirecta: TCheckBox
          Left = 13
          Top = 168
          Width = 236
          Height = 17
          Caption = 'Conexi'#243'n Directa (ADSL, CableModem, etc.)'
          TabOrder = 2
        end
        object CheckBox4: TCheckBox
          Left = 12
          Top = 143
          Width = 123
          Height = 17
          Caption = 'Conf. Servidor S&MTP'
          TabOrder = 3
          OnClick = CheckBox4Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Est'#225'ndares Acompa'#241'antes'
      ImageIndex = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 366
        Height = 225
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel8: TPanel
          Left = 6
          Top = 51
          Width = 354
          Height = 168
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object editarXML: TMemo
            Left = 2
            Top = 2
            Width = 350
            Height = 164
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 6
          Top = 6
          Width = 354
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 7
            Top = 3
            Width = 162
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hojas de Estilo para Presentaci'#243'n:'
          end
          object Label5: TLabel
            Left = 7
            Top = 23
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Documento:'
          end
          object documentoXML: TComboBox
            Left = 68
            Top = 20
            Width = 176
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = documentoXMLChange
            Items.Strings = (
              'Determinaciones con Monto Fijo'
              'Padr'#243'n de Obras Sociales'
              'Aranceles de Obras Sociales'
              'Aranceles del Nomeclador')
          end
          object Panel10: TPanel
            Left = 244
            Top = 0
            Width = 110
            Height = 45
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object CheckBox1: TCheckBox
              Left = 6
              Top = 2
              Width = 101
              Height = 17
              Caption = '&Modif. Estructura'
              TabOrder = 0
              OnClick = CheckBox1Click
            end
            object aplicar: TButton
              Left = 7
              Top = 21
              Width = 68
              Height = 22
              Caption = '&Aplicar'
              TabOrder = 1
              OnClick = aplicarClick
            end
          end
        end
      end
    end
  end
  object IdFTP1: TIdFTP
    AutoLogin = True
    Passive = True
    Password = 'idftp@client.com'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 288
    Top = 184
  end
  object IdAntiFreeze1: TIdAntiFreeze
    IdleTimeOut = 50
    OnlyWhenIdle = False
    Left = 320
    Top = 184
  end
  object IdLogDebug1: TIdLogDebug
    LogTime = False
    Left = 256
    Top = 184
  end
end
