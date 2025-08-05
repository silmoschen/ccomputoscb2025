program NominaPrecios;

uses
  Forms,
  NominaDePrecios in 'NominaDePrecios.pas' {fmListInsumos},
  tabladeprecios in 'tabladeprecios.pas' {fmInsumos},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CInsumos_Centrobioq in '..\..\CLASES\CInsumos_Centrobioq.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListInsumos, fmListInsumos);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
