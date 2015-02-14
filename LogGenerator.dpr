program LogGenerator;

uses
  Vcl.Forms,
  fLogGenerator in 'fLogGenerator.pas' {frmLogGenerator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogGenerator, frmLogGenerator);
  Application.Run;
end.
