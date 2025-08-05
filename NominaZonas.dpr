program NominaZonas;

uses
  Forms,
  NominaDeZonas in 'NominaDeZonas.pas' {fmListZonas},
  tabladezonas in 'tabladezonas.pas' {fmTablaZonas},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListZonas, fmListZonas);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
