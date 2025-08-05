program NominaPdronOSD6;

uses
  Forms,
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CObrasSocialesCCB in '..\..\CLASES\CObrasSocialesCCB.pas',
  CCategoriasCCB in '..\..\CLASES\CCategoriasCCB.pas',
  CNomecla in '..\..\CLASES\CNomecla.pas',
  CUtiles in '..\..\CLASES\CUtiles.pas',
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Afiliados in 'Afiliados.pas' {fmAfiliados},
  CUtilidadesStringGrid in '..\..\CLASES\CUtilidadesStringGrid.pas',
  NominaAfiliado in 'NominaAfiliado.pas' {fmListAfiliados},
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia},
  backup in '..\..\Varios\Backup\backup.pas',
  Lzrw1kh in '..\..\Varios\Backup\Lzrw1kh.pas',
  NominaPadronObrasSociales in 'NominaPadronObrasSociales.pas' {fmListPadronObrasSociales},
  Formauto in '..\..\INTERNET\rasdial\DELPHI\RAS\Formauto.pas' {AutoForm},
  FormPos in '..\..\INTERNET\rasdial\DELPHI\RAS\FormPos.pas',
  Llamar in '..\..\INTERNET\rasdial\DELPHI\RAS\Llamar.pas' {Form1},
  LogMsg in '..\..\INTERNET\rasdial\DELPHI\RAS\LogMsg.pas',
  RAS in '..\..\INTERNET\rasdial\DELPHI\RAS\RAS.PAS',
  RasDial1 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial1.pas' {RasDialerForm},
  RasDial2 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial2.pas',
  RasDial3 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial3.pas',
  RasDial4 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial4.pas',
  RasDial5 in '..\..\INTERNET\rasdial\DELPHI\RAS\RasDial5.pas',
  VERLOGS in '..\..\INTERNET\rasdial\DELPHI\RAS\VERLOGS.pas' {fmConsultar},
  MsgEdtAdv in '..\..\Delphi2007_Migraciones\EMail\MsgEdtAdv.pas' {frmAdvancedOptions},
  MsgEditor in 'MsgEditor.pas' {fmMessageEditor},
  smtpauth in '..\..\INTRANET\EMail\smtpauth.pas' {frmSMTPAuthentication},
  Main in '..\..\INTRANET\EMail\Main.pas' {frmMain},
  Setup in '..\..\INTRANET\EMail\Setup.pas' {fmSetup},
  CServers2000_Excel in '..\..\CLASES\CServers2000_Excel.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListPadronObrasSociales, fmListPadronObrasSociales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmPreparacionVia, fmPreparacionVia);
  Application.CreateForm(TfmListPadronObrasSociales, fmListPadronObrasSociales);
  Application.CreateForm(TfrmAdvancedOptions, frmAdvancedOptions);
  Application.CreateForm(TRasDialerForm, RasDialerForm);
  Application.CreateForm(TfmConsultar, fmConsultar);
  Application.CreateForm(TAutoForm, AutoForm);
  Application.CreateForm(TAutoForm, AutoForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TRasDialerForm, RasDialerForm);
  Application.CreateForm(TfmConsultar, fmConsultar);
  Application.CreateForm(TfrmAdvancedOptions, frmAdvancedOptions);
  Application.CreateForm(TfmMessageEditor, fmMessageEditor);
  Application.CreateForm(TfmMessageEditor, fmMessageEditor);
  Application.CreateForm(TfrmSMTPAuthentication, frmSMTPAuthentication);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfmSetup, fmSetup);
  Application.Run;
end.
