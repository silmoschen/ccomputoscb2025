program NominaDiagnosticosOMS;

uses
  Forms,
  NominaDeDiagnosticosOMS in 'NominaDeDiagnosticosOMS.pas' {fmListDiagnosticosOMS},
  tabladediagnosticosOMS in 'tabladediagnosticosOMS.pas' {fmTablaDiagnosticosOMS},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  backup in '..\..\Varios\Backup\backup.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  LZRW1KH in '..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListDiagnosticosOMS, fmListDiagnosticosOMS);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.Run;
end.
