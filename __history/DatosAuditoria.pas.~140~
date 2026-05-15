unit DatosAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, ToolWin, StdCtrls, Mask, ExtCtrls,
  Grids, DBTables, DB, Editv, Printers, IdIntercept, IdLogBase, IdLogDebug,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze, Contnrs,

  {$IFDEF VER185}
  Buttons, IdFTPCommon, IdExplicitTLSClientServerBase;
  {$ENDIF}
  {$IFDEF VER140}
  Buttons;
  {$ENDIF}

type
  TfmAuditoria = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    codautorizado: TMaskEdit;
    BuscarCodigosAutorizados: TBitBtn;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Label15: TLabel;
    Panel10: TPanel;
    Panel13: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    nprofesional: TMaskEdit;
    BuscarMedico: TBitBtn;
    fechaderivacion: TMaskEdit;
    nroderivacion: TMaskEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    ultimoNro: TMaskEdit;
    detaceptada: TLabel;
    DTS: TDataSource;
    Panel12: TPanel;
    Panel16: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    btnCerrar: TButton;
    GroupBox2: TGroupBox;
    desdeNro: TMaskEdit;
    hastaNro: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    desdeFecha: TMaskEdit;
    Label29: TLabel;
    hastaFecha: TMaskEdit;
    GroupBox3: TGroupBox;
    Entidad: TMaskEdit;
    Label30: TLabel;
    Label31: TLabel;
    LineasDet: TEditValid;
    Etiquetas: TEditValid;
    btnDispositivo: TBitBtn;
    btnEmitir: TBitBtn;
    btnAplicar: TButton;
    Label33: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    retomarImpr: TEditValid;
    CheckBox1: TCheckBox;
    Label32: TLabel;
    Label40: TLabel;
    lineasSep: TEditValid;
    Splitter2: TSplitter;
    Label41: TLabel;
    Label42: TLabel;
    df: TMaskEdit;
    Label43: TLabel;
    hf: TMaskEdit;
    Panel7: TPanel;
    detrechazada: TLabel;
    codrechazado: TMaskEdit;
    BuscarCodigosRechazados: TBitBtn;
    Panel17: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    Panel18: TPanel;
    Label44: TLabel;
    fuente_barra: TMaskEdit;
    Panel19: TPanel;
    btnReanudar: TSpeedButton;
    Panel21: TPanel;
    CR: TStringGrid;
    Label45: TLabel;
    scrollhc: TMaskEdit;
    HistoriaClinica: TStringGrid;
    Panel20: TPanel;
    CA: TStringGrid;
    Label47: TLabel;
    Label18: TLabel;
    Label50: TLabel;
    Panel29: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    nos: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    UB: TLabel;
    Label14: TLabel;
    UG: TLabel;
    codos: TMaskEdit;
    BuscarObraSocial: TBitBtn;
    nrodoc: TMaskEdit;
    nombre: TMaskEdit;
    iddiag: TMaskEdit;
    btnBuscarAfiliado: TBitBtn;
    Panel22: TPanel;
    btnRegistrar: TButton;
    Panel11: TPanel;
    Panel30: TPanel;
    totreceta: TLabel;
    tope: TLabel;
    Label24: TLabel;
    Label36: TLabel;
    Panel32: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    nroauditoria: TMaskEdit;
    Label1: TLabel;
    Label21: TLabel;
    fecha: TMaskEdit;
    Panel31: TPanel;
    Label23: TLabel;
    Label25: TLabel;
    totmes: TLabel;
    disponible: TLabel;
    Panel33: TPanel;
    Label4: TLabel;
    dzona: TLabel;
    idzona: TMaskEdit;
    BuscarZona: TBitBtn;
    Panel34: TPanel;
    btnCancelar: TButton;
    GroupBox5: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    na: TMaskEdit;
    Label53: TLabel;
    lab: TLabel;
    Label54: TLabel;
    dl: TLabel;
    btnAnular: TButton;
    TabSheet4: TTabSheet;
    Panel35: TPanel;
    Panel36: TPanel;
    Label55: TLabel;
    fechaLog: TMaskEdit;
    btnConsultarLog: TButton;
    CheckBox2: TCheckBox;
    Panel38: TPanel;
    btnRestaurar: TButton;
    Panel37: TPanel;
    Panel39: TPanel;
    Label56: TLabel;
    Label57: TLabel;
    dNro: TMaskEdit;
    Label58: TLabel;
    Label59: TLabel;
    hNro: TMaskEdit;
    Panel40: TPanel;
    btnIniciar: TButton;
    Logs: TRichEdit;
    GroupBox6: TGroupBox;
    Label60: TLabel;
    fadesde: TMaskEdit;
    Label61: TLabel;
    fahasta: TMaskEdit;
    btnEleccionObsocial: TButton;
    Label62: TLabel;
    Label63: TLabel;
    lineasSepPag: TEditValid;
    Label64: TLabel;
    Label65: TLabel;
    lineaSepOrdenesTxt: TEditValid;
    Label66: TLabel;
    Label67: TLabel;
    EtiqPag: TEditValid;
    listNro: TRadioButton;
    listFecha: TRadioButton;
    retomar: TRadioButton;
    imprimir: TCheckBox;
    ordenesfac: TRadioButton;
    infauditoria: TCheckBox;
    InfDetAutorizadas: TRadioButton;
    InfDetRechazadas: TRadioButton;
    infTabularOS: TRadioButton;
    infTabularInd: TRadioButton;
    impresionModoTexto: TCheckBox;
    activarSalto: TCheckBox;
    desactivarCod: TCheckBox;
    ingresos: TCheckBox;
    CheckBox3: TCheckBox;
    registrarDerivacion: TCheckBox;
    btnFax: TBitBtn;
    fax: TComboBox;
    Label71: TLabel;
    imprOrdenes: TComboBox;
    Label22: TLabel;
    btnGuardar: TButton;
    Label46: TLabel;
    Label48: TLabel;
    altoPag: TEditValid;
    TabSheet5: TTabSheet;
    Panel23: TPanel;
    GroupBox7: TGroupBox;
    Label49: TLabel;
    Label72: TLabel;
    unos: TLabel;
    ucodos: TMaskEdit;
    uBuscarOS: TBitBtn;
    Label74: TLabel;
    Label75: TLabel;
    uNrodoc: TMaskEdit;
    uBuscarAfiliado: TBitBtn;
    unombre: TLabel;
    consultarHC: TButton;
    exportarExcel: TBitBtn;
    CheckBox5: TCheckBox;
    Label76: TLabel;
    Label78: TLabel;
    codosfact: TMaskEdit;
    btnBuscarOSFact: TBitBtn;
    osf: TLabel;
    infEstMedico: TRadioButton;
    obs: TLabel;
    Label83: TLabel;
    Label86: TLabel;
    fepedido: TMaskEdit;
    Panel43: TPanel;
    Label17: TLabel;
    observacion: TMaskEdit;
    nn1: TLabel;
    nn2: TLabel;
    btnBuscarDiagnostico: TBitBtn;
    Label89: TLabel;
    obsdiagnostico: TMaskEdit;
    Label90: TLabel;
    profcab: TMaskEdit;
    btnBuscarMedicoCabecera: TBitBtn;
    Label91: TLabel;
    ddiag: TLabel;
    GroupBox4: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    oss: TLabel;
    Label37: TLabel;
    btnBorrarTope: TSpeedButton;
    tot_m: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    UB1: TLabel;
    Label77: TLabel;
    UG1: TLabel;
    codos1: TMaskEdit;
    btnBuscarOS: TBitBtn;
    monto: TEditValid;
    btnRecalcularTM: TButton;
    fecha_rec: TMaskEdit;
    recalcularMontos: TCheckBox;
    Label101: TLabel;
    CheckBox4: TCheckBox;
    obsfinal: TLabel;
    TabSheet7: TTabSheet;
    Panel47: TPanel;
    GroupBox9: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    nosobs: TLabel;
    Label105: TLabel;
    codosobs: TMaskEdit;
    BuscarOSObs: TBitBtn;
    observacionfinal: TMaskEdit;
    CheckBox8: TCheckBox;
    tablaOMS: TCheckBox;
    GroupBox10: TGroupBox;
    Label104: TLabel;
    fechatrans: TMaskEdit;
    btnGenerarRegistros: TButton;
    btnTransferirInternet: TButton;
    CheckBox9: TCheckBox;
    btnExportarTablasMaestras: TButton;
    Label106: TLabel;
    GroupBox11: TGroupBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    ftphost: TMaskEdit;
    usuario: TMaskEdit;
    contrasenia: TMaskEdit;
    dirftp: TMaskEdit;
    conexiondirecta: TCheckBox;
    btnAplicarConexion: TButton;
    IdFTP1: TIdFTP;
    IdLogDebug1: TIdLogDebug;
    theURL: TMaskEdit;
    Label111: TLabel;
    Label112: TLabel;
    btnFinalizar: TButton;
    GroupBox8: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    desdeNroAjuste: TMaskEdit;
    hastaNroAjuste: TMaskEdit;
    fechaAjuste: TMaskEdit;
    btnAplicarAjuste: TButton;
    btnAplicarCambiosGenerales: TButton;
    idprof: TLabel;
    GroupBox12: TGroupBox;
    btnSeleccionOS: TButton;
    btnOrdenOnLine: TSpeedButton;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nroauditoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarObraSocialClick(Sender: TObject);
    procedure BuscarZonaClick(Sender: TObject);
    procedure idzonaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrodocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarMedicoClick(Sender: TObject);
    procedure nprofesionalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure iddiagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechaderivacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SalirClick(Sender: TObject);
    procedure nroderivacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarCodigosAutorizadosClick(Sender: TObject);
    procedure BuscarCodigosRechazadosClick(Sender: TObject);
    procedure codautorizadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codrechazadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRegistrarClick(Sender: TObject);
    procedure CADblClick(Sender: TObject);
    procedure CRDblClick(Sender: TObject);
    procedure CAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure observacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listNroClick(Sender: TObject);
    procedure listFechaClick(Sender: TObject);
    procedure desdeNroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaNroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listNroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listFechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure desdeFechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaFechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDispositivoClick(Sender: TObject);
    procedure btnEmitirClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet1Hide(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure ultimoNroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure codos1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarOSClick(Sender: TObject);
    procedure montoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBorrarTopeClick(Sender: TObject);
    procedure btnBuscarAfiliadoClick(Sender: TObject);
    procedure ultimoNroChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure retomarImprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRecalcularTMClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ordenesfacClick(Sender: TObject);
    procedure ordenesfacKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnReanudarClick(Sender: TObject);
    procedure codautorizadoChange(Sender: TObject);
    procedure codrechazadoChange(Sender: TObject);
    procedure nprofesionalChange(Sender: TObject);
    procedure naKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarLogClick(Sender: TObject);
    procedure fechaLogKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet4Show(Sender: TObject);
    procedure LogsChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure TabSheet4Hide(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure InfDetAutorizadasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fadesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fahastaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEleccionObsocialClick(Sender: TObject);
    procedure infauditoriaClick(Sender: TObject);
    procedure fecha_recKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure infTabularOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure faxChange(Sender: TObject);
    procedure btnFaxClick(Sender: TObject);
    procedure retomarImprChange(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure imprOrdenesChange(Sender: TObject);
    procedure ucodosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure uBuscarOSClick(Sender: TObject);
    procedure uNrodocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure uBuscarAfiliadoClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet5Hide(Sender: TObject);
    procedure consultarHCClick(Sender: TObject);
    procedure exportarExcelClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure TabSheet3Hide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure codosfactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarOSFactClick(Sender: TObject);
    procedure infEstMedicoClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure desdeNroAjusteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaNroAjusteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechaAjusteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarAjusteClick(Sender: TObject);
    procedure fepedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure obsdiagnosticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure profcabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarDiagnosticoClick(Sender: TObject);
    procedure btnBuscarMedicoCabeceraClick(Sender: TObject);
    procedure profcabChange(Sender: TObject);
    procedure codosobsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarOSObsClick(Sender: TObject);
    procedure observacionfinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codautorizadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codrechazadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure observacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure profcabKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechatransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox9Click(Sender: TObject);
    procedure btnGenerarRegistrosClick(Sender: TObject);
    procedure btnExportarTablasMaestrasClick(Sender: TObject);
    procedure btnAplicarConexionClick(Sender: TObject);
    procedure btnTransferirInternetClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnAplicarCambiosGeneralesClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure btnSeleccionOSClick(Sender: TObject);
    procedure btnOrdenOnLineClick(Sender: TObject);
  private
    { Private declarations }
    Items1, Items2, lh: Integer;
    Modificado1, Modificado2, modProf, modProfCab, nuevo_nro, r_log, redim, efax, mov_auditoria, sino_obs, transtablas: Boolean;
    historiac: array[1..9] of String;
    archivo: TextFile;
    Id, nroaudit, arch, vfax, vimpr, codosref, idprofcab, dxx: String;
    listadet: TStringList;
    procedure CargarDatosObraSocial;
    procedure CargarDatosObraSocial1;
    procedure CargarDatosZona;
    procedure CargarDatosAfiliado;
    procedure CargarDatosMedico;
    procedure CargarDatosMedicoCabecera;
    function  ControlarDatosIngresados: Boolean;
    procedure IniciarDatos;
    procedure CargarDatosNomeclaturaCodAutorizados;
    procedure CargarDatosNomeclaturaCodRechazados;
    procedure AgregarItemsAutorizado;
    procedure AgregarItemsRechazado;
    procedure CargarDatos;
    procedure CargarHistorial(HHCC: TStringGrid);
    procedure LineaHist(HHCC: TStringGrid);
    procedure TotalDeterminaciones;
    procedure ControlarCodigosAutorizados;
    procedure ControlarCodigosRechazados;
    procedure CargarDatosObraSocialHC;
    procedure uDatosPaciente;
    procedure CargarDatosObraSocialFact;
    procedure CargarDatosDiagnostico;
    procedure CargarDatosObraSocial4;
  public
    { Public declarations }
  end;

var
  fmAuditoria: TfmAuditoria;

implementation

uses CAuditoriaCCB, CObrasSocialesCCB, CZonasCCB, CPadronOSCCB, CMedicosCCB, CNomeclaCCB, CUtiles, CConfigForms, CUtilidadesStringGrid,
     ImgForms, NominaObrasSociales, NominaDeZonas, NominaDeMedicos, NominaNomeclador, CBDT, ConfigurarImpresora,
     Disposit, BuscarAuditorias, CFacturacionCCB, NominaAfiliado, CProfesionalCCB, EleccionObrasSociales, CListar,
     EleccionMedicos, CNomeclatura_ObraSocial, NominaDeDiagnosticos, CDiagnosticosCCB, CDiagnosticosCCBOMS,
     BuscarMedicoCab, NominaDeDiagnosticosOMS, FormAuto, RasDial3, RasDial2,
     RasDial1, RasDial4, HTTPCliente, Nomina_NBU, CNBU, CMedicosCabCCB, CMedicosCCBOS,
     NominaDeMedicosAuditoria, BuscarMedicoCabOL, CMedicosCabAO, buscarosonline;

{$R *.dfm}

procedure TfmAuditoria.CargarDatosObraSocial;
// Objetivo...: Cargar Datos Obra Social
Begin
  obsocial.getDatos(codos.Text);
  obsocial.SincronizarArancel(codos.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4));
  nos.Caption    := obsocial.Nombre;
  UB.Caption     := utiles.FormatearNumero(FloatToStr(obsocial.UB));
  UG.Caption     := utiles.FormatearNumero(FloatToStr(obsocial.UG));
  auditoriacb.getTopes(codos.Text);
  tope.Caption   := utiles.FormatearNumero(FloatToStr(auditoriacb.Tope));
  codosfact.Text := codos.Text;
  osf.Caption    := nos.Caption;

  if CheckBox8.Checked then Begin
    auditoriacb.getDatosObs(codos.Text);
    obsfinal.Caption := auditoriacb.Observacfinal;
    sino_obs := True;
  end;

  { Total Facturado en el mes }
  Refresh;
  StatusBar1.Panels[0].Text := 'Espere ->Recalculando Total Mensual Obra Social ...!'; StatusBar1.Refresh;
  //totmes.Caption := utiles.FormatearNumero(FloatToStr(auditoriacb.setTotalAnalisisMensual(fecha.Text, codos.Text, recalcularMontos.Checked)));
  if Length(Trim(codosfact.Text)) = 0 then Begin
    codosfact.Text := codos.Text;
    osf.Caption    := Copy(obsocial.Nombre, 1, 25);
  end;
  if padron.conectar(obsocial.tabla.FieldByName('codos').AsString) then Begin
    if PageControl1.ActivePage = TabSheet1 then
      if idzona.Enabled then idzona.SetFocus;
    TotalDeterminaciones;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end else
    codos.Text := '';

  if obsocial.FacturaNBU = 'S' then Begin
    codautorizado.EditMask := '999999;1; ';
    codrechazado.EditMask  := '999999;1; ';
    Label13.Caption := 'NBU:';
    UB.Caption     := utiles.FormatearNumero(FloatToStr(obsocial.valorNBU));
    Label14.Visible := False; UG.Visible := False;
  end else Begin
    codautorizado.EditMask := '9999;1; ';
    codrechazado.EditMask  := '9999;1; ';
    Label14.Visible := True; UG.Visible := True;
    Label13.Caption := 'U.B.:';
  end;

  if (StrToFloat(UB.Caption) = 0) then begin
    utiles.msgError('No se Definieron Unidades para la Obra Social ...!');
    codos.SetFocus;
  end;

end;

procedure TfmAuditoria.CargarDatosObraSocial1;
// Objetivo...: Cargar Datos Obra Social
Begin
  obsocial.getDatos(codos1.Text);
  oss.Caption := obsocial.Nombre;
  auditoriacb.getTopes(codos1.Text);
  obsocial.SincronizarArancel(codos.Text, Copy(fecha_rec.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha_rec.Text), 1, 4));
  UB1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UB));
  UG1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UG));
  monto.Text := utiles.FormatearNumero(FloatToStr(auditoriacb.Tope));
  monto.SetFocus;
