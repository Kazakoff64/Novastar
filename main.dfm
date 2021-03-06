object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Novastar - '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1089#1090#1074#1077#1090#1082#1086#1081
  ClientHeight = 114
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    332
    114)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 236
    Top = 12
    Width = 81
    Height = 34
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1088'.'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComPortList: TComboBox
    Left = 19
    Top = 19
    Width = 200
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1088#1090
    OnDropDown = ComPortListDropDown
    ExplicitWidth = 190
  end
  object Button2: TButton
    Left = 236
    Top = 60
    Width = 81
    Height = 33
    Caption = #1048#1079#1084#1080#1085'.'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 19
    Top = 66
    Width = 200
    Height = 21
    TabOrder = 3
    Text = #1071#1088#1082#1086#1089#1090#1100
    Items.Strings = (
      '0%'
      '5%'
      '10%'
      '15%'
      '20%'
      '25%'
      '30%'
      '35%'
      '40%'
      '45%'
      '50%'
      '55%'
      '60%'
      '65%'
      '70%'
      '75%'
      '80%'
      '85%'
      '90%'
      '95%'
      '100%')
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 46
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 4
    Visible = False
  end
  object ComPort1: TComPort
    BaudRate = br115200
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 176
    Top = 64
  end
end
