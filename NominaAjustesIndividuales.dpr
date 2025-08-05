program NominaAjustesIndividuales;

uses
  Forms,
  NominaAjustesIndiv in 'NominaAjustesIndiv.pas' {fmAjustesIndividuales},
  TablaAjustesIndividuales in 'TablaAjustesIndividuales.pas' {fmTablaAjustesIndiv},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CAjustesIndivCentroBioq in '..\..\CLASES\CAjustesIndivCentroBioq.pas',
  scrReporte in '..\..\Interfases\scrReporte.pas' {scrList};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmAjustesIndividuales, fmAjustesIndividuales);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TscrList, scrList);
  Application.Run;
end.