end;

procedure TfmAuditoria.CargarDatosDiagnostico;
// Objetivo...: Cargar Datos Diagnostico
Begin
  if (auditoriacb.Online <> 'S') then begin   // 04/08/2009
    if Length(Trim(iddiag.Text)) < 5 then Begin
      diagnostico.getDatos(iddiag.Text);
      ddiag.Caption := diagnostico.Descrip;
    end else Begin
      diagnosticooms.getDatosCodRap(iddiag.Text);
      ddiag.Caption := Copy(diagnosticooms.Descrip, 1, 35);
    end;

    if (length(trim(diagnosticooms.Codrap)) = 0) then begin
      diagnosticooms.getDatos(dxx);
      Iddiag.Text := dxx;
      ddiag.Caption := Copy(diagnosticooms.Descrip, 1, 35);
    end;
  end;

  if (auditoriacb.Online = 'S') then begin // 04/08/2009 -> online toma codigo directo
    diagnosticooms.getDatos(iddiag.Text);
    ddiag.Caption := Copy(diagnosticooms.Descrip, 1, 35);
  end;

  // Verificamos si la obra social tiene o no médico de cabecera
  if medcab.VerificarSiLaObraSocialTieneMedicoCabecera(codos.Text) then Begin
    profcab.Enabled := True;
    profcab.SetFocus;
  end else Begin
    if ControlarDatosIngresados then Begin
      Panel6.Enabled := True;
      CA.Enabled     := True;
      codautorizado.SetFocus;
    end;
    profcab.Enabled := False;
  end;
end;

procedure TfmAuditoria.CargarDatosZona;
// Objetivo...: Cargar Datos Zona
Begin
  zonas.getDatos(idzona.Text);
  dzona.Caption := zonas.Zona;
  if PageControl1.ActivePage = TabSheet1 then
    if nrodoc.Enabled then nrodoc.SetFocus;
end;

procedure TfmAuditoria.CargarDatosAfiliado;
// Objetivo...: Cargar Datos Afiliado
Begin
  StatusBar1.Panels[0].Text := 'Recuperando Datos del Paciente ...!'; StatusBar1.Refresh;
  padron.getDatos(codos.Text, nrodoc.Text);
  if UpperCase(padron.Nombre) <> '*** INEXISTENTE ***' then nombre.Text := padron.Nombre else nombre.Text := 'No Existe el Nro. de Documento';
  if padron.Buscar(codos.Text, nrodoc.Text) then nprofesional.SetFocus;
  obs.Caption := padron.Observacion;
  if Length(Trim(obs.Caption)) > 0 then obs.Visible := True else obs.Visible := False;
  StatusBar1.Panels[0].Text := '';
end;

procedure TfmAuditoria.CargarDatosMedico;
// Objetivo...: Cargar datos Médico
Begin
  auditoriacb.getDatos(nroauditoria.Text);
  if (auditoriacb.Online <> 'S') then begin
    if (medico.Buscar(idprof.Caption)) then begin
      medico.getDatos(idprof.Caption);

      if (medico.Inactivo) then begin
        utiles.msgError('Médico Inactivo ...!');
        idprof.Caption := '';
        exit;
      end;

      nprofesional.Text := medico.Nombre;
    end;
  end;
  if (auditoriacb.Online = 'S') then begin
    medicoos.getDatos(codos.Text, idprof.Caption);
    nprofesional.Text := trimright(medicoos.Nombre);
  end;

  modProf           := False;
  if PageControl1.ActivePage = TabSheet1 then
    fepedido.SetFocus;
end;

procedure TfmAuditoria.CargarDatosMedicoCabecera;
// Objetivo...: Cargar datos Médico de Cabecera
Begin
  if (length(trim(idprofcab)) = 4) then begin
    medico.getDatos(idprofcab);
    profcab.Text := medico.Nombre;
  end;
  if (length(trim(idprofcab)) = 5) then begin
    medicoos.getDatos(codos.Text, idprofcab);
    profcab.Text := trimright(medicoos.Nombre);
  end;

  if (auditoriacb.Online <> 'S') then begin
    if not medcab.BuscarMedicoCabecera(codos.Text, idprofcab) then utiles.msgError('El Médico Seleccionado No es de Cabecera ...!') else Begin
      if ControlarDatosIngresados then Begin
        Panel6.Enabled := True;
        CA.Enabled     := True;
        codautorizado.SetFocus;
      end else Begin
        utiles.msgError('Se Detectaron Datos Erróneos o Incompletos, Verifíquelos y Corríjalos para Continuar ...!');
        Panel6.Enabled := False;
        CA.Enabled     := False;
      end;
    End;
  end;

  if (auditoriacb.Online = 'S') then begin
    if not medicoscabol.Buscar(codos.Text, idprofcab) then utiles.msgError('El Médico Seleccionado No es de Cabecera ...!') else Begin
      if ControlarDatosIngresados then Begin
        Panel6.Enabled := True;
        CA.Enabled     := True;
        codautorizado.SetFocus;
      end else Begin
        utiles.msgError('Se Detectaron Datos Erróneos o Incompletos, Verifíquelos y Corríjalos para Continuar ...!');
        Panel6.Enabled := False;
        CA.Enabled     := False;
      end;
    End;
  end;
end;

function  TfmAuditoria.ControlarDatosIngresados: Boolean;
// Objetivo...: Verificar datos ingresados
var
  vfd, l: Boolean;
Begin
  vfd := False;
  l   := False;

  if (auditoriacb.Online <> 'S') then begin
    if not medcab.VerificarSiLaObraSocialTieneMedicoCabecera(codos.Text) then l := True else
      if medcab.BuscarMedicoCabecera(codos.Text, idprofcab) then l := True;
  end;
  
  if (auditoriacb.Online = 'S') then begin
    if not medcab.VerificarSiLaObraSocialTieneMedicoCabecera(codos.Text) then l := True else
      if medicoscabol.Buscar(codos.Text, idprofcab) then l := True;
  end;

  if Length(Trim(fechaderivacion.Text)) < 8 then vfd := True else
    if utiles.ctrlFecha(fechaderivacion.Text, '') then vfd := True;
  if (Length(Trim(nroauditoria.Text)) > 0) and (Length(Trim(obsdiagnostico.Text)) >= 0) and (Length(Trim(nombre.Text)) > 0) and (utiles.ctrlFecha(fepedido.Text, '')) then
    if (obsocial.Buscar(codos.Text)) and (zonas.Buscar(idzona.Text)) and (padron.Buscar(codos.Text, nrodoc.Text)) and ( (medico.Buscar(idprof.Caption)) or ( medicoos.Buscar(codos.Text, idprof.Caption)) ) and (obsocial.Buscar(codosfact.Text))
    and ( (diagnostico.Buscar(iddiag.Text)) or (diagnosticooms.BuscarCodRap(iddiag.Text)) or (diagnosticooms.Buscar(iddiag.Text)) ) then
      if (utiles.ctrlFecha(fecha.Text, '')) and (vfd) and (l) then Result := True else Begin
        utiles.msgError('Hay Datos Ingresados que están Incorrectos, Verifíquelos ...!');
        Result := False;
      end;

   if r_log then Result := True;
end;

procedure TfmAuditoria.IniciarDatos;
// Objetivo...: Iniciar Atributos
Begin
  nroauditoria.Text := utiles.sLlenarIzquierda(auditoriacb.setNuevoNroAuditoria, 10, '0');
  if Length(Trim(fecha.Text)) < 8 then fecha.Text := utiles.setFechaActual;
  items1 := 0; items2 := 0; Modificado1 := False; Modificado2 := False;
  grid.IniciarGrilla(CA); grid.IniciarGrilla(CR);
  nrodoc.Text := ''; nombre.Text := ''; id := '';
  idprof.Caption := ''; nprofesional.Text := '';
  obsdiagnostico.Text := ''; fepedido.Text := '';
  fechaderivacion.Text := ''; nroderivacion.Text := '';
  codautorizado.Text := ''; detaceptada.Caption := ''; nn1.Caption := '';
  codrechazado.Text := ''; detrechazada.Caption := ''; nn2.Caption := '';
  idprofcab := ''; profcab.Text := ''; iddiag.Text := ''; ddiag.Caption := '';
  Panel6.Enabled := False; Panel7.Enabled := False;
  Panel12.Height := 0; observacion.Text := '';
  grid.IniciarGrilla(HistoriaClinica);
  Panel16.Visible   := False;
  Splitter2.Visible := False;
  totreceta.Caption := utiles.FormatearNumero('0');
  auditoriacb.Online := 'N';
  if PageControl1.ActivePage = TabSheet1 then codos.SetFocus;
end;

procedure TfmAuditoria.CargarDatosNomeclaturaCodAutorizados;
// Objetivo...: Cargar Instancia del Nomeclador
Begin
  if (obsocial.Factnbu = 'N') or (Length(trim(codautorizado.Text)) = 4) then Begin
    nomeclatura.getDatos(codautorizado.Text);
    detaceptada.Caption := nomeclatura.descrip;
    nn1.Caption         := nomeclaturaos.setDeterminacionNomeclaturaNacional(codos.Text, codautorizado.Text);
  end;
  if obsocial.Factnbu = 'S' then Begin
    nbu.getDatos(codautorizado.Text);
    detaceptada.Caption := nbu.descrip;
    nn1.Caption         := nomeclaturaos.setDeterminacionNomeclaturaNacional(codos.Text, codautorizado.Text);
  end;
end;

procedure TfmAuditoria.CargarDatosNomeclaturaCodRechazados;
// Objetivo...: Cargar Instancia del Nomeclador
Begin
  if (obsocial.Factnbu = 'N') or (Length(trim(codrechazado.Text)) = 4) then Begin
    nomeclatura.getDatos(codrechazado.Text);
    detrechazada.Caption := nomeclatura.descrip;
    nn2.Caption          := nomeclaturaos.setDeterminacionNomeclaturaNacional(codos.Text, codrechazado.Text);
  end;
  if obsocial.Factnbu = 'S' then Begin
    nbu.getDatos(codrechazado.Text);
    detrechazada.Caption := nbu.descrip;
    nn1.Caption         := nomeclaturaos.setDeterminacionNomeclaturaNacional(codos.Text, codautorizado.Text);
  end;
end;

procedure TfmAuditoria.AgregarItemsAutorizado;
// Objetivo...: Agregar Código Autorizado
var
  i: Integer;
  m, mf, coseguro, montocoseguro: Real;
Begin
  if not Modificado1 then Begin
    Inc(items1);
    i := items1;
  end else Begin
    i := CA.Row;
    totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) - StrToFloat(CA.Cells[2, i])));
  end;
  CA.Cells[0, i] := codautorizado.Text;
  if (Length(trim(codautorizado.Text)) = 4) then nomeclatura.getDatos(codautorizado.Text);
  if (obsocial.Factnbu = 'N') or (Length(trim(codautorizado.Text)) = 4) then CA.Cells[1, i] := nomeclatura.descrip else
  if obsocial.Factnbu = 'S' then CA.Cells[1, i] := nbu.descrip;
  CA.Cells[2, i] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos.Text, codautorizado.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4)) + facturacion.setTot9984));

  auditoriacb.SincronizarArancelDiferencial(codos.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4));

  if (auditoriacb.verificarArancelDiferencial(codos.Text)) and (auditoriacb.Aplica = 'S') then Begin
    if not obsocial.BuscarAnalisisMontoFijo(codos.Text, CA.Cells[0, i]) then Begin
      CA.Cells[3, i] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos.Text, codautorizado.Text, auditoriacb.UB, auditoriacb.UG, auditoriacb.RIEUB, auditoriacb.RIEUG) + facturacion.setTot9984))
    end else Begin
      CA.Cells[3, i] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos.Text, codautorizado.Text, auditoriacb.UB, auditoriacb.UG, auditoriacb.RIEUB, auditoriacb.RIEUG) + facturacion.setTot9984));
      if auditoriacb.Porcent > 0 then Begin
        m := StrToFloat(CA.Cells[3, i]) + (StrToFloat(CA.Cells[3, i]) * (auditoriacb.Porcent * 0.01));
        CA.Cells[3, i] := utiles.FormatearNumero(FloatToStr(m));
      end;

      // Montos Fijos
      mf := auditoriacb.setMontoFijo(codos.Text, codautorizado.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4));
      if mf > 0 then CA.Cells[3, i] := utiles.FormatearNumero(FloatToStr(mf));
    end;
  end else
    CA.Cells[3, i] := utiles.FormatearNumero('0');

  CA.Cells[4, i] := utiles.FormatearNumero('0');

  coseguro := auditoriacb.getArancelDiferencialNBU(codos.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4));
  if (coseguro > 0) then begin
     montocoseguro := facturacion.setImporteAnalisis(codos.Text, codautorizado.Text, Copy(fecha.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Text), 1, 4), coseguro);
     CA.Cells[4, i] := utiles.FormatearNumero(FloatToStr(montocoseguro - strtofloat(CA.Cells[2, i]) ));
     CA.Cells[3, i] := utiles.FormatearNumero('0');
  end;

  totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) + StrToFloat(CA.Cells[2, i])));
  CA.Row := i;
  Modificado1 := False;
  codautorizado.Text := '';
  //MessageBeep(MB_OK);
  TotalDeterminaciones;
