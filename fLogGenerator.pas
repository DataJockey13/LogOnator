unit fLogGenerator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogGenerator = class(TForm)
    StatusBar: TStatusBar;
    PnTop: TPanel;
    Memo: TMemo;
    BtAdd: TButton;
    cbAuto: TCheckBox;
    TimerAuto: TTimer;
    TimerStore: TTimer;
    BtClear: TButton;
    procedure BtAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAutoClick(Sender: TObject);
    procedure TimerAutoTimer(Sender: TObject);
    procedure TimerStoreTimer(Sender: TObject);
    procedure BtClearClick(Sender: TObject);
  private
    { Private-Deklarationen }
    encoding : TEncoding;
    buffer : TStringList;
    count : Integer;
    sum : Integer;
    procedure AddLine;
    procedure Store;
    procedure RefreshSBar;
  public
    { Public-Deklarationen }
  end;

var
  frmLogGenerator: TfrmLogGenerator;

implementation

uses
  System.IOUtils, System.DateUtils;

{$R *.dfm}

const
   LogPath : String = '.\en';
   LogFileName = 'combat.log';

   Chars : array[0..4] of String = (
         'Ado Ra',
         'Sidekick',
         'Robot Sidekick',
         'Sparring Target',
         'Carol Ferris');
   Attacks: array[0..9] of String = (
   'Ranged Attack',
   'Dreadfull Blast',
   'Warped Reality',
   'Tachyon Blast',
   'Tachyon Burst',
   'Flurry Shot',
   'Melee Attack',
   'Ranged Attack critically',
   'Flurry Shot critically',
   'Melee Attack critically'
   );


procedure TfrmLogGenerator.AddLine;
var
   char, attack : String;
   dmg : Integer;
   ts : Int64;
   dt : TDateTime;
   mask : String;
begin
   char := Chars[Random(Length(Chars))];
   attack := Attacks[Random(Length(Attacks))];
   dmg := Random(10000) + 1;
   dt := now;
   ts := System.DateUtils.DateTimeToUnix(TTimeZone.Local.ToUniversalTime(dt));
   if char.EndsWith('s')
   then mask := '%s: %s'' %s damaged Sparring Target for %d'
   else mask := '%s: %s''s %s damaged Sparring Target for %d';
   buffer.Add(  format(mask, [Int64.ToString(ts), char, attack, dmg]));
   Memo.Lines.Add(format(mask, [FormatDateTime('dd.mm.yyyy hh:nn:ss', dt), char, attack, dmg]));
   Memo.SelStart := Memo.GetTextLen;
   Memo.SelLength := 0;
   Memo.ScrollBy(0, Memo.Lines.Count);
   Memo.Refresh;
   inc(Count);
   inc(Sum, dmg);
   RefreshSBar;
end;

procedure TfrmLogGenerator.BtAddClick(Sender: TObject);
begin
   AddLine;
   Store;
end;

procedure TfrmLogGenerator.BtClearClick(Sender: TObject);
begin
   Count := 0;
   Sum := 0;
   Buffer.Clear;
   Memo.Clear;
   RefreshSbar;
end;

procedure TfrmLogGenerator.cbAutoClick(Sender: TObject);
begin
   TimerAuto.Enabled := cbAuto.Checked;
   TimerStore.Enabled := cbAuto.Checked;
   if not cbAuto.Checked
   then Store;
   //Endif
end;

procedure TfrmLogGenerator.FormCreate(Sender: TObject);
begin
   Count := 0;
   Sum := 0;
   encoding := TEncoding.GetEncoding(1252);
   Randomize;
   buffer := TStringList.Create;
   RefreshSbar;
end;

procedure TfrmLogGenerator.FormDestroy(Sender: TObject);
begin
   buffer.Free;
end;

procedure TfrmLogGenerator.RefreshSBar;
begin
   Statusbar.Panels[0].Text := Format('%d Hits, %d Dmg', [Count, Sum]);
end;

procedure TfrmLogGenerator.Store;
var
   logfile : String;
begin
   if buffer.Count > 0
   then begin
      logfile := IncludeTrailingPathDelimiter(LogPath) + LogFileName;
      if TFile.Exists(logfile)
      then begin
         try
            TFile.AppendAllText(logfile, buffer.Text, encoding);
            buffer.Clear;
            Memo.Lines.Add('...stored');
         except on E: Exception do
            Memo.Lines.Add(E.Message);
         end;
      end;//if
   end;//if
end;

procedure TfrmLogGenerator.TimerAutoTimer(Sender: TObject);
begin
   if Random(10) < 6
   then AddLine;
   //endif
   Application.ProcessMessages;
end;

procedure TfrmLogGenerator.TimerStoreTimer(Sender: TObject);
begin
   Store;
   TimerStore.Interval := (Random(6) + 1) * 1000;
end;

end.
