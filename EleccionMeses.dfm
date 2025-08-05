object fmEleMeses: TfmEleMeses
  Left = 295
  Top = 165
  Width = 206
  Height = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSizeToolWin
  Caption = 'Meses'
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 198
    Height = 221
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    OnResize = Panel3Resize
    object ScrollBox2: TScrollBox
      Left = 6
      Top = 6
      Width = 186
      Height = 209
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
      object M: TStringGrid
        Left = 0
        Top = 0
        Width = 186
        Height = 209
        Align = alClient
        ColCount = 3
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 13
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnKeyDown = MKeyDown
        ColWidths = (
          24
          120
          19)
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 221
    Width = 198
    Height = 19
    Panels = <
      item
        Width = 125
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
