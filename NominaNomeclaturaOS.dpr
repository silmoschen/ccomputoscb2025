program NominaNomeclaturaOS;

uses
  Forms,
  NominaNomeclaturaObrasSociales in 'NominaNomeclaturaObrasSociales.pas' {fmListNomeclaturaObrasSociales},
  FichaNomecladorOS in 'FichaNomecladorOS.pas' {fmFichaNomeclaturaOS},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CPacienteCCB in '..\..\CLASES\CPacienteCCB.pas',
  CIDBFM in '..\..\CLASES\CIDBFM.pas',
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales},
  CProfesionalCCB in '..\..\CLASES\CProfesionalCCB.pas',
  CNomeclatura_ObraSocial in '..\..\CLASES\CNomeclatura_ObraSocial.pas',
  NominaNomeclador in 'NominaNomeclador.pas' {fmListNomeclador},
  PreparacionViaTrabajo in '..\..\SME\IVA\PreparacionViaTrabajo.pas' {fmPreparacionVia},
  backup in '..\..\Varios\Backup\backup.pas',
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  LZRW1KH in '..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  obrasocial in 'obrasocial.pas' {fmObsociales},
  NomecladorAn in 'NomecladorAn.pas' {fmNomeclador},
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  NominaObrasSociales1 in 'NominaObrasSociales1.pas' {fmListPadronObrasSociales};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListNomeclaturaObrasSociales, fmListNomeclaturaObrasSociales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  Application.CreateForm(TfmListNomeclador, fmListNomeclador);
  Application.CreateForm(TfmPreparacionVia, fmPreparacionVia);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmObsociales, fmObsociales);
  Application.CreateForm(TfmNomeclador, fmNomeclador);
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  Application.CreateForm(TfmListPadronObrasSociales, fmListPadronObrasSociales);
  Application.Run;
end.
