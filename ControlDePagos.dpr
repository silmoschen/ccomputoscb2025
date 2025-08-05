program ControlDePagos;

uses
  Forms,
  ControlPagosObrasSociales in 'ControlPagosObrasSociales.pas' {frmControlPagos},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CCtaCteObrasSocialesCCB in '..\..\CLASES\CCtaCteObrasSocialesCCB.pas',
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  NominaDeBancos in 'NominaDeBancos.pas' {fmListBancos},
  EleccionObrasSociales in 'EleccionObrasSociales.pas' {fmEleObraSociales},
  Disposit in '..\..\Interfases\Disposit.pas' {Dispositivo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmControlPagos, frmControlPagos);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfmListBancos, fmListBancos);
  Application.CreateForm(TfmEleObraSociales, fmEleObraSociales);
  Application.CreateForm(TDispositivo, Dispositivo);
  Application.Run;
end.
