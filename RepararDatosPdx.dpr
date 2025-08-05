program RepararDatosPdx;

uses
  Forms,
  RepararDatosParadox in 'RepararDatosParadox.pas' {fmRepararDatosPdx},
  Main in '..\..\Varios\repara_paradox\32BIT\MAIN.PAS' {MainForm},
  px3pImp in '..\..\Varios\repara_paradox\32BIT\PX3PIMP.PAS',
  TUtil32 in '..\..\Varios\repara_paradox\32BIT\TUTIL32.PAS',
  DirDlg in '..\..\Varios\repara_paradox\32BIT\DIRDLG.PAS',
  RKSIni in '..\..\Varios\repara_paradox\RKSINI.PAS',
  LowStuff in '..\..\Varios\repara_paradox\LOWSTUFF.PAS',
  Pswd in '..\..\Varios\repara_paradox\PSWD.PAS' {FormPswd},
  PxHeader in '..\..\Varios\repara_paradox\PXHEADER.PAS',
  Rbld1 in '..\..\Varios\repara_paradox\RBLD1.PAS',
  Translat in '..\..\Varios\repara_paradox\INTERNAT\TRANSLAT.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmRepararDatosPdx, fmRepararDatosPdx);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
