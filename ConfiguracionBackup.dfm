object fmConfigBackup: TfmConfigBackup
  Left = 292
  Top = 152
  Width = 333
  Height = 157
  BorderStyle = bsSizeToolWin
  Caption = 'Configuraci'#243'n del Backup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 130
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 313
      Height = 118
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
      object Label12: TLabel
        Left = 18
        Top = 2
        Width = 159
        Height = 13
        Caption = 'Realizar Backup en la Modalidad:'
      end
      object Label13: TLabel
        Left = 16
        Top = 97
        Width = 201
        Height = 13
        Caption = 'Conservar las copias de seguridad durante'
      end
      object Label14: TLabel
        Left = 254
        Top = 98
        Width = 24
        Height = 13
        Caption = 'd'#237'as.'
      end
      object diasback: TEditValid
        Left = 224
        Top = 94
        Width = 25
        Height = 21
        MaxLength = 2
        TabOrder = 0
        Text = '7'
        Valid = tvEnteroPos
      end
      object OK: TButton
        Left = 257
        Top = 61
        Width = 51
        Height = 25
        Caption = '&OK'
        TabOrder = 1
        OnClick = OKClick
      end
      object manual: TRadioButton
        Left = 179
        Top = 17
        Width = 134
        Height = 17
        Caption = '&Al salir de la Aplicaci'#243'n'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object alsalir: TRadioButton
        Left = 179
        Top = 38
        Width = 113
        Height = 17
        Caption = '&En forma Manual'
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 17
        Width = 129
        Height = 78
        Caption = ' M'#243'dulos a Respaldar '
        TabOrder = 4
        object Auditoria: TCheckBox
          Left = 8
          Top = 34
          Width = 73
          Height = 17
          Caption = '&Auditor'#237'a'
          TabOrder = 0
        end
        object Distribucion: TCheckBox
          Left = 8
          Top = 53
          Width = 97
          Height = 17
          Caption = '&Distribuci'#243'n'
          TabOrder = 1
        end
        object Facturacion: TCheckBox
          Left = 8
          Top = 16
          Width = 89
          Height = 17
          Caption = '&Facturaci'#243'n'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
  end
end
