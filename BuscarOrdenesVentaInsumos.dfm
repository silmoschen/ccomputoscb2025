object fmBuscarOrdenesInsumos: TfmBuscarOrdenesInsumos
  Left = 259
  Top = 169
  Width = 427
  Height = 396
  Caption = 'Buscar Ordenes Venta de Insumos'
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
    Width = 419
    Height = 369
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 407
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 18
        Top = 5
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
      end
      object Label3: TLabel
        Left = 5
        Top = 29
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Profesional:'
      end
      object nos: TLabel
        Left = 132
        Top = 29
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
      object periodo: TMaskEdit
        Left = 64
        Top = 2
        Width = 52
        Height = 21
        EditMask = '99/9999;1; '
        MaxLength = 7
        TabOrder = 0
        Text = '  /    '
        OnKeyDown = periodoKeyDown
      end
      object idprof: TMaskEdit
        Left = 64
        Top = 26
        Width = 43
        Height = 21
        EditMask = '999999;1; '
        MaxLength = 6
        TabOrder = 1
        Text = '      '
        OnKeyDown = idprofKeyDown
      end
      object BuscarProfesional: TBitBtn
        Left = 109
        Top = 25
        Width = 20
        Height = 22
        Hint = 'Buscar Profesional'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      Left = 6
      Top = 334
      Width = 407
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnOK: TButton
        Left = 8
        Top = 2
        Width = 68
        Height = 25
        Caption = '&OK'
        TabOrder = 0
        OnClick = btnOKClick
      end
      object Panel4: TPanel
        Left = 319
        Top = 0
        Width = 88
        Height = 29
        Align = alRight
        Alignment = taRightJustify
        BevelOuter = bvNone
        TabOrder = 1
        object btnCerrar: TButton
          Left = 14
          Top = 2
          Width = 68
          Height = 25
          Caption = '&Cerrar'
          TabOrder = 0
          OnClick = btnCerrarClick
        end
      end
    end
    object Panel5: TPanel
      Left = 6
      Top = 55
      Width = 407
      Height = 279
      Align = alClient
      BevelInner = bvLowered
      Caption = 'Panel5'
      TabOrder = 2
      OnResize = Panel5Resize
      object S: TStringGrid
        Left = 2
        Top = 2
        Width = 403
        Height = 275
        Align = alClient
        BorderStyle = bsNone
        ColCount = 4
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 500
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnKeyDown = SKeyDown
        ColWidths = (
          60
          72
          247
          18)
      end
    end
  end
end