end;

procedure TfmAuditoria.AgregarItemsRechazado;
// Objetivo...: Agregar Código Rechazado
var
  i: Integer;
Begin
  if not Modificado2 then Begin
    Inc(items2);
    i := items2;
  end else i := CR.Row;
  CR.Cells[0, i] := codrechazado.Text;
  if (Length(trim(codrechazado.Text)) = 4) then nomeclatura.getDatos(codrechazado.Text);
  if (obsocial.Factnbu = 'N') or (Length(trim(codrechazado.Text)) = 4) then CR.Cells[1, i] := nomeclatura.descrip else
    if obsocial.Factnbu = 'S' then CR.Cells[1, i] := nbu.descrip;
  CR.Row := i;
  //MessageBeep(MB_OK);

  Modificado2 := False;
  codrechazado.Text := '';
end;

procedure TfmAuditoria.CargarDatos;
// Objetivo...: Cargar una Instancia en la auditoria
var
  l: TObjectList;
  objeto: TTAuditoriaCCB;
  i: Integer;
Begin
  StatusBar1.Panels[0].Text := 'Procesando Datos'; StatusBar1.Refresh;
  Panel16.Visible   := False;
  Splitter2.Visible := False;
  auditoriacb.getDatos(nroauditoria.Text);
  profcab.Text := ''; idprofcab := '';
  if auditoriacb.Existe then Begin
     fecha.Text           := auditoriacb.Fecha;
     codos.Text           := auditoriacb.Codos;
     idzona.Text          := auditoriacb.Idzona;
     nrodoc.Text          := auditoriacb.Nrodoc;
     id                   := auditoriacb.Nrodoc;
     idprof.Caption       := auditoriacb.Idprof;
     obsdiagnostico.Text  := auditoriacb.Obsdiagnostico;
     fechaderivacion.Text := auditoriacb.Federivacion;
     nroderivacion.Text   := auditoriacb.Nroderivacion;
     observacion.Text     := auditoriacb.Observacion;
     codosfact.Text       := auditoriacb.Codosfact;
     fepedido.Text        := auditoriacb.Fepedido;
     iddiag.Text          := auditoriacb.Iddiag;
     if Length(Trim(auditoriacb.IdFact)) > 0 then StatusBar1.Panels[1].Text := ' Fact.: S' else StatusBar1.Panels[1].Text := ' Fact.: N';
     CargarDatosObraSocial;
     CargarDatosZona;
     CargarDatosAfiliado;
     CargarDatosMedico;
     CargarDatosObraSocialFact;
     idprofcab            := auditoriacb.Profcab;

     if (auditoriacb.Online <> 'S') then begin
       medico.getDatos(idprofcab);
       profcab.Text  := medico.Nombre;
       if Length(Trim(iddiag.Text)) < 5 then Begin
         diagnostico.getDatos(iddiag.Text);
         ddiag.Caption := diagnostico.Descrip;
       end else Begin
         diagnosticooms.getDatosCodRap(iddiag.Text);
         if (length(trim(diagnosticooms.Codrap)) = 0) then diagnosticooms.getDatos(iddiag.Text);
         ddiag.Caption := Copy(diagnosticooms.Descrip, 1, 35);
       end;
     end;

     if (auditoriacb.Online = 'S') then begin
       diagnosticooms.getDatos(iddiag.Text);
       ddiag.Caption := Copy(diagnosticooms.Descrip, 1, 35);

       medicoos.getDatos(codos.Text, idprof.Caption);
       nprofesional.Text := trimright(medicoos.Nombre);
     end;

     if (length(trim(idprofcab)) = 5) then begin
       medicoos.getDatos(codos.Text, idprofcab);
       profcab.Text  := trimright(medicoos.Nombre);
     end;

     grid.IniciarGrilla(CA); grid.IniciarGrilla(CR);

     l := auditoriacb.setOrdenes;
     items1 := 0; items2 := 0;
     for i := 1 to l.Count do Begin
       objeto := TTAuditoriaCCB(l.Items[i-1]);
       if objeto.Estado = 'A' then Begin
         Inc(items1);
         CA.Cells[0, items1] := objeto.Codigo;
         if (obsocial.Factnbu = 'N') or (Length(trim(objeto.codigo)) = 4) then Begin
           nomeclatura.getDatos(objeto.Codigo);
           CA.Cells[1, items1] := nomeclatura.descrip;
         end else begin
           if obsocial.Factnbu = 'S' then Begin
             nbu.getDatos(objeto.Codigo);
             CA.Cells[1, items1] := nbu.descrip;
           end;
         end;
         CA.Cells[2, items1] := utiles.FormatearNumero(FloatToStr(objeto.monto));
         CA.Cells[3, items1] := utiles.FormatearNumero(FloatToStr(objeto.monto_dif));
         CA.Cells[4, items1] := utiles.FormatearNumero(FloatToStr(objeto.montocoseguro));
       end;
       if objeto.Estado = 'R' then Begin
         Inc(items2);
         CR.Cells[0, items2] := objeto.Codigo;
         if (obsocial.Factnbu = 'N') or (Length(trim(objeto.Codigo)) = 4) then Begin
           nomeclatura.getDatos(objeto.Codigo);
           CR.Cells[1, items2] := nomeclatura.descrip;
         end else begin
           if obsocial.Factnbu = 'S' then Begin
             nbu.getDatos(objeto.Codigo);
             CR.Cells[1, items2] := nbu.descrip;
           end;
         end;
       end;
     end;
     l.Free; l := Nil;

     if items1 > 0 then Begin
       CA.Row := items1;
       TotalDeterminaciones;
     end;
     if items2 > 0 then CR.Row := items2;
  end;

  obsfinal.Caption  := auditoriacb.Observacfinal;

  disponible.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(tope.Caption) - StrToFloat(totmes.Caption)));
  codos.SetFocus;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmAuditoria.CargarHistorial(HHCC: TStringGrid);
// Objetivo...: Cargar Datos Historial de Paciente
var
  r: TStringList; idanter, codd: String; i, j, k, m, n, o: Integer;
  z: TObjectList;
  objeto: TTAuditoriaCCB;
Begin
  StatusBar1.Panels[0].Text := 'Recuperando Historial Paciente ...!'; StatusBar1.Refresh;
  r := auditoriacb.setHistorial(codos.Text, nrodoc.Text, False);
  lh := 0; idanter := '';
  for j := 0 to r.Count - 1 do Begin
    if Copy(r.Strings[j], 1, 10) <> idanter then Begin
      if Length(Trim(idanter)) > 0 then LineaHist(HHCC);;
      m := pos(';1', r.Strings[j]);
      n := pos(';2', r.Strings[j]);
      o := pos(';3', r.Strings[j]);

      historiac[1] := utiles.sFormatoFecha(Copy(r.Strings[j], 11, 8));

      codd := Copy(r.Strings[j], o+2, 6);
      if (diagnostico.Buscar(codd)) then begin
        diagnostico.getDatos(codd);
        historiac[2] := codd + ' ' + diagnostico.Descrip + '(' + Copy(r.Strings[j], 33, m - 33) + ')';
      end else Begin
        if (diagnosticooms.Buscar(codd)) then begin
          diagnosticooms.getDatos(codd);
        end else begin
          diagnosticooms.getDatosCodRap(codd);
        end;
        historiac[2] := codd + ' ' + diagnosticooms.Descrip + '[' + Copy(r.Strings[j], 33, m - 33) + ']';
      end;

      if (medico.Buscar(Copy(r.Strings[j], 19, 5))) then begin
        medico.getDatos(Copy(r.Strings[j], 19, 5));
        historiac[3] := Copy(r.Strings[j], 19, 5) + ' ' + medico.Nombre;
      end else begin
        if (medicoos.Buscar(codos.Text, Copy(r.Strings[j], 19, 5))) then begin
          medicoos.getDatos(codos.Text, copy(r.Strings[j], 19, 5));
          historiac[3] := Copy(r.Strings[j], 19, 5) + ' ' + medicoos.Nombre;
        end;
      end;

      historiac[6] := '  Orden: ' + Copy(r.Strings[j], 1, 10);
      historiac[7] := Copy(r.Strings[j], m+2, n-(m+2));
      historiac[8] := Copy(r.Strings[j], n+2, o-(n+2));
      historiac[4] := '';  historiac[5] := '';
      if (medcab.BuscarMedicoCabecera(codos.Text, trim(Copy(r.Strings[j], o+7, 6)))) then
        historiac[9] := 'Méd. Cabecera: ' + Copy(r.Strings[j], o+7, 6) + ' ' + medcab.setMedicoCabecera(codos.Text, trim(Copy(r.Strings[j], o+7, 6)))
      else begin
        medicoos.getDatos(codos.Text, Copy(r.Strings[j], o+7, 6));
        historiac[9] := 'Méd. Cabecera: ' + Copy(r.Strings[j], o+7, 6) + ' ' + medicoos.Nombre;
      end;

      idanter      := Copy(r.Strings[j], 1, 10);
    end;
    listadet.Clear;
    z := auditoriacb.setItemsHistorial(Copy(r.Strings[j], 1, 10), False);
    for k := 1 to z.Count do begin
      objeto := TTAuditoriaCCB(z.Items[k-1]);
      if objeto.Estado = 'A' then Begin
        historiac[4] := historiac[4] + objeto.Codigo + '  ';
        listadet.Add(objeto.Codigo + Copy(r.Strings[j], 1, 10));
      end;
      if objeto.Estado = 'R' then historiac[5] := historiac[5] + objeto.Codigo + '  ';
    end;
    z.Free; z := Nil;
  end;
  r.Clear;

  if Length(Trim(idanter)) > 0 then Begin
    Panel16.Visible := True;
    Splitter2.Visible := True;
    Panel12.Align   := alBottom;
    //if not Panel12.Visible then Splitter2.Align := alTop else Splitter2.Align := alBottom;
    LineaHist(HHCC);
    Inc(lh);
    HHCC.Cells[0, lh] := '*';
    HHCC.Cells[1, lh] := '----------------------------------------------------------------------------------------------';
  end else Begin
    Panel16.Visible   := False;
    Splitter2.Visible := False;
  end;

  HHCC.Col    := 0;
  //if lh > 0 then HHCC.Row := lh - 4;

  For i := lh + 1 to HHCC.RowCount do
    for j := 0 to HHCC.ColCount - 1 do HHCC.Cells[j, i] := '';

  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmAuditoria.LineaHist;
// Objetivo...: Cargar Linea Historial
Begin
  if lh > 0 then Begin
    Inc(lh);
    HHCC.Cells[0, lh] := '*';
    HHCC.Cells[1, lh] := '-----------------------------------------------------------------------------------------------';
  end;
  Inc(lh); HHCC.Cells[1, lh] := 'Fecha: ' + historiac[1] + historiac[6] + '  Pedido: ' + historiac[8] + '  Diagnósitico: ' + historiac[2]; // +  '   Médico: ' + historiac[3];
  Inc(lh); HHCC.Cells[1, lh] := 'Médico: ' + historiac[3] + '  ' + historiac[9];
  Inc(lh); HHCC.Cells[1, lh] := 'Cód. Autorizados: ' + historiac[4];
  Inc(lh); HHCC.Cells[1, lh] := 'Cód. Rechazados : ' + historiac[5];
  if Length(Trim(historiac[7])) > 0 then Begin
    Inc(lh); HHCC.Cells[1, lh] := 'Observación: ' + historiac[7];
  end;
  historiac[7] := '';
  HHCC.Row := lh;
end;

procedure TfmAuditoria.TotalDeterminaciones;
// Objetivo...: Total de determinaciones
var
  i: Integer; total: Real;
Begin
  total := 0;
  if Length(Trim(nroderivacion.Text)) = 0 then Begin
    For i := 1 to items1 do
     if Length(Trim(CA.Cells[2, i])) > 0 then total := total + StrToFloat(CA.Cells[2, i]);
  end;
  totreceta.Caption  := utiles.FormatearNumero(FloatToStr(total));
  disponible.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(tope.Caption) - StrToFloat(totmes.Caption)));
end;

procedure TfmAuditoria.ControlarCodigosAutorizados;
var
  i, cant, ncant: Integer;
  agrega: Boolean;
begin
  if obsocial.Factnbu = 'N' then Begin
    if not nomeclatura.Buscar(codautorizado.Text) then BuscarCodigosAutorizadosClick(nil) else Begin
      if auditoriacb.BuscarDetRechazada(codos.Text, codautorizado.Text) then utiles.msgError('La Determinación está Excluida de la Auditoria ...!') else Begin
        CargarDatosNomeclaturaCodAutorizados;
        agrega := True; cant := 0;
        for i := 1 to listadet.Count do
          if (Copy(listadet.Strings[i-1], 1, 4) = codautorizado.Text) and (Copy(listadet.Strings[i-1], 5, 10) <> nroauditoria.Text) then Inc(cant);

        if cant > 0 then Begin
          ncant := nomeclaturaos.setCantidadDeterminacionesAutorizadas(codos.Text, codautorizado.Text);
          if ncant >= cant then
            agrega := utiles.msgSiNo('La Determinación ' + codautorizado.Text + ' - ' + detaceptada.Caption + chr(13) + ' se Autorizó ' + IntToStr(cant) + ' veces y el Tope son ' + IntToStr(ncant) + ' veces.' +
                                     chr(13) + 'Seguro para Volver a Autorizar ?');
        end;

        if agrega then AgregarItemsAutorizado else Begin
          codautorizado.Text := '';
          detaceptada.Caption := '';
          nn1.Caption := '';
        end;
      end;
    end;
  end;

  if obsocial.Factnbu = 'S' then Begin
    if not nbu.Buscar(codautorizado.Text) then BuscarCodigosAutorizadosClick(nil) else Begin
        CargarDatosNomeclaturaCodAutorizados;
        agrega := True; cant := 0;
        for i := 1 to listadet.Count do
          if (Copy(listadet.Strings[i-1], 1, 4) = codautorizado.Text) and (Copy(listadet.Strings[i-1], 5, 10) <> nroauditoria.Text) then Inc(cant);

        if cant > 0 then Begin
          ncant := nomeclaturaos.setCantidadDeterminacionesAutorizadas(codos.Text, codautorizado.Text);
          if ncant >= cant then
            agrega := utiles.msgSiNo('La Determinación ' + codautorizado.Text + ' - ' + detaceptada.Caption + chr(13) + ' se Autorizó ' + IntToStr(cant) + ' veces y el Tope son ' + IntToStr(ncant) + ' veces.' +
                                     chr(13) + 'Seguro para Volver a Autorizar ?');
        end;

        if agrega then AgregarItemsAutorizado else Begin
          codautorizado.Text := '';
          detaceptada.Caption := '';
          nn1.Caption := '';
        end;
    end;
  end;
