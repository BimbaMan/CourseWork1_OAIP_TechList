object Form_charts: TForm_charts
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1080#1082#1080
  ClientHeight = 483
  ClientWidth = 572
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
  object Charts_graph: TImage
    Left = 8
    Top = 40
    Width = 556
    Height = 435
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 556
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1089#1090#1088#1086#1081#1089#1090#1074' '#1088#1072#1079#1085#1099#1093' '#1082#1072#1090#1077#1075#1086#1088#1080#1081
      #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1089#1090#1088#1086#1081#1089#1090#1074' '#1085#1072' '#1075#1072#1088#1072#1085#1090#1080#1080' '#1080' '#1085#1077' '#1085#1072' '#1075#1072#1088#1072#1085#1090#1080#1080)
  end
end
