unit uStats;

interface

uses
  System.Generics.Collections, classes;

type
   TSortOrder = (TS_NONE, TS_ASCENDING, TS_DESCENDING);
   TSortInfo = record
      Order : TSortOrder;
      Column : Integer;
   end;

   //Typ zum Halten der Information welche Attack welcher DmgTyp ist
   TAttackType = record
      Attack : String;
      DmgType : String;
   end;

   //Liste zum Verwalten der Zuordnung von Attacke und DmgTyp
   TAttackTypList = class(TList<TAttackType>)
      function Find(const Attack: String; out AttackType : TAttackType): Boolean; overload;
      function Find(const Attack: String; out ind : Integer): Boolean; overload;
   end;

   //Grundtyp zum halten der geparsten Rohdaten
   TData = record
   public
      //Angreifer
      Name : String;
      //Name der Attacke
      Attack : String;
      //Flag ob critical
      Crit : Boolean;
      //Name des Ziels (noch nicht verwendet)
      Target : String;
      //Damagehöhe
      Damage : Int64;
      //Timerstamp des Hits
      Stamp : Int64;
      //Hilfsfunktion
      function DtStamp: TDateTime; //UTC
      //Initialisiert alle Datenfelder
      procedure Init;
      //flag ob Angreifer = Ziel
      function FakeDamage: Boolean;
   end;

   //Liste fuer Grunddaten mit Summenfunktion
   TDataList = class(TList<TData>)
      function Sum(const Start: int64; const Finish: int64): int64;
      constructor Create;
   end;

   //Hilfstyp für TDamage
   TDamageInfo = record
   public
      //geringster Dmg
      Min : Int64;
      //höchster Dmg
      Max : Int64;
      //Summe
      Sum : Int64;
      //Anzahl der Hits
      Count : Int64;
      //Gesamtsekunden zum Berechnen von DpM (wird von aussen in TDamage.SetSeconds im Finalize gesetzt)
      Seconds : Int64;
      //Initialisiert alle Datenfelder
      procedure Init;
      //Hinzufügen von Rohdaten
      procedure Add(const data: TData); overload;
      //Hinzufügen einer dmgInfo (beim Aufbau der Summen im Finalize)
      procedure Add(const dmg: TDamageInfo); overload;
      //Damage per Minute > Seconds
      function DpM: Int64;
      //Durschschnitt > Count
      function Avarage: Int64;
   end;

   //Informationen zu einer Attacke oder Summe
   TDamage = class
   public
      //Name der Attacke
      Name : String;
      //Summe aus Damage und CritDamage
      Sum : TDamageInfo;
      //normaler Damage
      Damage : TDamageInfo;
      //Critdamage
      CritDamage : TDamageInfo;
      procedure Init; virtual;
      procedure Add(const data: TData);
      procedure AddDamage(const dmg: TDamage);

      //CritChange Crit.Count / Sum.Count %
      function CritChance: Integer;
      //Caption für das Textlog
      function Caption: String;

      //Hilfsfunktion zum Sortieren der Datenmenge
      function GetColStr(const col: Integer): String; virtual;
      //Hilfsfunktion zum Sortieren der Datenmenge
      function GetColInt(const col: Integer): Int64;
      //Hilfsfunktion zum Sortieren der Datenmenge
      function CompareBy(const a: TDamage; const SortInfo: TSortInfo): Integer;

      constructor Create(const Name: String); virtual;

      //Wird im Finalize aufgerufen
      procedure SetSeconds(const Seconds: Int64); virtual;
   end;

   //Liste für Attacken mit Sortiermöglichkeit
   TDamages<T: TDamage> = class(TObjectList<T>)
   public
      SortInfo : TSortInfo;
      procedure SortBy(const Col: Integer; const SortOrder: TSortOrder);
      function Find(const Name: String; out ind: Integer): Boolean;
   end;

   TTypeSums = TDamages<TDamage>;

   //eine Attack mit Damage und Typ
   TAttack = class(TDamage)
      DmgType : String;
      function GetColStr(const col: Integer): String; override;
      constructor Create(const Name: String); override;
   end;

   TAttacks = TDamages<TAttack>;

   //Summe von Attacken
   TSum = class(TDamage)
      //Zwischensummen für Dmg-Typen
      Types : TTypeSums;
      //Hilfsfunktion ob Zwischensummen vorliegen
      function isTypeSums: Boolean;

      procedure Init; override;
      procedure AddSum(const aSum: TSum);
      procedure AddAttack(const aAtt: TAttack);
      procedure SetSeconds(const Seconds: Int64); override;
      constructor Create; reintroduce;
      destructor Destroy; override;
   end;


   //Angreifer
   TChar = class
   public
      //Name
      Name : String;
      //Summe incl Zwischensummen für Dmg-Typen
      Sum : TSum;
      //weitere Zeilen mit Attacks
      Attacks : TAttacks;
      //expandiert ja/nein
      Expanded : Boolean;

      constructor Create;
      destructor Destroy; override;
      procedure Add(const data: TData);
      //Hilfsfunktion zum Sortieren der Datenmenge
      function CompareBy(const aChar: TChar; const SortInfo: TSortInfo): Integer;
      //Gesamtsekunden des ausgewerteten Bereichs werden gesetzt ( > DpM) . muss am Ende einer Auswertung einmal aufgerufen werden
      procedure SetSeconds(const Seconds: Int64);
      //alle Summen werden gebildet. muss am Ende einer Auswertung einmal aufgerufen werden
      procedure Finalize;
   end;

   //Liste der Angreifer
   TChars = class(TObjectList<TChar>)
   public
      SortInfo : TSortInfo;
      procedure SortBy(const Col: Integer; const SortOrder: TSortOrder);
   end;

   //Ergebnis einer Auswertung
   TStats = class
   public
      Sum : TSum;
      Chars : TChars;
      Data : TDataList;
      constructor Create;
      destructor Destroy; override;
      function Add(const data: TData): Integer;
      procedure Init;
      procedure Finalize(const Seconds: Int64);
      procedure SortBy(const Col: Integer; const SortOrder: TSortOrder);
   end;

