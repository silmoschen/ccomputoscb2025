object fmRestaurarBackup: TfmRestaurarBackup
  Left = 232
  Top = 218
  Width = 418
  Height = 305
  Caption = 'Restaurar Backup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 259
    Width = 410
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 410
    Height = 259
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&Facturaci'#243'n'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 231
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel1: TPanel
          Left = 296
          Top = 6
          Width = 100
          Height = 219
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object btnRestaurarFact: TButton
            Left = 4
            Top = 27
            Width = 94
            Height = 25
            Caption = '&Restaurar Datos'
            TabOrder = 0
            OnClick = btnRestaurarFactClick
          end
          object Panel6: TPanel
            Left = 0
            Top = 188
            Width = 100
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object btnCerrarFact: TButton
              Left = 4
              Top = 3
              Width = 94
              Height = 25
              Caption = '&Cerrar'
              TabOrder = 0
              OnClick = btnCerrarFactClick
            end
          end
        end
        object Panel3: TPanel
          Left = 6
          Top = 6
          Width = 290
          Height = 219
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 290
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 5
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per'#237'odo:'
            end
            object SpeedButton1: TSpeedButton
              Left = 224
              Top = 2
              Width = 22
              Height = 22
              Hint = 'Si/No Selecci'#243'n'
              Caption = '&S'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton1Click
            end
            object SpeedButton2: TSpeedButton
              Left = 246
              Top = 2
              Width = 22
              Height = 22
              Hint = 'Seleccionar Todos'
              Caption = '&T'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton2Click
            end
            object SpeedButton3: TSpeedButton
              Left = 268
              Top = 2
              Width = 22
              Height = 22
              Hint = 'Quitar Selecci'#243'n a Todos'
              Caption = '&N'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton3Click
            end
            object periodo: TMaskEdit
              Left = 53
              Top = 3
              Width = 52
              Height = 21
              EditMask = '99/9999;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
              OnKeyDown = periodoKeyDown
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 28
            Width = 290
            Height = 191
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object S: TStringGrid
              Left = 2
              Top = 2
              Width = 286
              Height = 187
              Align = alClient
              BorderStyle = bsNone
              ColCount = 3
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 200
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              OnKeyDown = SKeyDown
              ColWidths = (
                48
                199
                17)
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Auditor'#237'a'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 231
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        TabOrder = 0
        object Panel13: TPanel
          Left = 296
          Top = 6
          Width = 100
          Height = 219
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object restaurarAudit: TButton
            Left = 4
            Top = 27
            Width = 94
            Height = 25
            Caption = '&Restaurar Datos'
            TabOrder = 0
            OnClick = restaurarAuditClick
          end
          object Panel14: TPanel
            Left = 0
            Top = 188
            Width = 100
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object btnCerrarAudit: TButton
              Left = 4
              Top = 3
              Width = 94
              Height = 25
              Caption = '&Cerrar'
              TabOrder = 0
              OnClick = btnCerrarFactClick
            end
          end
        end
        object Panel15: TPanel
          Left = 6
          Top = 6
          Width = 290
          Height = 219
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 290
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 5
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Per'#237'odo:'
            end
            object SpeedButton7: TSpeedButton
              Left = 267
              Top = 2
              Width = 22
              Height = 22
              Hint = 'Si/No Selecci'#243'n'
              Caption = '&S'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton7Click
            end
            object periodoaudit: TMaskEdit
              Left = 53
              Top = 3
              Width = 52
              Height = 21
              EditMask = '99/9999;1; '
              MaxLength = 7
              TabOrder = 0
              Text = '  /    '
              OnKeyDown = periodoauditKeyDown
            end
          end
          object Panel17: TPanel
            Left = 0
            Top = 28
            Width = 290
            Height = 191
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object A: TStringGrid
              Left = 2
              Top = 2
              Width = 286
              Height = 187
              Align = alClient
              BorderStyle = bsNone
              ColCount = 4
              DefaultRowHeight = 15
              FixedCols = 0
              RowCount = 200
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
              TabOrder = 0
              OnKeyDown = SKeyDown
              ColWidths = (
                54
                193
                17
                64)
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Distribuci'#243'n'
      ImageIndex = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 231
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 4
        Caption = 'Panel7'
        TabOrder = 0
        object Panel8: TPanel
          Left = 6
          Top = 6
          Width = 390
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 5
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object SpeedButton4: TSpeedButton
            Left = 224
            Top = 2
            Width = 22
            Height = 22
            Hint = 'Si/No Selecci'#243'n'
            Caption = '&S'
            Flat = True
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object SpeedButton5: TSpeedButton
            Left = 246
            Top = 2
            Width = 22
            Height = 22
            Hint = 'Seleccionar Todos'
            Caption = '&T'
            Flat = True
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton5Click
          end
          object SpeedButton6: TSpeedButton
            Left = 268
            Top = 2
            Width = 22
            Height = 22
            Hint = 'Quitar Selecci'#243'n a Todos'
            Caption = '&N'
            Flat = True
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton6Click
          end
          object periododist: TMaskEdit
            Left = 53
            Top = 3
            Width = 52
            Height = 21
            EditMask = '99/9999;1; '
            MaxLength = 7
            TabOrder = 0
            Text = '  /    '
            OnKeyDown = periododistKeyDown
          end
        end
        object Panel10: TPanel
          Left = 6
          Top = 34
          Width = 290
          Height = 191
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object D: TStringGrid
            Left = 2
            Top = 2
            Width = 286
            Height = 187
            Align = alClient
            BorderStyle = bsNone
            ColCount = 4
            DefaultRowHeight = 15
            FixedCols = 0
            RowCount = 200
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnKeyDown = DKeyDown
            ColWidths = (
              54
              192
              17
              4)
          end
        end
        object Panel9: TPanel
          Left = 296
          Top = 34
          Width = 100
          Height = 191
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object restaurarDist: TButton
            Left = 4
            Top = 0
            Width = 94
            Height = 25
            Caption = '&Restaurar Datos'
            TabOrder = 0
            OnClick = restaurarDistClick
          end
          object Panel11: TPanel
            Left = 0
            Top = 160
            Width = 100
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object btnCerrarDist: TButton
              Left = 4
              Top = 3
              Width = 94
              Height = 25
              Caption = '&Cerrar'
              TabOrder = 0
              OnClick = btnCerrarFactClick
            end
          end
        end
      end
    end
  end
end
