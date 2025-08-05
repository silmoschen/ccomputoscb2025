program FactManual;



uses
  Forms,
  FacturacionManual in 'FacturacionManual.pas' {fmFactManual},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CProfesionalCCB in '..\..\CLASES\CProfesionalCCB.pas',
  CObrasSocialesCCB in '..\..\CLASES\CObrasSocialesCCB.pas',
  CPacienteCCB in '..\..\CLASES\CPacienteCCB.pas',
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales},
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  NominaPacientes in 'NominaPacientes.pas' {fmListPacientes},
  CFacturacionCCB in '..\..\CLASES\CFacturacionCCB.pas',
  FichaProfesional in 'FichaProfesional.pas' {fmFichaProfesional},
  FichaPaciente in 'FichaPaciente.pas' {fmFichaPacientes},
  CIDBFM in '..\..\CLASES\CIDBFM.pas',
  Disposit in '..\..\Interfases\Disposit.pas' {Dispositivo},
  CListar in '..\..\CLASES\CListar.pas',
  CSolAnalisis in '..\..\CLASES\CSolAnalisis.pas',
  CObrasSociales in '..\..\CLASES\CObrasSociales.pas',
  CNomeclaCCB in '..\..\CLASES\CNomeclaCCB.pas',
  CUtiles in '..\..\CLASES\CUtiles.pas',
  EleccionFactura in '..\..\Interfases\EleccionFactura.pas' {fmEleccionFactura},
  DepurarInformacion in 'DepurarInformacion.pas' {fmDepurarInformacion},
  EleccionObrasSociales in '..\laborafabrissin\EleccionObrasSociales.pas' {fmEleObraSociales},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  CUtilidadesDiscos in '..\..\CLASES\CUtilidadesDiscos.pas' {TTUtilidadesDiscos},
  datosiniciosistema in '..\..\Interfases\datosiniciosistema.pas' {fmDatosSistema},
  NominaNomeclador in 'NominaNomeclador.pas' {fmListNomeclador},
  NomecladorAn in '..\laborafabrissin\NomecladorAn.pas' {fmNomeclador},
  SmtpProt in '..\..\INTERNET\smtp\DELPHI\VC32\SMTPPROT.PAS',
  WSocket in '..\..\INTERNET\smtp\DELPHI\VC32\WSOCKET.PAS',
  WSockbuf in '..\..\INTERNET\smtp\DELPHI\VC32\WSOCKBUF.PAS',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmFactManual, fmFactManual);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TscrList, scrList);
  Application.Run;
end.
