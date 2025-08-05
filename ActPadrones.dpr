program ActPadrones;

uses
  Forms,
  ActualizarPadrones in 'ActualizarPadrones.pas' {frmActualizarPadrones},
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  backup in '..\..\Varios\Backup\backup.pas',
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmActualizarPadrones, frmActualizarPadrones);
  Application.Run;
end.