end;

procedure TfmAuditoria.ControlarCodigosRechazados;
begin
  if obsocial.Factnbu = 'N' then Begin
    if not nomeclatura.Buscar(codrechazado.Text) then BuscarCodigosRechazadosClick(nil) else Begin
      CargarDatosNomeclaturaCodRechazados;
      AgregarItemsRechazado;
    end;
  end;
  if obsocial.Factnbu = 'S' then Begin
    if not nbu.Buscar(codrechazado.Text) then BuscarCodigosRechazadosClick(nil) else Begin
      CargarDatosNomeclaturaCodRechazados;
      AgregarItemsRechazado;
    end;
  end;
end;

procedure TfmAuditoria.CargarDatosObraSocialHC;
Begin
  obsocial.getDatos(ucodos.Text);
  unos.Caption := obsocial.Nombre;
  if padron.verificarPadron(ucodos.Text) then Begin
    padron.conectar(ucodos.Text);
    unrodoc.SetFocus;
  end else Begin
    utiles.msgError('Obra Social Sin Auditoria ...!');
    ucodos.SetFocus;
  end;
end;

procedure TfmAuditoria.uDatosPaciente;
Begin
  padron.getDatos(ucodos.Text, unrodoc.Text);
  unombre.Caption := padron.Nombre;
  consultarHC.SetFocus;
end;

procedure TfmAuditoria.CargarDatosObraSocialFact;
Begin
  obsocial.getDatos(codosfact.Text);
  osf.Caption := Copy(obsocial.Nombre, 1, 25);
  if Panel12.Visible then observacion.SetFocus;
end;

procedure TfmAuditoria.CargarDatosObraSocial4;
Begin
  obsocial.getDatos(codosobs.Text);
  nosobs.Caption := obsocial.Nombre;
  auditoriacb.getDatosObs(codosobs.Text);
  observacionfinal.Text := auditoriacb.Observacfinal;
  observacionfinal.SetFocus;
end;

//------------------------------------------------------------------------------

procedure TfmAuditoria.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width := Width - (Width div 5);
  btnBuscarAfiliado.Left := Panel29.Width - 48;
  nombre.Width := (Panel29.Width - nombre.Left) - (nrodoc.Width) + 10;
  obsdiagnostico.Width := (Panel29.Width - obsdiagnostico.Left) - (btnBuscarAfiliado.Width + 8);
end;

procedure TfmAuditoria.FormShow(Sender: TObject);
var
  l1: Integer; en, ld, ett, lc1, lc2, upi, ls, ing, fb, shc, lp5, dcb, itexto, lsp, lstxt, ep, acsalto, rd, altop, nn, coms: String;
  vhost, vftp, vusuario, vpassword, cd, url: String;
begin
  //AddFontResource(PChar(dbs.DirSistema + '\fuentes\IDAutomationCode39.ttf'));
  //SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  StatusBar1.Panels[1].Text := 'F9 Sí/No Obs.';
  StatusBar1.Panels[0].Text := 'Conectando'; StatusBar1.Refresh;
  CA.Cells[0, 0] := 'Cód.'; CA.Cells[1, 0] := 'Determinaciones Aceptadas'; CA.Cells[2, 0] := 'Monto'; CA.Cells[3, 0] := 'Monto Dif.'; CA.Cells[4, 0] := 'Coseguro';
  CR.Cells[0, 0] := 'Cód.'; CR.Cells[1, 0] := 'Determinaciones Rechazadas';
  grid.RecuperarAnchoColumnas(fmAuditoria, CA);
  grid.RecuperarAnchoColumnas(fmAuditoria, CR);

  fax.Items := Printer.Printers;
  fax.Text  := fax.Items[0];
  imprOrdenes.Items := Printer.Printers;
  imprOrdenes.Text  := imprOrdenes.Items[0];

  //if FormStyle = fsMDIChild then configform.Setear(fmAuditoria);
  configform.Setear(fmAuditoria);
  auditoriacb.conectar;
  DTS.DataSet := auditoriacb.cabauditoria;
  if FileExists(dbs.DirSistema + '\audit_1.ini') then Begin
    AssignFile(archivo, dbs.DirSistema + '\audit_1.ini');
    reset(archivo);
    readln(archivo, l1);
    if l1 > 50 then Panel16.Height := l1 else Panel16.Height := 50;
    readln(archivo, en);
    readln(archivo, ld);
    readln(archivo, ett);
    readln(archivo, lc1);
    readln(archivo, lc2);
    readln(archivo, upi);
    readln(archivo, ls);
    readln(archivo, ing);
    readln(archivo, fb);
    readln(archivo, shc);
    readln(archivo, lp5);
    readln(archivo, dcb);
    readln(archivo, itexto);
    readln(archivo, lsp);
    readln(archivo, lstxt);
    readln(archivo, ep);
    readln(archivo, acsalto);
    readln(archivo, rd);
    if Length(Trim(en)) > 0  then Entidad.Text    := en;
    if Length(Trim(ld)) > 0  then LineasDet.Text  := ld;
    if Length(Trim(ett)) > 0 then Etiquetas.Text  := ett;
    if Length(Trim(lc1)) > 0 then CA.ColWidths[1] := StrToInt(lc1);
    if Length(Trim(lc2)) > 0 then CR.ColWidths[1] := StrToInt(lc2);
    if Length(Trim(ls)) > 0  then lineassep.Text  := ls;
    if Length(Trim(ing)) > 0 then
      if ing = '1' then ingresos.Checked := True else ingresos.Checked := False;
    if Length(Trim(fb)) > 0  then fuente_barra.Text := fb;
    if Length(Trim(shc)) > 0 then scrollhc.Text     := shc;
    if Length(Trim(lp5)) > 0 then Panel5.Width      := StrToInt(lp5);
    retomarImpr.Text := upi;
    if dcb = 'S' then desactivarCod.Checked := True else desactivarCod.Checked := False;
    if itexto = 'S' then ImpresionModoTexto.Checked := True else ImpresionModoTexto.Checked := False;
    if Length(Trim(lsp)) > 0  then lineasSepPag.Text := lsp else lineasSepPag.Text := '5';
    if Length(Trim(lstxt)) > 0  then lineaSepOrdenesTxt.Text := lstxt else lineaSepOrdenesTxt.Text := '5';
    if Length(Trim(ep)) > 0  then EtiqPag.Text := ep else EtiqPag.Text := '5';
    if acsalto = 'S' then activarSalto.Checked := True else activarSalto.Checked := False;
    if rd = 'S' then registrarDerivacion.Checked := True else registrarDerivacion.Checked := False;
    readln(archivo, vfax);
    readln(archivo, vimpr);
    readln(archivo, altop);
    readln(archivo, nn);
    if Length(Trim(nn)) > 0 then
      if nn = '1' then Checkbox8.Checked := True else Checkbox8.Checked := False;
    readln(archivo, coms);
    if coms = '1' then tablaOMS.Checked := True else tablaOMS.Checked := False;
    closeFile(archivo);
    if Length(Trim(altop)) > 0  then altoPag.Text := altop else altoPag.Text := '65';
  end;
  Application.CreateForm(TDispositivo, Dispositivo);
  IniciarDatos;
  if fecha.Text <> auditoriacb.Fecha then retomarImpr.Text := nroauditoria.Text;
  if Length(Trim(retomarImpr.Text)) > 0 then retomar.Checked := True;
  tope.Caption       := utiles.FormatearNumero('0');
  totreceta.Caption  := tope.Caption;
  disponible.Caption := tope.Caption;
  totmes.Caption     := tope.Caption;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  Application.CreateForm(TfmEleObraSociales, fmEleObraSociales);
  Application.CreateForm(TfmEleMedicos, fmEleMedicos);
  fmEleObraSociales.CargarNivel := 1;
  fecha_rec.Text := utiles.setFechaActual;
  redim          := False;
  if Length(Trim(vfax)) > 0  then fax.Text := fax.Items[StrToInt(vfax)];
  if Length(Trim(vimpr)) > 0 then imprOrdenes.Text := imprOrdenes.Items[StrToInt(vimpr)];
  listadet := TStringList.Create;

  if FileExists(dbs.DirSistema + '\ftpaudi.ini') then Begin
    AssignFile(archivo, dbs.DirSistema + '\ftpaudi.ini');
    Reset(archivo);
    ReadLn(archivo, vhost);
    ReadLn(archivo, vftp);
    ReadLn(archivo, vusuario);
    ReadLn(archivo, vpassword);
    ReadLn(archivo, cd);
    ReadLn(archivo, url);
    closeFile(archivo);
    ftphost.Text     := vhost;
    dirftp.Text      := vftp;
    usuario.Text     := vusuario;
    contrasenia.Text := vpassword;
    if cd = '1' then conexiondirecta.Checked := True else conexiondirecta.Checked := False;
    if Length(Trim(url)) > 0 then theURL.Text := url;
  end;

  redim := false;

  TabSheet4.TabVisible := false;

  Refresh;
end;

procedure TfmAuditoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StatusBar1.Panels[0].Text := 'Desonectando'; StatusBar1.Refresh;
  //RemoveFontResource(PChar(dbs.DirSistema + '\fuentes\IDAutomationCode39.ttf'));
  //SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  //if FormStyle = fsMDIChild then configform.Guardar(fmAuditoria, redim);
  
  configform.Guardar(fmAuditoria, redim);
  auditoriacb.desconectar;
  padron.desconectar;
  if Assigned(Dispositivo) then Begin
    Dispositivo.Release; Dispositivo := nil;
  end;
  if Assigned(fmEleObraSociales) then Begin
    fmEleObraSociales.Release; fmEleObraSociales := Nil;
  end;
  if Assigned(fmEleMedicos) then Begin
    fmEleMedicos.Release; fmEleMedicos := Nil;
  end;

  grid.GuardarAnchoColumnas(fmAuditoria, CA);
  grid.GuardarAnchoColumnas(fmAuditoria, CR);

  fmAuditoria.Release; fmAuditoria := nil;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmAuditoria.nroauditoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  n: String;
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    nroauditoria.Text := utiles.sLlenarIzquierda(nroauditoria.Text, 10, '0');
    n := nroauditoria.Text;
    if StrToInt(nroauditoria.Text) > 0 then
      if not auditoriacb.Buscar(nroauditoria.Text) then Begin
        IniciarDatos;
        nroauditoria.Text := n;
        fecha.SetFocus;
      end else CargarDatos;
  end;
end;

procedure TfmAuditoria.fechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then nroauditoria.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fecha) then codos.SetFocus;
end;

procedure TfmAuditoria.codosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then fecha.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codos.Text) then BuscarObraSocialClick(Sender) else CargarDatosObraSocial;
end;

procedure TfmAuditoria.BuscarObraSocialClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.expresion.CharCase := ecUpperCase;
  fmListObrasSociales.ShowModal;
  Refresh;
  if fmListObrasSociales.seleccionOK then Begin
    codos.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocial;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmAuditoria.BuscarZonaClick(Sender: TObject);
begin
  Application.CreateForm(TfmListZonas, fmListZonas);
  fmListZonas.introSalir := True;
  fmListZonas.ShowModal;
  if fmListZonas.seleccionOK then Begin
    Idzona.Text := zonas.tabla.FieldByName('idzona').AsString;
    CargarDatosZona;
  end;
  fmListZonas.Release; fmListZonas := nil;
end;

procedure TfmAuditoria.btnAplicarCambiosGeneralesClick(Sender: TObject);
begin
  AssignFile(archivo, dbs.DirSistema + '\audit_1.ini');
  rewrite(archivo);
  writeln(archivo, Panel16.Height);
  writeln(archivo, Entidad.Text);
  writeln(archivo, LineasDet.Text);
  writeln(archivo, Etiquetas.Text);
  writeln(archivo, IntToStr(CA.ColWidths[1]));
  writeln(archivo, IntToStr(CR.ColWidths[1]));
  writeln(archivo, retomarImpr.Text);
  writeln(archivo, lineassep.Text);
  if ingresos.Checked then writeln(archivo, '1') else writeln(archivo, '0');
  writeln(archivo, fuente_barra.Text);
  writeln(archivo, scrollhc.Text);
  writeln(archivo, IntToStr(Panel5.Width));
  if desactivarCod.Checked then writeln(archivo, 'S') else writeln(archivo, 'N');
  if ImpresionModoTexto.Checked then writeln(archivo, 'S') else writeln(archivo, 'N');
  writeln(archivo, lineasseppag.Text);
  writeln(archivo, lineaSepOrdenesTxt.Text);
  writeln(archivo, EtiqPag.Text);
  if activarSalto.Checked then writeln(archivo, 'S') else writeln(archivo, 'N');
  if registrarDerivacion.Checked then writeln(archivo, 'S') else writeln(archivo, 'N');
  if Length(Trim(vfax)) > 0  then writeln(archivo, vfax);
  if Length(Trim(vimpr)) > 0 then writeln(archivo, vimpr);
  writeln(archivo, altoPag.Text);
  if Checkbox8.Checked then writeln(archivo, '1') else writeln(archivo, '0');
  if tablaOMS.Checked then writeln(archivo, '1') else writeln(archivo, '0');
  closeFile(archivo);
end;

procedure TfmAuditoria.idzonaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codos.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    idzona.Text := utiles.sLlenarIzquierda(idzona.Text, 2, '0');
    if not zonas.Buscar(idzona.Text) then BuscarZonaClick(Sender) else CargarDatosZona;
  end;
end;

procedure TfmAuditoria.nrodocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then idzona.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nrodoc.Text)) = 0 then btnBuscarAfiliadoClick(Sender) else Begin
      if not padron.Buscar(codos.Text, nrodoc.Text) then Begin
        if utiles.msgSiNo('El Nro. de Documento ' + nrodoc.Text + ' no está en el Padron de ' + nos.Caption + ',' + chr(13) + 'Desea Incorporalo ?') then Begin
          nombre.Enabled := True;
          nombre.SetFocus;
        end else nrodoc.Text := '';
      end else
        CargarDatosAfiliado;

      CargarHistorial(HistoriaClinica);
      StatusBar1.Panels[0].Text := 'PageUp / PageDown Recorrer Historial Paciente';
    end;
end;

procedure TfmAuditoria.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then Begin
    nrodoc.SetFocus;
    nombre.Enabled := False;
  end else
   if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then Begin
      padron.Guardar(codos.Text, nrodoc.Text, nombre.Text, '', '');
      nombre.Enabled := False;
      nprofesional.SetFocus;
    end;
end;

