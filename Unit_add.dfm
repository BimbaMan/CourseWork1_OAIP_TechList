object Form_add: TForm_add
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 488
  ClientWidth = 387
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
  object Label_regnumber: TLabel
    Left = 135
    Top = 8
    Width = 123
    Height = 13
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label_name: TLabel
    Left = 163
    Top = 77
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label_category: TLabel
    Left = 166
    Top = 123
    Width = 54
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object Label_dateofgaranty: TLabel
    Left = 135
    Top = 169
    Width = 133
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1075#1072#1088#1072#1085#1090#1080#1080
  end
  object Label_office: TLabel
    Left = 164
    Top = 238
    Width = 65
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1086#1092#1080#1089#1072
  end
  object Label_technician: TLabel
    Left = 128
    Top = 330
    Width = 140
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1079#1072' '#1090#1077#1093#1085#1080#1082#1091
  end
  object Label_Telnumber: TLabel
    Left = 152
    Top = 284
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  end
  object Label_more: TLabel
    Left = 154
    Top = 376
    Width = 80
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
  end
  object Save: TButton
    Left = 234
    Top = 440
    Width = 145
    Height = 40
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1077#1088#1085#1091#1090#1100#1089#1103
    TabOrder = 0
    OnClick = SaveClick
  end
  object Edit_regnumber: TEdit
    Left = 8
    Top = 50
    Width = 371
    Height = 21
    Alignment = taCenter
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 1
  end
  object DatePicker: TDateTimePicker
    Left = 8
    Top = 211
    Width = 371
    Height = 21
    Date = 44166.000000000000000000
    Time = 0.536081956015550500
    TabOrder = 2
  end
  object NoGuaranty: TCheckBox
    Left = 154
    Top = 188
    Width = 97
    Height = 17
    Caption = #1043#1072#1088#1072#1085#1090#1080#1080' '#1085#1077#1090
    TabOrder = 3
    OnClick = NoGuarantyClick
  end
  object Combo_name: TComboBox
    Left = 8
    Top = 96
    Width = 371
    Height = 21
    MaxLength = 20
    TabOrder = 4
    OnKeyPress = Combo_nameKeyPress
  end
  object Combo_category: TComboBox
    Left = 8
    Top = 142
    Width = 371
    Height = 21
    MaxLength = 20
    TabOrder = 5
    OnKeyPress = Combo_categoryKeyPress
  end
  object Combo_office: TComboBox
    Left = 8
    Top = 257
    Width = 371
    Height = 21
    MaxLength = 20
    TabOrder = 6
    OnKeyPress = Combo_officeKeyPress
  end
  object Combo_tecnician: TComboBox
    Left = 8
    Top = 349
    Width = 371
    Height = 21
    MaxLength = 20
    TabOrder = 7
    OnKeyPress = Combo_tecnicianKeyPress
  end
  object Combo_telnumber: TComboBox
    Left = 8
    Top = 303
    Width = 371
    Height = 21
    MaxLength = 20
    TabOrder = 8
    OnKeyPress = Combo_telnumberKeyPress
  end
  object Edit_more: TEdit
    Left = 8
    Top = 395
    Width = 371
    Height = 21
    Alignment = taCenter
    AutoSize = False
    MaxLength = 55
    TabOrder = 9
  end
  object CreateRegNum: TCheckBox
    Left = 88
    Top = 27
    Width = 233
    Height = 17
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    TabOrder = 10
    OnClick = CreateRegNumClick
  end
end
