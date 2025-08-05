program NominaMedicos;

uses
  Forms,
  NominaDeMedicos in 'NominaDeMedicos.pas' {fmListMedicos},
  tablademedicoss in 'tablademedicoss.pas' {fmTablaMedicos},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListMedicos, fmListMedicos);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
