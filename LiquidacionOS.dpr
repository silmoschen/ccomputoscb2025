program LiquidacionOS;

uses
  Forms,
  LiquidacionObrasSoc in 'LiquidacionObrasSoc.pas' {fmLiquidacionOS},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  CLiquidacionObrasSocCCB in '..\..\CLASES\CLiquidacionObrasSocCCB.pas',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList},
  CFacturacionCCB in '..\..\CLASES\CFacturacionCCB.pas',
  Unit1 in '..\..\Varios\Backup\Unit1.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  NominaAjustesIndiv in 'NominaAjustesIndiv.pas' {fmAjustesIndividuales},
  TablaAjustesIndividuales in 'TablaAjustesIndividuales.pas' {fmTablaAjustesIndiv},
  NominaRet in 'NominaRet.pas' {fmListRetenciones},
  CRetencionesCentroBioq in '..\..\CLASES\CRetencionesCentroBioq.pas',
  NominaDeProfesionalesLiquidacionOS in 'NominaDeProfesionalesLiquidacionOS.pas' {fmListProfesionalesLiq},
  IngresoOperaciones in 'IngresoOperaciones.pas' {fmIngreso},
  CUtiles in '..\..\CLASES\CUtiles.pas',
  MontosProfesionales in 'MontosProfesionales.pas' {fmMontosProfesional},
  FichaProfesionalLiquidacionOS in 'FichaProfesionalLiquidacionOS.pas' {fmFichaProfesional},
  EleccionProfesionales in 'EleccionProfesionales.pas' {fmEleProfesional},
  Disposit in '..\..\Interfases\Disposit.pas' {Dispositivo},
  CListar in '..\..\CLASES\CListar.pas',
  Main in '..\..\INTERNET\MailClient\Main.pas' {frmMain},
  MsgEdtAdv in '..\..\INTERNET\MailClient\MsgEdtAdv.pas' {frmAdvancedOptions},
  Setup in '..\..\INTERNET\MailClient\Setup.pas' {fmSetup},
  smtpauth in '..\..\INTERNET\MailClient\smtpauth.pas' {frmSMTPAuthentication},
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia},
  CUsuario in '..\..\CLASES\CUsuario.pas',
  MsgEditor in 'MsgEditor.pas' {fmMessageEditor},
  VERLOGS in '..\..\INTERNET\rasdial\DELPHI\RAS\VERLOGS.pas' {fmConsultar},
  FormAuto in '..\..\INTERNET\rasdial\DELPHI\RAS\Formauto.pas' {AutoForm},
  Formpos in '..\..\INTERNET\rasdial\DELPHI\RAS\FormPos.pas',
  Llamar in '..\..\INTERNET\rasdial\DELPHI\RAS\Llamar.pas' {Form1},
  Logmsg in '..\..\INTERNET\rasdial\DELPHI\RAS\LogMsg.pas',
  Ras in '..\..\INTERNET\rasdial\DELPHI\RAS\RAS.PAS',
  RasDial1 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial1.pas' {RasDialerForm},
  RasDial2 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial2.pas' {AboutForm},
  RasDial3 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial3.pas' {ConfigureAutoForm},
  RasDial4 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial4.pas' {TimeAutoForm},
  RasDial5 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial5.pas' {TimePasswordAutoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmLiquidacionOS, fmLiquidacionOS);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