var
    AttackDmgTypes : TAttackTypList = nil;
    DmgTypes : TStringList = nil;


const
   COLNAME        = 0;  //String
   COLATTACK      = 1;  //String
   COLSUMDPM      = 2;
   COLCRITCHANCE  = 3;
   COLSUMCOUNT    = 4;
   COLSUMDMG      = 5;
   COLSUMMIN      = 6;
   COLSUMAV       = 7;
   COLSUMMAX      = 8;
   COLNORMCOUNT   = 9;
   COLNORMDMG     = 10;
   COLNORMMIN     = 11;
   COLNORMAV      = 12;
   COLNORMMAX     = 13;
   COLCRITCOUNT   = 14;
   COLCRITDMG     = 15;
   COLCRITMIN     = 16;
   COLCRITAV      = 17;
   COLCRITMAX     = 18;
   COLDMGTYPE     = 19;  //String
   COLMAX = 19;


implementation

uses
  System.SysUtils, System.Math, System.Generics.Defaults, System.DateUtils;


{ TData }

function TData.DtStamp: TDateTime; //UTC
begin
   result := System.DateUtils.UnixToDateTime(Stamp);
end;

function TData.FakeDamage: Boolean;
begin
   result := Name = Target;
end;

procedure TData.Init;
begin
      Name := '';
      Attack := '';
      Crit := FALSE;
      Target := '';
      Damage := 0;
      Stamp := 0;
end;

{ TChar }

function TChar.CompareBy(const aChar: TChar;  const SortInfo: TSortInfo): Integer;
var
   myDmg, aDmg : TDamage;
begin
   if SortInfo.Column = COLNAME
   then begin
      result := CompareText(Name, aChar.Name);
      if SortInfo.Order = TSortOrder.TS_DESCENDING
      then result := result * -1;
      //endif
   end else begin
      if Attacks.Count > 0
      then begin
         if (Attacks.SortInfo.Column <> SortInfo.Column) or (Attacks.SortInfo.Order <> SortInfo.Order)
         then Attacks.SortBy(SortInfo.Column, SortInfo.Order);
         //endif
         myDmg := Attacks[0];
         if myDmg.CompareBy(Sum, SortInfo) > 0
         then myDmg := Sum;
         //endif
      end else myDmg := Sum;
      //endif


      if aChar.Attacks.Count > 0
      then begin
         if (aChar.Attacks.SortInfo.Column <> SortInfo.Column) or (aChar.Attacks.SortInfo.Order <> SortInfo.Order)
         then aChar.Attacks.SortBy(SortInfo.Column, SortInfo.Order);
         //endif
         aDmg := aChar.Attacks[0];
         if aDmg.CompareBy(aChar.Sum, SortInfo) > 0
         then aDmg := aChar.Sum;
         //endif
      end else aDmg := aChar.Sum;
      //endif
      result := myDmg.CompareBy(aDmg, SortInfo);
   end;//if
