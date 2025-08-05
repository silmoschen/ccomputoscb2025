program NominaAfiliados;

uses
  Forms,
  NominaAfiliado in 'NominaAfiliado.pas' {fmListAfiliados},
  FichaAfiliados in 'FichaAfiliados.pas' {fmFichaAfiliados},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CRetencionesCentroBioq in '..\..\CLASES\CRetencionesCentroBioq.pas',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListAfiliados, fmListAfiliados);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TscrList, scrList);
  Application.Run;
end.
