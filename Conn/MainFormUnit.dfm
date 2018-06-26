object FormMain: TFormMain
  Left = 271
  Top = 114
  Caption = 'FormMain'
  ClientHeight = 80
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 0
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    Visible = False
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 104
    Top = 46
    Width = 107
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 0
    Top = 19
    Width = 107
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 0
    Top = 46
    Width = 107
    Height = 25
    Caption = 'Open App'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 72
    Top = 152
  end
end
