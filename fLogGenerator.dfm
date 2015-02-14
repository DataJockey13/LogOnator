object frmLogGenerator: TfrmLogGenerator
  Left = 0
  Top = 0
  Caption = 'DCUO Log Test Generator'
  ClientHeight = 243
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 224
    Width = 527
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PnTop: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtAdd: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Add 1'
      TabOrder = 0
      OnClick = BtAddClick
    end
    object cbAuto: TCheckBox
      Left = 104
      Top = 12
      Width = 97
      Height = 17
      Caption = 'Autorun'
      TabOrder = 2
      OnClick = cbAutoClick
    end
    object BtClear: TButton
      Left = 432
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 1
      OnClick = BtClearClick
    end
  end
  object Memo: TMemo
    Left = 0
    Top = 41
    Width = 527
    Height = 183
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
  end
  object TimerAuto: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerAutoTimer
    Left = 280
  end
  object TimerStore: TTimer
    Enabled = False
    OnTimer = TimerStoreTimer
    Left = 328
  end
end
