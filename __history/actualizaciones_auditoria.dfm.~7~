object fmActualizacionesAuditoria: TfmActualizacionesAuditoria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exportar Actualizaciones Sist. Auditor'#237'a'
  ClientHeight = 437
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 418
    Width = 579
    Height = 19
    Panels = <
      item
        Width = 463
      end
      item
        Width = 116
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 579
    Height = 418
    ActivePage = TabSheetSincronizar
    Align = alClient
    TabOrder = 1
    object TabSheetSincronizar: TTabSheet
      Caption = 'Sincronizar'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelSincronizar: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 390
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object chkNBUIndividual: TCheckBox
          Left = 16
          Top = 16
          Width = 220
          Height = 17
          Caption = 'NBU Individual Obra Social'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkUnidadesNBU: TCheckBox
          Left = 16
          Top = 40
          Width = 280
          Height = 17
          Caption = 'Unidades NBU Obra Social Individual'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object PanelBotones: TPanel
          Left = 6
          Top = 343
          Width = 559
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object btnProcesar: TButton
            Left = 8
            Top = 8
            Width = 193
            Height = 25
            Caption = 'Procesar Datos a Actualizar'
            TabOrder = 0
            OnClick = btnProcesarClick
          end
          object btnIniciar: TButton
            Left = 208
            Top = 8
            Width = 217
            Height = 25
            Caption = 'Iniciar Proceso de Transferencia'
            TabOrder = 1
            OnClick = btnIniciarClick
          end
        end
      end
    end
    object TabSheetParametros: TTabSheet
      Caption = 'Par'#225'metros'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PanelParametros: TPanel
        Left = 0
        Top = 0
        Width = 571
        Height = 390
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object GroupBoxTipo: TGroupBox
          Left = 11
          Top = 10
          Width = 286
          Height = 44
          Caption = ' Tipo de Transferencia '
          TabOrder = 0
          object tsftp: TRadioButton
            Left = 24
            Top = 19
            Width = 65
            Height = 17
            Caption = 'SFTP'
            TabOrder = 0
            OnClick = tsftpClick
          end
          object tftp: TRadioButton
            Left = 168
            Top = 19
            Width = 57
            Height = 17
            Caption = 'FTP'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = tftpClick
          end
        end
        object btnAplicar: TButton
          Left = 322
          Top = 17
          Width = 57
          Height = 25
          Caption = '&Aplicar'
          TabOrder = 1
          OnClick = btnAplicarClick
        end
        object GroupBoxRemoto: TGroupBox
          Left = 11
          Top = 64
          Width = 368
          Height = 181
          Caption = ' Par'#225'metros Procesamiento de Datos Remotos '
          TabOrder = 2
          object LabelHost: TLabel
            Left = 8
            Top = 24
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Host Remoto:'
          end
          object LabelFtp: TLabel
            Left = 10
            Top = 50
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'FTP Remoto:'
          end
          object LabelUsuario: TLabel
            Left = 11
            Top = 77
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario FTP:'
          end
          object LabelPassword: TLabel
            Left = 203
            Top = 77
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Password:'
          end
          object LabelPuerto: TLabel
            Left = 39
            Top = 102
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puerto:'
          end
          object LabelDir: TLabel
            Left = 14
            Top = 136
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dir. Remoto:'
          end
          object host: TMaskEdit
            Left = 76
            Top = 21
            Width = 277
            Height = 21
            TabOrder = 0
            Text = 'http://localhost'
          end
          object ftp: TMaskEdit
            Left = 76
            Top = 47
            Width = 277
            Height = 21
            TabOrder = 1
            Text = 'ftp.centrobq.com.ar'
          end
          object usuario: TMaskEdit
            Left = 76
            Top = 74
            Width = 98
            Height = 21
            TabOrder = 2
            Text = 'actualizar'
          end
          object contrasenia: TMaskEdit
            Left = 255
            Top = 74
            Width = 98
            Height = 21
            PasswordChar = '*'
            TabOrder = 3
            Text = 'actualizar'
          end
          object puerto: TMaskEdit
            Left = 76
            Top = 99
            Width = 98
            Height = 21
            TabOrder = 4
            Text = '22'
          end
          object dirremoto: TMaskEdit
            Left = 76
            Top = 133
            Width = 277
            Height = 21
            TabOrder = 5
          end
          object ftpPasivo: TCheckBox
            Left = 76
            Top = 157
            Width = 117
            Height = 17
            Caption = 'FTP Modo Pasivo'
            Checked = True
            State = cbChecked
            TabOrder = 6
          end
        end
      end
    end
  end
end
