object fmInformesAdicionales: TfmInformesAdicionales
  Left = 268
  Top = 174
  Width = 430
  Height = 312
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Informes Adicionales'
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
    Top = 266
    Width = 422
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 266
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 1
    OnResize = Panel1Resize
    object Panel2: TPanel
      Left = 292
      Top = 6
      Width = 124
      Height = 254
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnDispositivo: TButton
        Left = 4
        Top = 9
        Width = 117
        Height = 25
        Caption = '&Dispositivo de Salida'
        TabOrder = 0
        OnClick = btnDispositivoClick
      end
      object emitir: TButton
        Left = 4
        Top = 38
        Width = 117
        Height = 25
        Caption = '&Generar Informe'
        TabOrder = 1
        OnClick = emitirClick
      end
      object Panel3: TPanel
        Left = 0
        Top = 213
        Width = 124
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnCerrar: TButton
          Left = 4
          Top = 10
          Width = 117
          Height = 25
          Caption = '&Cerrar'
          TabOrder = 0
          OnClick = btnCerrarClick
        end
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 6
      Width = 286
      Height = 254
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label28: TLabel
        Left = 7
        Top = 13
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
      end
      object periodo: TMaskEdit
        Left = 51
        Top = 10
        Width = 54
        Height = 21
        EditMask = '99/9999;1; '
        MaxLength = 7
        TabOrder = 0
        Text = '  /    '
        OnKeyDown = periodoKeyDown
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 37
        Width = 275
        Height = 73
        Caption = ' Informes  '
        TabOrder = 1
        object RadioButton1: TRadioButton
          Left = 6
          Top = 41
          Width = 249
          Height = 17
          Caption = '&Detalle Montos Dif. Fact. en Ordenes Auditadas'
          TabOrder = 1
          OnKeyDown = RadioButton1KeyDown
        end
        object RadioButton2: TRadioButton
          Left = 6
          Top = 19
          Width = 260
          Height = 17
          Caption = '&Resumen Montos Dif. Fact. en Ordenes Auditadas'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnKeyDown = RadioButton1KeyDown
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 207
        Width = 286
        Height = 47
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 9
          Top = 23
          Width = 208
          Height = 13
          Alignment = taRightJustify
          Caption = 'Porcentaje Retenci'#243'n Montos Diferenciales:'
        end
        object porcentaje: TEditValid
          Left = 221
          Top = 20
          Width = 36
          Height = 21
          TabOrder = 0
          Text = '6'
          Valid = tvDecimalPos
        end
      end
    end
  end
end