end;

constructor TChar.Create;
begin
   inherited;
   Expanded := FALSE;
   Name := '';
   Sum := TSum.Create;
   Attacks := TAttacks.Create(TRUE);
end;

destructor TChar.Destroy;
begin
   Sum.Free;
   Attacks.Free;
   inherited;
end;

procedure TChar.Finalize;
var
   i : Integer;
   att : TAttack;
begin
   //Summe aufbaun
   Sum.Init;
   for i := 0 to Attacks.Count -1
   do begin
      att := Attacks[i];
      Sum.AddAttack(att);
   end;//if
end;

procedure TChar.SetSeconds(const Seconds: Int64);
var
   i : Integer;
begin
   Sum.SetSeconds(Seconds);
   for i := 0 to Attacks.Count -1
   do Attacks[i].SetSeconds(Seconds);
   //endfor
end;

procedure TChar.Add(const data: TData);
var
   ind : Integer;
   found : Boolean;
   myAttack : TAttack;
begin
   found := FALSE;
   ind := 0;
   //Summen werden am Ende gebildet


   //Attack suchen
   while not found and (ind < Attacks.Count)
   do if Attacks[ind].Name = data.Attack
      then found := TRUE
      else inc(ind);
      //endif
   //endwhile

   if not found
   then begin
      myAttack := TAttack.Create(data.Attack);
      Attacks.Add(myAttack);
   end else myAttack := Attacks[ind];
   //endif

   //Daten registrieren
   myAttack.Add(data);
end;


{ TDamageInfo }

procedure TDamageInfo.Add(const data: TData);
begin
   if Min = 0
   then Min := data.Damage
   else Min := System.Math.Min(Min, data.Damage);
   //endif
   Max := System.Math.Max(Max, data.Damage);
   Count := Count +1;
   Sum := Sum + data.Damage;
end;

procedure TDamageInfo.Add(const dmg: TDamageInfo);
begin
   if Min = 0
   then Min := dmg.Min
   else
   if dmg.Min <> 0
   then Min := System.Math.Min(Min, dmg.Min);
   //endif
   Max := System.Math.Max(Max, dmg.Max);
   Count := Count + dmg.Count;
   Sum := Sum + dmg.Sum;
end;

function TDamageInfo.Avarage: Int64;
begin
   if Count > 0
   then result := Round(Sum / Count)
   else result := 0;
   //endif
end;

function TDamageInfo.DpM: Int64;
begin
   if Seconds > 0
   then result := Round((Sum / Seconds) * 60 )
   else result := 0;
   //endif
end;

procedure TDamageInfo.Init;
begin
   Min := 0;
   Max := 0;
   Count := 0;
   Sum := 0;
   Seconds := 0;
end;

{ TStats }

function TStats.Add(const data: TData): Integer;
var
   ind : Integer;
   found : Boolean;
   char : TChar;
begin
   Sum.Add(data);
   found := FALSE;
   ind := 0;
   while not found and (ind < Chars.Count)
   do if Chars[ind].Name = data.Name
      then found := TRUE
      else inc(ind);
      //endif
   //endwhile

   if not found
   then begin
      char := TChar.Create;
      char.Name := data.Name;
      ind := Chars.Add(char);
   end else char := Chars[ind];
   //endif
   char.Add(data);
   Self.Data.Add(data);
   result := Ind;
end;

constructor TStats.Create;
begin
   inherited;
   Sum := TSum.Create;
   Data := TDataList.Create;
   Chars := TChars.Create(TRUE);
end;

destructor TStats.Destroy;
begin
  Data.Free;
  Sum.Free;
  Chars.Free;
  inherited;
end;

procedure TStats.Finalize(const Seconds: Int64);
var
   c : TChar;
begin
   //eigene Summe befuellen und Chars finalizieren
   Sum.Init;
   for c in Chars
   do begin
      c.Finalize;
      c.SetSeconds(Seconds);
      Sum.AddSum(c.Sum);
   end;//if

   Sum.SetSeconds(Seconds);
   Data.Sort;
end;

procedure TStats.Init;
begin
   Sum.Init;
   Chars.Clear;
   Data.Clear;
end;

