unit uDeskSize;

interface

uses
  Windows, Vcl.Forms;

function getMonitorCount: Integer;

//function getActivMonitor: Integer;

function getMaxDeskWidth: Integer;
function getMaxDeskHeight: Integer;

function getMinDeskWidth: Integer;
function getMinDeskHeight: Integer;

function getTaskBarRect: TRect;

function getTaskBarTop: Integer;
function getTaskBarLeft: Integer;
function getTaskBarHeight: Integer;
function getTaskBarWidth: Integer;

function getMinDeskHeightTB: Integer;

function getMonitorResWidth( aMon: Integer): Integer;
function getMonitorResHeight( aMon: Integer): Integer;

procedure setToCenter( aForm: TCustomForm; aMon: Integer = 1);

//passt die Dimensionen ( dim) eines Fensters auf den aktuellen Desktop an
procedure AlignForm(const aForm: TCustomForm; var dim: TRect; const doPerform: Boolean = TRUE);

//passt ein Form auf den Desktop an
procedure   FormToDesktop( const FormIn: TForm; dim: TRect; const WindowState: TWindowState = wsNormal); forward;


implementation

uses
  MAth;
//------------------------------------------------------------------------------
//--------------- Desktop ------------------------------------------------------
//------------------------------------------------------------------------------

function getMonitorCount: Integer;
begin
  result := Screen.MonitorCount;
end;

function getMaxDeskWidth: Integer;
begin
  result := Screen.DesktopWidth;
end;

function getMaxDeskHeight: Integer;
begin
  result := Screen.DesktopHeight;
end;

function getMinDeskWidth: Integer;
var
  iMon: Integer;
begin
  result := Screen.Width;
  for iMon := 0 to Screen.MonitorCount -1 do
    if ( Screen.Monitors[ iMon].Width < Result) then
      Result := Screen.Monitors[ iMon].Width;
end;

function getMinDeskHeight: Integer;
var
  iMon: Integer;
begin
  result := Screen.Height;
  for iMon := 0 to Screen.MonitorCount -1 do
    if ( Screen.Monitors[ iMon].Height < result) then
      result := Screen.Monitors[ iMon].Height;
end;
//------------------------------------------------------------------------------
//--------------- Desktop ------------------------------------------------------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//--------------- Taskbar ------------------------------------------------------
//------------------------------------------------------------------------------
function getTaskBarRect: TRect;
var
  H: HWnd;
begin
  H:= FindWindow('Shell_TrayWnd', nil);
  if H<>0 then
  begin
    GetWindowRect(H, Result);
  end;
end;

function getTaskBarTop: Integer;
begin
  Result := getTaskBarRect.Top;
end;

function getTaskBarLeft: Integer;
begin
  Result := getTaskBarRect.Left;
end;

function getTaskBarHeight: Integer;
var
  rect : TRect;
begin
  rect := getTaskBarRect;
  with rect do begin
    if ( Bottom >= Top)
      then Result := rect.Bottom - rect.Top
      else Result := rect.Top - rect.Bottom;
  end;
end;

function getTaskBarWidth: Integer;
var
  rect : TRect;
begin
  rect := getTaskBarRect;
  with rect do begin
    if ( Right >= Left)
      then Result := rect.Right - rect.Left
      else Result := rect.Left - rect.Right;
  end;
end;

function getMinDeskHeightTB: Integer;
var
  minDesk, topTB: Integer;
begin
  minDesk := getMinDeskHeight;
  topTB := gettaskbartop;
  if ( topTB <= minDesk)
    then Result := topTB
    else result := minDesk;
end;

//------------------------------------------------------------------------------
//--------------- Taskbar ------------------------------------------------------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//--------------- Monitor ------------------------------------------------------
//------------------------------------------------------------------------------
function getMonitorResWidth( aMon: Integer): Integer;
var
  iMon: Integer;
begin
  if ( aMon = 0) then iMon := 1
                 else iMon := aMon;
  result := Screen.Width;
  if ( iMon <= getMonitorCount) then begin
    result := Screen.Monitors[ iMon -1].Width
  end;
end;

function getMonitorResHeight( aMon: Integer): Integer;
var
  iMon: Integer;
begin
  if ( aMon = 0) then iMon := 1
                 else iMon := aMon;
  result := Screen.Height;
  if ( iMon <= getMonitorCount) then begin
    result := Screen.Monitors[ iMon -1].Height;
  end;
end;

procedure setToCenter( aForm: TCustomForm; aMon: Integer = 1);
var
   Ind: Integer;
   Left: Integer;
begin
   if aForm <> nil then begin
      aMon := Max( Min( aMon, getMonitorCount), 1);
      Left := 0;
      for Ind := 1 to aMon - 1
      do Left := Left + getMonitorResWidth( Ind);
      aForm.Left := Left + ( ( getMonitorResWidth(  1) - aForm.Width) div 2);
      aForm.Top  := ( getMonitorResHeight( 1) - aForm.Height) div 2;
   end;
end;

