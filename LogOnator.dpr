program LogOnator;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {FrmMain},
  uStats in 'uStats.pas',
  uDeskSize in 'uDeskSize.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
