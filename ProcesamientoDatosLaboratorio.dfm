object fmPocesarDatosLab: TfmPocesarDatosLab
  Left = 190
  Top = 123
  Width = 417
  Height = 284
  Caption = 'Procesamiento de Datos de Laboratorios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 238
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 397
      Height = 226
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
      object Label1: TLabel
        Left = 24
        Top = 14
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Período:'
      end
      object Label2: TLabel
        Left = 10
        Top = 42
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Laboratorio:'
      end
      object prof: TLabel
        Left = 132
        Top = 43
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
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 188
        Height = 13
        Caption = 'Iniciar Proceso de Transferencia desde:'
      end
      object Label4: TLabel
        Left = 232
        Top = 40
        Width = 101
        Height = 13
        Caption = 'Dispositivo de Salida:'
      end
      object periodo: TMaskEdit
        Left = 67
        Top = 11
        Width = 48
        Height = 21
        EditMask = '##/####;1; '
        MaxLength = 7
        TabOrder = 0
        Text = '  /    '
      end
      object idprof: TMaskEdit
        Left = 67
        Top = 39
        Width = 38
        Height = 21
        EditMask = '#####;1; '
        MaxLength = 5
        TabOrder = 1
        Text = '     '
      end
      object BuscarProf: TBitBtn
        Left = 108
        Top = 39
        Width = 20
        Height = 22
        Hint = 'Buscar Profesional'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object DriveComboBox1: TDriveComboBox
        Left = 16
        Top = 96
        Width = 193
        Height = 19
        TabOrder = 3
      end
      object BitBtn1: TBitBtn
        Left = 16
        Top = 136
        Width = 153
        Height = 25
        Caption = 'Transferir ...'
        Enabled = False
        TabOrder = 4
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FFFCFFF030777030FFCCCFF030777030FFFCCCF777777030FFFFCCC7
          C777700000077CCCC7777777777777CCC777777777777CCCC777}
      end
      object CheckBox1: TCheckBox
        Left = 231
        Top = 8
        Width = 162
        Height = 17
        Caption = '&Generar Inf. de Transferencia'
        TabOrder = 5
      end
      object Button2: TButton
        Left = 232
        Top = 90
        Width = 145
        Height = 25
        Caption = '&Emitir Informe'
        TabOrder = 6
      end
      object dispositivo: TComboBox
        Left = 233
        Top = 55
        Width = 159
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        Text = 'Presentación Preliminar'
      end
      object BitBtn2: TBitBtn
        Left = 232
        Top = 192
        Width = 145
        Height = 25
        Caption = '&Transferencia Final'
        TabOrder = 8
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 238
    Width = 409
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
