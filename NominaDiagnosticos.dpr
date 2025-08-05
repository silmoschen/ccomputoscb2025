program NominaDiagnosticos;

uses
  Forms,
  NominaDeDiagnosticos in 'NominaDeDiagnosticos.pas' {fmListDiagmosticos},
  tabladediagnosticos in 'tabladediagnosticos.pas' {fmTablaDiagnosticos},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListDiagmosticos, fmListDiagmosticos);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