procedure TStats.SortBy(const Col: Integer; const SortOrder: TSortOrder);
begin
   Sum.Types.SortBy(Col, SortOrder);
   Chars.SortBy(Col, SortOrder);
end;

{ TChars }

procedure TChars.SortBy(const Col: Integer; const SortOrder: TSortOrder);
var
   c : TChar;
begin
   if SortOrder = TSortOrder.TS_NONE
   then SortInfo.Order := TSortOrder.TS_ASCENDING
   else SortInfo.Order := SortOrder;
   //endif
   SortInfo.Column := Col;

   for c in Self
   do begin
      c.Sum.Types.SortBy(Col, SortInfo.Order);
      c.Attacks.SortBy(Col, SortInfo.Order);
   end;//for

   Sort( TComparer<TChar>.Construct(
                                function(const Left, Right: TChar): Integer
                                begin
                                  Result := Left.CompareBy(Right, SortInfo);
                                end));
end;

{ TDamage }

procedure TDamage.Add(const data: TData);
begin
   Sum.Add(data);
   if data.Crit
   then CritDamage.Add(data)
   else Damage.Add(data);
   //endif
end;

procedure TDamage.AddDamage(const dmg: TDamage);
begin
      Sum.Add(dmg.Sum);
      Damage.Add(dmg.Damage);
      CritDamage.Add(dmg.CritDamage);
end;

function TDamage.Caption: String;
begin
   if Self.CritDamage.Count > 0
   then result := Format('%d gesamt (%d DpM), %d-%d-%d normal, %d-%d-%d kritisch (%d%%)', [Self.Sum.Sum, Self.Sum.DpM, Self.Damage.Min, Self.Damage.Avarage, Self.Damage.Max, Self.CritDamage.Min, Self.CritDamage.Avarage, Self.CritDamage.Max, Self.CritChance ])
   else result := Format('%d gesamt(%d DpM), %d-%d-%d normal', [Self.Sum.Sum, Self.Sum.DpM, Self.Damage.Min, Self.Damage.Avarage, Self.Damage.Max ]);
   //endif
end;

function TDamage.CompareBy(const a: TDamage; const SortInfo: TSortInfo): Integer;
begin
   if SortInfo.Column in [COLNAME, COLATTACK, COLDMGTYPE]
   then result := CompareText(GetColStr(SortInfo.Column), a.GetColStr(SortInfo.Column))
   else result := GetColInt(SortInfo.Column) - a.GetColInt(SortInfo.Column);
   //endif

   if SortInfo.Order = TSortOrder.TS_DESCENDING
   then result := -1* result;
   //endif
end;

constructor TDamage.Create(const Name: String);
begin
   inherited Create;
   Self.Name := Name;
   Self.Init;
end;

function TDamage.CritChance: Integer;
begin
   if Sum.Count > 0
   then result := Round(CritDamage.Count * 100 / Sum.Count)
   else result := 0;
   //endif
end;

function TDamage.GetColInt(const col: Integer): Int64;
begin
   case Col of
      COLNAME        : result := 0;
      COLATTACK      : result := 0;
      COLSUMDPM      : result := Sum.DpM;
      COLCRITCHANCE  : result := CritChance;
      COLSUMCOUNT    : result := Sum.Count;
      COLSUMDMG      : result := Sum.Sum;
      COLSUMMIN      : result := Sum.Min;
      COLSUMAV       : result := Sum.Avarage;
      COLSUMMAX      : result := Sum.Max;
      COLNORMCOUNT   : result := Damage.Count;
      COLNORMDMG     : result := Damage.Sum;
      COLNORMMIN     : result := Damage.Min;
      COLNORMAV      : result := Damage.Avarage;
      COLNORMMAX     : result := Damage.Max;
      COLCRITCOUNT   : result := CritDamage.Count;
      COLCRITDMG     : result := CritDamage.Sum;
      COLCRITMIN     : result := CritDamage.Min;
      COLCRITAV      : result := CritDamage.Avarage;
      COLCRITMAX     : result := CritDamage.Max;
      COLDMGTYPE     : result := 0;
      else result := 0;
   end;//case
end;

function TDamage.GetColStr(const col: Integer): String;
begin
   case Col of
      COLATTACK : result := Name;
      else result := '';
   end;//case
end;

procedure TDamage.Init;
begin
   Damage.Init;
   CritDamage.Init;
   Sum.Init;
end;