procedure TfmAuditoria.BuscarMedicoClick(Sender: TObject);
begin
  if (auditoriacb.Online <> 'S') then begin
    medico.FiltrarActivos;
    Application.CreateForm(TfmListMedicos, fmListMedicos);
    fmListMedicos.introSalir := True;
    fmListMedicos.expresion.Text := nprofesional.Text;
    fmListMedicos.ShowModal;
    if fmListMedicos.seleccionOK then Begin
      idprof.Caption := medico.tabla.FieldByName('idprof').AsString;
      CargarDatosMedico;
    end;
    fmListMedicos.Release; fmListMedicos := nil;
  end;
  if (auditoriacb.Online = 'S') then begin
    Application.CreateForm(TfmListMedicosAuditoria, fmListMedicosAuditoria);
    medicoos.Filtrar(codos.Text);
    fmListMedicosAuditoria.introSalir := True;
    fmListMedicosAuditoria.expresion.Text := nprofesional.Text;
    fmListMedicosAuditoria.ShowModal;
    if fmListMedicosAuditoria.seleccionOK then Begin
      idprof.Caption := medicoos.tabla.FieldByName('idprof').AsString;
      CargarDatosMedico;
    end;
    medicoos.QuitarFiltro;
    fmListMedicosAuditoria.Release; fmListMedicosAuditoria := nil;
  end;
end;

procedure TfmAuditoria.nprofesionalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Buscado: Boolean;
begin
  obs.Visible := False;
  if Key = VK_UP then
    if (Length(Trim(nombre.Text)) = 0) or not (nombre.Enabled) then nrodoc.SetFocus else Begin
      nombre.Enabled := True;
      nombre.setFocus;
    end;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if medico.Buscar(idprof.Caption) then CargarDatosMedico else Begin
    if Length(Trim(nprofesional.Text)) = 0 then BuscarMedicoClick(Sender) else Begin
    Buscado := False;
    if not (auditoriacb.Existe) or (modProf) then
      if medico.ExistenProfIgualNombre(nprofesional.Text) then Begin
        BuscarMedicoClick(Self);
        Buscado := True;
      end else Begin
        if medico.BuscarPorNombre(nprofesional.Text) then Begin
          idprof.Caption := medico.tabla.FieldByName('idprof').AsString;
          CargarDatosMedico;
        end;
      end;
    if not Buscado then
      if not medico.Buscar(idprof.Caption) then BuscarMedicoClick(Self) else Begin
        CargarDatosMedico;
      end;
    end;
    end;
  end;
end;

procedure TfmAuditoria.iddiagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then obsdiagnostico.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if (auditoriacb.Online <> 'S') then begin
      if Length(Trim(iddiag.Text)) = 0 then btnBuscarDiagnosticoClick(Self) else Begin
        if not tablaOMS.Checked then Begin
          iddiag.Text := utiles.sLlenarIzquierda(iddiag.Text, 4, '0');
          if not diagnostico.Buscar(iddiag.Text) then btnBuscarDiagnosticoClick(Self) else CargarDatosDiagnostico;
        end else Begin
          iddiag.Text := utiles.sLlenarIzquierda(iddiag.Text, 5, '0');
          dxx := iddiag.Text;
          if not (diagnosticooms.BuscarCodRap(iddiag.Text)) and not (diagnosticooms.Buscar(iddiag.Text)) then btnBuscarDiagnosticoClick(Self) else CargarDatosDiagnostico;
        end;
      end;
    end;

    if (auditoriacb.Online = 'S') then begin
      if (diagnosticooms.Buscar(iddiag.Text)) then CargarDatosDiagnostico else btnBuscarDiagnosticoClick(Self);
    end;
  End;
end;

procedure TfmAuditoria.fechaderivacionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codosfact.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(fechaderivacion.Text)) < 8 then nroderivacion.setFocus else
      if utiles.ctrlFecha(fechaderivacion) then nroderivacion.SetFocus;
end;

procedure TfmAuditoria.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAuditoria.nroderivacionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then fechaderivacion.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if ControlarDatosIngresados then Begin
      Panel6.Enabled := True;
      CA.Enabled     := True;
      codautorizado.SetFocus;
    end else
      utiles.msgError('Se Detectaron Datos Erróneos o Incompletos, Verifíquelos y Corríjalos para Continuar ...!');
end;

procedure TfmAuditoria.BuscarCodigosAutorizadosClick(Sender: TObject);
begin
  if obsocial.FactNBU = 'N' then Begin
    Application.CreateForm(TfmListNomeclador, fmListNomeclador);
    fmListNomeclador.introSalir := True;
    fmListNomeclador.ShowModal;
    if fmListNomeclador.seleccionOK then Begin
      codautorizado.Text := nomeclatura.tabla.FieldByName('codigo').AsString;
      CargarDatosNomeclaturaCodAutorizados;
    end;
    fmListNomeclador.Release; fmListNomeclador := nil;
    codautorizadoChange(Sender);
  end;

  if obsocial.FactNBU = 'S' then Begin
    Application.CreateForm(TfmListNBU, fmListNBU);
    fmListNBU.introSalir := True;
    fmListNBU.ShowModal;
    if fmListNBU.seleccionOK then Begin
      codautorizado.Text := nbu.tabla.FieldByName('codigo').AsString;
      CargarDatosNomeclaturaCodAutorizados;
    end;
    fmListNBU.Release; fmListNBU := nil;
    codautorizadoChange(Sender);
  end;
end;

procedure TfmAuditoria.BuscarCodigosRechazadosClick(Sender: TObject);
begin
  if obsocial.FactNBU = 'N' then Begin
    Application.CreateForm(TfmListNomeclador, fmListNomeclador);
    fmListNomeclador.introSalir := True;
    fmListNomeclador.ShowModal;
    if fmListNomeclador.seleccionOK then Begin
      codrechazado.Text := nomeclatura.tabla.FieldByName('codigo').AsString;
      CargarDatosNomeclaturaCodRechazados;
    end;
    fmListNomeclador.Release; fmListNomeclador := nil;
    codrechazadoChange(Sender);
  end;

  if obsocial.FactNBU = 'S' then Begin
    Application.CreateForm(TfmListNBU, fmListNBU);
    fmListNBU.introSalir := True;
    fmListNBU.ShowModal;
    if fmListNBU.seleccionOK then Begin
      codrechazado.Text := nbu.tabla.FieldByName('codigo').AsString;
      CargarDatosNomeclaturaCodRechazados;
    end;
    fmListNBU.Release; fmListNBU := nil;
    codrechazadoChange(Sender);
  end;
end;

procedure TfmAuditoria.codautorizadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then iddiag.SetFocus;
  if Key = VK_ESCAPE then
    if items1 >= 0 then Begin   // Si al menos hay una determinación ingresada
    Panel7.Enabled := True;
    CR.Enabled     := True;
    codrechazado.SetFocus;
  end;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ControlarCodigosAutorizados;
end;

procedure TfmAuditoria.codrechazadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Estado: Boolean;
begin
  if Key = VK_UP then codautorizado.SetFocus;
  if Key = VK_ESCAPE then
    if items1 >= 0 then Begin
      Estado            := Panel16.Visible;
      Panel16.Visible   := False;
      Splitter2.Visible := False;
      Panel12.Enabled   := True;
      Panel12.Height    := 29;
      //observacion.Width := (Panel12.Width div 2);
      observacion.SetFocus;
      Panel16.Visible   := Estado;
      Splitter2.Visible := Estado;
    end;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ControlarCodigosRechazados;
end;

procedure TfmAuditoria.btnRegistrarClick(Sender: TObject);
var
  i, j: Integer;
  regist_orden, ini_dat: Boolean;
begin
  auditoriacb.Buscar(nroauditoria.Text);
  if PageControl1.ActivePage = TabSheet1 then Begin
    if not auditoriacb.Existe then regist_orden := True else
      if utiles.msgSiNo('La Orden ' + nroauditoria.Text + ' ya está Registrada,' + chr(13) + 'Seguro para Volverla a Registrar ?') then regist_orden := True else ini_dat := True;
  end else
    regist_orden := True;

  if (regist_orden) then Begin
    if (ControlarDatosIngresados) and (items1 + items2 > 0) then Begin
      if not (auditoriacb.Existe) then nroauditoria.Text := utiles.sLlenarIzquierda(auditoriacb.setNuevoNroAuditoria, 10, '0');
      StatusBar1.Panels[0].Text := 'Registrando Orden ' + nroauditoria.Text + ' ...!'; StatusBar1.Refresh;
      auditoriacb.Registrar(nroauditoria.Text, fecha.Text, codos.Text, idzona.Text, nrodoc.Text, nombre.Text, idprof.Caption, obsdiagnostico.Text, fechaderivacion.Text, nroderivacion.Text, observacion.Text, codosfact.Text, fepedido.Text, idprofcab, iddiag.Text, obsfinal.Caption, r_log, auditoriacb.Online, 'N', '', '');
      For i := 1 to items1 do auditoriacb.RegistrarItems(nroauditoria.Text, utiles.sLlenarIzquierda(IntToStr(i), 3, '0'), CA.Cells[0, i], CA.Cells[1, i], 'A', StrToFloat(CA.Cells[2, i]), StrToFloat(CA.Cells[3, i]), items1 + items2, r_log, 'N', 'N', StrToFloat(CA.Cells[3, i]), StrToFloat(CA.Cells[4, i]));
      j := items1;
      For i := 1 to items2 do Begin
        Inc(j);
        auditoriacb.RegistrarItems(nroauditoria.Text, utiles.sLlenarIzquierda(IntToStr(j), 3, '0'), CR.Cells[0, i], CR.Cells[1, i], 'R', 0, 0, items1 + items2, r_log, 'N', 'N', 0, 0);
      end;
      auditoriacb.RegistrarTotalMensual(codos.Text, fecha.Text, StrToFloat(totmes.Caption));
      ini_dat := True;
    end else
      if (items1 + items2 = 0) then utiles.msgError('No Hay Determinaciones Ingresadas ...!');
  end;

  if ini_dat then Begin
    IniciarDatos;
    obsocial.getDatos(codos.Text);
    btnRegistrar.Enabled := False;
    if PageControl1.ActivePage = TabSheet1 then
      if not CheckBox3.Checked then nrodoc.SetFocus else nroauditoria.SetFocus;
    //MessageBeep(MB_OK);
  end;

  mov_auditoria := True;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmAuditoria.CADblClick(Sender: TObject);
begin
  if Panel6.Enabled then Begin
    Modificado1         := True;
    codautorizado.Text  := CA.Cells[0, CA.Row];
    detaceptada.Caption := CA.Cells[1, CA.Row];
    codautorizado.SetFocus;
  end else CA.Row := 1;
end;

procedure TfmAuditoria.CRDblClick(Sender: TObject);
begin
  if Panel7.Enabled then Begin
    Modificado2 := True;
    codrechazado.Text    := CR.Cells[0, CR.Row];
    detrechazada.Caption := CR.Cells[1, CR.Row];
    codrechazado.SetFocus;
  end else CR.Row := 1;
end;

procedure TfmAuditoria.CAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Panel6.Enabled then Begin
   if Key = VK_DELETE then
    if utiles.msgSiNo('Seguro para Eliminar Determinación ' + CA.Cells[1, CA.Row]) then Begin
      totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) - StrToFloat(CA.Cells[2, CA.Row])));
      grid.BorrarRenglon_SinRenumerar(CA);
      Dec(items1);
      TotalDeterminaciones;
    end;
   codautorizado.SetFocus;
  end;
end;

procedure TfmAuditoria.CRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Panel6.Enabled then Begin
    if Key = VK_DELETE then
      if utiles.msgSiNo('Seguro para Eliminar Determinación ' + CR.Cells[1, CR.Row]) then Begin
        grid.BorrarRenglon_SinRenumerar(CR);
        Dec(items2);
      end;
    if Panel7.Enabled then codrechazado.SetFocus else
      if Panel6.Enabled then codautorizado.SetFocus;
  end;
end;

procedure TfmAuditoria.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  nroauditoria.Text := auditoriacb.cabauditoria.FieldByName('nroauditoria').AsString;
  CargarDatos;
end;

procedure TfmAuditoria.observacionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codosfact.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    btnRegistrar.Enabled := True;
    btnRegistrar.SetFocus;
  end;
end;

procedure TfmAuditoria.listNroClick(Sender: TObject);
begin
  if listNro.Checked then Begin
    desdeNro.Enabled := True; hastaNro.Enabled := True;
    desdeFecha.Text := ''; hastaFecha.Text := ''; desdeFecha.Enabled := False; hastaFecha.Enabled := False;
  end;
end;

procedure TfmAuditoria.listFechaClick(Sender: TObject);
begin
  if listFecha.Checked then Begin
    desdeFecha.Enabled := True; hastaFecha.Enabled := True;
    desdeNro.Text := ''; hastaNro.Text := ''; desdeNro.Enabled := False; hastaNro.Enabled := False;
  end;
end;

procedure TfmAuditoria.desdeNroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    desdeNro.Text := utiles.sLlenarIzquierda(desdeNro.Text, 10, '0');
    listNro.Checked := True;
    hastaNro.SetFocus;
  end;
end;

procedure TfmAuditoria.hastaNroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    hastaNro.Text := utiles.sLlenarIzquierda(hastaNro.Text, 10, '0');
    btnDispositivo.SetFocus;
  end;
end;

procedure TfmAuditoria.listNroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then desdeNro.SetFocus;
end;

procedure TfmAuditoria.listFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then desdeFecha.SetFocus;
end;

procedure TfmAuditoria.desdeFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if utiles.ctrlFecha(desdeFecha) then hastaFecha.SetFocus;
end;

procedure TfmAuditoria.hastaFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if utiles.ctrlFecha(hastaFecha) then btnDispositivo.SetFocus;
end;

procedure TfmAuditoria.btnDispositivoClick(Sender: TObject);
begin
  if not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
  Dispositivo.ShowModal;
  ActiveControl := btnEmitir;
end;

procedure TfmAuditoria.btnEmitirClick(Sender: TObject);
var
  salida: Char;