//passt die Dimensionen ( dim) eines Fensters auf den aktuellen Desktop an
procedure AlignForm(const aForm: TCustomForm; var dim: TRect; const doPerform: Boolean = TRUE);
var
   r, tr, dr, mr, ir : TRect;
   i : Integer;
   fits : Boolean;

   procedure m2r(const m: TMonitor; var r: TRect);
   begin
     r.Left := m.Left;
     r.Top := m.Top;
     r.Right := m.Left + m.Width;
     r.Bottom := m.Top + m.Height;
   end;
   function AlignTo(const r: TRect): Boolean;
   begin
        //gehts ueberhaupt?
        result := ((dim.Right - dim.Left) <= (r.Right - r.Left))
          and ((dim.Bottom - dim.Top) <= (r.Bottom - r.Top));
        if result
        then begin
         //zuruechtruecken
         if dim.Left < r.Left
         then begin
           inc(dim.Right, r.Left - dim.Left);
           inc(dim.Left, r.Left - dim.Left);
         end else
         if dim.Right > r.Right
         then begin
           inc(dim.Left, r.Right - dim.Right);
           inc(dim.Right, r.Right - dim.Right);
         end;//if
         if dim.Top < r.Top
         then begin
           inc(dim.Bottom, r.Top - dim.Top);
           inc(dim.Top, r.Top - dim.Top);
         end else
         if dim.Bottom > r.Bottom
         then begin
           inc(dim.Top, r.Bottom - dim.Bottom);
           inc(dim.Bottom, r.Bottom - dim.Bottom);
         end;//if
        end;//if
   end;
begin
     tr := getTaskBarRect;
     fits := FALSE;
     i := 0;
     mr.Left := 0;
     mr.Right := 0;
     while not fits and (i < Screen.MonitorCount)
     do begin
       m2r(Screen.Monitors[i],r);
       //Taskbar rausrechnen

       //Taskbar liegt oben oder unten
       if (tr.Left = r.Left)
          and (tr.Right = r.Right)
       then begin
         //oben
         if (tr.Top <= r.Top)
            and (tr.Bottom > r.Top)
         then r.Top := tr.Bottom;
         //endif

         //unten
         if (tr.Bottom >= r.Bottom)
            and (tr.Top < r.Bottom)
         then r.Bottom := tr.Top;
         //endif
       end;//if

       //Taskbar liegt links oder rechts
       if (tr.Top = r.Top)
          and (tr.Bottom = r.Bottom)
       then begin
         //links
         if (tr.Left <= r.Left)
            and (tr.Right > r.Left)
         then r.Left := tr.Right;
         //endif

         //rechts
         if (tr.Right >= r.Right)
            and (tr.Left < r.Right)
         then r.Right := tr.Left;
         //endif
       end;//if

       //Desktop Dimensionen anpassen (nur fuer n Monitore nebeneinander)
       if i = 0
       then dr := r
       else begin
         dr.Left := Min(dr.Left, r.Left);
         dr.Bottom := Min(dr.Bottom, r.Bottom);

         dr.Top := Max(dr.Top, r.Top);
         dr.Right := Max(dr.Right, r.Right);
       end;//if

       //liegt das Fenster hier drin?
//       if not ((dim.left > r.Right)
//            or (dim.Right < r.Left)
//            or (dim.Top > r.Bottom)
//            or (dim.Bottom < r.Top))
       if IntersectRect(ir, dim, r)
       then begin
         // MonitorDimensionen anpassen auf denen das Form liegt(nur fuer n Monitore nebeneinander)
         if (mr.Left = 0) and (mr.Right = 0)
         then mr := r
         else begin
           //mr ist so gross wie alle Monitore zusammen auf denen das Form liegt 
           mr.Left := Min(mr.Left, r.Left);
           mr.Bottom := Min(mr.Bottom, r.Bottom);

           mr.Top := Max(mr.Top, r.Top);
           mr.Right := Max(mr.Right, r.Right);
         end;//if
       end;//if

       fits := (dim.Left >= mr.Left)
              and (dim.Right <= mr.Right)
              and (dim.Top >= mr.Top)
              and (dim.Bottom <= mr.Bottom);

       inc(i);
     end;//while

     if not fits
     then begin
       //passt das Fenster in die Monitordimensionen oder DesktopDimensionen?
       if not (AlignTo(mr) or AlignTo(dr))
       then begin
         //Verschieben nach links oben
         Offsetrect(dim, dr.Left - dim.Left, dr.Top - dim.Top);
//         dec(dim.Right, dim.Left - dr.Left);
//         dec(dim.Left, dim.Left - dr.Left);
//         dec(dim.Bottom, dim.Top - dr.Top);
//         dec(dim.Top, dim.Top - dr.Top);

         //verkleinern
         if dim.Right > dr.Right
         then dim.Right := dr.Right;
         //endif
         if dim.Bottom > dr.Bottom
         then dim.Bottom := dr.Bottom;
         //endif
       end;//if
     end;//if

     if doPerform and (aForm.WindowState = wsNormal )
     then SetWindowPos(aForm.Handle, 0, dim.Left, dim.Top, dim.Right-dim.Left, dim.Bottom-dim.Top, SWP_NOZORDER + SWP_NOACTIVATE);
     //then aForm.SetBounds(dim.Left, dim.Top, dim.Right-dim.Left, dim.Bottom-dim.Top);
     //endif
end;

procedure FormToDesktop( const FormIn: TForm; dim: TRect; const WindowState: TWindowState = wsNormal);
var
  WP : TWindowPlacement;
begin
   if (WindowState = wsNormal)
   then begin
     if (FormIn.WindowState <> wsNormal)
     then FormIn.WindowState := wsNormal;
     //endif
     uDeskSize.AlignForm(FormIn,dim);
   end else begin
     uDeskSize.AlignForm(FormIn,dim, FALSE);
     WP.Length := SizeOf(TWindowPlacement);
     GetWindowPlacement(FormIn.Handle, @WP);
     WP.showCmd := SW_SHOW;
     WP.rcNormalPosition := dim;
     SetWindowPlacement(FormIn.Handle, @WP);
     if FormIn.WindowState <> WindowState
     then FormIn.WindowState := WindowState;
     //endif
   end;//if
end;


end.
