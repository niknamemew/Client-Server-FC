object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Ciao'
  end
  object btnPlainCall: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btnPlainCall'
    TabOrder = 1
    OnClick = btnPlainCallClick
  end
  object btnToJSON: TButton
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btnToJSON'
    TabOrder = 2
    OnClick = btnToJSONClick
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 440
    Top = 16
  end
end
