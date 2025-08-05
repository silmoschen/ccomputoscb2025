program consultarordenes;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  ConsultasAuditoriaCGI in 'ConsultasAuditoriaCGI.pas' {WM: TWebModule},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  backup in '..\..\Varios\Backup\backup.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  LZRW1KH in '..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWM, WM);
  Application.Run;
end.
