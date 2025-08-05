program NominaDebitosCreditos;

uses
  Forms,
  NominaDebCred in 'NominaDebCred.pas' {fmListDebCred},
  TablaDebitosCreditos in 'TablaDebitosCreditos.pas' {fmTablaDebCred},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CDebitosCreditosCentroBioq in '..\..\CLASES\CDebitosCreditosCentroBioq.pas',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList},
  CCategoriasCCB in '..\..\CLASES\CCategoriasCCB.pas',
  NominaDeCategoriasLab in 'NominaDeCategoriasLab.pas' {fmListCategoriasLab},
  EleccionProfesionales in 'EleccionProfesionales.pas' {fmEleProfesional},
  EleccionMeses in 'EleccionMeses.pas' {fmEleMeses},
  NominaDeProfesionalesLiquidacionOS in 'NominaDeProfesionalesLiquidacionOS.pas' {fmListProfesionalesLiq},
  CBDT in '..\..\CLASES\CBDT.pas',
  backup in '..\..\Varios\Backup\backup.pas',
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  MsgEditor in '..\..\INTERNET\MailClient\MsgEditor.pas' {frmMessageEditor},
  MsgEdtAdv in '..\..\INTERNET\MailClient\MsgEdtAdv.pas' {frmAdvancedOptions},
  Main in '..\..\INTERNET\MailClient\Main.pas' {frmMain},
  Setup in '..\..\INTERNET\MailClient\Setup.pas' {fmSetup},
  smtpauth in '..\..\INTERNET\MailClient\smtpauth.pas' {frmSMTPAuthentication},
  FichaProfesional in 'FichaProfesional.pas' {fmFichaProfesional},
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListDebCred, fmListDebCred);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfrmMessageEditor, frmMessageEditor);
  Application.CreateForm(TfrmAdvancedOptions, frmAdvancedOptions);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfmSetup, fmSetup);
  Application.CreateForm(TfrmSMTPAuthentication, frmSMTPAuthentication);
  Application.CreateForm(TfmFichaProfesional, fmFichaProfesional);
  Application.CreateForm(TfmPreparacionVia, fmPreparacionVia);
  Application.Run;
end.