procedure TDamage.SetSeconds(const Seconds: Int64);
begin
   Sum.Seconds := Seconds;
   Damage.Seconds := Seconds;
   CritDamage.Seconds := Seconds;
end;

{ TAttackTypList }

function TAttackTypList.Find(const Attack: String;
  out AttackType: TAttackType): Boolean;
var
   ind : Integer;
begin
   result := Find(Attack, ind);
   if result
   then AttackType := Self.Items[ind];
   //endif
end;

function TAttackTypList.Find(const Attack: String; out ind: Integer): Boolean;
var
   at : TAttackType;
begin
   at.Attack := Attack;
   at.DmgType := '';
   result := Self.BinarySearch(at, ind);
end;


{ TDamages<T> }

function TDamages<T>.Find(const Name: String; out ind: Integer): Boolean;
begin
   result := FALSE;
   ind := 0;
   while not result and (ind < Count)
   do if Name = Self[ind].Name
      then result := TRUE
      else inc(ind);
      //endif
   //endwhile
end;

procedure TDamages<T>.SortBy(const Col: Integer; const SortOrder: TSortOrder);
begin
   if SortOrder = TSortOrder.TS_NONE
   then SortInfo.Order := TSortOrder.TS_ASCENDING
   else SortInfo.Order := SortOrder;
   //endif
   SortInfo.Column := Col;
   Sort( TComparer<T>.Construct( function(const Left, Right: T): Integer
                      begin
                        Result := Left.CompareBy(Right, SortInfo);
                      end));


end;

{ TSum }

procedure TSum.AddAttack(const aAtt: TAttack);
var
   ind : Integer;
   typeSum : TDamage;
begin
   AddDamage(aAtt);
   if Types.Find(aAtt.DmgType, ind)
   then typeSum := Types[ind]
   else begin
      typeSum := TDamage.Create(aAtt.DmgType);
      Types.Add(typeSum);
   end;//if

   typeSum.AddDamage(aAtt)
end;

procedure TSum.AddSum(const aSum: TSum);
var
   aTypeSum, typeSum: TDamage;
   ind : Integer;
begin
   //alles Mergen
   AddDamage(aSum);
   for aTypeSum in aSum.Types
   do begin
      if Types.Find(aTypeSum.Name, ind)
      then typeSum := Types[ind]
      else begin
         typeSum := TDamage.Create(aTypeSum.Name);
         Types.Add(typeSum);
      end;//if

      typeSum.AddDamage(aTypeSum)
   end;//for
end;

constructor TSum.Create;
begin
   Types :=  TTypeSums.Create(TRUE);
   inherited Create('Summe');
end;

destructor TSum.Destroy;
begin
  Types.Free;
  inherited;
end;

procedure TSum.Init;
begin
  inherited;
  Types.Clear;
end;

function TSum.isTypeSums: Boolean;
begin
   result := (Types.Count > 1);
end;

procedure TSum.SetSeconds(const Seconds: Int64);
var
   i : Integer;
begin
  inherited;
  for i := 0 to Types.Count -1
  do Types[i].SetSeconds(Seconds);
  //endfor
end;

{ TAttack }

constructor TAttack.Create(const Name: String);
var
   attackType : TAttackType;
begin
   inherited;
   if (AttackDmgTypes.Count > 0)
      and (Name <> '')
      and AttackDmgTypes.Find(Name, attackType)
   then DmgType := attacktype.DmgType;
   //endif
end;

function TAttack.GetColStr(const col: Integer): String;
begin
   if col = COLDMGTYPE
   then result := DmgType
   else result := inherited GetColStr(col);
   //endif
end;

{ TDataList }

constructor TDataList.Create;
begin
   inherited Create( TComparer<TData>.Construct( function(const Left, Right: TData): Integer
                                  begin
                                    Result := Left.Stamp - Right.Stamp;
                                  end));
end;

function TDataList.Sum(const Start, Finish: int64): int64;
var
   probe: TData;
   ind : Integer;
begin
   result := 0;
   probe.Stamp := Start;
   if not Self.BinarySearch(probe, ind)
   then begin
      ind := 0;
      while (ind < Self.Count) and (Self.Items[ind].Stamp < Start)
      do inc(ind);
      //endwhile
   end;//if

   while (ind < Self.Count) and (Self.Items[ind].Stamp <= Finish)
   do begin
      result := result + Self.Items[ind].Damage;
      ind := ind +1;
   end;//while
   //endwhile
end;

end.
