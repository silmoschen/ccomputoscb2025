object fmConversionNBU: TfmConversionNBU
  Left = 312
  Top = 189
  Width = 434
  Height = 255
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Conversi'#243'n de C'#243'digos al Sistema N.B.U.'
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
    Top = 197
    Width = 426
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label3: TLabel
      Left = 6
      Top = 2
      Width = 403
      Height = 13
      Caption = 
        'Par'#225'metros Aplicables al Proceso de Importaci'#243'n de Datos y poste' +
        'rior Transformaci'#243'n'
    end
    object Label4: TLabel
      Left = 6
      Top = 15
      Width = 139
      Height = 13
      Caption = 'de C'#243'digos al Sistema N.B.U.'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 426
    Height = 197
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'C'#243'digos a Excluir'
      OnShow = TabSheet1Show
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 418
        Height = 169
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel6: TPanel
          Left = 6
          Top = 6
          Width = 406
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 5
            Top = 6
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo:'
          end
          object des1: TLabel
            Left = 121
            Top = 7
            Width = 66
            Height = 13
            Caption = '                      '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object codigo1: TMaskEdit
            Left = 46
            Top = 3
            Width = 48
            Height = 21
            EditMask = '9999;1; '
            MaxLength = 4
            TabOrder = 0
            Text = '    '
            OnKeyDown = codigo1KeyDown
          end
          object Buscar1: TBitBtn
            Left = 97
            Top = 3
            Width = 20
            Height = 22
            Hint = 'Buscar Profesional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = Buscar1Click
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
        object Panel7: TPanel
          Left = 6
          Top = 34
          Width = 406
          Height = 129
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object S: TStringGrid
            Left = 2
            Top = 2
            Width = 402
            Height = 125
            Align = alClient
            BorderStyle = bsNone
            ColCount = 3
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 400
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnKeyDown = SKeyDown
            ColWidths = (
              33
              51
              293)
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'C'#243'digos a Anexar'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 418
        Height = 162
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel3: TPanel
          Left = 6
          Top = 6
          Width = 406
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 5
            Top = 6
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo:'
          end
          object des2: TLabel
            Left = 121
            Top = 7
            Width = 66
            Height = 13
            Caption = '                      '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object codigo2: TMaskEdit
            Left = 46
            Top = 3
            Width = 46
            Height = 21
            EditMask = '999999;1; '
            MaxLength = 6
            TabOrder = 0
            Text = '      '
            OnKeyDown = codigo2KeyDown
          end
          object Buscar2: TBitBtn
            Left = 97
            Top = 3
            Width = 20
            Height = 22
            Hint = 'Buscar Profesional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = Buscar2Click
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
        object Panel4: TPanel
          Left = 6
          Top = 34
          Width = 406
          Height = 122
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object T: TStringGrid
            Left = 2
            Top = 2
            Width = 402
            Height = 118
            Align = alClient
            BorderStyle = bsNone
            ColCount = 3
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 400
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnKeyDown = TKeyDown
            ColWidths = (
              33
              51
              293)
          end
        end
      end
    end
  end
end
