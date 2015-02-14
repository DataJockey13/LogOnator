object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'LogOnator - DCUO Combat Log Analyzer'
  ClientHeight = 557
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object SBar: TStatusBar
    Left = 0
    Top = 538
    Width = 1006
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PnClient: TCSPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 776
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    Borders.Bottom = 0
    Borders.Left = 0
    Borders.Radius = 0
    Borders.RadiusWidth = 0
    Borders.Right = 0
    Borders.ShadowWidth = 0
    Borders.Top = 0
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    TinyHTML = False
    object Splitter: TSplitter
      Left = 0
      Top = 474
      Width = 776
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Visible = False
      OnPaint = SplitterPaint
      ExplicitLeft = -8
      ExplicitTop = 344
    end
    object SplitterTextStats: TSplitter
      Left = 0
      Top = 410
      Width = 776
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Visible = False
      OnPaint = SplitterPaint
      ExplicitTop = 397
    end
    object SplitterDiag: TSplitter
      Left = 0
      Top = 287
      Width = 776
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Visible = False
      OnPaint = SplitterPaint
      ExplicitTop = 325
    end
    object PnCombatLog: TCSPanel
      AlignWithMargins = True
      Left = 0
      Top = 478
      Width = 776
      Height = 54
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Borders.Bottom = 1
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 3
      Visible = False
      TinyHTML = False
      object PnMemoHeader: TCSPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Combat Log'
        Color = clWhite
        EndColor = clSilver
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
        object BtClose: TCsSpeedButton
          AlignWithMargins = True
          Left = 749
          Top = 0
          Width = 24
          Height = 24
          Hint = 'Combat Log schlie'#223'en'
          Margins.Top = 0
          Margins.Bottom = 0
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 6
          ImageIndexDisabled = 7
          ImageIndexHot = 7
          Align = alRight
          ParentShowHint = False
          ShowHint = True
          OnClick = BtCloseClick
          ExplicitLeft = 744
        end
      end
      object Memo: TMemo
        AlignWithMargins = True
        Left = 1
        Top = 24
        Width = 774
        Height = 29
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object PnStats: TCSPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 776
      Height = 286
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 1
      Align = alClient
      BevelOuter = bvNone
      Borders.Bottom = 1
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 0
      TinyHTML = False
      object SplitterCols: TSplitter
        Left = 576
        Top = 29
        Height = 238
        Align = alRight
        Visible = False
        OnPaint = SplitterPaint
        ExplicitLeft = 96
        ExplicitTop = 96
        ExplicitHeight = 100
      end
      object Gauge: TGauge
        Left = 0
        Top = 267
        Width = 776
        Height = 19
        Align = alBottom
        Progress = 0
        Visible = False
        ExplicitTop = 448
        ExplicitWidth = 585
      end
      object PnGridHeader: TCSPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 29
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Statistik'
        Color = clWhite
        EndColor = clSilver
        Padding.Left = 60
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
        object BtColsConfig: TCsSpeedButton
          AlignWithMargins = True
          Left = 625
          Top = 1
          Width = 97
          Height = 27
          Margins.Top = 1
          Margins.Bottom = 1
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 12
          ImageIndexDisabled = 13
          ImageIndexHot = 14
          Align = alRight
          Caption = 'Spalten'
          OnClick = BtColsConfigClick
          ExplicitLeft = 633
          ExplicitTop = 0
          ExplicitHeight = 22
        end
        object BtColsOk: TCsSpeedButton
          AlignWithMargins = True
          Left = 728
          Top = 1
          Width = 45
          Height = 27
          Margins.Top = 1
          Margins.Bottom = 1
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 9
          ImageIndexDisabled = 10
          ImageIndexHot = 11
          Align = alRight
          Caption = 'ok'
          Visible = False
          OnClick = BtColsOkClick
        end
        object LCharFilter: TLabel
          Left = 265
          Top = 0
          Width = 76
          Height = 16
          Align = alRight
          Caption = 'Filter (Name)'
          Layout = tlCenter
        end
        object cBoxChar: TCsCheckComboBox
          AlignWithMargins = True
          Left = 344
          Top = 3
          Width = 275
          Height = 23
          Margins.Bottom = 1
          Align = alRight
          BevelInner = bvNone
          BevelKind = bkSoft
          BevelOuter = bvRaised
          Ctl3D = False
          ItemHeight = 17
          ParentCtl3D = False
          TabOrder = 0
          TextHint = 'Filter: Charname'
          OnCloseUp = cBoxCharCloseUp
          ItemsCB = <>
        end
      end
      object PnCols: TCSPanel
        Left = 579
        Top = 29
        Width = 197
        Height = 238
        Align = alRight
        BevelOuter = bvNone
        Borders.Bottom = 0
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 0
        Borders.ShadowWidth = 0
        Borders.Top = 0
        ParentBackground = False
        TabOrder = 2
        Visible = False
        TinyHTML = False
        object sgCols: TCsStringGrid
          Left = 0
          Top = 0
          Width = 197
          Height = 238
          Align = alClient
          BorderStyle = bsNone
          ColCount = 1
          RowCount = 1
          Options = [goHorzLine, goColSizing, goRowSelect, goThumbTracking]
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 0
          OnDblClick = sgColsDblClick
          CellHint = True
          Decoration = 
            ',,clWindow,0,0,0,0,,",,,10",1,3,0,0,0,0,,CI,HR,0,0,'#255',"5,-1,-1,-1' +
            ',-1,,,2,,,,,,,,,0,0,0,0,,-1,0,,,,","2,0,-1,0,-1,,,16,,,,,,,,,0,0' +
            ',0,0,N,-1,0,,,,","2,1,-1,1,-1,,,4,,,,,,,,,0,0,0,0,D,-1,0,,,,"'
          FocusMode = fmRow
          ImageList = ImgListCheck
          LeftCol = 0
          SelectMode = smSingle
          Text = ''
          TopRow = 0
          ColWidths = (
            0)
          RowHeights = (
            -1)
        end
      end
      object PnGrids: TCSPanel
        Left = 0
        Top = 29
        Width = 576
        Height = 238
        Align = alClient
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Color = clSilver
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 0
        Padding.Left = 1
        Padding.Right = 1
        Padding.Bottom = 1
        ParentBackground = False
        TabOrder = 1
        TinyHTML = False
        object sg: TCsStringGrid
          Left = 1
          Top = 0
          Width = 574
          Height = 237
          Margins.Left = 1
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          ColCount = 19
          FixedColor = clWhite
          RowCount = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnDblClick = sgDblClick
          CellHint = True
          Decoration = 
            'DamageTable,,,0,1,0,0,clWhite,",,,10",1,3,0,0,0,0,,IS,FIVHGCR,0,' +
            '0,'#255',"5,-1,-1,-1,-1,,,2,,,,,,,,,0,0,0,0,,-1,0,,,,","2,2,-1,18,-1,' +
            'R,,4,,,,,,,,,0,0,0,0,,-1,0,,,,","3,-1,0,-1,0,C,,0,,,,,,,,,0,0,0,' +
            '0,,-1,0,,,,","6,-1,-1,-1,-1,,,2,,,,,,,,,0,0,0,0,,-1,0,,,,"'
          FocusMode = fmRow
          LeftCol = 0
          SelectMode = smSingle
          SmartFindMode = sfAll
          Sorting = True
          Text = 
            'Charname,Attack,SumCount,SumDmg,SumDpM,SumMin,SumAv,SumMax,NormC' +
            'ount,NormDmg,NormMin,NormAv,NormMax,CritCount,CritDmg,CritMin,Cr' +
            'itAv,CritMax,CritChance'
          TopRow = 0
          OnShowHint = sgShowHint
          OnSort = sgSort
          ColWidths = (
            68
            44
            68
            61
            60
            55
            49
            58
            73
            66
            60
            54
            63
            62
            55
            49
            43
            52
            71)
          RowHeights = (
            19)
        end
      end
    end
    object PnTextStats: TCSPanel
      AlignWithMargins = True
      Left = 0
      Top = 414
      Width = 776
      Height = 60
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Borders.Bottom = 1
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 2
      Visible = False
      TinyHTML = False
      object PnTextStatsHeader: TCSPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Statistik (Text)'
        Color = clWhite
        EndColor = clSilver
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
        object BtCloseTextStats: TCsSpeedButton
          AlignWithMargins = True
          Left = 749
          Top = 0
          Width = 24
          Height = 24
          Hint = 'Combat Log schlie'#223'en'
          Margins.Top = 0
          Margins.Bottom = 0
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 6
          ImageIndexDisabled = 7
          ImageIndexHot = 7
          Align = alRight
          ParentShowHint = False
          ShowHint = True
          OnClick = BtCloseTextStatsClick
          ExplicitLeft = 744
        end
      end
      object MemoStats: TMemo
        AlignWithMargins = True
        Left = 1
        Top = 24
        Width = 774
        Height = 35
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object PnDiag: TCSPanel
      AlignWithMargins = True
      Left = 0
      Top = 291
      Width = 776
      Height = 119
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Borders.Bottom = 1
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 1
      Visible = False
      TinyHTML = False
      object Diag: TPaintBox
        Left = 0
        Top = 24
        Width = 776
        Height = 95
        Align = alClient
        OnPaint = DiagPaint
        ExplicitLeft = 336
        ExplicitTop = 8
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object PnDiagHeader: TCSPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Diagramm'
        Color = clWhite
        EndColor = clSilver
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
        object BtDiagClose: TCsSpeedButton
          AlignWithMargins = True
          Left = 749
          Top = 0
          Width = 24
          Height = 24
          Hint = 'Combat Log schlie'#223'en'
          Margins.Top = 0
          Margins.Bottom = 0
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 6
          ImageIndexDisabled = 7
          ImageIndexHot = 7
          Align = alRight
          ParentShowHint = False
          ShowHint = True
          OnClick = BtCloseTextStatsClick
          ExplicitLeft = 744
        end
      end
    end
  end
  object PnControls: TCSPanel
    AlignWithMargins = True
    Left = 785
    Top = 3
    Width = 218
    Height = 531
    Margins.Bottom = 4
    Align = alRight
    BevelOuter = bvNone
    Borders.Bottom = 1
    Borders.Color = clSilver
    Borders.Left = 0
    Borders.Radius = 0
    Borders.RadiusWidth = 0
    Borders.Right = 0
    Borders.ShadowWidth = 0
    Borders.Top = 0
    Ctl3D = False
    Padding.Bottom = 1
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    TinyHTML = False
    object PnAnalyze: TCSPanel
      Left = 0
      Top = 0
      Width = 218
      Height = 121
      Align = alTop
      BevelOuter = bvNone
      Borders.Bottom = 0
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 0
      TinyHTML = False
      object BtStart: TCsSpeedButton
        AlignWithMargins = True
        Left = 11
        Top = 34
        Width = 94
        Height = 28
        Margins.Top = 1
        Margins.Bottom = 1
        Caption = 'Start'
        OnClick = BtStartClick
      end
      object BtStop: TCsSpeedButton
        AlignWithMargins = True
        Left = 111
        Top = 34
        Width = 98
        Height = 28
        Margins.Top = 1
        Margins.Bottom = 1
        Caption = 'Stop'
        Enabled = False
        OnClick = BtStopClick
      end
      object GaugeLive: TGauge
        Left = 0
        Top = 116
        Width = 218
        Height = 5
        Align = alBottom
        Progress = 0
        ShowText = False
        Visible = False
        ExplicitTop = 119
      end
      object CSPanel1: TCSPanel
        Left = 0
        Top = 0
        Width = 218
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Live - Auswertung'
        Color = clWhite
        EndColor = clSilver
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
      end
      object PnAutoStop: TCsClickPanel
        Left = 11
        Top = 77
        Width = 198
        Height = 27
        Active = False
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Borders.Bottom = 0
        Borders.Left = 0
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 0
        Borders.ShadowWidth = 0
        Borders.Top = 0
        Caption = 'Auto-Stop nach'
        FieldName = 'Auto-Stop nach'
        ParentBackground = False
        TabOrder = 1
        object EdAutoStop: TCsMaskEdit
          Left = 126
          Top = 3
          Width = 61
          Height = 22
          Decimaldigits = 0
          Enabled = False
          HintShow = True
          IntegerDiggits = 0
          MaskMode = mmSecond
          MaxLength = 10
          SeparatorDecimal = ','
          SeparatorThousand = '.'
          ShowValidStatus = False
          TabOrder = 0
          Text = '00:01:00'
        end
      end
    end
    object CSPanel2: TCSPanel
      Left = 0
      Top = 121
      Width = 218
      Height = 164
      Align = alTop
      BevelOuter = bvNone
      Borders.Bottom = 0
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 1
      TinyHTML = False
      object BtAnalyze: TCsSpeedButton
        Left = 8
        Top = 103
        Width = 193
        Height = 28
        Caption = 'Auswerten'
        OnClick = BtAnalyzeClick
      end
      object Label1: TLabel
        Left = 8
        Top = 38
        Width = 20
        Height = 16
        Caption = 'von'
      end
      object Label2: TLabel
        Left = 8
        Top = 73
        Width = 16
        Height = 16
        Caption = 'bis'
      end
      object CSPanel3: TCSPanel
        Left = 0
        Top = 0
        Width = 218
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Zeitraum auswerten'
        Color = clWhite
        EndColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        TinyHTML = False
      end
      object dtpDateFrom: TCsDateTimePicker
        Left = 34
        Top = 36
        Width = 97
        Height = 22
        Button = True
        Checkbox = False
        Checked = False
        Enabled = True
        HintShow = True
        IntegerDiggits = 0
        InitialState = isNone
        MaskMode = mmDate
        tabOrder = 1
        Value = '00.00.0000'
        ValueMax = '31.12.2200'
        ValueMin = '30.12.1899'
      end
      object EdTimeFrom: TCsMaskEdit
        Left = 137
        Top = 36
        Width = 61
        Height = 22
        Decimaldigits = 0
        Enabled = True
        HintShow = True
        IntegerDiggits = 0
        MaskMode = mmSecond
        MaxLength = 10
        SeparatorDecimal = ','
        SeparatorThousand = '.'
        ShowValidStatus = False
        TabOrder = 2
        Text = '00:00:00'
      end
      object dtpDateTo: TCsDateTimePicker
        Left = 34
        Top = 71
        Width = 97
        Height = 22
        Button = True
        Checkbox = False
        Checked = False
        Enabled = True
        HintShow = True
        IntegerDiggits = 0
        InitialState = isNone
        MaskMode = mmDate
        tabOrder = 3
        Value = '00.00.0000'
        ValueMax = '31.12.2200'
        ValueMin = '30.12.1899'
      end
      object EdTimeTo: TCsMaskEdit
        Left = 137
        Top = 71
        Width = 61
        Height = 22
        Decimaldigits = 0
        Enabled = True
        HintShow = True
        IntegerDiggits = 0
        MaskMode = mmSecond
        MaxLength = 10
        SeparatorDecimal = ','
        SeparatorThousand = '.'
        ShowValidStatus = False
        TabOrder = 4
        Text = '00:00:00'
      end
      object CSPanel6: TCSPanel
        AlignWithMargins = True
        Left = 3
        Top = 137
        Width = 212
        Height = 26
        Margins.Top = 1
        Margins.Bottom = 1
        Align = alBottom
        BevelOuter = bvNone
        Borders.Bottom = 0
        Borders.Left = 0
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 0
        Borders.ShadowWidth = 0
        Borders.Top = 0
        ParentBackground = False
        TabOrder = 5
        TinyHTML = False
        object EdStore: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 206
          Height = 20
          Align = alClient
          TabOrder = 0
          TextHint = 'Name'
          ExplicitHeight = 22
        end
      end
    end
    object CSPanel4: TCSPanel
      Left = 0
      Top = 285
      Width = 218
      Height = 245
      Align = alClient
      BevelOuter = bvNone
      Borders.Bottom = 0
      Borders.Color = clSilver
      Borders.Left = 1
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 1
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 2
      TinyHTML = False
      object CSPanel5: TCSPanel
        Left = 0
        Top = 0
        Width = 218
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Background = cpbGradientVertical
        BevelOuter = bvNone
        Borders.Bottom = 1
        Borders.Left = 1
        Borders.Radius = 0
        Borders.RadiusWidth = 0
        Borders.Right = 1
        Borders.ShadowWidth = 0
        Borders.Top = 1
        Caption = 'Speicher'
        Color = clWhite
        EndColor = clSilver
        ParentBackground = False
        TabOrder = 0
        TinyHTML = False
        object BtStore: TCsSpeedButton
          AlignWithMargins = True
          Left = 159
          Top = 1
          Width = 25
          Height = 22
          Margins.Top = 1
          Margins.Bottom = 1
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 0
          ImageIndexDisabled = 1
          ImageIndexHot = 2
          Align = alRight
          OnClick = BtStoreClick
          ExplicitLeft = 128
        end
        object BtDel: TCsSpeedButton
          AlignWithMargins = True
          Left = 190
          Top = 1
          Width = 25
          Height = 22
          Margins.Top = 1
          Margins.Bottom = 1
          Flat = True
          Images = ImgList
          ImageIndexEnabled = 3
          ImageIndexDisabled = 4
          ImageIndexHot = 5
          Align = alRight
          OnClick = BtDelClick
          ExplicitLeft = 184
          ExplicitHeight = 24
        end
      end
      object sgStore: TCsStringGrid
        AlignWithMargins = True
        Left = 1
        Top = 24
        Width = 216
        Height = 220
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        ColCount = 1
        RowCount = 1
        Options = [goHorzLine, goColSizing, goRowSelect, goThumbTracking]
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = True
        TabOrder = 1
        OnDblClick = sgStoreDblClick
        CellHint = True
        Decoration = 
          ',,clWindow,0,0,0,0,,",,,10",1,3,0,0,0,0,,CI,HR,0,0,'#255',"5,-1,-1,-1' +
          ',-1,,,2,,,,,,,,,0,0,0,0,,-1,0,,,,"'
        FocusMode = fmRow
        LeftCol = 0
        SelectMode = smSingle
        SmartFindMode = sfAll
        Text = ''
        TopRow = 0
        OnShowHint = sgStoreShowHint
        ColWidths = (
          0)
        RowHeights = (
          -1)
      end
    end
  end
  object PnAttackConfig: TCSPanel
    Left = 328
    Top = 76
    Width = 217
    Height = 48
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Borders.Bottom = 1
    Borders.Left = 1
    Borders.Radius = 0
    Borders.RadiusWidth = 0
    Borders.Right = 1
    Borders.ShadowWidth = 0
    Borders.Top = 1
    Caption = 'Typ f'#252'r Attack Name'
    Padding.Left = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 2
    VerticalAlignment = taAlignTop
    Visible = False
    TinyHTML = True
    object PnItem: TCSPanel
      Left = 3
      Top = 21
      Width = 211
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Borders.Bottom = 0
      Borders.Color = clSilver
      Borders.Left = 0
      Borders.Radius = 0
      Borders.RadiusWidth = 0
      Borders.Right = 0
      Borders.ShadowWidth = 0
      Borders.Top = 0
      ParentBackground = False
      TabOrder = 0
      TinyHTML = False
      object BtOkType: TCsSpeedButton
        AlignWithMargins = True
        Left = 182
        Top = 1
        Width = 28
        Height = 22
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Flat = True
        Images = ImgList
        ImageIndexEnabled = 9
        ImageIndexDisabled = 10
        ImageIndexHot = 11
        Align = alRight
        OnClick = BtOkTypeClick
        ExplicitLeft = 151
      end
      object cBoxType: TComboBox
        Left = 0
        Top = 0
        Width = 179
        Height = 24
        Align = alClient
        BevelKind = bkFlat
        Ctl3D = True
        ParentCtl3D = False
        Sorted = True
        TabOrder = 0
        OnKeyPress = cBoxTypeKeyPress
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 200
    Top = 232
    object Datei1: TMenuItem
      Caption = 'Datei'
      object LogVerzeichnisndern1: TMenuItem
        Action = AcChangePath
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Beenden1: TMenuItem
        Action = AcClose
      end
    end
    object Ansicht1: TMenuItem
      Caption = 'Fenster'
      object CombatLog1: TMenuItem
        Caption = 'Combat Log'
        OnClick = CombatLog1Click
      end
      object extStatistik1: TMenuItem
        Caption = 'Text-Statistik'
        OnClick = extStatistik1Click
      end
      object miShowDiag: TMenuItem
        Caption = 'Diagramm'
        OnClick = miShowDiagClick
      end
    end
    object Optionen1: TMenuItem
      Caption = 'Optionen'
      object miFilterFakeDmg: TMenuItem
        Caption = 'Angreifer = Ziel filtern'
        Checked = True
        OnClick = miFilterFakeDmgClick
      end
      object miTypeDmg: TMenuItem
        Caption = 'Statistik f'#252'r Typen anzeigen'
        Checked = True
        OnClick = miTypeDmgClick
      end
    end
    object N1: TMenuItem
      Caption = '?'
      object about1: TMenuItem
        Caption = #252'ber LogOnator'
      end
      object Debug1: TMenuItem
        Action = AcDebug
        Caption = 'Debugmode'
      end
    end
  end
  object AcList: TActionList
    Left = 243
    Top = 226
    object AcClose: TAction
      Caption = 'Beenden'
      OnExecute = AcCloseExecute
    end
    object AcChangePath: TAction
      Caption = 'Log-Verzeichnis '#228'ndern'
      OnExecute = AcChangePathExecute
    end
    object AcCancel: TAction
      Caption = 'AcCancel'
      ShortCut = 27
      OnExecute = AcCancelExecute
    end
    object AcDebug: TAction
      Caption = 'Debug'
      ShortCut = 57412
      OnExecute = AcDebugExecute
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 288
    Top = 224
  end
  object ImgList: TCsImageList
    ColorDepth = cd32Bit
    Items.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 24
    Top = 220
    Bitmap = {
      494C010111005000240110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B9AC3FF7288C5FF6579
      ABFF677BAAFF6479A8FF6178A6FF5E78A5FF5D76A4FF5F79A6FF647EAAFF6785
      AFFF6B89B3FF688EC0FF759ED4FFCCD6E2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000133299FF0E39BAFFB9C2
      D5FFE4E8EAFFE3E7E9FFE6EAECFFEAEDEFFFEEF1F2FFF2F4F5FFF5F7F7FFF9FA
      FAFFFDFDFDFF4476C1FF5F8AC5FF90ADD5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001435A4FF1A41BFFFBDC6
      D8FFEDF0F1FFE1E6E8FFE4E8EAFFE7EBEDFFEBEEF0FFEFF1F2FFF3F4F5FFF6F8
      F8FFFAFBFBFF3F78CFFF377ADAFF90ACD4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003C56BFFF0F3CD6FFBDC5
      D7FFE6E8EAFFDEE1E2FFCFD4D5FFD1D6D8FFD5D9D9FFD9DBDCFFDCDEDFFFDFE1
      E2FFF1F2F3FF3D77D6FF3080F7FF8FAAD3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000586EC7FF5974E1FFBEC5
      D7FFEDF0F1FFEEF0F2FFEAEEEFFFE3E7E9FFE5E9EBFFE9EDEEFFEDF0F1FFF1F3
      F4FFF4F6F7FF3C73D4FF2172F4FF8FA9D3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A6CC6FF627AE1FFBEC5
      D8FFE6E9E9FFE5E8E9FFE5E8E9FFE2E4E5FFD6DADBFFD3D7D9FFD7D9DBFFDADC
      DEFFECEEEFFF3B71D1FF1264F1FF8FA8D2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A6BC5FF647AE0FFBEC5
      D7FFE5E8E9FFE5E7E9FFE5E8E9FFE6E8E9FFE6E8E9FFE1E4E5FFDADEDFFFD9DB
      DDFFE9EBECFF3A6DCFFF095AEEFF8FA8D1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C6BC3FF6678DEFFBEC4
      D6FFEBEFF0FFECEFF0FFEDEFF1FFEDF0F2FFEEF1F2FFF0F2F3FFF1F3F4FFF2F5
      F5FFF3F5F5FF5380D4FF3978EFFF94AAD2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F6AC3FF6878DDFF5A6B
      BCFF5B6CB0FF5A6CB1FF6879B7FF6E81BDFF6D82BFFF6D83C0FF6D84C0FF6B86
      C2FF6A87C2FF5380E3FF5287EFFF95AAD3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006069C2FF6A78DCFF1C26
      9EFF101FB7FF0E26C8FFAAB0C3FFDDDFE2FFF6F7F7FFCDD0DCFFA3ADC4FFAFB7
      C3FFA6ADB3FF4976E0FF5384EDFF95A9D2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006168C1FF6B77DBFF151D
      9FFF000FB5FF001AC9FFA6ACBEFFD9DCE0FFE0E2E5FF4858BDFF0010B6FF5D73
      C4FFB7BCC0FF4B75DEFF5583EBFF94A8D1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006267C0FF6D76DAFF3E45
      ACFF3240C5FF152ECFFF9DA4B6FFD1D4D9FFDBDDE1FF4656BBFF0015C1FF6479
      CBFFC8CBCEFF4C73DDFF5782EAFF95A7D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000595DB3FF5A61C6FF4C53
      B3FF5562D1FF3349D7FF989FB1FFC6CBD1FFD3D6DBFF5D6BC4FF4D60DCFF6F84
      D4FFD8DADCFF4D71DBFF5980E8FF95A6D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005455B0FF5055BEFF4C53
      B3FF5764D4FF334AD9FF9DA3B5FFBEC3CAFFC9CDD3FF6977B9FF3F58D4FF8F9D
      D1FFEBECECFF4F70DAFF5778D2FFC8CEDDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008989B9FF7578BBFF8E8E
      B5FFA0A2C6FFA0A4C8FF8E92A2FF999FADFF989EABFFA1A6B2FFABB0BCFFB6BA
      C5FFB7BBC5FF6D7EB9FFC6CBDBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040404230707
      0733070707330303032200000000000000000000000000000000000000000000
      0000030303220707073307070733040404230000000000000000040404230707
      0733070707330303032200000000000000000000000000000000000000000000
      0000030303220707073307070733040404230000000000000000040404230707
      0733070707330303032200000000000000000000000000000000000000000000
      0000030303220707073307070733040404230000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004B3F28C0C18B
      22FFBF8A1FFF483E28BD03030321000000000000000000000000000000000303
      0322483D29BDC08B1EFFC18C21FF4B3F28C000000000000000003E3E3EC0B7B7
      B7FFB5B5B5FF3B3B3BBD03030321000000000000000000000000000000000303
      03223B3B3BBDB5B5B5FFB7B7B7FF3E3E3EC00000000000000000312823C0A343
      00FFA14300FF2F2823BD03030321000000000000000000000000000000000303
      03222F2723BDA24400FFA34400FF312823C00000000000000000CBCBCBFF3939
      39FF6B6B6BFF757575FF808080FF878787FF878787FF808080FF757575FF6B6B
      6BFF393939FF343434FF626262FF000000000000000000000000C28E26FFEEBB
      64FFE8AF4BFFD19729FF453B27B903030321000000000000000004040423453B
      29B9D09527FFE7AB45FFEDB85EFFC28E25FF0000000000000000B9B9B9FFECEC
      ECFFDDDDDDFFC2C2C2FF393939B9030303210000000000000000040404233939
      39B9C1C1C1FFDADADAFFE8E8E8FFB9B9B9FF0000000000000000A44700FFD072
      00FFCA6200FFB34B00FF2E2724B9030303210000000000000000040404232E27
      24B9B24800FFC95C00FFCF6D00FFA44700FF00000000CBCBCBFF333333FF3939
      39FFA9A9A9FF676767FF676767FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9
      A9FF393939FF646464FF333333FF000000000000000000000000C18E26FFFFF2
      D2FFE9B55AFFE7AC47FFD6982AFF453B27B90303032100000000453C28B8D398
      29FFE6A942FFE8B355FFFFF6D3FFC18E26FF0000000000000000B9B9B9FFFFFF
      FFFFE5E5E5FFDBDBDBFFC5C5C5FF393939B90303032100000000383838B8C3C3
      C3FFD8D8D8FFE2E2E2FFFFFFFFFFB9B9B9FF0000000000000000A34800FFE1CA
      92FFCB6B00FFC95D00FFB84800FF2E2724B903030321000000002E2824B8B54B
      00FFC85900FFCA6900FFE1D193FFA34800FF00000000373737FF676767FF4545
      45FFB3B3B3FF595959FF595959FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
      B3FF454545FF676767FF373737FF0000000000000000000000003E3627ACCF9E
      3EFFFFEFCCFFEEC473FFE6AC47FFD5982BFF423928B50606062E3C3527ADE9AA
      3FFFE9B253FFFFF3CEFFD5A650FF3E3627AC0000000000000000333333ACCBCB
      CBFFFFFFFFFFF4F4F4FFDADADAFFC5C5C5FF373737B50606062E333333ADD8D8
      D8FFE1E1E1FFFFFFFFFFD6D6D6FF333333AC00000000000000002B2724ACB158
      00FFE1C587FFD08700FFC85E00FFB74900FF2D2724B50606062E2A2725ADCB58
      00FFCB6600FFE1CC8BFFB76100FF2B2724AC000000003A3A3AFF6B6B6BFF5555
      55FFC2C2C2FF474747FF474747FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
      C2FF555555FF6B6B6BFF3A3A3AFF000000000000000000000000000000003A34
      27A7DBAC52FFFFEECBFFE8B459FFE7AD47FFD69829FF7C5F2CED787E87E9D9B7
      7BFFFFF4CBFFDCAC51FF3B3427A8000000000000000000000000000000003030
      30A7DADADAFFFFFFFFFFE4E4E4FFDBDBDBFFC4C4C4FF757575ED909090E9EBEB
      EBFFFFFFFFFFDADADAFF313131A8000000000000000000000000000000002926
      25A7BD6700FFE1C385FFCA6A00FFC95F00FFB84800FF53310EED49505CE9BB80
      19FFE1CE85FFBE6600FF2A2625A800000000000000003F3F3FFF707070FF6666
      66FFD3D3D3FF393939FF393939FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FF666666FF707070FF3F3F3FFF000000000000000000000000000000000000
      00003A3326A6E0B565FFFFEECBFFEAB458FFEBAD40FF9C752CFFDDE1E9FF9B9E
      A7FB36322A9B3D3626AB00000000000000000000000000000000000000000000
      0000303030A6E5E5E5FFFFFFFFFFE4E4E4FFDADADAFFA7A7A7FFFFFFFFFFCFCF
      CFFB2D2D2D9B323232AB00000000000000000000000000000000000000000000
      0000292624A6C27300FFE1C385FFCC6900FFCD5C00FF793F00FFB6BDCBFF6D72
      86FB2726249B2B2725AB000000000000000000000000434343FF757575FF7575
      75FFC2C2C2FFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFC2C2
      C2FF757575FF757575FF434343FF000000000000000003030322070707330303
      032200000000373125A2DDAC50FFFFF0C7FFDFBD83FFB3B5BCFF7A7A7BFF3232
      32A7070707330707073304040426000000000000000003030322070707330303
      0322000000002E2E2EA2DADADAFFFFFFFFFFF1F1F1FFF2F2F2FFB9B9B9FF3030
      30A7070707330707073304040426000000000000000003030322070707330303
      032200000000292524A2BF6500FFE1C779FFC1861DFF8F929EFF59595BFF2626
      27A70707073307070733040404260000000000000000484848FF7B7B7BFF7B7B
      7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B7BFF7B7B
      7BFF7B7B7BFF7B7B7BFF484848FF00000000030303223E3E3EBD868484FF3D3D
      3EBD000000060303031F795D25ECA1762BFFE2E6EDFFC9C9CBFFA7A5A4FF6E6D
      6CFF8A8B8FFF777881FF424244CB0606062F030303223E3E3EBDC0C0C0FF3E3E
      3EBD000000060303031F717171ECA9A9A9FFFFFFFFFFFFFFFFFFE1E1E1FFACAC
      ACFFC8C8C8FFB8B8B8FF484848CB0606062F030303222B2A2ABD636060FF292A
      2ABD000000060303031F522E0FEC833D00FFBCC3CFFFAAAAADFF898684FF4E4D
      4BFF64666CFF53555EFF2A2A2CCB0606062F000000004D4D4DFF818181FF6B6B
      6BFF646464FF646464FF646464FF646464FF646464FF646464FF646464FF6464
      64FF6B6B6BFF818181FF4D4D4DFF000000003E3E3EBDA5A19FFFBFBDBBFFAFAE
      ADFF0F0F0F4C323232B0A3A5AAFFE0E2E7FF828080FFD1D0D0FFC9C7C6FFD3D1
      D1FFEBEBECFFEFEEF0FFDCDCDCFF696866F03E3E3EBDDDDDDDFFF9F9F9FFEAEA
      EAFF0F0F0F4C333333B0E2E2E2FFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8AF02B2B2ABD878078FFA19E9AFF918F
      8EFF0F0F0F4C252526B080848CFFBDC0C9FF5F5C5CFFB3B1B1FFABA8A6FFB5B2
      B2FFCCCCCEFFD0CED2FFBEBEBEFF464441F000000000525252FF878787FFD9CC
      BEFFFFEEDDFFFFEEDDFFFFEEDDFFFFEEDDFFFFEEDDFFFFEEDDFFFFEEDDFFFFEE
      DDFFD9CCBEFF878787FF525252FF000000008A8987FFE0DEDEFFB9B7B5FFC3C1
      BFFF9F9C9BFF706F6DFFE7E7E7FFADAAA8FF83817BFFDBD9D8FFCECCCCFFCDCB
      C9FFCBC9CAFF898684FF878582FF8A8886FFC4C4C4FFFFFFFFFFF3F3F3FFFDFD
      FDFFD8D8D8FFADADADFFFFFFFFFFE6E6E6FFBCBCBCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC2C2C2FFC0C0C0FFC4C4C4FF676562FFC2BFBFFF9B9894FFA5A2
      9EFF817776FF504F4CFFC9C9C9FF8F8A87FF605D58FFBDBAB8FFB0ADADFFAFAC
      A8FFADAAABFF66615EFF64615CFF676461FF00000000565656FF8C8C8CFFFFF1
      E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1E4FFFFF1
      E4FFFFF1E4FF8C8C8CFF565656FF000000003A3939B0A29F9CFFE3E3E2FFC4C2
      BFFFD4D2D1FFBBB9B8FF757371FF2A2A2A918B8987FFE1E1E0FFCAC8C7FFCCCA
      C9FF8E8C89FF000000000000000000000000373737B0DBDBDBFFFFFFFFFFFDFD
      FDFFFFFFFFFFF5F5F5FFB2B2B2FF28282891C5C5C5FFFFFFFFFFFFFFFFFFFFFF
      FFFFC7C7C7FF000000000000000000000000292929B0847A75FFC5C5C3FFA6A3
      9EFFB6B3B1FF9D9A98FF55524FFF23232391686562FFC3C3C1FFACA9A7FFAEAB
      A9FF6B6863FF000000000000000000000000000000005B5B5BFF919191FFFFF6
      EEFFFFF6EEFFFFF6EEFFFFF6EEFFFFF6EEFFFFF6EEFFFFF6EEFFFFF6EEFFFFF6
      EEFFFFF6EEFF919191FF5B5B5BFF000000000000000000000000908D8BFFEAE9
      EAFFD0CECDFFD4D2D2FF2F2F2F9F0000000093918EFFE3E2E1FFBBB9B8FFBCBA
      BAFF94928FFF0707073307070733070707330000000000000000C9C9C9FFFFFF
      FFFFFFFFFFFFFFFFFFFF2D2D2D9F00000000CCCCCCFFFFFFFFFFF5F5F5FFF6F6
      F6FFCDCDCDFF07070733070707330707073300000000000000006D6865FFCCCA
      CCFFB2AFADFFB6B3B3FF2525259F00000000706D68FFC5C3C2FF9D9A98FF9E9B
      9BFF716E69FF070707330707073307070733000000005E5E5EFF959595FFFFFC
      F8FFFFFCF8FFFFFCF8FFFFFCF8FFFFFCF8FFFFFCF8FFFFFCF8FFFFFCF8FFFFFC
      F8FFFFFCF8FF959595FF5E5E5EFF000000000000000000000000363535AAAEAC
      A9FFF2F1F1FFAEADABFF0606062D00000008878683F4D5D4D3FFDDDBDBFFB4B1
      AFFFA9A6A4FF9D9B98FF9E9C98FF9C9B97FF0000000000000000333333AAE7E7
      E7FFFFFFFFFFE8E8E8FF0606062D00000008A8A8A8F4FFFFFFFFFFFFFFFFEDED
      EDFFE2E2E2FFD6D6D6FFD7D7D7FFD6D6D6FF0000000000000000282727AA908D
      88FFD4D2D2FF908E8BFF0606062D000000085F5D5AF4B7B5B4FFBFBCBCFF9691
      8EFF8B8683FF7A7772FF807871FF797771FF00000000626262FF989898FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF989898FF626262FF000000000000000000000000000000003434
      33A8B5B3B2FFFFFEFEFF616160E61212125311111152AFADABFFDBDAD9FFF0EE
      EFFFECEBEAFFE2E0E0FFBFBCBCFFA3A19EFF0000000000000000000000003131
      31A8EFEFEFFFFFFFFFFF777777E61212125311111152E9E9E9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF9F9F9FFDCDCDCFF0000000000000000000000002827
      27A8979492FFE1DFDFFF3E3E3DE61212125311111152918E8AFFBDBBBAFFD2CE
      D0FFCECCCBFFC4C1C1FFA19C9CFF858278FF000000008A8A8AFF676767FFFFD0
      A0FFFFD6ABFFFFDCB8FFFFE2C3FFFFE6CCFFFFE6CCFFFFE2C3FFFFDCB8FFFFD6
      ABFFFFD0A0FF676767FF8A8A8AFF000000000000000000000000000000000000
      000025252584B2B0AFFFB6B4B3FF8A8887FF373737B10505052B747270E4AEAC
      A9FFB9B6B5FFABA9A5FF5D5B5AD2040404230000000000000000000000000000
      000023232384ECECECFFF0F0F0FFC4C4C4FF353535B10505052B818181E4E7E7
      E7FFF2F2F2FFE4E4E4FF5D5D5DD2040404230000000000000000000000000000
      00002020208494918FFF989593FF676462FF282828B10505052B4B4948E4908D
      88FF9B9694FF8D8A83FF3B3B39D2040404230000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000707073307070733000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000707073307070733000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000707073307070733000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070733008945FF008945FF070707330000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070733818181FF818181FF070707330000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070733006600FF006600FF070707330000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      0733008641FF07E9ABFF07E9ABFF008641FF0707073300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07337A7A7AFFC6C6C6FFC6C6C6FF7A7A7AFF0707073300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      0733006300FF00CB5AFF00CB5AFF006300FF0707073300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000070707330086
      40FF07E7A9FF00D89DFF00D89DFF07E7A9FF008640FF07070733000000000000
      0000000000000000000000000000000000000000000000000000070707337A7A
      7AFFC4C4C4FFB8B8B8FFB8B8B8FFC4C4C4FF7A7A7AFF07070733000000000000
      0000000000000000000000000000000000000000000000000000070707330063
      00FF00C958FF00BA4FFF00BA4FFF00C958FF006300FF07070733000000000000
      00000000000000000000000000000000000000000000000000002C1601485E31
      0499000000000000000000000000000000000000000000000000000000000000
      00005E3104992C16014800000000000000000000000007070733008640FF19E9
      B0FF00D39DFF00D19AFF00D19AFF00D39DFF19E9B0FF008640FF070707330000
      00000000000000000000000000000000000000000000070707337A7A7AFFCDCD
      CDFFB6B6B6FFB5B5B5FFB5B5B5FFB6B6B6FFCDCDCDFF7A7A7AFF070707330000
      0000000000000000000000000000000000000000000007070733006300FF00CB
      63FF00B553FF00B350FF00B350FF00B553FF00CB63FF006300FF070707330000
      00000000000000000000000000000000000000000000301B0348864A0ACC864A
      0ACC000000000000000000000000000000000000000000000000000000000000
      0000864A0ACC864A0ACC301B03480000000007070733008640FF29EBB9FF00CF
      9CFF00CD9AFF00CC99FF00CC99FF00CD9AFF00CF9CFF29EBB9FF00863FFF0707
      073300000000000000000000000000000000070707337A7A7AFFD6D6D6FFB5B5
      B5FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB5B5B5FFD6D6D6FF797979FF0707
      07330000000000000000000000000000000007070733006300FF00CD71FF00B1
      55FF00AF53FF00AE52FF00AE52FF00AF53FF00B155FF00CD71FF006300FF0707
      073300000000000000000000000000000000341D0748915413CCFDD88CFF9154
      13CC915413CC915413CC915413CC915413CC915413CC915413CC915413CC9154
      13CC915413CCF7B934FF915413CC341D0748008944FF38EFC4FF00C99BFF00C8
      99FF00C99AFF38E9BDFF38E9BDFF00C99AFF00C89AFF00CA9BFF3AEEC2FF0086
      3FFF07070733000000000000000000000000818181FFE0E0E0FFB2B2B2FFB1B1
      B1FFB2B2B2FFDCDCDCFFDCDCDCFFB2B2B2FFB2B2B2FFB3B3B3FFE0E0E0FF7979
      79FF07070733000000000000000000000000006600FF00D186FF00AB58FF00AA
      55FF00AB56FF00CB79FF00CB79FF00AB56FF00AA57FF00AC57FF00D083FF0063
      00FF070707330000000000000000000000009C601BCCFFDC90FFFCCD81FFFCD4
      88FFF9CF83FFF7CA7DFFF4C578FFEFBF76FFEABA72FFE8B76BFFE9B661FFEDB6
      53FFF2B844FFF5AD16FFFCBB26FF9C601BCC008943FF4AF0CDFF00C69BFF00C5
      9BFF4BEFCAFF00833CFF00833CFF4BEFCAFF00C69BFF00C59AFF00C69CFF4BF0
      CBFF00863EFF070707330000000000000000818181FFEAEAEAFFB1B1B1FFB1B1
      B1FFE9E9E9FF777777FF777777FFE9E9E9FFB1B1B1FFB1B1B1FFB2B2B2FFE9E9
      E9FF797979FF070707330000000000000000006600FF00D295FF00A85AFF00A7
      5BFF00D190FF006000FF006000FF00D190FF00A85AFF00A759FF00A85CFF00D2
      91FF006300FF0707073300000000000000003B260C48A86C24CCFDD88CFFA86C
      24CCA86C24CCA86C24CCA86C24CCA86C24CCA86C24CCA86C24CCA86C24CCA86C
      24CCA86C24CCF7B934FFA86C24CC3B260C480000000000863EFF5AF2D4FF5BF2
      D4FF00863EFF000000000000000000853EFF5CF1D2FF00C19BFF00C09AFF00C2
      9BFF5CF2D2FF00863EFF070707330000000000000000797979FFF2F2F2FFF2F2
      F2FF797979FF0000000000000000797979FFF2F2F2FFB0B0B0FFAFAFAFFFB0B0
      B0FFF2F2F2FF797979FF070707330000000000000000006300FF00D49FFF00D4
      9FFF006300FF0000000000000000006200FF00D39DFF00A35EFF00A25DFF00A4
      5DFF00D49CFF006300FF0707073300000000000000003F2A1048B2762CCCB276
      2CCC000000000000000000000000000000000000000000000000000000000000
      0000B2762CCCB2762CCC3F2A1048000000000000000000000000008943FF0089
      43FF0000000000000000000000000000000000863EFF6EF3DBFF00BC9AFF00BC
      99FF00BD9BFF5BF2D2FF00863EFF070707330000000000000000818181FF8181
      81FF00000000000000000000000000000000797979FFFBFBFBFFAEAEAEFFADAD
      ADFFAEAEAEFFF2F2F2FF797979FF070707330000000000000000006600FF0066
      00FF00000000000000000000000000000000006300FF00D5ABFF009E60FF009E
      5EFF009F61FF00D49CFF006300FF070707330000000000000000402C12488B5E
      2599000000000000000000000000000000000000000000000000000000000000
      00008B5E2599402C124800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000863DFF83F4E4FF00B8
      9BFF00B79AFF00B79BFF6BF4DCFF008942FF0000000000000000000000000000
      00000000000000000000000000000000000000000000797979FFFFFFFFFFADAD
      ADFFACACACFFACACACFFFBFBFBFF808080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000006300FF0BD6BAFF009A
      64FF009964FF009965FF00D6ACFF006600FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000863DFF83F4
      E4FF00B29AFF00B29AFF81F5E5FF008942FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000797979FFFFFF
      FFFFAAAAAAFFAAAAAAFFFFFFFFFF808080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006300FF0BD6
      BAFF009467FF009467FF06D7BBFF006600FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000086
      3DFF91F8EEFF91F8EEFF00863DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007979
      79FFFFFFFFFFFFFFFFFF797979FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      00FF20DAC8FF20DAC8FF006300FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008942FF008942FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080FF808080FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600FF006600FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000B000000480000005500000057000000560000004D0000
      0024000000000000000000000000000000000000000000000000000000000000
      0000000000000000000B000000480000005500000057000000560000004D0000
      0024000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000601040B62012793DE002FC6F8002DC0FA002DC4F900279EE8010F359D0000
      0059000000550000001300000000000000000000000000000000000000000000
      0006000312620000DEDE0000F8F80000FAFA0000F9F90000E8E800035E9D0000
      0059000000550000001300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001030616012D
      A6E40036DAFF0034D4FF0033D2FF0032D1FF0032D1FF0033D2FF0032D2FF012B
      B9F8000A187C0000005800000012000000000000000000000000000109160003
      E4E40000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      F8F80005287C0000005800000012000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010407100237C9F70038
      DDFF0037DAFF0031D0FF0033D2FF0034D4FF0034D4FF0035D5FF002ECCFF0036
      DAFF012DC3FD010C197C00000057000000060000000000030B100003F7F70000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FDFD0006287C00000057000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000331A4D20037E2FF0038
      E1FF0030D3FF2E3FB3FF0F26ADFF0033D6FF0035DBFF2E55D8FF0F20A3FF001A
      ADFF0034DAFF022DBAFA0105086300000036000000000009D2D20000FFFF0000
      FFFF0000FFFF0012FFFF0000FFFF0000FFFF0000FFFF0025FFFF0000FFFF0000
      FFFF0000FFFF0000FAFA00030B630000003600000000A2A2A2FFA2A2A2FFA2A2
      A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2
      A2FFA2A2A2FFA2A2A2FFA2A2A2FF00000000000000000000A6FF0000A6FF0000
      A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000
      A6FF0000A6FF0000A6FF0000A6FF00000000020D22300037E3FF0036E3FF1A4C
      E2FFD9DADFFFF9F9F9FFD0D4EDFF0F26AEFF5E7CE4FFFFFFFFFFF0F1F9FF5E6A
      C2FF0015A5FF002EDCFF052461BD00000054000830300000FFFF0000FFFF0017
      FFFFD6D8E5FFF9F9F9FFC0CAFFFF0000FFFF0E56FFFFFFFFFFFFECEEFFFF2B48
      FFFF0000FFFF0000FFFF0010A2BD0000005400000000A2A2A2FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FFD3D3D3FFD3D3D3FFA2A2A2FF00000000000000000000A6FF0000CCFF0000
      CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF0000
      CCFF0000CCFF0000CCFF0000A6FF0000000005328BBA0030E0FF0033E3FF0035
      E6FFB9C3E4FFE3E3E3FFFDFDFDFFE0E2F3FFFFFFFFFFFFFFFFFFF0F1F9FF2E42
      BAFF002BD4FF002DDDFF042EB4F5000000590013BABA0000FFFF0000FFFF0000
      FFFFA0B8FFFFE3E3E3FFFDFDFDFFD8DDFFFFFFFFFFFFFFFFFFFFECEEFFFF0013
      FFFF0000FFFF0000FFFF0000F5F50000005900000000A2A2A2FFE9E9E9FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFE9E9E9FFA2A2A2FF00000000000000000000A6FF1A31CFFF0000
      D2FF0000D2FF0000D2FF0000D2FF0000D2FF0000D2FF0000D2FF0000D2FF0000
      D2FF0000D2FF1A31CFFF0000A6FF000000000435BDEB002BDEFF002FE3FF0031
      E6FF0032E9FFC5CDE6FFE3E3E3FFFDFDFDFFFFFFFFFFFFFFFFFF3E55CBFF002D
      DFFF002BDFFF0028DAFF032AC7FF000000590002EBEB0000FFFF0000FFFF0000
      FFFF0000FFFFB1C5FFFFE3E3E3FFFDFDFDFFFFFFFFFFFFFFFFFF0028FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000005900000000A2A2A2FFFEFEFEFFB8B8
      B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFB8B8B8FFFEFEFEFFA2A2A2FF00000000000000000000A6FF4F5FD2FF0000
      CDFF0000CDFF0000CDFF0000CDFF0000CDFF0000CDFF0000CDFF0000CDFF0000
      CDFF0000CDFF4F5FD2FF0000A6FF000000000633BEEB0027DBFF002AE1FF002C
      E6FF002DE9FF103BEDFFDFE0E1FFE5E5E5FFFFFFFFFF7E88CFFF0016ABFF0027
      E0FF0027DEFF0024D8FF0229C7FF000000590000EBEB0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFFDDE0E2FFE5E5E5FFFFFFFFFF556BFFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000005900000000A2A2A2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA2A2A2FF00000000000000000000A6FF7483D4FF7483
      D4FF7483D4FF7483D4FF7483D4FF7483D4FF7483D4FF7483D4FF7483D4FF7483
      D4FF7483D4FF7483D4FF0000A6FF000000000631BAEA0022D8FF0529E0FF042B
      E6FF0930EAFFC7CAE0FFDDDDDDFFF9F9F9FFFFFFFFFFF0F1F9FF2E3DAFFF0016
      AAFF0324DAFF0020D6FF0328C8FF000000570001EAEA0000FFFF0000FFFF0000
      FFFF0000FFFFBAC1F6FFDDDDDDFFF9F9F9FFFFFFFFFFECEEFFFF000FFFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000005700000000A2A2A2FFA2A2A2FFA2A2
      A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2
      A2FFA2A2A2FFA2A2A2FFA2A2A2FF00000000000000000000A6FF0000A6FF0000
      A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000A6FF0000
      A6FF0000A6FF0000A6FF0000A6FF000000000836A4CD2F49DFFF687DECFF2544
      EAFFC4C9E1FFDDDDDDFFF2F2F2FF8A98E7FFE9ECFDFFFFFFFFFFF0F1F9FF2E3D
      AFFF0317A9FF0A25D7FF0933BFFC000000430011CDCD000FFFFF2053FFFF0005
      FFFFB5C1FAFFDDDDDDFFF2F2F2FF5678FFFFDFE7FFFFFFFFFFFFECEEFFFF000F
      FFFF0000FFFF0000FFFF0000FCFC000000430000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000006295467586DE6FFB5BEF6FFA8B3
      F5FFDFDFDFFFF2F2F2FF8693E5FF677DF7FF8396F8FFF5F7FEFFF2F3FBFF5E6A
      C2FF1125B8FF3B51E1FF104498D60000000D001B67670C3EFFFF93A9FFFF7E9A
      FFFFDFDFDFFFF2F2F2FF5271FFFF1A4FFFFF416FFFFFF1F6FFFFEEF0FFFF2B48
      FFFF0000FFFF0018FFFF002AD6D60000000D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001441CCF1C4CCF8FFA7B3
      F7FFABB7F9FF9BA8F3FF778CF8FF7B90F9FF7A8FF8FF97A6FAFF7185F6FF374C
      D2FF7C8EF0FF4763DDFE0A1821500000000300000000000FF1F1A8BBFFFF7C9A
      FFFF819DFFFF6C8CFFFF3060FFFF3666FFFF3565FFFF6085FFFF2B58FFFF0018
      FFFF3E67FFFF0034FEFE00162E50000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000821383C264BE4FDA0AC
      F7FF9CABF8FFBAC4FBFFA6B3FBFF8FA0FAFF8D9EFAFF8597F9FF95A4F9FFB3BD
      F9FF8A99F1FF2A4E7BA6080808100000000200000000001B3C3C0012FDFD708E
      FFFF688DFFFF97AFFFFF7696FFFF557EFFFF517AFFFF4470FFFF5F84FFFF8FA7
      FFFF5276FFFF0043A6A608080810000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020202172F474A385C
      E6FB98A7F9FFE6EAFDFFF0F2FEFFE8EBFEFFD7DDFDFFE8EBFDFFCFD6FCFF8194
      F0FE3D6290A71818182005050508000000010000000002020202002B4A4A0029
      FBFB6388FFFFD9E3FFFFE9EEFFFFDDE4FFFFC4D2FFFFDCE3FFFFB7C8FFFF4371
      FEFE0054A7A71818182005050508000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808081D24
      292A3D68BBC55E7BEBFC7E94F8FFA0AFFCFF9EAEFAFF758CEEFE5C83D2E23746
      4D571B1B1B200909090B02020203000000000000000000000000080808081124
      2A2A004BC5C50C51FCFC3A6DFFFF6C91FFFF6B92FFFF3068FEFE0D68E2E22144
      57571B1B1B200909090B02020203000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF008A46FF008A46FF008A46FF008A46FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FF818181FF818181FF818181FF818181FF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF006900FF006900FF006900FF006900FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF04C687FF04C687FF04C687FF04C687FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFACACACFFACACACFFACACACFFACACACFF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00A83AFF00A83AFF00A83AFF00A83AFF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF0DC98EFF00D89FFF00D89FFF0DC98EFF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFB3B3B3FFB9B9B9FFB9B9B9FFB3B3B3FF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00AB44FF00BA55FF00BA55FF00AB44FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF17CE96FF00D59FFF00D59FFF17CE96FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFBABABAFFB8B8B8FFB8B8B8FFBABABAFF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00B04DFF00B757FF00B757FF00B04DFF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008A46FF008A46FF008A
      46FF008A46FF008A46FF23D39FFF00D29EFF00D29EFF23D39FFF008A46FF008A
      46FF008A46FF008A46FF008A46FF0000000000000000818181FF818181FF8181
      81FF818181FF818181FFC3C3C3FFB6B6B6FFB6B6B6FFC3C3C3FF818181FF8181
      81FF818181FF818181FF818181FF0000000000000000006900FF006900FF0069
      00FF006900FF006900FF00B559FF00B458FF00B458FF00B559FF006900FF0069
      00FF006900FF006900FF006900FF00000000000000002E3EC4FF2E3EC4FF2E3E
      C4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3E
      C4FF2E3EC4FF2E3EC4FF2E3EC4FF0000000000000000008A46FF30D8A9FF30D8
      A9FF30D8A9FF30D8A9FF30D8A9FF00CE9EFF00CE9EFF30D8A9FF30D8A9FF30D8
      A9FF30D8A9FF30D8A9FF008A46FF0000000000000000818181FFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFB5B5B5FFB5B5B5FFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFF818181FF0000000000000000006900FF00BA66FF00BA
      66FF00BA66FF00BA66FF00BA66FF00B05BFF00B05BFF00BA66FF00BA66FF00BA
      66FF00BA66FF00BA66FF006900FF00000000000000002E3EC4FF6575EAFF6575
      EAFF6575EAFF6575EAFF6575EAFF6575EAFF6575EAFF6575EAFF6575EAFF6575
      EAFF6575EAFF6575EAFF2E3EC4FF0000000000000000008A46FF3DDDB3FF00CA
      9DFF00CA9DFF00CA9DFF00CA9DFF00CA9DFF00CA9DFF00CA9DFF00CA9DFF00CA
      9DFF00CA9DFF3DDDB3FF008A46FF0000000000000000818181FFD6D6D6FFB3B3
      B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
      B3FFB3B3B3FFD6D6D6FF818181FF0000000000000000006900FF00BF73FF00AC
      5CFF00AC5CFF00AC5CFF00AC5CFF00AC5CFF00AC5CFF00AC5CFF00AC5CFF00AC
      5CFF00AC5CFF00BF73FF006900FF00000000000000002E3EC4FF8794EDFF445B
      F0FF445BF0FF445BF0FF445BF0FF445BF0FF445BF0FF445BF0FF445BF0FF445B
      F0FF445BF0FF8794EDFF2E3EC4FF0000000000000000008A46FF49E3BEFF00C7
      9DFF00C79DFF00C79DFF00C79DFF00C79DFF00C79DFF00C79DFF00C79DFF00C7
      9DFF00C79DFF49E3BEFF008A46FF0000000000000000818181FFDFDFDFFFB2B2
      B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
      B2FFB2B2B2FFDFDFDFFF818181FF0000000000000000006900FF00C585FF00A9
      5FFF00A95FFF00A95FFF00A95FFF00A95FFF00A95FFF00A95FFF00A95FFF00A9
      5FFF00A95FFF00C585FF006900FF00000000000000002E3EC4FFA7B0F0FF3851
      EBFF3851EBFF3851EBFF3851EBFF3851EBFF3851EBFF3851EBFF3851EBFF3851
      EBFF3851EBFFA7B0F0FF2E3EC4FF0000000000000000008A46FF56E8C8FF56E8
      C8FF56E8C8FF56E8C8FF56E8C8FF00C39DFF00C39DFF56E8C8FF56E8C8FF56E8
      C8FF56E8C8FF56E8C8FF008A46FF0000000000000000818181FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFB1B1B1FFB1B1B1FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FF818181FF0000000000000000006900FF00CA92FF00CA
      92FF00CA92FF00CA92FF00CA92FF00A562FF00A562FF00CA92FF00CA92FF00CA
      92FF00CA92FF00CA92FF006900FF00000000000000002E3EC4FFBDC4F2FFBDC4
      F2FFBDC4F2FFBDC4F2FFBDC4F2FFBDC4F2FFBDC4F2FFBDC4F2FFBDC4F2FFBDC4
      F2FFBDC4F2FFBDC4F2FF2E3EC4FF0000000000000000008A46FF008A46FF008A
      46FF008A46FF008A46FF62EDD1FF00C09CFF00C09CFF62EDD1FF008A46FF008A
      46FF008A46FF008A46FF008A46FF0000000000000000818181FF818181FF8181
      81FF818181FF818181FFF1F1F1FFB0B0B0FFB0B0B0FFF1F1F1FF818181FF8181
      81FF818181FF818181FF818181FF0000000000000000006900FF006900FF0069
      00FF006900FF006900FF00CF9EFF00A262FF00A262FF00CF9EFF006900FF0069
      00FF006900FF006900FF006900FF00000000000000002E3EC4FF2E3EC4FF2E3E
      C4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3EC4FF2E3E
      C4FF2E3EC4FF2E3EC4FF2E3EC4FF000000000000000000000000000000000000
      000000000000008A46FF6CF2D9FF00BD9CFF00BD9CFF6CF2D9FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFF9F9F9FFAFAFAFFFAFAFAFFFF9F9F9FF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00D4A8FF009F64FF009F64FF00D4A8FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF75F5E0FF00BA9BFF00BA9BFF75F5E0FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFFFFFFFFFADADADFFADADADFFFFFFFFFF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00D7B2FF009C65FF009C65FF00D7B2FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF7BF8E5FF7BF8E5FF7BF8E5FF7BF8E5FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF00DAB9FF00DAB9FF00DAB9FF00DAB9FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008A46FF008A46FF008A46FF008A46FF008A46FF008A46FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000818181FF818181FF818181FF818181FF818181FF818181FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006900FF006900FF006900FF006900FF006900FF006900FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C3F0C3F0C3F00000C1E0C1E0C1E00000
      C0C0C0C0C0C00000C040C040C0400000C000C000C0000000E001E001E0010000
      F003F003F0030000880188018801000000000000000000000000000000000000
      00000000000000000007000700070000C100C100C1000000C000C000C0000000
      E000E000E0000000F000F000F0000000FFFFFFFFFFFFFFFFFFFFF9FFF9FFF9FF
      FFFFF0FFF0FFF0FFFFFFE07FE07FE07FFFFFC03FC03FC03FCFF3801F801F801F
      8FF1000F000F000F000000070007000700000003000300030000860186018601
      8FF1CF00CF00CF00CFF3FF80FF80FF80FFFFFFC0FFC0FFC0FFFFFFE1FFE1FFE1
      FFFFFFF3FFF3FFF3FFFFFFFFFFFFFFFF00000000F80FF80F00000000E003E003
      00000000C001C001000000008000800000000000800080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800080000000000080008000
      000000008000800000000000C001C00100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ImgListCheck: TCsImageList
    ColorDepth = cd24Bit
    Items.Strings = (
      ''
      '')
    Left = 736
    Top = 48
    Bitmap = {
      494C010102000800D00010001000FFFFFFFF1910FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000100000000100180000000000000C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622F99622F99622F9962
      2F99622F99622F99622F99622F99622F99622F99622F99622F99622F99622F00
      000000000099622F99622F99622F99622F99622F99622F99622F99622F99622F
      99622F99622F99622F99622F99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FF1F1F1F1F1F1F1F1
      F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF99622F00
      000000000099622FF1F1F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
      FFFFFFFFFFFFFFFFFFFFFFFF99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FF1F1F1F1F1F1F1F1
      F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF99622F00
      000000000099622FF1F1F1F1F1F1F8F8F8F8F8F8800000F8F8F8F8F8F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FF1F1F1F1F1F1F1F1
      F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFFFFFFFFFFFFFFFFF99622F00
      000000000099622FF1F1F1F1F1F1F1F1F1800000800000800000F8F8F8F8F8F8
      FFFFFFFFFFFFFFFFFFFFFFFF99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FEAEAEAEAEAEAF1F1
      F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFFFFFFFFFFF99622F00
      000000000099622FEAEAEAF1F1F1800000800000800000800000800000F8F8F8
      F8F8F8FFFFFFFFFFFFFFFFFF99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FEAEAEAEAEAEAEAEA
      EAF1F1F1F1F1F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F8F8F8F899622F00
      000000000099622FEAEAEA800000800000800000800000800000800000800000
      F8F8F8F8F8F8FFFFFFF8F8F899622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FE3E3E3E3E3E3EAEA
      EAEAEAEAF1F1F1F1F1F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F899622F00
      000000000099622FE3E3E3800000800000800000F1F1F1800000800000800000
      800000F8F8F8F8F8F8F8F8F899622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FE3E3E3E3E3E3EAEA
      EAEAEAEAF1F1F1F1F1F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F8F8F8F899622F00
      000000000099622FE3E3E3800000800000EAEAEAF1F1F1F1F1F1800000800000
      800000800000F8F8F8F8F8F899622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FDDDDDDDDDDDDE3E3
      E3EAEAEAEAEAEAF1F1F1F1F1F1F1F1F1F1F1F1F8F8F8F8F8F8F8F8F899622F00
      000000000099622FDDDDDD800000E3E3E3EAEAEAF1F1F1F1F1F1F1F1F1800000
      800000800000800000F8F8F899622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FDDDDDDDDDDDDDDDD
      DDE3E3E3EAEAEAEAEAEAEAEAEAF1F1F1F1F1F1F1F1F1F8F8F8F8F8F899622F00
      000000000099622FDDDDDDE3E3E3E3E3E3EAEAEAEAEAEAF1F1F1F1F1F1F1F1F1
      800000800000800000F8F8F899622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FDDDDDDDDDDDDDDDD
      DDDDDDDDE3E3E3EAEAEAEAEAEAEAEAEAF1F1F1F1F1F1F1F1F1F1F1F199622F00
      000000000099622FDDDDDDDDDDDDE3E3E3E3E3E3EAEAEAEAEAEAEAEAEAF1F1F1
      F1F1F1800000800000F1F1F199622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FD7D7D7D7D7D7DDDD
      DDDDDDDDDDDDDDE3E3E3E3E3E3EAEAEAEAEAEAF1F1F1F1F1F1F1F1F199622F00
      000000000099622FD7D7D7DDDDDDDDDDDDE3E3E3E3E3E3EAEAEAEAEAEAEAEAEA
      F1F1F1F1F1F1800000F1F1F199622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622FD7D7D7D7D7D7DDDD
      DDDDDDDDDDDDDDE3E3E3E3E3E3EAEAEAEAEAEAF1F1F1F1F1F1F1F1F199622F00
      000000000099622FD7D7D7D7D7D7DDDDDDDDDDDDDDDDDDE3E3E3E3E3E3EAEAEA
      EAEAEAF1F1F1F1F1F1F1F1F199622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000099622F99622F99622F9962
      2F99622F99622F99622F99622F99622F99622F99622F99622F99622F99622F00
      000000000099622F99622F99622F99622F99622F99622F99622F99622F99622F
      99622F99622F99622F99622F99622F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ilSgGroups: TCsImageList
    ColorDepth = cd32Bit
    Height = 15
    Width = 15
    Items.Strings = (
      'erweitern'
      'verstecken'
      ''
      '')
    Left = 88
    Top = 240
    Bitmap = {
      494C010104000800E4000F000F00FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000003C0000001E0000000100200000000000201C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000151515155D5853638C7565A7AE8466DCC28C66FBAE84
      66DC8C7565A75D58536315151515000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000151515155D5853638C7565A7AE8466DCC28C66FBAE8466DC8C7565A75D58
      5363151515150000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000041404043998475B0CFA2
      7EFFECDAC1FFF9F4DEFFFFFFEAFFF9F4DDFFECDAC1FFCFA280FF998475B04140
      4043000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000041404043998475B0CFA27EFFECDAC1FFF9F4
      DEFFFFFFEAFFF9F4DDFFECDAC1FFCFA280FF998475B041404043000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000414040439C7254C9DBB790FFF5E8BFFFF9F0C7FFFBF5CDFFFCF7D1FFFCF8
      D1FFFCF6CDFFF8EEC5FFDCBB94FF9B7152C94140404300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414040439C72
      54C9DBB790FFF5E8BFFFF9F0C7FFFBF5CDFFFCF7D1FFFCF8D1FFFCF6CDFFF8EE
      C5FFDCBB94FF9B7152C941404043000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000015151515998475B0D7B087FFEDD8ACFFF1DE
      B3FFF2E4B9FFF5EABDFFF7EDC1FFF7EEC2FFF6EABEFFF2E5B9FFF1DFB3FFD9B3
      89FF998475B01515151500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000015151515998475B0D7B087FFEDD8ACFFF1DEB3FFF2E4B9FFF5EA
      BDFFF7EDC1FFF7EEC2FFF6EABEFFF2E5B9FFF1DFB3FFD9B389FF998475B01515
      1515000000000000000000000000000000000000000000000000141414141414
      1414141414140000000000000000000000000000000000000000000000005D58
      5563C9986FFFE4C797FFE7CEA0FFEAD5A7FFEDDAABFFEFDFB0FFF1E0B2FFF1DF
      B2FFEFE0B0FFEDDAABFFEBD5A7FFE6CDA0FFCA9970FF5D585563000000000000
      0000000000001414141414141414141414141414141400000000141414141414
      141414141414141414140000000000000000000000005D585563C9986FFFE4C7
      97FFE7CEA0FFEAD5A7FFEDDAABFFEFDFB0FFF1E0B2FFF1DFB2FFEFE0B0FFEDDA
      ABFFEBD5A7FFE6CDA0FFCA9970FF5D5855630000000000000000000000000000
      0000000000001414141414141414993200FF1414141414141414000000000000
      00000000000000000000000000008E7767A7D6AD81FFE3C697FFE6CC9EFFE9D2
      A2FFECD6A9FFEDDAADFF610100FFEFDDB0FFEEDAADFFEDD6A9FFEAD1A3FFE6CC
      9FFFD8B388FF8E7767A700000000000000000000000014141414993200FF9932
      00FF141414141414141414141414993200FF993200FF14141414000000000000
      0000000000008E7767A7D6AD81FFE3C697FFE6CC9EFF610100FF610100FFEDDA
      ADFFEEDDB0FFEFDDB0FF610100FF610100FFEAD1A3FFE6CC9FFFD8B388FF8E77
      67A7000000000000000000000000000000001414141414141414993200FF9932
      00FF993200FF141414141414141400000000000000000000000000000000AF85
      67DCE2C39EFFEAD4AFFFEEDAB7FFF1DFBDFFF4E6C3FF610100FF610100FF6101
      00FFF6EAC8FFF4E7C4FFF1E0BEFFEEDAB8FFE7CEA9FFAF8567DC000000000000
      00000000000014141414993200FF993200FF993200FF14141414993200FF9932
      00FF993200FF14141414000000000000000000000000AF8567DCE2C39EFFEAD4
      AFFFEEDAB7FF610100FF610100FF610100FFEEDDB0FF610100FF610100FF6101
      00FFF1E0BEFFEEDAB8FFE7CEA9FFAF8567DC0000000000000000000000001414
      141414141414993200FF993200FF993200FF993200FF993200FF141414141414
      1414000000000000000000000000C38F69FBEAD2B1FFF0DDC1FFF4E5CAFFF7EB
      D0FF610100FF610100FF610100FF610100FF610100FFF9F0D6FFF7ECD1FFF4E6
      CBFFF0DDC0FFC38F69FB00000000000000000000000014141414141414149932
      00FF993200FF993200FF993200FF993200FF1414141414141414000000000000
      000000000000C38F69FBEAD2B1FFF0DDC1FFF4E5CAFFF7EBD0FF610100FF6101
      00FF610100FF610100FF610100FFF9F0D6FFF7ECD1FFF4E6CBFFF0DDC0FFC38F
      69FB00000000000000000000000014141414993200FF993200FF993200FF1414
      1414993200FF993200FF993200FF14141414000000000000000000000000AF85
      67DCE8CEADFFF1DEC2FFF5E6CBFF610100FF610100FF610100FFFBF6E0FF6101
      00FF610100FF610100FFF7ECD1FFF6E7CCFFEDD7BAFFAF8567DC000000000000
      000000000000000000001414141414141414993200FF993200FF993200FF1414
      14141414141400000000000000000000000000000000AF8567DCE8CEADFFF1DE
      C2FFF5E6CBFFF7EBD1FFF8F0D6FF610100FF610100FF610100FFFBF4DAFFF8F0
      D7FFF7ECD1FFF6E7CCFFEDD7BAFFAF8567DC0000000000000000000000001414
      1414993200FF993200FF141414141414141414141414993200FF993200FF1414
      14140000000000000000000000008E7767A7DFBF9EFFF2E3C7FFF6E8CFFF6101
      00FF610100FFFBF6E0FFFBF6E0FFFBF6E0FF610100FF610100FFF8EED5FFF6E9
      D0FFE3C6A8FF8E7767A700000000000000000000000000000000000000001414
      141414141414993200FF14141414141414140000000000000000000000000000
      0000000000008E7767A7DFBF9EFFF2E3C7FFF6E8CFFFF8EDD4FFF9F2D9FFFBF5
      DCFF610100FFFDF6DFFFFCF6DCFFF9F2D9FFF8EED5FFF6E9D0FFE3C6A8FF8E77
      67A7000000000000000000000000141414141414141414141414141414140000
      0000141414141414141414141414141414140000000000000000000000005D58
      5563CEA07CFFF4E4CAFFF8EBD2FFF9F0D7FFF9F4DCFFFBF6DEFFFBF6E0FFFBF6
      E0FFFBF6DFFFFAF4DCFFF9F1D7FFF8EBD2FFD0A380FF5D585563000000000000
      0000000000000000000000000000000000001414141414141414141414140000
      000000000000000000000000000000000000000000005D585563CEA07CFFF4E4
      CAFFF8EBD2FFF9F0D7FFF9F4DCFFFBF6DEFFFBF6E0FFFBF6E0FFFBF6DFFFFAF4
      DCFFF9F1D7FFF8EBD2FFD0A380FF5D5855630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000015151515998173B0E4C8B1FFFBF6E9FFFCF8
      EDFFFDFAEEFFFDFAF0FFFDFAF1FFFDFAF1FFFDFAF0FFFDFAEFFFFCF8EDFFE4CB
      B3FF998173B01515151500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000015151515998173B0E4C8B1FFFBF6E9FFFCF8EDFFFDFAEEFFFDFA
      F0FFFDFAF1FFFDFAF1FFFDFAF0FFFDFAEFFFFCF8EDFFE4CBB3FF998173B01515
      1515000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000403E3B439C7254C9E0C5B1FFFDFCFBFFFEFFFFFFFEFFFFFFFEFFFFFFFEFF
      FFFFFEFFFFFFFDFCFBFFE0C5B1FF9B7254C9403E3B4300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000403E3B439C72
      54C9E0C5B1FFFDFCFBFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFDFC
      FBFFE0C5B1FF9B7254C9403E3B43000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000041404043998475B0CFA2
      83FFECDACEFFF9F2EFFFFFFFFFFFF9F2EFFFECD9CCFFCFA283FF998475B04140
      4043000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000041404043998475B0CFA283FFECDACEFFF9F2
      EFFFFFFFFFFFF9F2EFFFECD9CCFFCFA283FF998475B041404043000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000151515155D5853638C7565A7AF8567DCC28C66FBAF85
      67DC8C7766A75D58556315151515000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000151515155D5853638C7565A7AF8567DCC28C66FBAF8567DC8C7766A75D58
      556315151515000000000000000000000000424D3E000000000000003E000000
      280000003C0000001E0000000100010000000000F00000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFC01FFFFF0070FFFF800FFFFE0030FFFF0007FFFC0010
      FFFE0003FFF80000FC7E000384380000F83E000380380000F01E000380380000
      E00E000380380000E00E0003C0780000E00E0003E0F80000E10E0003F1F80000
      FFFE0003FFF80000FFFF0007FFFC0010FFFF800FFFFE0030FFFFC01FFFFF0070
      00000000000000000000000000000000000000000000}
  end
end
