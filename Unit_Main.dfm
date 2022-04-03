object Form_Main: TForm_Main
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1095#1105#1090' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1074' '#1080' '#1086#1088#1075#1090#1077#1093#1085#1080#1082#1080
  ClientHeight = 684
  ClientWidth = 1412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 13
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' ...'
  end
  object Data_table: TStringGrid
    Left = 8
    Top = 48
    Width = 1396
    Height = 588
    ColCount = 10
    DefaultColAlignment = taCenter
    FixedColor = clInfoBk
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = Data_tableDrawCell
  end
  object Button_edit: TButton
    Left = 1275
    Top = 642
    Width = 129
    Height = 34
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button_editClick
  end
  object Button_delete: TButton
    Left = 1116
    Top = 642
    Width = 129
    Height = 34
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = Button_deleteClick
  end
  object Button_add: TButton
    Left = 956
    Top = 642
    Width = 129
    Height = 34
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = Button_addClick
  end
  object Button_charts: TButton
    Left = 796
    Top = 642
    Width = 129
    Height = 34
    Caption = #1043#1088#1072#1092#1080#1082#1080
    TabOrder = 4
    OnClick = Button_chartsClick
  end
  object Button_search: TButton
    Left = 1275
    Top = 8
    Width = 129
    Height = 34
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 5
    OnClick = Button_searchClick
  end
  object Combo_sort: TComboBox
    Left = 111
    Top = 8
    Width = 174
    Height = 21
    Style = csDropDownList
    TabOrder = 6
    OnChange = Combo_sortChange
    Items.Strings = (
      #1053#1077#1090
      #1053#1086#1084#1077#1088' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1077
      #1053#1086#1084#1077#1088' '#1091#1073#1099#1074#1072#1085#1080#1077
      #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      #1050#1072#1090#1077#1075#1086#1088#1080#1103
      #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1075#1072#1088#1072#1085#1090#1080#1080
      #1054#1092#1080#1089
      #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081)
  end
  object Button_alldevices: TButton
    Left = 8
    Top = 642
    Width = 129
    Height = 34
    Caption = #1042#1089#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    TabOrder = 7
    OnClick = Button_alldevicesClick
  end
end
