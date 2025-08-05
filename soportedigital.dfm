object fmSoporteDigital: TfmSoporteDigital
  Left = 0
  Top = 0
  Caption = 'Exportaci'#243'n Datos Soporte Digital'
  ClientHeight = 341
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 322
    Width = 573
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
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 573
    Height = 322
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 55
      Top = 290
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'V'#237'a:'
    end
    object Label4: TLabel
      Left = 35
      Top = 21
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
    end
    object Label5: TLabel
      Left = 137
      Top = 21
      Width = 54
      Height = 13
      Caption = '(a Exportar)'
    end
    object estado: TLabel
      Left = 82
      Top = 34
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
      Left = 18
      Top = 52
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obra Social:'
    end
    object Label2: TLabel
      Left = 21
      Top = 114
      Width = 189
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comprobante (Tipo - Sucursal - N'#250'mero)'
    end
    object Edit1: TEdit
      Left = 81
      Top = 287
      Width = 328
      Height = 21
      TabOrder = 0
    end
    object periodo: TMaskEdit
      Left = 82
      Top = 18
      Width = 51
      Height = 21
      EditMask = '99/9999;1; '
      MaxLength = 7
      TabOrder = 1
      Text = '  /    '
    end
    object listObraSocial: TComboBox
      Left = 82
      Top = 49
      Width = 239
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = listObraSocialChange
    end
    object listCodigo: TComboBox
      Left = 252
      Top = 76
      Width = 42
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object Panel3: TPanel
      Left = 429
      Top = 6
      Width = 138
      Height = 310
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
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
        Caption = 'Generar Archivo'
        TabOrder = 1
      end
    end
    object tipo: TMaskEdit
      Left = 81
      Top = 133
      Width = 32
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 1
      TabOrder = 5
    end
    object sucursal: TMaskEdit
      Left = 119
      Top = 133
      Width = 49
      Height = 21
      EditMask = '9999;1; '
      MaxLength = 4
      TabOrder = 6
      Text = '    '
    end
    object numero: TMaskEdit
      Left = 173
      Top = 133
      Width = 121
      Height = 21
      EditMask = '99999999;1; '
      MaxLength = 8
      TabOrder = 7
      Text = '        '
    end
    object listRegla: TComboBox
      Left = 260
      Top = 84
      Width = 42
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      Visible = False
    end
  end
end
