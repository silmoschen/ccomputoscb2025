program Venta_Insumos;

uses
  Forms,
  VentasInsumos in 'VentasInsumos.pas' {fmVentasInsumos},
  ImgForms in 'ImgForms.pas' {contenedorImg},
  CCVentas_CCB in '..\..\CLASES\CCVentas_CCB.pas',
  CInsumos_Centrobioq in '..\..\CLASES\CInsumos_Centrobioq.pas',
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia},
  backup in '..\..\Varios\Backup\backup.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  LZRW1KH in '..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales},
  MsgEdtAdv in '..\..\INTRANET\EMail\MsgEdtAdv.pas' {frmAdvancedOptions},
  smtpauth in '..\..\INTRANET\EMail\smtpauth.pas' {frmSMTPAuthentication},
  Setup in '..\..\INTRANET\EMail\Setup.pas' {fmSetup},
  MsgEditor in 'MsgEditor.pas' {fmMessageEditor},
  Main in '..\..\INTRANET\EMail\Main.pas' {frmMain},
  FormAuto in '..\..\INTERNET\rasdial\DELPHI\RAS\Formauto.pas' {AutoForm},
  Formpos in '..\..\INTERNET\rasdial\DELPHI\RAS\FormPos.pas',
  VERLOGS in '..\..\INTERNET\rasdial\DELPHI\RAS\VERLOGS.pas' {fmConsultar},
  Llamar in '..\..\INTERNET\rasdial\DELPHI\RAS\Llamar.pas' {Form1},
  Logmsg in '..\..\INTERNET\rasdial\DELPHI\RAS\LogMsg.pas',
  Ras in '..\..\INTERNET\rasdial\DELPHI\RAS\RAS.PAS',
  RasDial1 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial1.pas' {RasDialerForm},
  RasDial2 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial2.pas' {AboutForm},
  RasDial3 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial3.pas' {ConfigureAutoForm},
  RasDial4 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial4.pas' {TimeAutoForm},
  RasDial5 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial5.pas' {TimePasswordAutoForm},
  NominaDePrecios in 'NominaDePrecios.pas' {fmListInsumos},
  BuscarOrdenesVentaInsumos in 'BuscarOrdenesVentaInsumos.pas' {fmBuscarOrdenesInsumos},
  MontosProfesionales in 'MontosProfesionales.pas' {fmMontosProfesional},
  CLiquidacionObrasSocCCB in '..\..\CLASES\CLiquidacionObrasSocCCB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmVentasInsumos, fmVentasInsumos);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmListInsumos, fmListInsumos);
  Application.CreateForm(TfmBuscarOrdenesInsumos, fmBuscarOrdenesInsumos);
  Application.CreateForm(TfmMontosProfesional, fmMontosProfesional);
  Application.Run;
end.