begin
  if listNro.Checked then Begin
    desdeNro.Text := utiles.sLlenarIzquierda(desdeNro.Text, 10, '0');
    hastaNro.Text := utiles.sLlenarIzquierda(hastaNro.Text, 10, '0');
  end;
  auditoriacb.ImpresionModoTexto := ImpresionModoTexto.Checked;
  auditoriacb.SaltarPagina       := activarSalto.Checked;
  StatusBar1.Panels[0].Text := 'Generando Informe ...!'; StatusBar1.Refresh;
  auditoriacb.Entidad               := Entidad.Text;
  if desactivarCod.Checked then auditoriacb.ImprimeCodigoBarras := False else auditoriacb.ImprimeCodigoBarras := True;
  if not infauditoria.Checked then Begin

  if not impresionModoTexto.Checked then Begin
    auditoriacb.EtiquetasPorPagina    := StrToInt(Etiquetas.Text);
    auditoriacb.ItemsPorDeterminacion := StrToInt(LineasDet.Text);
  end else Begin
    auditoriacb.EtiquetasPorPagina    := StrToInt(EtiqPag.Text);
    auditoriacb.ItemsPorDeterminacion := StrToInt(LineasDet.Text);
    auditoriacb.LineasTxt             := StrToInt(altoPag.Text);
    auditoriacb.SeparacionPaginas     := StrToInt(lineasSepPag.Text);
  end;

  if not ImpresionModoTexto.Checked then
    if Length(Trim(lineassep.Text)) > 0 then auditoriacb.LineasSeparacionEtiquetas := StrToInt(lineassep.Text);

  if ImpresionModoTexto.Checked then
    if Length(Trim(lineaSepOrdenesTxt.Text)) > 0 then auditoriacb.LineasSeparacionEtiquetas := StrToInt(lineaSepOrdenesTxt.Text);

  if retomar.Checked then Begin
    desdeNro.Text := retomarImpr.Text;
    hastaNro.Text := '99999999';
  end;

  salida := 'P';
  if not Dispositivo.Impresor.Checked then auditoriacb.ImpresionModoTexto := False;
  if not Dispositivo.Impresor.Checked then imprimir.Checked := False;
  if (Dispositivo.Impresor.Checked) or (imprimir.Checked) then salida := 'I';

  if not (efax) and (Length(Trim(vimpr)) >= 0) and (salida = 'I') then Begin  // Redireccionamos la impresora
    if Not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
    Dispositivo.Impresor.Checked := True;
    Application.CreateForm(TfmConfigImpresora, fmConfigImpresora);
    fmConfigImpresora.seleccionar_impresora := vimpr;   // Indice Impresora
    fmConfigImpresora.FormShow(Self);                   // Load Seteos
  end;

  if (listNro.Checked) or (retomar.Checked) then
    if (Length(Trim(desdeNro.Text)) > 0) and (Length(Trim(hastaNro.Text)) > 0) then
      if auditoriacb.Buscar(desdeNro.Text) then auditoriacb.ListarOrden(desdeNro.Text, hastaNro.Text, '', '', '', fuente_barra.Text, salida) else utiles.msgError('El Número Inicial de Auditoria No Existe ...!');
  if listFecha.Checked then
    if (Length(Trim(desdeFecha.Text)) > 0) and (Length(Trim(hastaFecha.Text)) > 0) then auditoriacb.ListarOrden('', '', desdeFecha.Text, hastaFecha.Text, '', fuente_barra.Text, salida);
  if salida = 'I' then
    if retomar.Checked then
      if Length(Trim(auditoriacb.UltimaOrdenImpresa)) > 0 then retomarImpr.Text := utiles.sLlenarIzquierda(IntToStr(StrToInt(auditoriacb.UltimaOrdenImpresa) + 1), 10, '0');

  if retomar.Checked then Begin
    desdeNro.Text := '';
    hastaNro.Text := '';
  end;

  if ordenesfac.Checked then auditoriacb.InfControlOrdenesFacturadas(df.Text, hf.Text, salida);

  imprimir.Checked := True;
  end;

  if infauditoria.Checked then Begin
    salida := 'P';
    if Dispositivo.Impresor.Checked then salida := 'I';

    if infDetAutorizadas.Checked then
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarOrdenesAutorizadas(fmEleObraSociales.lista, fadesde.Text, fahasta.Text, salida, CheckBox5.Checked);
    if infDetRechazadas.Checked then
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarOrdenesRechazadas(fmEleObraSociales.lista, fadesde.Text, fahasta.Text, salida, CheckBox5.Checked);
    if infTabularOS.Checked then
      auditoriacb.ListarTotalesDiariosOS(fadesde.Text, fahasta.Text, salida, '1');
    if infTabularInd.Checked then
      auditoriacb.ListarTotalesDiariosOS(fadesde.Text, fahasta.Text, salida, '2');
    if infEstMedico.Checked then Begin
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarEstadisticaMedicos(fmEleMedicos.lista, fadesde.Text, fahasta.Text, salida);
      infEstMedico.Checked := False;
    end;
  end;

  if Assigned(fmConfigImpresora) then Begin
    fmConfigImpresora.Release; fmConfigImpresora := nil;
  end;

  if PageControl1.ActivePage = TabSheet2 then btnCerrar.SetFocus;

  efax := False;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmAuditoria.btnCerrarClick(Sender: TObject);
begin
  fadesde.Text := ''; fahasta.Text := '';
  PageControl1.ActivePage := TabSheet1;
end;

procedure TfmAuditoria.BajaClick(Sender: TObject);
begin
  if auditoriacb.Buscar(nroauditoria.Text) then
    if utiles.BajaRegistro('Seguro para Eliminar Auditorían Nº  ' + nroauditoria.Text) then Begin
      auditoriacb.Borrar(nroauditoria.Text);
      totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) - StrToFloat(totreceta.Caption)));
      auditoriacb.RegistrarTotalMensual(codos.Text, fecha.Text, StrToFloat(totmes.Caption));
      nroauditoria.Text := auditoriacb.cabauditoria.FieldByName('nroauditoria').AsString;
      mov_auditoria     := True;
      btnCancelarClick(Self);
    end;
end;

procedure TfmAuditoria.TabSheet1Show(Sender: TObject);
begin
  DBNavigator.Enabled := True; Alta.Enabled := True; Baja.Enabled := True; Modificar.Enabled := True; Buscar.Enabled := True; Deshacer.Enabled := True;
  if nuevo_nro then Begin
    btnCancelarClick(Self);
    nroauditoria.Text := ultimoNro.Text;
  end;
  nuevo_nro := False;
  if Length(Trim(codos.Text)) > 0 then idzona.SetFocus else codos.SetFocus;
  Refresh;
end;

procedure TfmAuditoria.TabSheet1Hide(Sender: TObject);
begin
  DBNavigator.Enabled := False; Alta.Enabled := False; Baja.Enabled := False; Modificar.Enabled := False; Buscar.Enabled := False; Deshacer.Enabled := False;
end;

procedure TfmAuditoria.btnAplicarClick(Sender: TObject);
begin
  if Length(Trim(ultimoNro.Text)) > 0 then Begin
    ultimoNro.Text := utiles.sLlenarIzquierda(ultimoNro.Text, 10, '0');
    if not auditoriacb.Buscar(ultimoNro.Text) then Begin
      btnAplicar.Enabled := False;
      nroaudit := utiles.sLlenarIzquierda(auditoriacb.setNuevoNroAuditoria, 10, '0');
      nroauditoria.Text := nroaudit;
      nuevo_nro := True;
      PageControl1.ActivePage := TabSheet1;
    end else utiles.msgError('Este Número ya está Registrado ...!');
  end;
end;

procedure TfmAuditoria.ultimoNroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    ultimoNro.Text := utiles.sLlenarIzquierda(ultimoNro.Text, 10, '0');
    btnAplicar.SetFocus;
  end;
end;

procedure TfmAuditoria.AltaClick(Sender: TObject);
begin
  IniciarDatos;
end;

procedure TfmAuditoria.TabSheet3Show(Sender: TObject);
begin
  ultimoNro.Text := utiles.sLlenarIzquierda(IntToStr(StrToInt(auditoriacb.setNuevoNroAuditoria) -1), 10, '0');
  monto.Text := utiles.FormatearNumero('0');
  tot_m.Caption  := utiles.FormatearNumero('0');
  codos1.Text    := '';
  oss.Caption    := '';
  btnAplicar.Enabled := False;
end;

procedure TfmAuditoria.BuscarClick(Sender: TObject);
begin
  Application.CreateForm(TfmBuscarAuditoria, fmBuscarAuditoria);
  fmBuscarAuditoria.ShowModal;
  if fmBuscarAuditoria.btnOK.Enabled then Begin
    nroauditoria.Text := fmBuscarAuditoria.A.Cells[0, fmBuscarAuditoria.A.Row];
    Refresh;
    CargarDatos;
  end;
  fmBuscarAuditoria.Release; fmBuscarAuditoria := nil;
end;

procedure TfmAuditoria.codos1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codos1.Text) then btnBuscarOSClick(Sender) else CargarDatosObraSocial1;
end;

procedure TfmAuditoria.btnBuscarOSClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codos1.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocial1;
  end else codos1.SetFocus;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmAuditoria.montoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codos1.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(monto.Text)) > 0 then Begin
      monto.Text := utiles.FormatearNumero(monto.Text);
      auditoriacb.EstablecerTope(codos1.Text, StrToFloat(monto.Text));
      fecha_rec.SetFocus;
    end;
end;

procedure TfmAuditoria.btnBorrarTopeClick(Sender: TObject);
begin
  if auditoriacb.BuscarTopes(codos1.Text) then
    if utiles.BajaRegistro('Tope en Obra Social ' + codos1.Text) then
      auditoriacb.BorrarTopes(codos1.Text);
  codos1.setFocus;
end;

procedure TfmAuditoria.btnBuscarAfiliadoClick(Sender: TObject);
begin
  Application.CreateForm(TfmListAfiliados, fmListAfiliados);
  fmListAfiliados.Caption := fmListAfiliados.Caption + '   ' + obsocial.codos + '-' + obsocial.Nombre;
  fmListAfiliados.codos := obsocial.codos;
  fmListAfiliados.os    := obsocial.Nombre;
  fmListAfiliados.introSalir := True;
  fmListAfiliados.ShowModal;
  Refresh;
  if fmListAfiliados.seleccionOK then Begin
    //nrodoc.Text := padron.getNrodoc;
    nrodoc.Text := fmListAfiliados.nrodoc;
    padron.getDatos(codos.Text, nrodoc.Text);
    nombre.Text := padron.Nombre;
    CargarHistorial(HistoriaClinica);
    nprofesional.SetFocus;
  end;
  fmListAfiliados.Release; fmListAfiliados := nil;
end;

procedure TfmAuditoria.ultimoNroChange(Sender: TObject);
begin
  btnAplicar.Enabled := True;
end;

procedure TfmAuditoria.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Caption = '&Ajustar Nº' then Begin
    retomarImpr.Enabled := True;
    retomarImpr.SetFocus;
    CheckBox1.Caption := '&Aplicar';
  end else Begin
    if CheckBox1.Caption = '&Aplicar' then Begin
      retomarImpr.Text := utiles.sLlenarIzquierda(retomarImpr.Text, 10, '0');
      if auditoriacb.Buscar(retomarImpr.Text) then Begin
        CheckBox1.Caption   := '&Ajustar Nº';
        CheckBox1.Checked   := False;
        retomarImpr.Enabled := False;
      end else Begin
        utiles.msgError('El Número Suministrado es Incorrecto ...!');
        CheckBox1.Checked := False;
      end;
    end;
  end;
end;

procedure TfmAuditoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sc: Integer;
begin
  if Key = VK_F5 then btnReanudarClick(Self);
  if (Key = VK_PRIOR) or (Key = VK_NEXT) then Begin
    if (PageControl1.ActivePage = TabSheet1) and (HistoriaClinica.Visible) then Begin
      if Length(Trim(scrollhc.Text)) > 0 then sc := StrToInt(scrollhc.Text) else sc := 1;
      if (Key = VK_PRIOR) and (HistoriaClinica.Row > 0) then
        if HistoriaClinica.Row - sc >= 0 then HistoriaClinica.Row := HistoriaClinica.Row - sc else HistoriaClinica.Row := 1;
      if (Key = VK_NEXT) and (HistoriaClinica.Row < HistoriaClinica.RowCount) then HistoriaClinica.Row := HistoriaClinica.Row + sc;
      HistoriaClinica.Refresh;
    end;
  end;

  if Key = VK_F9 then
    if obsocial.Buscar(codos.Text) then Begin
      if sino_obs then Begin
        obsfinal.Caption := '';
        sino_obs := False;
      end else Begin
        auditoriacb.getDatosObs(codos.Text);
        obsfinal.Caption := auditoriacb.Observacfinal;
        sino_obs := True;
      end;
    end else
      utiles.msgError('No se Definió la Obra Social ...!');
end;

procedure TfmAuditoria.retomarImprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    retomarImpr.Text := utiles.sLlenarIzquierda(retomarImpr.Text, 10, '0');
    if auditoriacb.Buscar(retomarImpr.Text) then CheckBox1.Checked := False else utiles.msgError('El Número Suministrado es Incorrecto ...!');
  end;
end;

procedure TfmAuditoria.btnRecalcularTMClick(Sender: TObject);
begin
  Refresh;
  if obsocial.Buscar(codos1.Text) then Begin
    //obsocial.SincronizarArancel(codos.Text, Copy(fecha_rec.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha_rec.Text), 1, 4));
    obsocial.SincronizarArancel(codos1.Text, Copy(fecha_rec.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha_rec.Text), 1, 4));
    UB1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UB));
    UG1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UG));
    StatusBar1.Panels[0].Text := 'Recalculando total mensual obra social ...!'; StatusBar1.Refresh;
    totmes.Caption := utiles.FormatearNumero(FloatToStr(auditoriacb.setRecalcularTotalAnalisisMensual(fecha_rec.Text, codos1.Text, recalcularMontos.Checked)));
    tot_m.Caption  := totmes.Caption;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
    recalcularMontos.Checked := False;
  end else utiles.msgError('Obra Social Incorrecta ...!');
  codos1.SetFocus;
end;

procedure TfmAuditoria.btnCancelarClick(Sender: TObject);
begin
  IniciarDatos;
  codos.Text := '';
end;

procedure TfmAuditoria.ordenesfacClick(Sender: TObject);
begin
  if ordenesfac.Checked then Begin
    df.Enabled := True;
    df.SetFocus;
  end;
end;

procedure TfmAuditoria.ordenesfacKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ordenesfacClick(Sender);
end;

procedure TfmAuditoria.dfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if utiles.ctrlFecha(df) then Begin
      hf.Enabled := True;
      hf.SetFocus;
    end;
end;

procedure TfmAuditoria.hfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ordenesfac.SetFocus;
  if Key = VK_RETURN then
    if utiles.ctrlFecha(hf) then btnDispositivo.SetFocus;
end;

procedure TfmAuditoria.btnReanudarClick(Sender: TObject);
begin
  if retomar.Checked then
    if Length(Trim(retomarImpr.Text)) = 0 then utiles.msgError('No se ha Establecido El Nro. de Impresión donde' + chr(13) + 'la misma debe Retomarse.') else Begin
      if utiles.msgSiNo('Retomar Impresión a partir de Orden Número: ' + retomarImpr.Text + ' ?') then Begin
        Dispositivo.Impresor.Checked := True;
        retomar.Checked := True;
        btnEmitirClick(Sender);
        Dispositivo.Pantalla.Checked := True;
      end;
      if PageControl1.ActivePage = TabSheet1 then codos.SetFocus;
  end;
end;

procedure TfmAuditoria.codautorizadoChange(Sender: TObject);
begin
  if (ingresos.Checked) and (Length(Trim(codautorizado.Text)) = codautorizado.MaxLength) and not (modificado1) then ControlarCodigosAutorizados;
end;

procedure TfmAuditoria.codrechazadoChange(Sender: TObject);
begin
  if (obsocial.Factnbu = 'N') then
    if (ingresos.Checked) and (Length(Trim(codrechazado.Text)) = 4) and not (modificado2) then ControlarCodigosRechazados;
  if (obsocial.Factnbu = 'S') then
    if (ingresos.Checked) and (Length(Trim(codrechazado.Text)) = 6) and not (modificado2) then ControlarCodigosRechazados;
end;

procedure TfmAuditoria.nprofesionalChange(Sender: TObject);
begin
  if Length(Trim(nprofesional.Text)) <= 1 then idprof.Caption := '';
  modProf := True;
end;

