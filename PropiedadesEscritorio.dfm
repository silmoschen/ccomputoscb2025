object frmPropiedadesEscritorio: TfrmPropiedadesEscritorio
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'frmPropiedadesEscritorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 423
    ActivePage = tblFondo
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object tblFondo: TTabSheet
      Caption = '&Fondo'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 395
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 599
          Height = 395
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object Fondo: TImage
            Left = 2
            Top = 2
            Width = 595
            Height = 391
            Align = alClient
            AutoSize = True
          end
        end
      end
      object Panel3: TPanel
        Left = 599
        Top = 0
        Width = 81
        Height = 395
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnExaminar: TButton
          Left = 7
          Top = 6
          Width = 70
          Height = 25
          Caption = 'Examinar ...'
          TabOrder = 0
        end
        object BorCheck1: TCheckBox
          Left = 8
          Top = 39
          Width = 70
          Height = 17
          Caption = '(Ninguna)'
          TabOrder = 1
        end
      end
    end
    object tblBotones: TTabSheet
      Caption = '&Botones'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 395
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object botones: TCheckListBox
          Left = 2
          Top = 2
          Width = 284
          Height = 253
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 599
        Top = 0
        Width = 81
        Height = 395
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Memo: TMemo
          Left = 0
          Top = 0
          Width = 81
          Height = 395
          Align = alClient
          Alignment = taCenter
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clBtnFace
          Lines.Strings = (
            ''
            ' Puede '
            'Personalizar la '
            'Barra de '
            'Herramientas. '
            'Seleccione los '
            'Botones '
            ' que quiera '
            'Ocultar, luego '
            'pulse Aplicar.')
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 688
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Presentaci'#243'n'
    end
    object Label2: TLabel
      Left = 8
      Top = 14
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'de im'#225'genes:'
    end
    object Button1: TButton
      Left = 240
      Top = 4
      Width = 65
      Height = 25
      Caption = '&Aplicar'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 308
      Top = 4
      Width = 65
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
    end
    object estilo: TComboBox
      Left = 76
      Top = 5
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Ninguno'
      Items.Strings = (
        'Ninguno'
        'Centrado'
        'Expandido'
        'En Mosaico')
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 312
    Top = 248
  end
end
