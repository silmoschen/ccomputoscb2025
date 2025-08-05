object fmLogin: TfmLogin
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Ingreso'
  ClientHeight = 138
  ClientWidth = 331
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 331
    Height = 138
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label10: TLabel
      Left = 28
      Top = 20
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usuario:'
    end
    object Label11: TLabel
      Left = 10
      Top = 47
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contrase'#241'a:'
    end
    object usuario: TEdit
      Left = 73
      Top = 19
      Width = 208
      Height = 21
      TabOrder = 0
    end
    object pass: TMaskEdit
      Left = 73
      Top = 46
      Width = 208
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 88
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Ingresar'
      TabOrder = 2
      OnClick = btnOKClick
    end
    object btnCancelar: TButton
      Left = 184
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
end
