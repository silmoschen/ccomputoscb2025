object fmDetalleFacturado: TfmDetalleFacturado
  Left = 0
  Top = 0
  Caption = 'Detalle Facturado'
  ClientHeight = 393
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 374
    Width = 619
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitWidth = 379
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 374
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 379
    object A: TStringGrid
      Left = 6
      Top = 6
      Width = 607
      Height = 362
      Align = alClient
      BorderStyle = bsNone
      ColCount = 6
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 50000
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      ColWidths = (
        68
        32
        49
        87
        107
        270)
    end
  end
end
