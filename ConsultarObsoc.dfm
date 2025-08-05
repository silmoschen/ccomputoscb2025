object fmConsultarObSoc: TfmConsultarObSoc
  Left = 248
  Top = 161
  Width = 490
  Height = 318
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Total Facturado Obra Social'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ob. Social:'
    end
    object codos: TLabel
      Left = 62
      Top = 2
      Width = 29
      Height = 13
      Caption = 'codos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object nos: TLabel
      Left = 101
      Top = 2
      Width = 17
      Height = 13
      Caption = 'nos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 15
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per. Fact:'
    end
    object perfact: TLabel
      Left = 62
      Top = 15
      Width = 29
      Height = 13
      Caption = 'codos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 137
      Top = 15
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per. Liq.:'
    end
    object perliq: TLabel
      Left = 183
      Top = 15
      Width = 29
      Height = 13
      Caption = 'codos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 236
      Top = 15
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tot. Ob.Social:'
    end
    object totos: TLabel
      Left = 311
      Top = 15
      Width = 29
      Height = 13
      Caption = 'codos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 380
      Top = 0
      Width = 102
      Height = 32
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnAjustar: TButton
        Left = 2
        Top = 3
        Width = 49
        Height = 25
        Caption = '&Ajustar'
        TabOrder = 0
        OnClick = btnAjustarClick
      end
      object btnCerrar: TButton
        Left = 53
        Top = 3
        Width = 49
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 1
        OnClick = btnCerrarClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 272
    Width = 482
    Height = 19
    Panels = <
      item
        Width = 380
      end
      item
        Text = ' INTRO Ajustar'
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 482
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 29
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Neto Fact.:'
    end
    object Label3: TLabel
      Left = 152
      Top = 29
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Fact.:'
    end
    object Label8: TLabel
      Left = 7
      Top = 6
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Profesional:'
    end
    object nprof: TLabel
      Left = 134
      Top = 7
      Width = 27
      Height = 13
      Caption = '         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object netofact: TEditValid
      Left = 65
      Top = 26
      Width = 80
      Height = 21
      TabOrder = 0
      OnKeyDown = netofactKeyDown
      Valid = tvDecimalPos
    end
    object totalfact: TEditValid
      Left = 210
      Top = 26
      Width = 80
      Height = 21
      TabOrder = 1
      OnKeyDown = totalfactKeyDown
      Valid = tvDecimalPos
    end
    object Panel5: TPanel
      Left = 371
      Top = 0
      Width = 111
      Height = 48
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnAplicar: TButton
        Left = 2
        Top = 3
        Width = 52
        Height = 25
        Caption = '&Ajustar'
        Enabled = False
        TabOrder = 0
        OnClick = btnAplicarClick
      end
      object btnCancelar: TButton
        Left = 57
        Top = 3
        Width = 52
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object idprof: TMaskEdit
      Left = 65
      Top = 3
      Width = 43
      Height = 21
      EditMask = '999999;1; '
      MaxLength = 6
      TabOrder = 3
      Text = '      '
      OnKeyDown = idprofKeyDown
    end
    object BuscarProfesional: TBitBtn
      Left = 111
      Top = 3
      Width = 20
      Height = 22
      Hint = 'Buscar Profesional'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BuscarProfesionalClick
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
  object Panel3: TPanel
    Left = 0
    Top = 32
    Width = 482
    Height = 192
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    OnResize = Panel3Resize
    object S: TStringGrid
      Left = 2
      Top = 2
      Width = 478
      Height = 188
      Align = alClient
      BorderStyle = bsNone
      ColCount = 4
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 5000
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnDblClick = btnAjustarClick
      OnKeyDown = SKeyDown
      ColWidths = (
        64
        266
        64
        64)
    end
  end
end
