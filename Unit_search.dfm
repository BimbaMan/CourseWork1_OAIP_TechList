object Form_search: TForm_search
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 109
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 8
    Width = 13
    Height = 17
    Caption = '1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 274
    Top = 8
    Width = 13
    Height = 17
    Caption = '2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Combo1: TComboBox
    Left = 24
    Top = 8
    Width = 225
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = Combo1Change
    Items.Strings = (
      #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
      #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      #1050#1072#1090#1077#1075#1086#1088#1080#1103
      #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1075#1072#1088#1072#1085#1090#1080#1080
      #1040#1076#1088#1077#1089' '#1086#1092#1080#1089#1072
      #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1079#1072' '#1090#1077#1093#1085#1080#1082#1091)
  end
  object Combo2: TComboBox
    Left = 293
    Top = 8
    Width = 225
    Height = 21
    TabOrder = 1
  end
  object Confirm: TButton
    Left = 373
    Top = 51
    Width = 145
    Height = 40
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 2
    OnClick = ConfirmClick
  end
end
