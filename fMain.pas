unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  uCsMaskEdit, uCsDateTimePicker, uCsSpeedButton, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCsPanel, Vcl.Menus, System.Actions, Vcl.ActnList,
  System.Generics.Collections, Vcl.Samples.Gauges, Vcl.ImgList, uCsClickPanel,
  Vcl.Grids, uCsStringGrid, uCsPaintBox, uCsFilter, uCsImageList,
  uCsCombocheckBox, uCsClasses, uSort, uStats;

type
   TIndex = record
      Position : Int64;
      DateTime : TDateTime;
   end;

   TIndexList = class(TList<TIndex>)
      procedure Store(const path : String);
      function Load(const path : String): Boolean;
   end;

   //Speichert die Aufruf-Information einer Auswertung
   TStore = class
      DayStart : TDate;
      DayEnd : TDate;
      TimeStart : TTime;
      TimeEnd : TTime;
      Name : String;
      function TimeSpanCaption: String;
      function Caption: String;
   end;

   //Steuerinformationen der Live-Auswertung
   TPoll = record
     //letzte Position im Logfile (nur zu Debugzwecken)
     lastPos : Int64;
     //letzter Timestamp der Logdatei
     lastFileStamp : TDateTime;
     //Polling wird bei naechster Gelegenheit abgebrochen
     DoStop : Boolean;
     //Poll Aktiv?
     Valid : Boolean;
     //aktuelle Dateiposition im Logfile
     Pos : Int64;
     //Dateipfad der Logdatei
     LogFile : String;
     //Autostop in Sekunden
     DtAutoStop : TDateTime;
     //Startzeit (wird beim ersten Dmg festgelegt)
     DtStart : TDateTime;    //UTC
     //berechnete Ende-Zeit (wird beim ersten Dmg berechnet)
     DtStop : TDateTime;     //UTC
     function IsAutoStop : Boolean;
     procedure Init;
   end;

  TFrmMain = class(TForm)
    SBar: TStatusBar;
    MainMenu: TMainMenu;
    Datei1: TMenuItem;
    N1: TMenuItem;
    about1: TMenuItem;
    Beenden1: TMenuItem;
    PnClient: TCSPanel;
    PnControls: TCSPanel;
    AcList: TActionList;
    AcClose: TAction;
    AcChangePath: TAction;
    LogVerzeichnisndern1: TMenuItem;
    N2: TMenuItem;
    Timer: TTimer;
    PnAnalyze: TCSPanel;
    CSPanel1: TCSPanel;
    CSPanel2: TCSPanel;
    CSPanel3: TCSPanel;
    BtStart: TCsSpeedButton;
    BtStop: TCsSpeedButton;
    dtpDateFrom: TCsDateTimePicker;
    EdTimeFrom: TCsMaskEdit;
    dtpDateTo: TCsDateTimePicker;
    EdTimeTo: TCsMaskEdit;
    BtAnalyze: TCsSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    PnAutoStop: TCsClickPanel;
    EdAutoStop: TCsMaskEdit;
    Splitter: TSplitter;
    PnCombatLog: TCSPanel;
    PnStats: TCSPanel;
    PnGridHeader: TCSPanel;
    PnMemoHeader: TCSPanel;
    sg: TCsStringGrid;
    Memo: TMemo;
    ImgList: TCsImageList;
    BtClose: TCsSpeedButton;
    Ansicht1: TMenuItem;
    CombatLog1: TMenuItem;
    BtColsConfig: TCsSpeedButton;
    PnCols: TCSPanel;
    BtColsOk: TCsSpeedButton;
    sgCols: TCsStringGrid;
    ImgListCheck: TCsImageList;
    SplitterCols: TSplitter;
    cBoxChar: TCsCheckComboBox;
    LCharFilter: TLabel;
    PnGrids: TCSPanel;
    ilSgGroups: TCsImageList;
    GaugeLive: TGauge;
    AcCancel: TAction;
    AcDebug: TAction;
    Debug1: TMenuItem;
    CSPanel4: TCSPanel;
    CSPanel5: TCSPanel;
    CSPanel6: TCSPanel;
    EdStore: TEdit;
    sgStore: TCsStringGrid;
    BtStore: TCsSpeedButton;
    BtDel: TCsSpeedButton;
    extStatistik1: TMenuItem;
    PnTextStats: TCSPanel;
    PnTextStatsHeader: TCSPanel;
    BtCloseTextStats: TCsSpeedButton;
    MemoStats: TMemo;
    SplitterTextStats: TSplitter;
    Optionen1: TMenuItem;
    miFilterFakeDmg: TMenuItem;
    PnAttackConfig: TCSPanel;
    PnItem: TCSPanel;
    BtOkType: TCsSpeedButton;
    cBoxType: TComboBox;
    miTypeDmg: TMenuItem;
    PnDiag: TCSPanel;
    PnDiagHeader: TCSPanel;
    BtDiagClose: TCsSpeedButton;
    miShowDiag: TMenuItem;
    SplitterDiag: TSplitter;
    Diag: TPaintBox;
    Gauge: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure AcCloseExecute(Sender: TObject);
    procedure BtAnalyzeClick(Sender: TObject);
    procedure AcChangePathExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtStartClick(Sender: TObject);
    procedure BtStopClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtDebugDecoClick(Sender: TObject);
    procedure SplitterPaint(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure CombatLog1Click(Sender: TObject);
    procedure BtColsOkClick(Sender: TObject);
    procedure BtColsConfigClick(Sender: TObject);
    procedure sgColsDblClick(Sender: TObject);
    procedure sgShowHint(Sender: TObject; ACol, ARow: Integer;
      var Hint: string);
    procedure cBoxCharCloseUp(Sender: TObject);
    procedure sgSort(Sender: TObject; const aCol, aRow: Integer;
      const SortOrder: uSort.TSortOrder; var doSort: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure AcCancelExecute(Sender: TObject);
    procedure AcDebugExecute(Sender: TObject);
    procedure sgStoreDblClick(Sender: TObject);
    procedure BtStoreClick(Sender: TObject);
    procedure BtDelClick(Sender: TObject);
    procedure sgStoreShowHint(Sender: TObject; ACol, ARow: Integer;
      var Hint: string);
    procedure extStatistik1Click(Sender: TObject);
    procedure BtCloseTextStatsClick(Sender: TObject);
    procedure miFilterFakeDmgClick(Sender: TObject);
    procedure OnNewAttackType(Sender: TObject);
    procedure OnSetAttackType(Sender: TObject);
    procedure OnRemoveAttackType(Sender: TObject);
    procedure sgDblClick(Sender: TObject);
    procedure BtOkTypeClick(Sender: TObject);
    procedure miTypeDmgClick(Sender: TObject);
    procedure cBoxTypeKeyPress(Sender: TObject; var Key: Char);
    procedure miShowDiagClick(Sender: TObject);
    procedure DiagPaint(Sender: TObject);
  private
    { Private-Deklarationen }
    //Pfad zur Logdatei
    LogPath : String;
    //Puffer für das Combatlog wenn es nicht angezeigt wird
    Log: TStrings;
    //Liste der gespeicherten Auswertungen
    storage: TList<TStore>;
    //die aktuell geparsten Rohdaten
    curData : TList<TData>;
    //die aktuell ermittelten Statistikdaten
    curStats : TStats;
    //Index auf dem Logfile (wird beim Start geladen oder bei jeder Analyse erstellt oder ergänzt wenn nötig)
    IndexList : TIndexList;
    //verwaltet die Liveauswertung
    polling : TPoll;
    //Encoding für alle Dateizugriffe (1252)
    encoding : TEncoding;
    //Flag zum einmalige Laden der Einstellungen beim Aktivieren
    FirstShow : Boolean;
    //angezeigte Spalten (wird aus der Ini geladen)
    VisibleCols : TCsIntegerList;
    //Flag zum Verhindern von Doppelreaktionen
    inAction : Boolean;
    //Flag zum kontrollierten Abbrechen einer Analyse
    doCancel : Boolean;
    //speichert die ausgewählte Attacke beim Vergeben eines Damage-Types
    currentAttack : String;
    //laedt die gespeicherten Auswertungen nach storage
    procedure LoadStorage;
    //speichert storage auf die Platte
    procedure StoreStorage;
    //dezentraler Zugriff auf das Combatlog
    function GetLog: TStrings;
    //sortiert curStats nach der im Grid eingestellten Sortierung
    procedure Sort;
    //Hilfsfunktion damit die Splitter nicht durchdrehen
    procedure RealignSplitters;
    //befüllt das Grid mit curStats
    procedure RefreshGrid;
    //befüllt das Textlog mit curStats
    procedure RefreshTextStats;
    //blendet Spalten ein/aus auf Basis von VisibleCols
    procedure ReloadCols;
    //befüllt das Storage-Grid mit Storage
    procedure ReloadStorage;
    //stellt die Suchparameter der Auswertung auf ein Storage-Item ein
    procedure LoadItem(const item: TStore);
    //Startet die Live-Auswertung
    procedure Start;
    //Stopt die Live-Auswertung bei der nächsten Gelegenheit
    procedure Stop;
    //prüft das Logfile im Rahmen der Live-Auswertung auf neue Zeilen und stellt Ergebnisse dar
    procedure Poll;
    //filtert curData und fuellt curStats und refresht alle Anzeigen
    procedure CalcSum;
    //stösst eine Auswertung mit den eingestellten Suchparametern an und stellt Ergebnisse dar
    procedure Analyze;
    //befüllt die Statusbar
    procedure RefreshSBar;
    //zeichnet das Diagramm neu
    procedure RefreshDiag;
    //erstellt den Index des Logfiles (auch wenn vorhanden)
    procedure CreateIndex;
    function IsDebug: Boolean;
    //übergibt eine Zeile ins debug.log
    procedure Debug(const line: String);

  public
    { Public-Deklarationen }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.IOUtils, System.DateUtils, Vcl.FileCtrl, System.UITypes,
  System.IniFiles, System.Generics.Defaults, System.Math, uDecoration, uCsControls,
  uDeskSize;

{$R *.dfm}
(**
   SetUp: http://www.delphi-treff.de/tutorials/tools/einfuehrung-in-inno-setup/3/

*)

const
   LogFileName = 'combat.log';
   INDEXFILENAME = 'combat.log.index';
   INIFILE = 'LogOnator.ini';
   STORAGEFILE = 'Storage.lgs';
   INDEXVERSION = '1';
   SECTIONATTACKDMGTYPES = 'AttackDamageTypes';

   HEADER = 'Name,Attacke,DpM,"Crit %",'
         +'Hits,"'+ chr($03A3)+' Dmg","'+ chr($2193)+' Dmg","Ø Dmg","'+ chr($2191)+' Dmg",'
         +'Std-Hits,"'+ chr($03A3)+' Std","'+ chr($2193)+' Std","Ø Std","'+ chr($2191)+' Std",'
         +'Crit-Hits,"'+ chr($03A3)+' Crit","'+ chr($2193)+' Crit","Ø Crit","'+ chr($2191)+' Crit",Typ';

   COLOBJ       = 0;

   VISIBLECOLSCONST = '0,1,2,3,5,11,12,13,16,17,18';

   DECOTAG = 13;

   COLHINTS : array[0..COLMAX] of String = (
      '',
      '',
      'Schaden pro Minute',
      'Crit-Chance in %',
      'Gesamtanzahl der Treffer',
      'Gesamtschaden',
      'geringster Treffer',
      'durschnittlicher Schaden',
      'höchster Treffer',
      'Anzahl der normalen Treffer',
      'Gesamtschaden mit normalen Treffern',
      'geringster normaler Treffer',
      'durchschnittlicher Schaden mit normalen Treffern',
      'höchster normaler Treffer',
      'Anzahl der kritischen Treffer',
      'Gesamtschaden mit kritischen Treffern',
      'geringster kritischer Treffer',
      'durchschnittlicher Schaden mit kritischen Treffern',
      'höchster kritischer Treffer',
      '');



(** deutsch

1413633838: Fernangriff von Mond Schatten beschädigt Trainingsziel für 10 Schaden
1413633843: Wirbelschuss von Mond Schatten beschädigt (kritisch) Trainingsziel für 17 Schaden
1413633846: Nahkampfangriff von Mond Schatten beschädigt Trainingsziel für 8 Schaden
1413633891: Mond Schatten beschwört einen Helfer  mit der Fähigkeit "TOM-Bot"
1413633892: Mond Schatten beschwört einen Helfer  mit der Fähigkeit "Verbündeten rufen"
1413633893: Mond Schatten beschwört einen Helfer  mit der Fähigkeit "Roboter-Kamerad"
1413633896: Gravitationsfeld von TOM-Bot beschädigt Trainingsziel für 1 Schaden
1413633896: Nahkampfangriff von Kamerad beschädigt Trainingsziel für 4 Schaden
1413633896: Nahkampfangriff von Roboter-Kamerad beschädigt Trainingsziel für 14 Schaden

     <TimeStamp>: <Attack> von <Name> beschädigt <Target> für <damage> Schaden
*)

(** english

1413631547: Mond Schatten's Fan damaged Sparring Target for 66
1413631552: Mond Schatten's Ranged Attack critically damaged Sparring Target for 15
1413631553: Mond Schatten's Flurry Shot damaged Sparring Target for 24
1413634171: Mond Schatten summoned a pet using ability Call Ally
1413634173: Mond Schatten summoned a pet using ability TOM-Bot
1413634176: Mond Schatten summoned a pet using ability Robot Sidekick
1413634177: TOM-Bot's Gravitonic Field damaged Sparring Target for 2
1413634179: Robot Sidekick's Melee Attack damaged Sparring Target for 15
1413634180: Sidekick's Melee Attack damaged Sparring Target for 4
1413634180: Carrol Ferris' Melee Attack damaged Sparring Target for 4

     <TimeStamp>: <Name>'s <Attack> damaged <Target> for <damage>
*)

function Parse(var aLine: String; out dt: TDateTime; out data: TData): Boolean;
var
   indDt, ind, ind2, offset: Integer;
   ts : Int64;
begin
   dt := 0;
   result := FALSE;
   indDt := aLine.IndexOf(':');
   data.Init;
   if (indDt >= 0)
   then begin
      if Int64.TryParse(aLine.Substring(0, indDt), ts)
      then begin
         dt :=  System.DateUtils.UnixToDateTime(ts);
         data.Stamp := ts;
         //<TimeStamp>:<Name>'s <Attack> damaged <Target> for <damage>

         ind := indDt +1;
         //Name
         ind2 := aLine.IndexOf('''s ', ind);
         if ind2 < 0
         then begin
            ind2 := aLine.IndexOf(''' ', ind);
            offset := 2;
         end else offset := 3;
         //endif

         if ind2 >= 0
         then begin
            data.Name := aLine.Substring(ind, ind2 - ind).Trim;
            ind := ind2 + offset;
            ind2 := aLine.IndexOf(' damaged ', ind);
            if (ind2 >= 0)
            then begin
               data.Attack := aLine.Substring(ind, ind2 - ind).Trim;
               data.Crit := data.Attack.EndsWith(' critically');
               if data.Crit
               then data.Attack := data.Attack.Remove(data.Attack.IndexOf(' critically'));
               //endif
               ind := ind2 + 9;
               ind2 := aLine.IndexOf(' for ', ind);
               if (ind2 >= 0)
               then begin
                  data.Target := aLine.Substring(ind, ind2 - ind).Trim;

                  ind := ind2 + 5;
                  data.Damage := StrToIntDef(aLine.SubString(ind), 0);
                  result := TRUE;

                  aLine := FormatDateTime('dd.mm.yyyy hh:nn:ss',TTimeZone.Local.ToLocalTime( dt)) + aLine.Substring(indDt);
               end;//if
            end;//if
         end;//if
         if not result
         then begin
         // <TimeStamp>: <Attack> von <Name> beschädigt <Target> für <damage> Schaden
            ind := indDt +1;
            //Name
            ind2 := aLine.IndexOf(' von ', ind);
            if ind2 >= 0
            then begin
               data.Attack := aLine.Substring(ind, ind2 - ind).Trim;
               ind := ind2 + 5;
               ind2 := aLine.IndexOf(' beschädigt ', ind);
               if ind2 >= 0
               then begin
                  data.Name := aLine.Substring(ind, ind2 - ind).Trim;
                  ind := ind2 + 12;
                  ind2 := aLine.IndexOf(' für ', ind);
                  if ind2 >= 0
                  then begin
                     data.Target := aLine.Substring(ind, ind2 - ind).Trim;
                     data.Crit := data.Target.StartsWith('(kritisch) ');
                     if data.Crit
                     then data.Target := data.Target.Remove(0, 11);
                     //endif

                     ind := ind2 + 5;
                     ind2 := aLine.IndexOf(' Schaden', ind);
                     if ind2 >= 0
                     then begin
                        data.Damage := StrToIntDef(aLine.Substring(ind, ind2 - ind).Trim, 0);

                        aLine := FormatDateTime('dd.mm.yyyy hh:nn:ss', TTimeZone.Local.ToLocalTime( dt)) + aLine.Substring(indDt);
                        result := TRUE;
                     end;//if
                  end;//if
               end;//if
            end;//if
         end;//if
//         if result and (data.Name = data.Target)
//         then  result := FALSE;
//         //endif
      end;//if
   end;//if
end;

procedure TFrmMain.AcCancelExecute(Sender: TObject);
begin
   if PnAttackConfig.Visible
   then PnAttackConfig.Visible := FALSE;
   //endif
   doCancel := TRUE;
end;

procedure TFrmMain.AcChangePathExecute(Sender: TObject);
var
   dir : String;
   ini : TIniFile;
begin
   if SelectDirectory('Log Verzeichnis','', dir)
   then begin
      LogPath := dir;
      ini := TIniFile.Create('./'+INIFILE);
      ini.WriteString('main','logpath',LogPath);
      ini.Free;
      FreeAndNil(IndexList);
      RefreshSBar;
   end;
end;

procedure TFrmMain.AcCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TFrmMain.AcDebugExecute(Sender: TObject);
begin
   AcDebug.Checked := not AcDebug.Checked;
   if AcDebug.Checked
   then PnMemoHeader.Caption := 'Combat Log (Debug)'
   else PnMemoHeader.Caption := 'Combat Log';
end;

procedure TFrmMain.BtAnalyzeClick(Sender: TObject);
begin
   Analyze;
end;

procedure TFrmMain.BtCloseClick(Sender: TObject);
begin
   PnCombatLog.Visible := FALSE;
   Log.Clear;
   Log.AddStrings(Memo.Lines);
   RealignSplitters;
end;

procedure TFrmMain.BtCloseTextStatsClick(Sender: TObject);
begin
   PnTextStats.Visible := FALSE;
   RealignSplitters;
end;

procedure TFrmMain.BtColsOkClick(Sender: TObject);
var
   col : Integer;
begin
  PnCols.Visible := FALSE;
  SplitterCols.Visible := PnCols.Visible;
  BtColsOk.Visible := PnCols.Visible;
  SplitterCols.Left := PnCols.Left -1;
  BtColsOk.Left := BtColsConfig.Left + BtColsConfig.Width +1;
  VisibleCols.Clear;
  for col := 0 to COLMAX
  do if sgCols.Data.CellsAsInt[0, col] = 1
     then VisibleCols.Add(col);
     //endif
  //endfor
  ReloadCols;
end;

procedure TFrmMain.BtColsConfigClick(Sender: TObject);
begin
  PnCols.Visible := not PnCols.Visible;
  SplitterCols.Visible := PnCols.Visible;
  BtColsOk.Visible := PnCols.Visible;
  SplitterCols.Left := PnCols.Left -1;
  BtColsOk.Left := BtColsConfig.Left + BtColsConfig.Width +1;
end;

procedure TFrmMain.BtDebugDecoClick(Sender: TObject);
var
   fileName: String;
   sl : TStringList;
   DlgExportDeco: TSaveDialog;
begin
   DlgExportDeco := TSaveDialog.Create(Self);
   with DlgExportDeco do
   begin
     Name := 'DlgExportDeco';
     DefaultExt := '*.csv';
     Filter := 'Csv-Dateien|*.csv|Alle Dateien|*.*';
     InitialDir := 'C:\Entwicklung\CombatLogAnalyzer';
     FileName := sg.Name;
   end;

   if DlgExportDeco.Execute
   then begin
      fileName := System.IOutils.TPath.ChangeExtension(DlgExportDeco.FileName, '.csv');
      sg.Data.SaveToFile(fileName);
      fileName := System.IOutils.TPath.ChangeExtension(DlgExportDeco.FileName, '.pas');
      sl := TStringList.Create;
      sg.data.Decorations.ExportPasFormat(sl);
      sl.SaveToFile(filename);
      sl.free;
   end;
   DlgExportDeco.Free;
end;

procedure TFrmMain.BtDelClick(Sender: TObject);
begin
   if sgStore.IsSelected
   then begin
      Storage.Remove(TStore(sgStore.Data.Objects[0, sgStore.SelectIndex]));
      StoreStorage;
      ReloadStorage;
   end;//if
end;

procedure TFrmMain.BtStartClick(Sender: TObject);
begin
  Start;
end;

procedure TFrmMain.BtStopClick(Sender: TObject);
begin
   Stop;
end;

procedure TFrmMain.BtStoreClick(Sender: TObject);
var
   item : TStore;
begin
   item := TStore.Create;
   item.Name := Trim(EdStore.Text);
   item.DayStart := Trunc(dtpDateFrom.DateTime);
   item.DayEnd := Trunc(dtpDateTo.DateTime);
   item.TimeStart := EdTimeFrom.AsTime;
   item.TimeEnd := EdTimeTo.AsTime;
   Storage.Add(Item);
   StoreStorage;
   ReloadStorage;
end;

(** vom Ende lesen ...spaeter mal ..vieleicht
procedure TFrmMain.Calc;
const
   BUFFERSIZE = 128;
var
   dtFrom, dtTo : TDateTime;
   logfile : String;
   fs : TFileStream;
   sr : TStreamReader;
   buffer: TCharArray;
   line : String;
begin
   Memo.Clear;

   dtFrom := Trunc(dtpDateFrom.DateTime) + Frac(EdTimeFrom.asTime);
   dtTo := Trunc(dtpDateTo.DateTime) + Frac(EdTimeTo.asTime);

   logfile := IncludeTrailingPathDelimiter(LogPath) + LogFileName;
   SetLength(buffer, BUFFERSIZE);


   if System.IOUtils.TFile.Exists(logfile)
   then begin
      fs := TFileStream.Create(logfile, fmOpenRead or fmShareDenyNone);
      fs.Seek(BUFFERSIZE * -1,soFromEnd);
      sr := TStreamReader.Create(fs, TRUE);
      sr.ReadBlock(buffer,0,BUFFERSIZE-1);
      line := String(buffer);
      Memo.Text := line;

      sr.Free;
      fs.Free;
   end else MessageDlg('Das Logfile ist nicht vorhanden!', mtError, [mbOK], 0);
   //endif
end;
*)

procedure TFrmMain.Analyze;
var
   dtFrom, dtTo, dt : TDateTime;
   logfile : String;
   sr : TStreamReader;
   sw : TStreamWriter;
   line : String;
   Data : TData;
   junk : TStringList;
   maxSize, startIndex : Int64;
   fs : TFileStream;
   position : Int64;
   index : TIndex;
   ind : Integer;
   storeIndex : Boolean;
   theLog : TStrings;
begin
   BtStart.Enabled := FALSE;
   BtAnalyze.Enabled := FALSE;
   dtpDateFrom.Enabled := FALSE;
   dtpDateTo.Enabled := FALSE;
   EdTimeFrom.Enabled := FALSE;
   EdTimeTo.Enabled := FALSE;
   Application.ProcessMessages;

   theLog := GetLog;
   theLog.Clear;
   theLog.BeginUpdate;

   dtFrom := Trunc(dtpDateFrom.DateTime) + EdTimeFrom.asTime;
   if EdTimeTo.Text = '24:00:00'
   then dtTo := Trunc(dtpDateTo.DateTime) + 1
   else dtTo := Trunc(dtpDateTo.DateTime) + EdTimeTo.asTime + System.DateUtils.OneSecond;
   //endif

   dtFrom := TTimeZone.Local.ToUniversalTime(dtFrom);
   dtTo := TTimeZone.Local.ToUniversalTime(dtTo);

   logfile := IncludeTrailingPathDelimiter(LogPath) + LogFileName;
   junk := TStringList.Create;
   curData.Free;
   curData := TList<TData>.Create;
   Gauge.Visible := TRUE;


   if System.IOUtils.TFile.Exists(logfile)
   then begin
      debug('File exists');
      if IndexList = nil
      then CreateIndex;
      //endif

      index.Position := 0;
      index.DateTime := Trunc(dtpDateFrom.DateTime);

      IndexList.BinarySearch(index, ind);
      if (ind < 0) or (IndexList.Count = 0)
      then begin
         startIndex := 0;
         dt := dtFrom;
      end else begin
         if ind >= IndexList.Count
         then ind := IndexList.Count -1;
         //endif
         startIndex := IndexList[ind].Position;
         dt := IndexList[ind].DateTime;
      end;//if

      storeIndex := FALSE;
      if IndexList.Count > 0
      then index := IndexList[IndexList.Count -1]
      else index.DateTime := 0;
      //endif

      debug(Format('starting at %d', [startIndex]));

      doCancel := FALSE;

      fs := TFileStream.Create(logfile, fmOpenRead or fmShareDenyNone);
      fs.Seek(startIndex,soFromBeginning);
      position := startIndex;
      maxSize := fs.Size;
      sr := TStreamReader.Create(fs, encoding);
      debug(Format('doCancel: %s, sr.EndOfStream: %s, (dt < dtTo): %s)', [BoolToStr(doCancel, TRUE), BoolToStr(sr.EndOfStream, TRUE), BoolToStr(dt < dtTo, TRUE)]));
      while not doCancel and not sr.EndOfStream and (dt < dtTo)
      do begin
         line := sr.ReadLine;
         index.Position := position;
         position := position + line.Length + 2;

         if Parse(line, dt, data)
            and (dt >= dtFrom) and (dt < dtTo)
         then begin
            theLog.Add(line);
            curData.Add(data);

            //index bei Bedarf erweitern
            if Trunc(dt) > index.DateTime
            then begin
               index.DateTime := Trunc(dt);
               IndexList.Add(index);
               storeIndex := TRUE;
            end;//if

         end else if IsDebug then Junk.Add(line);
         //endif

         Gauge.Progress := Round((position - startIndex) * 100 / (maxSize - startIndex));
         Application.ProcessMessages;
      end;//while

      if storeIndex
      then IndexList.Store(LogPath);
      //endif

      Gauge.Progress := 100;

      sr.Free;
      FreeAndNil(fs);

      if isDebug and (Junk.Count > 0)
      then begin
         try
           fs := TFileStream.Create('debug.txt', fmCreate or fmShareDenyWrite);
           sw := TStreamWriter.Create(fs, Encoding);
           for ind := 0 to Junk.Count -1
           do begin
              Gauge.Progress := Round( ind * 100 / Junk.Count);
              sw.WriteLine(Junk[ind]);
           end;//for
           Gauge.Progress := 100;
           sw.Free;
           FreeAndNil(fs);
         except on E: Exception do
            MessageDlg('Fehler beim Schreiben des Debug-Outputs: ' + E.Message, mtError, [mbOK], 0);
         end;
      end;//if

   end else MessageDlg('Das Logfile ist nicht vorhanden!', mtError, [mbOK], 0);
   //endif

   Gauge.Visible := FALSE;
   CalcSum;

   junk.Free;
   theLog.EndUpdate;
   BtStart.Enabled := TRUE;
   BtAnalyze.Enabled := TRUE;
   dtpDateFrom.Enabled := TRUE;
   dtpDateTo.Enabled := TRUE;
   EdTimeFrom.Enabled := TRUE;
   EdTimeTo.Enabled := TRUE;
   Application.ProcessMessages;
end;

procedure TFrmMain.CalcSum;
var
   data : TData;
   ind : Integer;
   Seconds : Int64;
   charnames, cboxItems, cboxselected : TStringList;
   cboxItem : TCheckBoxItem;
   oldStats : TStats;
   i : Integer;
begin
   oldStats := curStats;
   curStats := TStats.Create;

   charnames := TSTringList.Create;
   charnames.Sorted := TRUE;
   charnames.Duplicates := TDuplicates.dupIgnore;
   cboxselected := TStringList.Create;
   cboxselected.Sorted := TRUE;
   cboxselected.Duplicates := TDuplicates.dupIgnore;
   cboxitems := TStringList.Create;
   cboxitems.Sorted := TRUE;
   cboxitems.Duplicates := TDuplicates.dupIgnore;

   for i := 0 to cBoxChar.ItemsCB.Count -1
   do begin
      if cBoxChar.ItemsCB[i].Checked
      then cboxselected.Add(cBoxChar.ItemsCB[i].Caption);
      //endif
      cboxitems.Add( cBoxChar.ItemsCB[i].Caption);
   end;//for

   for data in curData
   do if not (miFilterFakeDmg.Checked and data.FakeDamage)
      then begin
         charnames.Add(data.Name);
         if (cboxselected.Count = 0) or cboxselected.Find(data.Name, ind)
         then curStats.Add(data);
         //endif
      end;//if
   //endfor

   if (curData.Count > 1)
   then Seconds := curData[curData.Count -1].Stamp - curData[0].Stamp
   else Seconds := 0;
   //endif

   curStats.Finalize(Seconds);

   if sg.Data.SortDirection <> uSort.TSortOrder.TS_NONE
   then Sort;
   //endif

   cboxChar.ItemsCB.BeginUpdate;
   if charnames.Text <> cboxitems.Text
   then begin
      cboxChar.Clear;
      for i := 0 to charnames.Count -1
      do begin
         cboxItem := cboxChar.ItemsCB.Add;
         cboxItem.Caption := charnames[i];
         cboxItem.Checked := (cboxselected.Count > 0) and cboxselected.Find(charnames[i], ind);
      end;//if
   end;//if
   cboxChar.ItemsCB.EndUpdate;

   RefreshGrid;
   RefreshDiag;

   cboxitems.Free;
   cboxselected.Free;
   charnames.Free;
   oldStats.Free;
end;

procedure TFrmMain.cBoxCharCloseUp(Sender: TObject);
begin
   CalcSum;
end;

procedure TFrmMain.cBoxTypeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = chr(VK_RETURN)
   then BtOkTypeClick(Sender);
   //endif
end;

procedure TFrmMain.CombatLog1Click(Sender: TObject);
begin
   PnCombatLog.Visible := TRUE;
   RealignSplitters;
   Memo.Lines.BeginUpdate;
   Memo.Lines.Clear;
   Memo.Lines.AddStrings(Log);
   Memo.Lines.EndUpdate;
end;

procedure TFrmMain.CreateIndex;
var
   logFile, indexFile : String;
   maxSize : Int64;
   sr : TStreamReader;
   line : String;
   dt : TDateTime;
   lastDt : TDateTime;
   fs : TFileStream;
   position : Int64;
   entry : TIndex;

   function Parse(var aLine: String; out dt: TDateTime): Boolean;
   var
      indDt: Integer;
      ts : Int64;
   begin
      dt := 0;
      result := FALSE;
      indDt := aLine.IndexOf(':');
      if (indDt >= 0)
      then begin
         if Int64.TryParse(aLine.Substring(0, indDt), ts)
         then begin
            dt := Trunc(System.DateUtils.UnixToDateTime(ts));
            result := dt <> 0;
         end;//if
      end;//if
   end;//if
begin
   logfile := IncludeTrailingPathDelimiter(LogPath) + LogFileName;
   indexFile := IncludeTrailingPathDelimiter(LogPath) + INDEXFILENAME;

   FreeAndNil(IndexList);
   IndexList := TIndexList.Create(TComparer<TIndex>.Construct(
             function(const Left, Right: TIndex): Integer
             begin
               Result := Trunc(Left.DateTime - Right.DateTime);
             end));

   if not IndexList.Load(LogPath)
   then begin
      lastDt := 0;
      if System.IOUtils.TFile.Exists(logfile)
      then begin
         fs := TFileStream.Create(logfile, fmOpenRead or fmShareDenyNone);
         fs.Seek(0,soFromBeginning);
         position := 0;
         maxSize := fs.Size;
         sr := TStreamReader.Create(fs, encoding);
         while not sr.EndOfStream
         do begin
            line := sr.ReadLine;

            if Parse(line, dt) and (lastDt <> dt)
            then begin
               entry.DateTime := dt;
               entry.Position := position;
               IndexList.Add(entry);
               lastDt := dt;
            end;//if

            position := position + line.Length + 2;
            Gauge.Progress := Round(position * 100 / maxSize);
            Application.ProcessMessages;
         end;//if
         FreeAndNIl(fs);
         IndexList.Store(LogPath);
      end else MessageDlg('Das Logfile ist nicht vorhanden!', mtError, [mbOK], 0);
      //endif
   end;//if

end;

procedure TFrmMain.Debug(const line: String);
begin
   if IsDebug
   then GetLog.Add(line);
   //endif
end;

procedure TFrmMain.DiagPaint(Sender: TObject);
const
   xscale : Integer = 2;
var
   rect : TRect;
   canvas : TCanvas;
   start, finish, current, span, dmg, maxDmg : int64;
   x,y, ind : Integer;
   factor : double;
   Values : TList<int64>;
   points : array of TPoint;
   data : TDataList;
begin
   canvas := Diag.Canvas;
   rect := Canvas.ClipRect;

   Canvas.Brush.Color := clWhite;
   Canvas.Pen.Color := clBlack;
   Canvas.Rectangle(rect);
   data := curStats.Data;

   if PnDiag.Visible and (data.Count > 0)
   then begin
      Values := TList<int64>.Create;

      //** Diagramm zeichnen **

      //auf anzeigbare Länge begrenzen
      start := data.First.Stamp;
      finish := data.Last.Stamp;
      span := finish - start;
      if span > (rect.Width div xscale)
      then start := finish -  (rect.Width div xscale);
      //endif

      //Daten sekundenweise aufbereiten und maxDmg ermitteln
      maxDmg := 0;
      ind := data.Count -1;
      current := finish;
      while (ind >= 0) and (current >= start)
      do begin
         dmg := 0;

         //Sekunde ohne Daten?
         if data[ind].Stamp <> current
         then dec(ind)
         else
            //pro Sekunde addieren
            while (ind >= 0) and (data[ind].Stamp = current)
            do begin
               dmg := dmg + data[ind].Damage;
               dec(ind);
            end;//while
         //endif

         maxDmg := Max(maxDmg, dmg);
         Values.Add(dmg);
         current := current -1;
      end;//if

      PnDiagHeader.Caption := format('Diagramm - %d max Damage', [maxDmg]);

      if maxDmg > 0
      then begin
         SetLength(points, Values.Count);
         for x := 0 to Values.Count -1
         do begin
            dmg := Values[x];
            //auf Hoehe umrechnen
            (**
                damage        y
               --------  =  ---
                maxDamage    Height
            **)
            y := Round((dmg / maxDmg) * rect.Height);

            points[x] := TPoint.Create(rect.Width - x * xscale, rect.Height - y);
         end;//for

         canvas.Polyline(points);
      end;

      Values.Free;
   end;//if
end;

procedure TFrmMain.extStatistik1Click(Sender: TObject);
begin
   PnTextStats.Visible := TRUE;
   RealignSplitters;
   if PnTextStats.Visible
   then RefreshTextStats;
   //endif
end;

procedure TFrmMain.Sort;
var
   order : uStats.TSortOrder;
begin
   if (sg.Data.SortCell.X >= 0) and (sg.Data.SortDirection <> uSort.TSortOrder.TS_NONE)
   then begin
      case sg.Data.SortDirection  of
         uSort.TSortOrder.TS_ASCENDING: order := uStats.TSortOrder.TS_ASCENDING;
         uSort.TSortOrder.TS_DESCENDING: order := uStats.TSortOrder.TS_DESCENDING;
         else order := uStats.TSortOrder.TS_NONE;
      end;//case

      curStats.Chars.SortBy(sg.Data.SortCell.X, order);
   end;//if
end;

procedure TFrmMain.FormActivate(Sender: TObject);
var
   ini : TIniFile;
   dim : TRect;
   WP: TWindowPlacement;
   ws : TWindowState;
   section : TStringList;
   attacktype : TAttackType;
   i : Integer;
begin
   if FirstShow and TFile.Exists('./'+INIFILE)
   then begin
      //Ansicht laden
     ini := TIniFile.Create('./'+INIFILE);
     WP.Length := Sizeof(TWindowPlacement);
     GetWindowPlacement(Self.Handle, @WP);

     dim := WP.rcNormalPosition;
     dim.Left   := ini.ReadInteger('main', 'left',10);
     dim.Top    := ini.ReadInteger('main', 'top', 10);
     dim.Right  := dim.Left + ini.ReadInteger('main', 'width', dim.Right - dim.Left);
     dim.Bottom := dim.Top + ini.ReadInteger('main', 'height',dim.Bottom - dim.Top);
     ws         := TWindowState(ini.ReadInteger('main', 'state', Integer(self.WindowState)));
     if ws = wsMinimized
     then ws := wsNormal;
     //endif

     FormToDesktop(Self, dim, ws);

     PnCombatLog.Visible := ini.ReadBool('main', 'combatlog', PnCombatLog.Visible);
     PnCombatLog.Height := ini.ReadInteger('main', 'combatlog.height', 200);
     PnTextStats.Visible := ini.ReadBool('main', 'textstats', PnTextStats.Visible);
     PnTextStats.Height := ini.ReadInteger('main', 'textstats.height', 200);
     PnDiag.Visible := ini.ReadBool('main', 'chart', PnDiag.Visible);
     PnDiag.Height := ini.ReadInteger('main', 'chart.height', 200);
     PnCols.Width := ini.ReadInteger('main', 'cols.width', PnCols.Width);
     miFilterFakeDmg.Checked := ini.ReadBool('options','FilterFakeDamage', miFilterFakeDmg.Checked);
     miTypeDmg.Checked := ini.ReadBool('options', 'ShowTypeDamage', miTypeDmg.Checked);

     RealignSplitters;

     //DmgTypes
     if ini.SectionExists(SECTIONATTACKDMGTYPES)
     then begin
        section := TStringList.Create;
        ini.ReadSectionValues(SECTIONATTACKDMGTYPES, section);
        for i := 0 to section.Count -1
        do begin
            attackType.Attack := section.Names[i];
            attackType.DmgType := section.ValueFromIndex[i];
            if DmgTypes.IndexOf(attackType.DmgType) < 0
            then DmgTypes.Add(attackType.DmgType);
            //endif
            AttackDmgTypes.Add(attackType);
        end;//for
        AttackDmgTypes.Sort;
        cBoxType.Items.AddStrings(dmgTypes);
        section.Free;
     end;//if

     ini.Free;
   end;//if
   FirstShow := FALSE;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
   ini : TIniFile;
   Cols : TStringList;
   col : Integer;
   row : Integer;
   deco : TDecoration;
begin
   inherited;
   inAction := TRUE;
   FirstShow := TRUE;
   doCancel := FALSE;
   VisibleCols := TCsIntegerList.Create;
   VisibleCols.Commatext := VISIBLECOLSCONST;
   curData := TList<TData>.Create;
   curStats := TStats.Create;
   Log := TStringList.Create;
   DmgTypes := TStringList.Create;
   currentAttack := '';
   AttackDmgTypes := TAttackTypList.Create(  TComparer<TAttackType>.Construct( function(const Left, Right: TAttackType): Integer
                                                          begin
                                                            Result := CompareText(Left.Attack, Right.Attack);
                                                          end));

   encoding := TEncoding.GetEncoding(1252);
   LogPath := '';
   if TFile.Exists('./'+INIFILE)
   then begin
      ini := TIniFile.Create('./'+INIFILE);
      LogPath := ini.ReadString('main','logpath','');
      VisibleCols.Commatext := ini.ReadString('main', 'cols', VisibleCols.Commatext);
      if VisibleCols.Count = 0
      then VisibleCols.Commatext := VISIBLECOLSCONST;
      //endif

      ini.Free;
   end;//if

   CalcSum;
   ReloadCols;

   dtpDateFrom.DateTime := now;
   dtpDateTo.DateTime := now;
   EdTimeFrom.asTime := 0;
   EdTimeTo.asTime := 1;
   RefreshSBar;
   IndexList := nil;

   sgCols.Data.Clear;
   Cols := TStringList.Create;
   Cols.CommaText := HEADER;
   for col  := 0 to Cols.Count -1
   do begin
      row := sgCols.Data.AddEmpty(3);
      if VisibleCols.IsIn(col)
      then sgCols.Data.CellsAsInt[0, row] := 1
      else sgCols.Data.CellsAsInt[0, row] := 0;
      //endif
      sgCols.Data.CellsAsInt[1, row] := col;
      if COLHINTS[col] = ''
      then sgCols.Data.Cells[2, row] := Cols[col]
      else sgCols.Data.Cells[2, row] := COLHINTS[col]; //Cols[col];
   end;//if
   deco := sgCols.Decorations.GetRange(rtColumn, 0, -1, 0, -1, TRUE);
   deco.FormatString := Format('%d%s%d', [0, #13#10, 1]);

   sgCols.SetGrid;
   sgCols.ControlStyle := sgCols.ControlStyle + [csDisplayDragImage];
   deco := sg.Data.Decorations.GetRange(rtColumn, COLCRITCHANCE, -1, COLCRITCHANCE, -1, TRUE);
   deco.FormatString := '0%';

   cBoxChar.DropDownAutoWidth;

   Storage := TObjectList<TStore>.Create(TRUE);
   LoadStorage;
   ReloadStorage;

   inAction := FALSE;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
var
   ini : TIniFile;
   WP : TWIndowPlacement;
begin
   Storage.Free;
   Log.Free;
   curData.Free;
   curStats.Free;
   DmgTypes.Free;
   AttackDmgTypes.Free;
   try
      ini := TIniFile.Create('./'+INIFILE);
      LogPath := ini.ReadString('main','logpath','');

      WP.Length := Sizeof(TWindowPlacement);
      GetWindowPlacement(Self.Handle, @WP);

      ini.WriteInteger('main', 'left',   WP.rcNormalPosition.Left);
      ini.WriteInteger('main', 'top',    WP.rcNormalPosition.Top);
      ini.WriteInteger('main', 'width',  WP.rcNormalPosition.Right - WP.rcNormalPosition.Left);
      ini.WriteInteger('main', 'height', WP.rcNormalPosition.Bottom - WP.rcNormalPosition.Top);
      ini.WriteInteger('main', 'state',  Integer(Self.WindowState));
      ini.WriteBool('main', 'combatlog', PnCombatLog.Visible);
      ini.WriteInteger('main', 'combatlog.height', PnCombatLog.Height);
      ini.WriteBool('main', 'textstats', PnTextStats.Visible);
      ini.WriteInteger('main', 'textstats.height', PnTextStats.Height);
      ini.WriteBool('main', 'chart', PnDiag.Visible);
      ini.WriteInteger('main', 'chart.height', PnDiag.Height);
      ini.WriteInteger('main', 'cols.width', PnCols.Width);
      ini.WriteString('main', 'cols', VisibleCols.Commatext);
      ini.WriteBool('options','FilterFakeDamage', miFilterFakeDmg.Checked);
      ini.WriteBool('options','ShowTypeDamage', miTypeDmg.Checked);

      ini.Free;
   except on E: Exception do
      MessageDlg('Die Konfigurationsdatei konnte nicht gespeichert werden!' + #13#10 + E.Message, mtError, [mbOK], 0);
   end;

   IndexList.Free;
   inherited;
end;

function TFrmMain.GetLog: TStrings;
begin
   if PnCombatLog.Visible
   then result := Memo.Lines
   else result := Log;
   //endif
end;

function TFrmMain.IsDebug: Boolean;
begin
   result := AcDebug.Checked;
end;

procedure TFrmMain.LoadItem(const item: TStore);
begin
   if item is TStore
   then begin
      dtpDateFrom.DateTime := Trunc(item.DayStart);
      dtpDateTo.DateTime := Trunc(item.DayEnd);
      EdTimeFrom.asTime := item.TimeStart;
      EdTimeTo.asTime := item.TimeEnd;
      EdStore.Text := item.Name;
   end;//if
end;

procedure TFrmMain.RealignSplitters;
begin
   SplitterTextStats.Visible := PnTextStats.Visible;
   if SplitterTextStats.Visible
   then SplitterTextStats.Top := PnTextStats.Top;
   //endif

   Splitter.Visible := PnCombatLog.Visible;
   if Splitter.Visible
   then Splitter.Top := PnCombatLog.Top;
   //endif

   SplitterDiag.Visible := PnDiag.Visible;
   if SplitterDiag.Visible
   then SplitterDiag.Top := PnDiag.Top;
   //endif
end;

procedure TFrmMain.RefreshDiag;
begin
   Diag.Repaint;
end;

procedure TFrmMain.RefreshGrid;
var
   ind : Integer;
   char : TChar;

   function ToSg(const capChar: String; const dmg : TDamage; const Color: TColor = clWhite): Integer;
   var
      row : Integer;
      deco : TDecoration;
      typedmg : TDamage;
   begin
      row := sg.Data.AddEmpty;

      sg.Data.Cells[     COLNAME        , row] := capChar;
      sg.Data.Cells[     COLATTACK      , row] := dmg.Name;
      sg.Data.CellsAsInt[COLSUMCOUNT    , row] := dmg.Sum.Count;
      sg.Data.CellsAsInt[COLSUMDMG      , row] := dmg.Sum.Sum;
      sg.Data.CellsAsInt[COLSUMDPM      , row] := dmg.Sum.DpM;
      sg.Data.CellsAsInt[COLSUMMIN      , row] := dmg.Sum.Min;
      sg.Data.CellsAsInt[COLSUMAV       , row] := dmg.Sum.Avarage;
      sg.Data.CellsAsInt[COLSUMMAX      , row] := dmg.Sum.Max;
      sg.Data.CellsAsInt[COLNORMCOUNT   , row] := dmg.Damage.Count;
      sg.Data.CellsAsInt[COLNORMDMG     , row] := dmg.Damage.Sum;
      sg.Data.CellsAsInt[COLNORMMIN     , row] := dmg.Damage.Min;
      sg.Data.CellsAsInt[COLNORMAV      , row] := dmg.Damage.Avarage;
      sg.Data.CellsAsInt[COLNORMMAX     , row] := dmg.Damage.Max;
      sg.Data.CellsAsInt[COLCRITCOUNT   , row] := dmg.CritDamage.Count;
      sg.Data.CellsAsInt[COLCRITDMG     , row] := dmg.CritDamage.Sum;
      sg.Data.CellsAsInt[COLCRITMIN     , row] := dmg.CritDamage.Min;
      sg.Data.CellsAsInt[COLCRITAV      , row] := dmg.CritDamage.Avarage;
      sg.Data.CellsAsInt[COLCRITMAX     , row] := dmg.CritDamage.Max;
      sg.Data.CellsAsInt[COLCRITCHANCE  , row] := dmg.CritChance;
      if dmg is TAttack
      then sg.Data.Cells[     COLDMGTYPE     , row] := TAttack(dmg).DmgType;
      //endif

      sg.Data.Objects[COLOBJ,             row] := dmg;
      result := row;
      if Color <> clWhite
      then begin
         deco := sg.Decorations.GetRange(rtRow, -1, row, -1, row, TRUE);
         deco.Color := Color;
         deco.Tag := DECOTAG;
      end;//if

      if miTypeDmg.Checked
         and (dmg is TSum)
         and TSum(dmg).isTypeSums
      then begin
         for typedmg in TSum(dmg).Types
         do ToSg('', typedmg, Color);
         //endfor
      end;//if
   end;
begin
   inAction := TRUE;
   sg.Data.Clear;
   sg.Data.AddRow(HEADER);
   sg.Decorations.DeleteTag(DECOTAG);

   if curStats.Chars.Count <> 1
   then begin
      toSg('Alle', curStats.Sum, $00C1FFC1);
   end;//if

   for char in curStats.Chars
   do begin
      toSg(char.Name, char.Sum, clInfoBk);
      for ind := 0 to char.Attacks.Count -1
      do toSg('', char.Attacks[ind]);
      //endfor
   end;//for

   sg.SetGrid;
   sg.Repaint;

   if PnTextStats.Visible
   then RefreshTextStats;
   //endif
   inAction := FALSE;
end;

procedure TFrmMain.RefreshSBar;
begin
   SBar.Panels[0].Text := Format('Log Verzeichnis: %s', [Logpath]);
end;

procedure TFrmMain.RefreshTextStats;
var
   ind : Integer;
   char : TChar;
   gap : String;

   procedure toMemo(const capChar: String; const dmg : TDamage);
   begin
      MemoStats.Lines.Add(capChar+ ': ' + dmg.Caption);
   end;

begin
   MemoStats.Clear;
   MemoStats.Lines.BeginUpdate;

   if curStats.Chars.Count <> 1
   then begin
      toMemo('Alle', curStats.Sum);
      gap := '   ';
   end else gap := '';
   //endif

   for char in curStats.Chars
   do begin
      toMemo(gap + '+ ' + char.Name, char.Sum);
      for ind := 0 to char.Attacks.Count -1
      do toMemo(gap + '  - ' + char.Attacks[ind].Name, char.Attacks[ind]);
      //endfor
   end;//for

   MemoStats.Lines.EndUpdate;
end;

procedure TFrmMain.ReloadCols;
var
   col : Integer;
   deco : TDecoration;
begin
  for col := 0 to COLMAX
  do begin
     deco := sg.Decorations.GetRange(rtColumn, col, -1, col, -1, TRUE);
     if VisibleCols.IsIn(col)
     then deco.TrimModes := deco.TrimModes - [tmHide]
     else deco.TrimModes := deco.TrimModes + [tmHide];
     //endif
  end;//if
  sg.Trim;
end;

procedure TFrmMain.ReloadStorage;
var
   item : TStore;
   row : Integer;
begin
   sgStore.Data.Clear;
   for item in storage
   do begin
      row := sgStore.Data.AddEmpty(1);
      sgStore.Data.Cells[0, row] := item.Caption;
      sgStore.Data.Objects[0, row] := item;
   end;//for
   sgStore.SetGrid;
end;

procedure TFrmMain.sgColsDblClick(Sender: TObject);
begin
   if sgCols.IsSelected
   then sgCols.Toggle(sgCols.SelectIndex);
   //endif
end;

procedure TFrmMain.sgDblClick(Sender: TObject);
var
   attack : String;
   atype : TAttackType;
   row : Integer;
begin
   if sg.IsSelected
   then begin
      row := sg.SelectIndex;
      attack := sg.Data.Cells[COLATTACK, row];
      if (nil = sg.Decorations.GetRange(rtRow, -1, row, -1, row))
         and (attack <> '')
      then begin
         currentAttack := attack;
         PnAttackConfig.Left := Self.ScreenToClient(Mouse.CursorPos).X +15;
         PnAttackConfig.Top := Self.ScreenToClient(Mouse.CursorPos).Y +5;
         PnAttackConfig.Visible := TRUE;
         PnAttackConfig.Caption := format('Typ für <b>%s</b>', [ attack]);
         if AttackDmgTypes.Find(attack, atype)
         then cBoxType.ItemIndex := cBoxType.Items.IndexOf(atype.DmgType);
         //endif
      end else PnAttackConfig.Visible := FALSE;
      //endif
   end;//if
end;

procedure TFrmMain.BtOkTypeClick(Sender: TObject);
var
   atype : TAttackType;
   dmgtype : String;
   ind : Integer;
   isDirty : Boolean;
   ini : TIniFile;
begin
   PnAttackConfig.Visible := FALSE;
   sg.SetFocus;
   if (currentAttack <> '')
   then begin
      dmgtype := cBoxType.Text;
      if (dmgtype <> '') and (cBoxType.Items.IndexOf(dmgtype) < 0)
      then begin
         cBoxType.Items.Add(dmgtype);
      end;//if

      isDirty := TRUE;

      if AttackDmgTypes.Find(currentAttack, ind)
      then begin
         if dmgType = ''
         then AttackDmgTypes.Delete(ind)
         else
         if dmgType <> AttackDmgTypes[ind].DmgType
         then begin
            atype := AttackDmgTypes[ind];
            atype.DmgType := dmgType;
            AttackDmgTypes[ind] := atype;
         end else isDirty := FALSE;
         //endif
      end else begin
         if dmgType <> ''
         then begin
            atype.Attack := currentAttack;
            atype.DmgType := dmgType;
            AttackDmgTypes.Add(atype);
            AttackDmgTypes.Sort;
         end else isDirty := FALSE;
         //endif
      end;//if
      Application.ProcessMessages;

      if isDirty
      then begin
         ini := TIniFile.Create('./'+INIFILE);
         ini.WriteString(SECTIONATTACKDMGTYPES, currentAttack, dmgtype);
         ini.Free;

         CalcSum;
      end;//if
   end;//if
end;

procedure TFrmMain.sgShowHint(Sender: TObject; ACol, ARow: Integer;
  var Hint: string);
begin
   if (ARow = 0) and (ACol >= 0) and (ACol < length( COLHINTS)) and (COLHINTS[ACol] <> '')
   then Hint := COLHINTS[ACol];
   //endif
end;

procedure TFrmMain.sgSort(Sender: TObject; const aCol, aRow: Integer;
  const SortOrder: uSort.TSortOrder; var doSort: Boolean);
begin
   doSort := FALSE;
   if not inAction
   then begin
      if (sg.Data.SortCell.X <> aCol) or (sg.Data.SortDirection = uSort.TSortOrder.TS_ASCENDING)
      then sg.Data.SortDirection := uSort.TSortOrder.TS_DESCENDING
      else sg.Data.SortDirection := uSort.TSortOrder.TS_ASCENDING;
      //endif

      sg.Data.SortCell.X := aCol;
      sg.Data.SortCell.Y := aRow;

      Sort;
      RefreshGrid;
   end;//if
end;

procedure TFrmMain.sgStoreDblClick(Sender: TObject);
begin
   if sgStore.IsSelected and (sgStore.Data.Objects[0, sgStore.SelectIndex] is TStore)
   then LoadItem(TStore(sgStore.Data.Objects[0, sgStore.SelectIndex]));
   //endif
end;

procedure TFrmMain.sgStoreShowHint(Sender: TObject; ACol, ARow: Integer;
  var Hint: string);
var
   cap : String;
begin
   if (ACol = 0)  and (ARow >= 0) and (ARow  < sgStore.Data.Count)
      and (sgStore.Data.Objects[0, ARow] is TStore)
   then begin
      cap := TStore(sgStore.Data.Objects[0, ARow]).TimeSpanCaption;
      if cap <> Hint
      then Hint :=  Trim(Hint + ' ' + cap)
   end;//if
end;

procedure TFrmMain.SplitterPaint(Sender: TObject);
begin
   uCsControls.SplitterPaint(Sender);
end;

procedure TFrmMain.Start;
var
   logfile : String;
begin
   logfile := IncludeTrailingPathDelimiter(LogPath) + LogFileName;
   polling.Valid := FALSE;
   if System.IOUtils.TFile.Exists(logfile)
   then begin
      GetLog.Clear;
      BtStart.Enabled := FALSE;
      BtStop.Enabled := TRUE;
      BtAnalyze.Enabled := FALSE;
      dtpDateFrom.Enabled := FALSE;
      dtpDateTo.Enabled := FALSE;
      EdTimeFrom.Enabled := FALSE;
      EdTimeTo.Enabled := FALSE;
      Application.ProcessMessages;
      curStats.Init;
      curData.Free;
      curData := TList<TData>.Create;
      polling.Init;
      polling.LogFile := logFile;
      RefreshGrid;
      RefreshDiag;

      if PnAutoStop.Active
      then polling.DtAutoStop := EdAutoStop.asTime
      else polling.DtAutoStop := 0;
      //endif

      GaugeLive.Progress := 0;
      GaugeLive.Visible := PnAutoStop.Active;
      Application.ProcessMessages;
      Poll;
      Timer.Enabled := TRUE;
   end else MessageDlg('Das Logfile ist nicht vorhanden!', mtError, [mbOK], 0);
   //endif
end;

procedure TFrmMain.Poll;
var
   line : String;
   dt : TDateTime;
   data : TData;
   sr : TStreamReader;
   fs : TFileStream;
   lines : TStringList;
   currentFileStamp : TDateTime;
begin
   if polling.Valid
   then begin
      currentFileStamp := TFile.GetLastWriteTimeUtc(polling.LogFile);

      if polling.lastFileStamp = 0
      then begin
         fs := TFileStream.Create(polling.LogFile, fmOpenRead or fmShareDenyNone);
         fs.Seek(0,soFromEnd);
         polling.Pos := fs.Position;
         fs.Free;
      end else
      if polling.lastFileStamp <> currentFileStamp
      then begin
         fs := TFileStream.Create(polling.LogFile, fmOpenRead or fmShareDenyNone);
         fs.Seek(polling.Pos, soFromBeginning);
         lines := TStringList.Create;

         sr := TStreamReader.Create(fs, encoding);
         while not sr.EndOfStream
         do begin
            line := sr.ReadLine;
            polling.LastPos := polling.Pos;
            polling.Pos := polling.Pos + line.Length + 2;

            if Parse(line, dt, data)
            then begin
               if polling.IsAutoStop and (curData.Count = 0)
               then begin
                  polling.DtStart := dt;
                  polling.DtStop := dt + polling.DtAutoStop;
               end;//if

               if (polling.DtStop = 0) or ( dt < polling.DtStop)
               then begin
                  curData.Add(data);
                  //lines.Add(Format('%d(%d) - %s', [polling.LastPos, polling.Pos - polling.LastPos, line]));
                  lines.Add(line);
                  if polling.IsAutoStop
                  then begin
                     GaugeLive.Progress := Round( ( dt - polling.DtStart) * 100 / polling.DtAutoStop );
                     Application.ProcessMessages;
                  end;//if
               end else
               if not polling.DoStop and polling.IsAutoStop
               then begin
                  Beep;
                  GaugeLive.Progress := 100;
                  polling.DoStop := TRUE;
               end;//if
            end else ;//Junk.Add(line);
            //endif
         end;//while

         if lines.Count > 0
         then begin
            GetLog.AddStrings(lines);
            if PnCombatLog.Visible
            then begin
               Memo.SelStart := Memo.GetTextLen;
               Memo.SelLength := 0;
               Memo.ScrollBy(0, Memo.Lines.Count);
               Memo.Refresh;
            end;//if
            CalcSum;
            Application.ProcessMessages;
         end;//if

         sr.Free;
         fs.Free;
      end;//if

      polling.lastFileStamp := currentFileStamp;

      if polling.doStop
      then Stop;
      //endif
   end;//if
end;

procedure TFrmMain.Stop;
begin
   polling.DoStop := TRUE;
   polling.Valid := FALSE;
   GaugeLive.Visible := FALSE;
   if curData.Count > 0
   then begin
      dtpDateFrom.DateTime := Trunc(TTimeZone.Local.ToLocalTime(curData.First.DtStamp));
      EdTimeFrom.asTime := Frac(TTimeZone.Local.ToLocalTime(curData.First.DtStamp));
      dtpDateTo.DateTime := Trunc(TTimeZone.Local.ToLocalTime(curData.Last.DtStamp));
      EdTimeTo.asTime := Frac(TTimeZone.Local.ToLocalTime(curData.Last.DtStamp));
   end;//if
   BtStart.Enabled := TRUE;
   BtStop.Enabled := FALSE;
   BtAnalyze.Enabled := TRUE;
   dtpDateFrom.Enabled := TRUE;
   dtpDateTo.Enabled := TRUE;
   EdTimeFrom.Enabled := TRUE;
   EdTimeTo.Enabled := TRUE;
   Application.ProcessMessages;
//   Analyze;
end;

procedure TFrmMain.LoadStorage;
var
   data : TCsStringList;
   sub : TCsStringList;
   item : TStore;
   line : String;
   pop : TPop;
begin
   Storage.Clear;
   if TFile.Exists( './' + STORAGEFILE)
   then begin
      data := TCsStringList.Create;
      data.LoadFromFile('./' + STORAGEFILE, Encoding);
      sub := TCsStringList.Create;

      for line in data
      do begin
         sub.LightText := line;
         pop.Create(sub);
         item := TStore.Create;
         item.DayStart := pop.PopExt(0);
         item.TimeStart := pop.PopExt(0);
         item.DayEnd := pop.PopExt(0);
         item.TimeEnd := pop.PopExt(0);
         item.Name := pop.pop;
         Storage.Add(item);
      end;//if

      sub.Free;
      data.Free;
   end;//if
end;

procedure TFrmMain.miFilterFakeDmgClick(Sender: TObject);
begin
   miFilterFakeDmg.Checked := not miFilterFakeDmg.Checked;
   CalcSum;
end;

procedure TFrmMain.miShowDiagClick(Sender: TObject);
begin
   PnDiag.Visible := TRUE;
   RealignSplitters;
   if PnDiag.Visible
   then RefreshDiag;
   //endif
end;

procedure TFrmMain.miTypeDmgClick(Sender: TObject);
begin
   miTypeDmg.Checked := not miTypeDmg.Checked;
   RefreshGrid;
end;

procedure TFrmMain.OnNewAttackType(Sender: TObject);
begin
   //
end;

procedure TFrmMain.OnRemoveAttackType(Sender: TObject);
begin
   //
end;

procedure TFrmMain.OnSetAttackType(Sender: TObject);
begin
   //
end;

procedure TFrmMain.StoreStorage;
var
   data : TCsStringList;
   sub : TCsStringList;
   item : TStore;
begin
   data := TCsStringList.Create;
   sub := TCsStringList.Create;

   for item in storage
   do begin
      sub.Clear;
      sub.AddExt(item.DayStart);
      sub.AddExt(item.TimeStart);
      sub.AddExt(item.DayEnd);
      sub.AddExt(item.TimeEnd);
      sub.Add(Item.Name);
      data.Add(sub.Lighttext);
   end;//for

   data.SaveToFile('./' + STORAGEFILE, Encoding);
   sub.Free;
   data.Free;
end;

procedure TFrmMain.TimerTimer(Sender: TObject);
begin
   Timer.Enabled := FALSE;
   Poll;
   Timer.Enabled := polling.Valid;
end;

{ TIndexList }

function TIndexList.Load(const path: String): Boolean;
var
   i : Integer;
   sl : TStringList;
   indexFile : String;
   entry : TIndex;
begin
   result := FALSE;
   indexFile := IncludeTrailingPathDelimiter(path) + INDEXFILENAME;
   Clear;
   if TFile.Exists(indexFile)
   then begin
      sl := TStringList.Create;
      sl.LoadFromFile(indexFile);
      if (sl.Count > 0) and (sl[0] = INDEXVERSION)
      then begin
         for i := 0 to sl.Count -1
         do begin
            entry.DateTime := StrToDateDef(sl[i].Substring(0, 10), 0);
            if (entry.DateTime <> 0) and Int64.TryParse(sl[i].Substring(11), entry.Position)
            then Add(entry);
            //enfif
         end;//for
         result := TRUE;
      end;//if
      sl.Free;
      Sort;
   end;//if
end;

procedure TIndexList.Store(const path : String);
var
   i : Integer;
   sl : TStringList;
   indexFile : String;
begin
   indexFile := IncludeTrailingPathDelimiter(path) + INDEXFILENAME;
   Sort;

   sl := TStringList.Create;
   sl.Add(INDEXVERSION);
   for i := 0 to Count -1
   do sl.Add(Format('%s|%s', [FormatDateTime('dd.mm.yyyy',Items[i].DateTime), Int64.ToString(Items[i].Position)]));
   //endfor

   try
     sl.SaveToFile(indexFile);
   except on E: Exception do
     MessageDlg('Speichern des Index fehlgeschlagen!' + #13#10 + e.Message, mtError, [mbOK], 0);
   end;

   sl.Free;
end;

{ TPoll }

procedure TPoll.Init;
begin
      Valid := TRUE;
      Pos := 0;
      LastPos := 0;
      DtStart := 0;
      DtStop := 0;
      DoStop := FALSE;
      lastFileStamp := 0;
end;

function TPoll.IsAutoStop: Boolean;
begin
   result := DtAutoStop > 0;
end;

{ TStore }

function TStore.Caption: String;
begin
   if Name = ''
   then result := TimeSpanCaption
   else result := Name;
   //endif
end;

function TStore.TimeSpanCaption: String;
begin
      if Trunc(DayStart) = Trunc(DayEnd)
      then begin
         if TimeEnd = 1
         then result := Format('%s, %s - 24:00:00', [ FormatDateTime('dd.mm.yyyy', DayStart), FormatDateTime('hh:nn:ss', TimeStart)])
         else result := Format('%s, %s - %s', [ FormatDateTime('dd.mm.yyyy', DayStart), FormatDateTime('hh:nn:ss', TimeStart), FormatDateTime('hh:nn:ss', TimeEnd)]);
      end else begin
         if TimeEnd = 1
         then result := Format('%s - %s', [ FormatDateTime('dd.mm.yyyy hh:nn:ss', DayStart + TimeStart), FormatDateTime('dd.mm.yyyy 24:00:00', DayEnd)])
         else result := Format('%s - %s', [ FormatDateTime('dd.mm.yyyy hh:nn:ss', DayStart + TimeStart), FormatDateTime('dd.mm.yyyy hh:nn:ss', DayEnd + TimeEnd)]);
      end;//if
      //endif
end;

end.
