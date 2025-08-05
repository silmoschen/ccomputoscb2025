program NominaObSociales;

uses
  Forms,
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  obrasocial in 'obrasocial.pas' {fmObsociales},
  CObrasSocialesCCB in '..\..\CLASES\CObrasSocialesCCB.pas',
  CCategoriasCCB in '..\..\CLASES\CCategoriasCCB.pas',
  NominaNomeclador in '..\laborafabrissin\NominaNomeclador.pas' {fmListNomeclador},
  NomecladorAn in '..\laborafabrissin\NomecladorAn.pas' {fmNomeclador},
  CNomecla in '..\..\CLASES\CNomecla.pas',
  CUtiles in '..\..\CLASES\CUtiles.pas',
  MontosFacturados in 'MontosFacturados.pas' {fmMontosFacturados},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmMontosFacturados, fmMontosFacturados);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.Run;
end.
