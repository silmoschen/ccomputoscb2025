program NominaProfesionales;

uses
  Forms,
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales},
  CProfesionalCCB in '..\..\CLASES\CProfesionalCCB.pas',
  CCategoriasCCB in '..\..\CLASES\CCategoriasCCB.pas',
  NominaDeCategorias in 'NominaDeCategorias.pas' {fmListCategorias},
  FichaProfesionalLiquidacionOS in 'FichaProfesionalLiquidacionOS.pas' {fmFichaProfesionalCCB};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmListCategorias, fmListCategorias);
  Application.CreateForm(TfmFichaProfesionalCCB, fmFichaProfesionalCCB);
  Application.Run;
end.
