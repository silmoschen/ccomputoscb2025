program AuditoriaCentroBioq;

uses
  Forms,
  DatosAuditoria in 'DatosAuditoria.pas' {fmAuditoria},
  ImgForms in '..\consorcio\ImgForms.pas' {contenedorImg},
  CAuditoriaCCB in '..\..\CLASES\CAuditoriaCCB.pas',
  NominaObrasSociales in 'NominaObrasSociales.pas' {fmListObrasSociales},
  NominaDeZonas in 'NominaDeZonas.pas' {fmListZonas},
  CPadronOSCCB in '..\..\CLASES\CPadronOSCCB.pas',
  NominaDeMedicos in 'NominaDeMedicos.pas' {fmListMedicos},
  NomecladorAn in 'NomecladorAn.pas' {fmNomeclador},
  NominaNomeclador in 'NominaNomeclador.pas' {fmListNomeclador},
  Disposit in '..\..\Interfases\Disposit.pas' {Dispositivo},
  obrasocial in 'obrasocial.pas' {fmObsociales},
  BuscarAuditorias in 'BuscarAuditorias.pas' {frmBuscarAuditoria},
  NominaAfiliado in 'NominaAfiliado.pas' {fmListAfiliados},
  EleccionObrasSociales in 'EleccionObrasSociales.pas' {fmEleObraSociales},
  Unit1 in '..\..\Varios\Backup\Unit1.pas' {fmBackup},
  comodines in '..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Selectarchivos in '..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmAuditoria, fmAuditoria);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.Run;
end.
