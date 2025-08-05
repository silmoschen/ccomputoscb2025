object fmRepararDatosPdx: TfmRepararDatosPdx
  Left = 317
  Top = 207
  Caption = 'Reparaci'#243'n de Datos'
  ClientHeight = 202
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 183
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 128
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object Label3: TLabel
      Left = 116
      Top = 128
      Width = 56
      Height = 13
      Caption = 'Laboratorio:'
    end
    object prof: TLabel
      Left = 13
      Top = 151
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
    object Panel2: TPanel
      Left = 293
      Top = 6
      Width = 79
      Height = 142
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnReparar: TButton
        Left = 2
        Top = 4
        Width = 75
        Height = 25
        Caption = '&Reparar'
        TabOrder = 0
        OnClick = btnRepararClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 8
      Width = 181
      Height = 110
      Caption = ' Tarea a Realizar '
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 11
        Top = 15
        Width = 161
        Height = 17
        Caption = '&Estructuras de Datos'
        TabOrder = 0
        OnKeyDown = CheckBox1KeyDown
      end
      object CheckBox2: TCheckBox
        Left = 11
        Top = 33
        Width = 161
        Height = 17
        Caption = 'Estructuras de &Trabajo'
        TabOrder = 1
        OnKeyDown = CheckBox1KeyDown
      end
      object CheckBox3: TCheckBox
        Left = 11
        Top = 71
        Width = 161
        Height = 17
        Caption = '&Datos M'#243'dulo Auditor'#237'a'
        TabOrder = 2
        OnKeyDown = CheckBox1KeyDown
      end
      object CheckBox4: TCheckBox
        Left = 11
        Top = 90
        Width = 110
        Height = 13
        Caption = 'D&istribuci'#243'n'
        TabOrder = 3
        OnClick = CheckBox4Click
        OnKeyDown = CheckBox5KeyDown
      end
      object CheckBox5: TCheckBox
        Left = 11
        Top = 51
        Width = 118
        Height = 17
        Caption = '&Facturaci'#243'n'
        TabOrder = 4
        OnClick = CheckBox5Click
        OnKeyDown = CheckBox5KeyDown
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 148
      Width = 366
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label2: TLabel
        Left = 3
        Top = 5
        Width = 44
        Height = 13
        Caption = 'Nro. Dist:'
      end
      object nrodist: TMaskEdit
        Left = 51
        Top = 2
        Width = 27
        Height = 21
        EditMask = '99;1; '
        MaxLength = 2
        TabOrder = 0
        Text = '  '
        OnKeyDown = nrodistKeyDown
      end
      object Panel3: TPanel
        Left = 280
        Top = 0
        Width = 86
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnCerrar: TButton
          Left = 9
          Top = 1
          Width = 75
          Height = 25
          Caption = '&Cerrar'
          TabOrder = 0
          OnClick = btnCerrarClick
        end
      end
    end
    object periodo: TMaskEdit
      Left = 57
      Top = 125
      Width = 54
      Height = 21
      EditMask = '99/9999;1; '
      MaxLength = 7
      TabOrder = 3
      Text = '  /    '
      OnKeyDown = periodoKeyDown
    end
    object idlaboratorio: TMaskEdit
      Left = 175
      Top = 125
      Width = 50
      Height = 21
      AutoSize = False
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 4
      Text = '      '
      OnKeyDown = idlaboratorioKeyDown
    end
    object BuscarProf: TBitBtn
      Left = 229
      Top = 125
      Width = 20
      Height = 22
      Hint = 'Buscar Profesional'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 183
    Width = 378
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
end
