program NominaRetenciones;

uses
  Forms,
  NominaRet in 'NominaRet.pas' {fmListRetenciones},
  TablaRetenciones in 'TablaRetenciones.pas' {fmTablaRetenciones},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CRetencionesCentroBioq in '..\..\CLASES\CRetencionesCentroBioq.pas',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListRetenciones, fmListRetenciones);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TscrList, scrList);
  Application.Run;
end.
