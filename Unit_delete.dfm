object Form_delete: TForm_delete
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1076#1072#1083#1080#1090#1100
  ClientHeight = 72
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label_confirm: TLabel
    Left = 24
    Top = 8
    Width = 225
    Height = 16
    Caption = #1042#1099' '#1090#1086#1095#1085#1086' '#1093#1086#1090#1080#1090#1077' '#1091#1076#1072#1083#1080#1090#1100' '#1101#1090#1080' '#1076#1072#1085#1085#1099#1077'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button_yes: TButton
    Left = 187
    Top = 33
    Width = 76
    Height = 31
    Caption = #1044#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button_yesClick
  end
  object Button_no: TButton
    Left = 8
    Top = 33
    Width = 76
    Height = 31
    Caption = #1053#1077#1090
    TabOrder = 1
    OnClick = Button_noClick
  end
end