procedure TfmAuditoria.naKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    na.Text := utiles.sLlenarIzquierda(na.Text, 10, '0');
    if auditoriacb.Buscar(na.Text) then Begin
      auditoriacb.getDatos(na.Text);
      lab.Caption := auditoriacb.Laboratorio;
      if Length(Trim(lab.Caption)) > 0 then Begin
        profesional.conectar;
        profesional.getDatos(lab.Caption);
        dl.Caption := profesional.nombre;
        profesional.desconectar;
        btnAnular.Enabled := True;
      end else Begin
        dl.Caption := 'Orden No Facturada';
        btnAnular.Enabled := False;
      end;
    end;
  end;
end;

procedure TfmAuditoria.btnConsultarLogClick(Sender: TObject);
begin
  logs.Lines.Clear;
  if utiles.ctrlFecha(fechaLog) then Begin
    arch := auditoriacb.Logs(fechaLog.Text);
    if Length(Trim(arch)) > 0 then logs.Lines.LoadFromFile(arch) else logs.Lines.Add('Sin Registro');
  end;
  btnGuardar.Enabled := False;
end;

procedure TfmAuditoria.fechaLogKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if utiles.ctrlFecha(fechaLog) then btnConsultarLog.SetFocus;
end;

procedure TfmAuditoria.TabSheet4Show(Sender: TObject);
begin
  fechaLog.Text := utiles.setFechaActual;
  fechaLog.SetFocus;
end;

procedure TfmAuditoria.LogsChange(Sender: TObject);
begin
  if logs.Lines.Count > 1 then btnGuardar.Enabled := True else btnGuardar.Enabled := False;
end;

procedure TfmAuditoria.btnGuardarClick(Sender: TObject);
begin
  if Length(Trim(arch)) > 0 then logs.Lines.SaveToFile(arch);
end;

procedure TfmAuditoria.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then logs.ReadOnly := False else logs.ReadOnly := True;
end;

procedure TfmAuditoria.TabSheet4Hide(Sender: TObject);
begin
  CheckBox2.Checked := False;
  Logs.Lines.Clear;
end;

procedure TfmAuditoria.btnRestaurarClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Restaurar Datos a Partir del Log ?') then Begin
    dNro.Text := Copy(logs.Lines[0], 1, 10);
    for i := 1 to logs.Lines.Count do
      if Copy(logs.Lines[i-1], 5, 1) <> '-' then hNro.Text := Copy(logs.Lines[i-1], 1, 10);
    Panel37.Visible := True;
    dNro.SetFocus;
  end;
end;

procedure TfmAuditoria.btnSeleccionOSClick(Sender: TObject);
begin
///
end;

procedure TfmAuditoria.btnIniciarClick(Sender: TObject);
var
  i, j, k: Integer; proc: Boolean;
begin
  r_log := True;
  for i := 1 to logs.Lines.Count do Begin
    if Copy(logs.Lines[i-1], 5, 1) <> '-' then
      if (Copy(logs.Lines[i-1], 1, 10) >= dNro.Text) and (Copy(logs.Lines[i-1], 1, 10) <= hNro.Text) then proc := True else proc := False;

    if proc then Begin
      if (Copy(logs.Lines[i-1], 5, 1) <> '-') and (Length(Trim(nroauditoria.Text)) > 0) and (j+k > 0) then btnRegistrarClick(Self);
      StatusBar1.Panels[0].Text := 'Procesando Orden ' + Copy(logs.Lines[i-1], 1, 10); StatusBar1.Refresh;
      if Copy(logs.Lines[i-1], 5, 1) <> '-' then Begin    // Datos de Cabecera
        Nroauditoria.Text    := Copy(logs.Lines[i-1], 1, 10);
        fecha.Text           := utiles.sFormatoFecha(Copy(logs.Lines[i-1], 12, 8));
        codos.Text           := Copy(logs.Lines[i-1], 21, 6);
        CargarDatosObraSocial;
        idzona.Text          := Copy(logs.Lines[i-1], 28, 2);
        CargarDatosZona;
        nrodoc.Text          := Trim(Copy(logs.Lines[i-1], 31, 10));
        padron.getDatos(codos.Text, nrodoc.Text);
        nombre.Text          := Copy(logs.Lines[i-1], 42, 40);
        idprof.Caption       := Copy(logs.Lines[i-1], 83, 4);
        CargarDatosMedico;
        obsdiagnostico.Text  := Copy(logs.Lines[i-1], 88, 40);
        fechaderivacion.Text := Copy(logs.Lines[i-1], 129, 8);
        nroderivacion.Text   := Copy(logs.Lines[i-1], 138, 10);
        observacion.Text     := Copy(logs.Lines[i-1], 149, 100);
        j := 0; k := 0;
      end else Begin  // Determinaciones
        if Copy(logs.Lines[i-1], 6, 1) = 'A' then Begin
          Inc(j);
          CA.Cells[0, j] := Copy(logs.Lines[i-1], 1, 4);
          CA.Cells[1, j] := Copy(logs.Lines[i-1], 8, 50);
          CA.Cells[2, j] := Trim(Copy(logs.Lines[i-1], 59, 15));
        end;
        if Copy(logs.Lines[i-1], 6, 1) = 'R' then Begin
          Inc(k);
          CR.Cells[0, k] := Copy(logs.Lines[i-1], 1, 4);
          CR.Cells[1, k] := Copy(logs.Lines[i-1], 8, 50);
        end;
        items1 := j; items2 := k;
      end;
    end;
    StatusBar1.Panels[0].Text := ' '; StatusBar1.Refresh;
  end;

  if (Length(Trim(nroauditoria.Text)) > 0) and (j+k > 0) then btnRegistrarClick(Self);

  r_log := False;

  dNro.Text := ''; hNro.Text := '';
  Panel37.Visible := False;
  fechaLog.SetFocus;
end;

procedure TfmAuditoria.btnOrdenOnLineClick(Sender: TObject);
begin
  Application.CreateForm(TfmBuscarOrdenesOnLine, fmBuscarOrdenesOnLine);
  fmBuscarOrdenesOnLine.ShowModal;
  if (length(trim(fmBuscarOrdenesOnLine.E.Cells[0, fmBuscarOrdenesOnLine.E.Row])) > 0) then begin
     nroauditoria.Text := fmBuscarOrdenesOnLine.E.Cells[0, fmBuscarOrdenesOnLine.E.Row];
     CargarDatos;
  end;
  fmBuscarOrdenesOnLine.Release; fmBuscarOrdenesOnLine := nil;
end;

procedure TfmAuditoria.InfDetAutorizadasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then btnEleccionObsocial.SetFocus;
end;

procedure TfmAuditoria.fadesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if utiles.ctrlFecha(fadesde) then Begin
      fahasta.Text := utiles.ultimodiames(Copy(fadesde.Text, 4, 2), Copy(utiles.sExprFecha2000(fadesde.Text), 1, 4)) + Copy(fadesde.Text, 3, 6);
      btnDispositivo.SetFocus;
    end;
  end;
end;

procedure TfmAuditoria.fahastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fahasta) then btnDispositivo.SetFocus;
end;

procedure TfmAuditoria.btnEleccionObsocialClick(Sender: TObject);
begin
  if not Assigned(fmEleObraSociales) then Begin
    Application.CreateForm(TfmEleObraSociales, fmEleObraSociales);
    fmEleObraSociales.CargarDatos(2);
    fmEleObraSociales.capitadas.Checked := True;
  end;
  fmEleObraSociales.ShowModal;
  fadesde.SetFocus;
end;

procedure TfmAuditoria.infauditoriaClick(Sender: TObject);
begin
  if infauditoria.Checked then GroupBox6.Enabled := True else GroupBox6.Enabled := False;
  if GroupBox6.Enabled then InfDetAutorizadas.SetFocus;
end;

procedure TfmAuditoria.fecha_recKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then monto.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fecha_rec) then Begin
      obsocial.SincronizarArancel(codos.Text, Copy(fecha_rec.Text, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha_rec.Text), 1, 4));
      UB1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UB));
      UG1.Caption  := utiles.FormatearNumero(FloatToStr(obsocial.UG));
      btnRecalcularTM.SetFocus;
    end;
end;

procedure TfmAuditoria.infTabularOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then fadesde.SetFocus;
end;

procedure TfmAuditoria.faxChange(Sender: TObject);
begin
  vfax := IntToStr(fax.ItemIndex);
end;

procedure TfmAuditoria.btnFaxClick(Sender: TObject);
var
  opcion: array[1..2] of boolean;
begin
  if utiles.VerificarSiElSgtringTieneUnNumeroValido(vfax, 'No hay Fax Seleccionado, Hágalo desde la solapa Parámetros ...!') then Begin
    opcion[1] := desactivarCod.Checked;
    opcion[2] := impresionModoTexto.Checked;
    desactivarCod.Checked      := False;
    impresionModoTexto.Checked := False;
    efax := True;
    if Not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
    Dispositivo.Impresor.Checked := True;
    Application.CreateForm(TfmConfigImpresora, fmConfigImpresora);
    fmConfigImpresora.seleccionar_impresora := vfax;   // Indice Impresora
    fmConfigImpresora.FormShow(Self);                  // Load Seteos
    btnEmitirClick(Sender);
    if Assigned(fmConfigImpresora) then Begin
      fmConfigImpresora.Release; fmConfigImpresora := nil;
    end;
    desactivarCod.Checked      := opcion[1];
    impresionModoTexto.Checked := opcion[2];
  end;
end;

procedure TfmAuditoria.retomarImprChange(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := '  Ret.Imp.: ' + retomarImpr.Text;
end;

procedure TfmAuditoria.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  StatusBar1.Panels[0].Width := Width - 255;
end;

procedure TfmAuditoria.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmAuditoria.imprOrdenesChange(Sender: TObject);
begin
  vimpr := IntToStr(imprOrdenes.ItemIndex);
end;

procedure TfmAuditoria.ucodosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(ucodos.Text) then uBuscarOSClick(Sender) else CargarDatosObraSocialHC;
end;

procedure TfmAuditoria.uBuscarOSClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.expresion.CharCase := ecUpperCase;
  fmListObrasSociales.ShowModal;
  Refresh;
  if fmListObrasSociales.seleccionOK then Begin
    ucodos.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocialHC;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmAuditoria.uNrodocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then uCodos.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(unrodoc.Text)) = 0 then uBuscarAfiliadoClick(Sender) else Begin
      if padron.Buscar(ucodos.Text, unrodoc.Text) then uDatosPaciente else uBuscarAfiliadoClick(Self);
    end;
end;

procedure TfmAuditoria.uBuscarAfiliadoClick(Sender: TObject);
begin
  Application.CreateForm(TfmListAfiliados, fmListAfiliados);
  fmListAfiliados.Caption := fmListAfiliados.Caption + '   ' + obsocial.codos + '-' + obsocial.Nombre;
  fmListAfiliados.codos := obsocial.codos;
  fmListAfiliados.os    := obsocial.Nombre;
  fmListAfiliados.introSalir := True;
  fmListAfiliados.ShowModal;
  Refresh;
  if fmListAfiliados.seleccionOK then Begin
    unrodoc.Text    := padron.getNrodoc;
    padron.getDatos(ucodos.Text, unrodoc.Text);
    unombre.Caption := padron.Nombre;
    consultarHC.SetFocus;
  end;
  fmListAfiliados.Release; fmListAfiliados := nil;
end;

procedure TfmAuditoria.TabSheet5Show(Sender: TObject);
begin
  codosref := codos.Text;
end;

procedure TfmAuditoria.TabSheet5Hide(Sender: TObject);
begin
  if Length(Trim(codosref)) > 0 then padron.conectar(codosref);
end;

procedure TfmAuditoria.consultarHCClick(Sender: TObject);
begin
  auditoriacb.Entidad := Entidad.Text;
  if (obsocial.Buscar(ucodos.Text)) and (padron.verificarPadron(ucodos.Text)) then
    if padron.Buscar(ucodos.Text, unrodoc.Text) then Begin
      StatusBar1.Panels[0].Text := 'Generando Informe ...!'; StatusBar1.Refresh;
      auditoriacb.ListarHistoriaClinica(ucodos.Text, unrodoc.Text, 'P');
      StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
      if utiles.msgSiNo('Generar una Copia Impresa ?') then auditoriacb.ListarHistoriaClinica(ucodos.Text, unrodoc.Text, 'I');
    end;
  Refresh;
  ucodos.Text := ''; unos.Caption := '';
  unrodoc.Text := ''; unombre.Caption := '';
  ucodos.SetFocus;
end;

procedure TfmAuditoria.exportarExcelClick(Sender: TObject);
begin
  if (InfDetAutorizadas.Checked) or (InfDetRechazadas.Checked) or (infEstMedico.Checked) then Begin
    StatusBar1.Panels[0].Text := 'Exportando Datos a Excel ...!'; StatusBar1.Refresh;
    if infDetAutorizadas.Checked then
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarOrdenesAutorizadas(fmEleObraSociales.lista, fadesde.Text, fahasta.Text, 'X', CheckBox5.Checked);
    if infDetRechazadas.Checked then
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarOrdenesRechazadas(fmEleObraSociales.lista, fadesde.Text, fahasta.Text, 'X', CheckBox5.Checked);
    if infEstMedico.Checked then Begin
      if (utiles.ctrlFecha(fadesde.Text, '')) and (utiles.ctrlFecha(fahasta.Text, '')) then auditoriacb.ListarEstadisticaMedicos(fmEleMedicos.lista, fadesde.Text, fahasta.Text, 'X');
      infEstMedico.Checked := False;
    end;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end else
    utiles.msgError('Imposible Exportar este Informe ...!');
end;

procedure TfmAuditoria.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then Begin
    GroupBox4.Enabled := True;
    codos1.setFocus;
  end else
    GroupBox4.Enabled := False;
end;

procedure TfmAuditoria.TabSheet3Hide(Sender: TObject);
begin
  CheckBox4.Checked := False;
end;

procedure TfmAuditoria.FormActivate(Sender: TObject);
begin
  codos.setFocus;
end;

procedure TfmAuditoria.codosfactKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codrechazado.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codosfact.Text) then btnBuscarOSFactClick(Sender) else CargarDatosObraSocialFact;
end;

procedure TfmAuditoria.btnBuscarOSFactClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.expresion.CharCase := ecUpperCase;
  fmListObrasSociales.ShowModal;
  Refresh;
  if fmListObrasSociales.seleccionOK then Begin
    codosfact.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocialFact;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmAuditoria.infEstMedicoClick(Sender: TObject);
begin
  if infEstMedico.Checked then Begin
    fmEleMedicos.ShowModal;
    fadesde.SetFocus;
  end;
end;

procedure TfmAuditoria.TabSheet2Show(Sender: TObject);
begin
  infEstMedico.Checked := False;
  infauditoria.Checked := False;
end;

procedure TfmAuditoria.desdeNroAjusteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    desdeNroAjuste.Text := utiles.sLlenarIzquierda(desdeNroAjuste.Text, 10, '0');
    if auditoriacb.Buscar(desdeNroAjuste.Text) then hastaNroAjuste.SetFocus else utiles.msgError('El Número de Auditoría No Existe ...!');
  end;
end;

