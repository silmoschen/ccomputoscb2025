program ExportPAMI;

uses
  Forms,
  ExportarDatosOSPami in 'ExportarDatosOSPami.pas' {fmSoporteMagPAMI},
  CSoporteMagneticoPAMI in '..\..\CLASES\CSoporteMagneticoPAMI.pas',
  backup in '..\..\Varios\Backup\backup.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  LZRW1KH in '..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia},
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmSoporteMagPAMI, fmSoporteMagPAMI);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmPreparacionVia, fmPreparacionVia);
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  Application.Run;
end.
