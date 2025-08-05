program NominaCategorias;

uses
  Forms,
  NominaDeCategorias in 'NominaDeCategorias.pas' {fmListCategorias},
  tabladecategorias in 'tabladecategorias.pas' {fmTablaCategorias},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListCategorias, fmListCategorias);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
