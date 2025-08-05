object fmModificarPeriodoFact: TfmModificarPeriodoFact
  Left = 285
  Top = 285
  Width = 438
  Height = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSizeToolWin
  Caption = 'Modificar Per'#237'odo Facturado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 86
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 13
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per. Actual:'
    end
    object periodo: TLabel
      Left = 73
      Top = 13
      Width = 30
      Height = 13
      Caption = '          '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 29
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Profesional:'
    end
    object idprof: TLabel
      Left = 73
      Top = 29
      Width = 30
      Height = 13
      Caption = '          '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object nprof: TLabel
      Left = 120
      Top = 29
      Width = 48
      Height = 13
      Caption = '                '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 61
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'a Per'#237'odo:'
    end
    object Label4: TLabel
      Left = 25
      Top = 49
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Transferir'
    end
    object nuevoperiodo: TMaskEdit
      Left = 76
      Top = 52
      Width = 48
      Height = 21
      EditMask = '99/9999;1; '
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
      OnKeyDown = nuevoperiodoKeyDown
    end
    object Panel2: TPanel
      Left = 364
      Top = 6
      Width = 60
      Height = 74
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Button1: TButton
        Left = 1
        Top = 4
        Width = 55
        Height = 25
        Caption = '&OK'
        Enabled = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 1
        Top = 32
        Width = 55
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
end