procedure TfmAuditoria.hastaNroAjusteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then desdeNroAjuste.SetFocus;
  if Key = VK_RETURN then Begin
    hastaNroAjuste.Text := utiles.sLlenarIzquierda(hastaNroAjuste.Text, 10, '0');
    if auditoriacb.Buscar(hastaNroAjuste.Text) then fechaAjuste.SetFocus else utiles.msgError('El Número de Auditoría No Existe ...!');
  end;
end;

procedure TfmAuditoria.fechaAjusteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then hastaNroAjuste.SetFocus;
  if Key = VK_RETURN then
    if utiles.ctrlFecha(fechaAjuste) then Begin
      btnAplicarAjuste.Enabled := True;
      btnAplicarAjuste.SetFocus;
    end;
end;

procedure TfmAuditoria.btnAplicarAjusteClick(Sender: TObject);
begin
  if (auditoriacb.Buscar(desdeNroAjuste.Text)) and (auditoriacb.Buscar(hastaNroAjuste.Text)) and (utiles.ctrlFecha(fechaAjuste)) then Begin
    if StrToInt(desdeNroAjuste.Text) <= StrToInt(hastaNroAjuste.Text) then Begin
      if utiles.msgSiNo('Seguro para Realizar Proceso de Modificación de Fechas ?') then Begin
        StatusBar1.Panels[0].Text := 'Procesando Datos ...!'; StatusBar1.Refresh;
        auditoriacb.AjustarFecha(desdeNroAjuste.Text, hastaNroAjuste.Text, fechaAjuste.Text);
        desdeNroAjuste.Text := ''; hastaNroAjuste.Text := ''; fechaAjuste.Text := '';
        desdeNroAjuste.SetFocus;
        btnAplicarAjuste.Enabled := False;
        StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
      end
    end else
      utiles.msgError('El Nro. Inicial debe ser Mayor al Nro. Final ...!');
  end else
    utiles.msgError('Controle, Hay Datos Incorrectos, Imposible Realizar Ajuste ...!');
end;

procedure TfmAuditoria.fepedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then nprofesional.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fepedido) then obsdiagnostico.SetFocus;
end;

procedure TfmAuditoria.obsdiagnosticoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fepedido.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(obsdiagnostico.Text)) >= 0 then Begin
      if registrarDerivacion.Checked then fechaderivacion.SetFocus else iddiag.SetFocus;
    end;
end;

procedure TfmAuditoria.profcabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Buscado: Boolean;
begin
  obs.Visible := False;
  if Key = VK_UP then iddiag.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if (auditoriacb.Online = 'S') then btnBuscarMedicoCabeceraClick(Sender) else begin

    if medico.Buscar(idprofcab) then CargarDatosMedicoCabecera else Begin
    if Length(Trim(profcab.Text)) = 0 then btnBuscarMedicoCabeceraClick(Sender) else Begin
    Buscado := False;
    if not (auditoriacb.Existe) or (modProfCab) then
      if medico.ExistenProfIgualNombre(profcab.Text) then Begin
        btnBuscarMedicoCabeceraClick(Self);
        Buscado := True;
      end else Begin
        if medico.BuscarPorNombre(profcab.Text) then Begin
          idprofcab := medico.tabla.FieldByName('idprof').AsString;
          CargarDatosMedicoCabecera;
        end;
      end;
    if not Buscado then
      if not medico.Buscar(idprofcab) then btnBuscarMedicoCabeceraClick(Self);
    end;
    end;
    end;
  end;
end;

procedure TfmAuditoria.btnBuscarDiagnosticoClick(Sender: TObject);
begin
  dxx := '';
  if (auditoriacb.Online <> 'S') then begin
    if not tablaOMS.Checked then Begin
      Application.CreateForm(TfmListDiagnosticos, fmListDiagnosticos);
      fmListDiagnosticos.introSalir := True;
      fmListDiagnosticos.ShowModal;
      if fmListDiagnosticos.seleccionOK then Begin
        Iddiag.Text := diagnostico.tabla.FieldByName('items').AsString;
        CargarDatosDiagnostico;
      end;
      fmListDiagnosticos.Release; fmListDiagnosticos := nil;
    end else Begin
      Application.CreateForm(TfmListDiagnosticosOMS, fmListDiagnosticosOMS);
      fmListDiagnosticosOMS.introSalir := True;
      fmListDiagnosticosOMS.ShowModal;
      if fmListDiagnosticosOMS.seleccionOK then Begin
        Iddiag.Text := diagnosticooms.tabla.FieldByName('oms_cod').AsString;
        dxx := diagnosticooms.tabla.FieldByName('oms_cod').AsString;
        CargarDatosDiagnostico;
      end;
      fmListDiagnosticosOMS.Release; fmListDiagnosticosOMS := nil;
    end;
  end;
  if (auditoriacb.Online = 'S') then begin
    Application.CreateForm(TfmListDiagnosticosOMS, fmListDiagnosticosOMS);
    fmListDiagnosticosOMS.introSalir := True;
    fmListDiagnosticosOMS.ShowModal;
    if fmListDiagnosticosOMS.seleccionOK then Begin
      Iddiag.Text := diagnosticooms.tabla.FieldByName('oms_cod').AsString;
      CargarDatosDiagnostico;
    end;
    fmListDiagnosticosOMS.Release; fmListDiagnosticosOMS := nil;
  end;
end;

procedure TfmAuditoria.btnBuscarMedicoCabeceraClick(Sender: TObject);
begin
  if (auditoriacb.Online <> 'S') then begin
    medico.FiltrarActivos;
    Application.CreateForm(TfmBuscarMedicoCabecera, fmBuscarMedicoCabecera);
    fmBuscarMedicoCabecera.codos       := codos.Text;
    fmBuscarMedicoCabecera.buscar.Text := profcab.Text;
    fmBuscarMedicoCabecera.ShowModal;
    if fmBuscarMedicoCabecera.seleccionOK then Begin
      idprofcab := fmBuscarMedicoCabecera.S.Cells[1, fmBuscarMedicoCabecera.S.Row];
      CargarDatosMedicoCabecera;
    end;
    fmBuscarMedicoCabecera.Release; fmBuscarMedicoCabecera := nil;
  end;
  if (auditoriacb.Online = 'S') then begin
    Application.CreateForm(TfmBuscarMedicoCabeceraOL, fmBuscarMedicoCabeceraOL);
    fmBuscarMedicoCabeceraOL.codos       := codos.Text;
    fmBuscarMedicoCabeceraOL.buscar.Text := profcab.Text;
    fmBuscarMedicoCabeceraOL.ShowModal;
    if fmBuscarMedicoCabeceraOL.seleccionOK then Begin
      idprofcab := fmBuscarMedicoCabeceraOL.S.Cells[1, fmBuscarMedicoCabeceraOL.S.Row];
      CargarDatosMedicoCabecera;
    end;
    fmBuscarMedicoCabeceraOL.Release; fmBuscarMedicoCabeceraOL := nil;
  end;
end;

procedure TfmAuditoria.profcabChange(Sender: TObject);
begin
  if Length(Trim(profcab.Text)) <= 1 then idprofcab := '';
  modProfCab := True;
end;

procedure TfmAuditoria.codosobsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codosobs.Text) then BuscarOSObsClick(Sender) else CargarDatosObraSocial4;
end;

procedure TfmAuditoria.BuscarOSObsClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.expresion.CharCase := ecUpperCase;
  fmListObrasSociales.ShowModal;
  Refresh;
  if fmListObrasSociales.seleccionOK then Begin
    codosobs.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocial4;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmAuditoria.observacionfinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codosobs.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    auditoriacb.GuardarObs(codosobs.Text, observacionfinal.Text);
    codosobs.Text := ''; observacionfinal.Text := ''; nosobs.Caption := '';
    codosobs.SetFocus;
  end;
end;

procedure TfmAuditoria.codautorizadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := 'ESC Finalizar Ing. Determinaciones';
end;

procedure TfmAuditoria.codrechazadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := 'ESC Finalizar Ing. Determinaciones';
end;

procedure TfmAuditoria.observacionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := '';
end;

procedure TfmAuditoria.profcabKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := '';
end;

procedure TfmAuditoria.fechatransKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if utiles.ctrlFecha(fechatrans) then Begin
       btnGenerarRegistros.Enabled := True;
       btnGenerarRegistros.SetFocus;
    end;
end;

procedure TfmAuditoria.CheckBox9Click(Sender: TObject);
begin
  if CheckBox9.Checked then fechatrans.SetFocus;
end;

procedure TfmAuditoria.btnGenerarRegistrosClick(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Procesando Datos ...!'; StatusBar1.Refresh;
  auditoriacb.GenerarOrdenesXML(fechatrans.Text);
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  btnTransferirInternet.Enabled := True;
  btnTransferirInternet.SetFocus;
end;

procedure TfmAuditoria.btnExportarTablasMaestrasClick(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Creando Zonas ...!'; StatusBar1.Refresh;
  zonas.ExportarZonasXML;
  StatusBar1.Panels[0].Text := 'Creando Obras Sociales ...!'; StatusBar1.Refresh;
  obsocial.ExportarOSXML;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  btnTransferirInternet.Enabled := True;
  transtablas := True;
  btnGenerarRegistros.SetFocus;
end;

procedure TfmAuditoria.btnAplicarConexionClick(Sender: TObject);
begin
  AssignFile(archivo, dbs.DirSistema + '\ftpaudi.ini');
  Rewrite(archivo);
  WriteLn(archivo, ftphost.Text);
  WriteLn(archivo, dirftp.Text);
  WriteLn(archivo, usuario.Text);
  WriteLn(archivo, contrasenia.Text);
  if conexiondirecta.Checked then WriteLn(archivo, '1') else WriteLn(archivo, '0');
  WriteLn(archivo, theURL.Text);
  closeFile(archivo);
end;

procedure TfmAuditoria.btnTransferirInternetClick(Sender: TObject);
// Objetivo...: Subir Actualizaciones OnLine
var
  datosok, TransferrignData: Boolean;
  con: Cardinal;

procedure conectarInternet;
Begin
  Application.CreateForm(TAutoForm, AutoForm);
  Application.CreateForm(TConfigureAutoForm, ConfigureAutoForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TRasDialerForm, RasDialerForm);
  Application.CreateForm(TTimeAutoForm, TimeAutoForm);
  datosok := False;
  if Length(Trim(RasDialerForm.setIPAdress)) = 0 then   // Si No esta conectado
    if utiles.msgSiNo('Los Información a Transferir se Generó Correctamente,', 'Desea Conectarse a Internet y Realizar la Transferencia ?') then Begin
      RasDialerForm.ShowModal;
      con := RasDialerForm.hRasConn;
      datosok := True;
    end;
   StatusBar1.Panels[0].Text := 'Iniciando Transferencia'; StatusBar1.refresh;
  Refresh;
end;

procedure ChageDir(DirName: String);
begin
  try
    IdFTP1.ChangeDir(DirName);
    {$IFDEF VER140}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}
    {$IFDEF VER185}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}
  finally
  end;
end;

procedure conectarFTP;
begin
  if IdFTP1.Connected then try
    if TransferrignData then IdFTP1.Abort;
    IdFTP1.Quit;
    finally
  end else with IdFTP1 do try
    {$IFDEF VER140}
    User := usuario.Text;
    {$ENDIF}
    {$IFDEF VER185}
    UserName := usuario.Text;
    {$ENDIF}
    Password := contrasenia.Text;
    Host := ftphost.Text;
    Connect;
    ChageDir(dirftp.Text);
  finally
  end;
end;

procedure DesconectarFTP;
begin
  if IdFTP1.Connected then try
    IdFTP1.Disconnect;
    finally
  end
end;

procedure DesconectarInternet;
Begin
  if (datosok) and (Length(Trim(RasDialerForm.setIPAdress)) > 0) then   // Si solo nos conectamos a Internet para transferir
    if utiles.msgSiNo('Los Datos se Transfirieron Correctamente', 'Quiere Desconectarse de Internet Ahora ?') then Begin
      StatusBar1.Panels[0].Text := 'Desconectando ...!'; Refresh;
      Application.CreateForm(TRasDialerForm, RasDialerForm);
      RasDialerForm.hRasConn := con;
      RasDialerForm.CancelButtonClick(nil);
      StatusBar1.Panels[0].Text := ''; Refresh;
    end;

  if Assigned(RasDialerForm) then Begin
    RasDialerForm.Release; RasDialerForm := nil;
  end;
  if Assigned(ConfigureAutoForm) then Begin
    ConfigureAutoForm.Release; ConfigureAutoForm := nil;
  end;
  if Assigned(AboutForm) then Begin
    AboutForm.Release; AboutForm := nil;
  end;
  if Assigned(TimeAutoForm) then Begin
    TimeAutoForm.Release; TimeAutoForm := nil;
  end;
end;

//------------------------------------------------------------------------------

begin
  if not conexiondirecta.Checked then conectarInternet;
  if (Length(Trim(RasDialerForm.setIPAdress)) > 0) or (conexiondirecta.Checked) then Begin
    StatusBar1.Panels[0].Text := 'Transfiriendo Datos ...!'; StatusBar1.refresh;
    conectarFTP;
    if IdFTP1.Connected then begin
      IdFTP1.TransferType := ftBinary;
      StatusBar1.Panels[0].Text := 'Transfiriendo Ordenes'; StatusBar1.refresh;
      IdFTP1.Put(dbs.DirSistema + '\actualizaciones_online\upload\ordenes.xml', 'ordenes.xml');
      StatusBar1.Panels[0].Text := 'Transfiriendo Código Ordenes ...!'; StatusBar1.refresh;
      IdFTP1.Put(dbs.DirSistema + '\actualizaciones_online\upload\cod_ordenes.xml', 'cod_ordenes.xml');
      if transtablas then Begin
        StatusBar1.Panels[0].Text := 'Transfiriendo Zonas'; StatusBar1.refresh;
        IdFTP1.Put(dbs.DirSistema + '\actualizaciones_online\upload\zonas.xml', 'zonas.xml');
        StatusBar1.Panels[0].Text := 'Transfiriendo Obras Sociales ...!'; StatusBar1.refresh;
        IdFTP1.Put(dbs.DirSistema + '\actualizaciones_online\upload\obrassociales.xml', 'obrassociales.xml');
      end;
      ChageDir(idftp1.RetrieveCurrentDir);
      desconectarFTP;
      transtablas := False;

      // Invocamos el Script para que actualice
      if Length(Trim(theURL.Text)) > 0 then Begin
        StatusBar1.Panels[0].Text := 'Invocando Script Remoto ...!'; StatusBar1.refresh;
        Application.CreateForm(TfmClientHTML, fmClientHTML);
        fmClientHTML.cbURL.Text := theURL.Text;
        fmClientHTML.FormActivate(Self);
        fmClientHTML.btnGoClick(Self);
        fmClientHTML.Release; fmClientHTML := Nil
      end;
    end else
      utiles.msgError('Error - No Hay Conexion Establecida ...!');
    if not conexiondirecta.Checked then DesconectarInternet;
    btnTransferirInternet.Enabled := False;
    fechatrans.SetFocus;
    StatusBar1.Panels[0].Text := ''; StatusBar1.refresh;
  end;
end;

procedure TfmAuditoria.btnFinalizarClick(Sender: TObject);
begin
  ucodos.Text := ''; unos.Caption := '';
  unrodoc.Text := ''; unombre.Caption := '';
  ucodos.SetFocus;
end;

end.
