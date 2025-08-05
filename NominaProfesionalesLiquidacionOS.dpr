program NominaProfesionalesLiquidacionOS;

uses
  Forms,
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  NominaDeProfesionalesLiquidacionOS in 'NominaDeProfesionalesLiquidacionOS.pas' {fmListProfesionales},
  FichaProfesionalLiquidacionOS in 'FichaProfesionalLiquidacionOS.pas' {fmFichaProfesional},
  CProfesionalLiqOS in '..\..\CLASES\CProfesionalLiqOS.pas',
  CCategoriasCCB in '..\..\CLASES\CCategoriasCCB.pas',
  NominaDeCategorias in 'NominaDeCategorias.pas' {fmListCategorias};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmFichaProfesional, fmFichaProfesional);
  Application.CreateForm(TfmListCategorias, fmListCategorias);
  Application.Run;
end.
