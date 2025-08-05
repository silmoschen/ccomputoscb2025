unit ControlPagosObrasSociales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, DBCtrls, ToolWin, Editv,
  Buttons, Grids, DB, DBGrids, Menus, BorBtns;

type
  TfrmControlPagos = class(TForm)
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel3: TPanel;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    Panel6: TPanel;
    btnRegistrarF: TButton;
    btnCancelarF: TButton;
    Panel7: TPanel;
    TabSheet4: TTabSheet;
    DTSF: TDataSource;
    F: TStringGrid;
    PopupMenuFacturas: TPopupMenu;
    EditarItemsFactura1: TMenuItem;
    BorrarItems1: TMenuItem;
    Panel8: TPanel;
    Label3: TLabel;
    osf: TLabel;
    codosf: TMaskEdit;
    BuscarObraSocialF: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    nrocheque: TMaskEdit;
    Label26: TLabel;
    fechacheque: TMaskEdit;
    Label27: TLabel;
    Label28: TLabel;
    codbanco: TMaskEdit;
    BuscarBanco: TBitBtn;
    entbco: TLabel;
    Label29: TLabel;
    montocheque: TEditValid;
    Label30: TLabel;
    conceptocheque: TMaskEdit;
    Label31: TLabel;
    Panel14: TPanel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    fechaf: TMaskEdit;
    sucursalf: TMaskEdit;
    numerof: TMaskEdit;
    montof: TEditValid;
    conceptof: TMaskEdit;
    fechavto1: TMaskEdit;
    fechavto2: TMaskEdit;
    fechavtou: TMaskEdit;
    recargovto1: TEditValid;
    recargovto2: TEditValid;
    Panel4: TPanel;
    Panel12: TPanel;
    btnRegistrarPago: TButton;
    btnCancelarPago: TButton;
    Panel15: TPanel;
    Panel16: TPanel;
    Label1: TLabel;
    osp: TLabel;
    Label2: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    codosp: TMaskEdit;
    btnBuscarOSP: TBitBtn;
    sucursalp: TMaskEdit;
    numerop: TMaskEdit;
    Panel17: TPanel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    fechap: TMaskEdit;
    montop: TEditValid;
    conceptop: TMaskEdit;
    Panel18: TPanel;
    Panel19: TPanel;
    ScrollBox2: TScrollBox;
    Panel20: TPanel;
    ScrollBox3: TScrollBox;
    GroupBox4: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    ajExpendio: TMaskEdit;
    ajRecibo: TMaskEdit;
    btnAplicarRecibo: TButton;
    editarRecibo: TBorCheck;
    Label36: TLabel;
    totd: TLabel;
    Panel13: TPanel;
    btnRegistrarCheque: TButton;
    btnCancelarCheque: TButton;
    btnGuardarCheques: TButton;
    Splitter1: TSplitter;
    Panel9: TPanel;
    D: TStringGrid;
    P: TStringGrid;
    PopupMenuCheques: TPopupMenu;
    EditarCheque1: TMenuItem;
    BorrarCheque1: TMenuItem;
    hFecha: TMaskEdit;
    Label37: TLabel;
    btnObrasSociales: TButton;
    Panel21: TPanel;
    btnDispositivo: TButton;
    btnEmitir: TButton;
    Panel22: TPanel;
    Button1: TButton;
    GroupBox5: TGroupBox;
    infPagos: TBorRadio;
    infSaldos: TBorRadio;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BuscarObraSocialFClick(Sender: TObject);
    procedure fechafKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sucursalfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure numerofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure montofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conceptofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRegistrarFClick(Sender: TObject);
    procedure btnCancelarFClick(Sender: TObject);
    procedure codosfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditarItemsFactura1Click(Sender: TObject);
    procedure BorrarItems1Click(Sender: TObject);
    procedure fechavto1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechavto2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechavtouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure recargovto1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure recargovto2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarOSPClick(Sender: TObject);
    procedure codospKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conceptopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure montopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sucursalpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure numeropKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRegistrarPagoClick(Sender: TObject);
    procedure btnCancelarPagoClick(Sender: TObject);
    procedure ajExpendioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ajReciboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarReciboClick(Sender: TObject);
    procedure BuscarBancoClick(Sender: TObject);
    procedure fechachequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conceptochequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRegistrarChequeClick(Sender: TObject);
    procedure montochequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrochequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codbancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarChequeClick(Sender: TObject);
    procedure btnGuardarChequesClick(Sender: TObject);
    procedure EditarCheque1Click(Sender: TObject);
    procedure BorrarCheque1Click(Sender: TObject);
    procedure DKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet3Show(Sender: TObject);
    procedure hFechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnObrasSocialesClick(Sender: TObject);
    procedure btnDispositivoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure infPagosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    archivo: TextFile;
    items: Integer; modificado: Boolean;
    procedure CargarDatosOSF;
    procedure CargarDatosFacturas;
    procedure CargarFactura;
    procedure CargarDatosOSP;
    function  ControlarPagos: Boolean;

    procedure CargarPagos;
    procedure CargarRecibo;
    procedure IniciarPagos;

    procedure CargarDatosBanco;
    function  ControlarDatosCheque: Boolean;
    procedure CalcularTotalDistribuido;

    procedure CargarCheques;
  public
    { Public declarations }
  end;

var
  frmControlPagos: TfrmControlPagos;

implementation

uses CCtaCteObrasSocialesCCB, CObrasSocialesCCB, NominaObrasSociales, CUtiles, CUtilidadesStringGrid, CBDT,
  NominaDeBancos, CBancosCentroBioq, EleccionObrasSociales, Disposit;

{$R *.dfm}

procedure TfrmControlPagos.CargarDatosOSF;
// Objetivo...: Cargar Datos Obra Social
Begin
  obsocial.getDatos(codosf.Text);
  osf.Caption := obsocial.Nombre;
  CargarDatosFacturas;
  GroupBox2.Enabled := True;
  sucursalf.SetFocus;
end;

procedure TfrmControlPagos.CargarDatosFacturas;
// Objetivo...: Cargar Datos Facturas
var
  l: TStringList;
  i, j, p, k: Integer;
Begin
  grid.IniciarGrilla(F);
  l := ctacteccb.setFacturas(codosf.Text);
  j := 0;
  For i := l.Count downto 1 do Begin
    Inc(j);
    F.Cells[0, j] := Copy(l.Strings[i-1], 9, 4) + '-' + Copy(l.Strings[i-1], 13, 8);
    F.Cells[1, j] := Copy(l.Strings[i-1], 1, 8);
    p := Pos(';1', l.Strings[i-1]);
    F.Cells[2, j] := Copy(l.Strings[i-1], 21, p-21);
    k := Pos(';2', l.Strings[i-1]);
    F.Cells[8, j] := Copy(l.Strings[i-1], p+2, (k-p) - 2);
    p := Pos(';2', l.Strings[i-1]);
    F.Cells[3, j] := Copy(l.Strings[i-1], p+2, 8);
    F.Cells[4, j] := Copy(l.Strings[i-1], p+10, 8);
    F.Cells[5, j] := Copy(l.Strings[i-1], p+18, 8);
    F.Cells[6, j] := Copy(l.Strings[i-1], p+26, Pos(';3', l.Strings[i-1]) - (p+26));
    p := Pos(';3', l.Strings[i-1]);
    F.Cells[7, j] := Trim(Copy(l.Strings[i-1], p+2, 15));
  end;
  l.Clear; L.Destroy;
end;

procedure TfrmControlPagos.CargarFactura;
// Objetivo...: Cargar Datos Factura
Begin
  ctacteccb.getDatos(codosf.Text, sucursalf.Text, numerof.Text);
  montof.Text      := utiles.FormatearNumero(FloatToStr(ctacteccb.Monto));
  fechaf.Text      := ctacteccb.Fecha;
  fechavto1.Text   := ctacteccb.Fechavto1;
  fechavto2.Text   := ctacteccb.Fechavto2;
  fechavtou.Text   := ctacteccb.Fechavtou;
  recargovto1.Text := utiles.FormatearNumero(FloatToStr(ctacteccb.Recargo1vto));
  recargovto2.Text := utiles.FormatearNumero(FloatToStr(ctacteccb.Recargo2vto));
  conceptof.Text   := ctacteccb.Concepto;
end;

procedure TfrmControlPagos.CargarDatosOSP;
// Objetivo...: Cargar Datos Obra Social
var
  r: String;
Begin
  obsocial.getDatos(codosp.Text);
  osp.Caption := obsocial.Nombre;
  r := ctacteccb.NuevoRecibo('0000');
  sucursalp.Text := Copy(r, 1, 4);
  numerop.Text := Copy(r, 5, 8);
  if Not editarRecibo.Checked then Begin
    GroupBox3.Enabled := True;
    montop.SetFocus;
  end else
    sucursalp.SetFocus;
  CargarPagos;
end;

function TfrmControlPagos.ControlarPagos: Boolean;
// Objetivo...: Efectuar control de pagos
Begin
  if (obsocial.Buscar(codosp.Text) and (utiles.ctrlFecha(fechap.Text, '')) and (StrToFloat(montop.Text) > 0) and (Length(Trim(conceptop.Text)) > 0)) and (Length(Trim(numerop.Text)) > 0) then Result := True else Result := False;
end;

procedure TfrmControlPagos.CargarPagos;
// Objetivo...: Cargar Pagos
var
  l: TStringList;
  i, j: Integer;
Begin
  l := ctacteccb.setPagos(codosp.Text);
  for i := 1 to l.Count do Begin
    P.Cells[0, i] := Copy(l.Strings[i-1], 1, 4) + '-' + Copy(l.Strings[i-1], 5, 8);
    P.Cells[1, i] := utiles.sFormatoFecha(Copy(l.Strings[i-1], 13, 8));
    j := Pos(';1', l.Strings[i-1]);
    P.Cells[3, i] := utiles.FormatearNumero(Copy(l.Strings[i-1], 21, j - 21));
    P.Cells[2, i] := Copy(l.Strings[i-1], j + 2, 40);
  end;
  l.Clear; l.Destroy;
end;

procedure TfrmControlPagos.CargarRecibo;
// Objetivo...: Cargar Recibos
Begin
  ctacteccb.getDatosPago(codosp.Text, sucursalp.Text, numerop.Text);
  montop.Text    := utiles.FormatearNumero(FloatToStr(ctacteccb.Montop));
  fechap.Text    := ctacteccb.Fechap;
  conceptop.Text := ctacteccb.Conceptop;
  CargarCheques;
end;

procedure TfrmControlPagos.IniciarPagos;
// Objetivo...: Iniciar Pagos
Begin
  codosp.Text := ''; osp.Caption := ''; sucursalp.Text := ''; numerop.Text := ''; montop.Text := ''; fechap.Text := ''; conceptop.Text := '';
  nrocheque.Text := ''; codbanco.Text := ''; entbco.Caption := ''; fechacheque.Text := ''; montocheque.Text := ''; conceptocheque.Text := '';
  totd.Caption := ''; grid.IniciarGrilla(P); grid.IniciarGrilla(D);
end;

procedure TfrmControlPagos.CargarDatosBanco;
// Objetivo...: Cargar datos entidad Bancaria
Begin
  entbcos.getDatos(codbanco.Text);
  entbco.Caption := entbcos.descrip;
  fechacheque.SetFocus;
end;

function  TfrmControlPagos.ControlarDatosCheque: Boolean;
// Objetivo...: Controlar Datos Ingresados en cheques
Begin
  if (Length(Trim(nrocheque.Text)) > 0) and (Length(Trim(montocheque.Text)) > 0) and (entbcos.Buscar(codbanco.Text)) and (utiles.ctrlFecha(fechacheque.Text, '')) and (StrToFloat(montocheque.Text) > 0) then Result := True else Result := False;
end;

procedure TfrmControlPagos.CalcularTotalDistribuido;
// Objetivo...: Calcular total distribuido
var
  i: Integer; t: Real;
Begin
  t := 0;
  for i := 1 to D.RowCount do Begin
    if Length(Trim(D.Cells[0, i])) = 0 then Break;
    t := t + StrToFloat(D.Cells[4, i]);
  end;
  totd.Caption := utiles.FormatearNumero(FloatToStr(t));
  if totd.Caption = montop.Text then btnGuardarCheques.Enabled := True else btnGuardarCheques.Enabled := False;
end;

procedure TfrmControlPagos.CargarCheques;
// Objetivo...: Cargar Cheques
var
  i, p: Integer;
  l: TStringList;
Begin
  grid.IniciarGrilla(D);
  l := ctacteccb.setCheques(sucursalp.Text, numerop.Text);
  for i := 1 to l.Count do Begin
    D.Cells[0, i] := Copy(l.Strings[i - 1], 1, 2);
    D.Cells[1, i] := Copy(l.Strings[i - 1], 3, 10);
    entbcos.getDatos(Copy(l.Strings[i - 1], 13, 3));
    D.Cells[2, i] := entbcos.descrip;
    D.Cells[3, i] := Copy(l.Strings[i - 1], 16, 8);
    p := pos(';1', l.Strings[i - 1]);
    D.Cells[4, i] := utiles.FormatearNumero(Copy(l.Strings[i - 1], 24, (p-24)));
    D.Cells[5, i] := Copy(l.Strings[i - 1], p+2, 40);
    D.Cells[6, i] := Copy(l.Strings[i - 1], 13, 3);
  end;
  l.Clear; l.Destroy;
  items := i;
end;

procedure TfrmControlPagos.FormShow(Sender: TObject);
var
  e, x: Integer;
begin
  ctacteccb.conectar;
  DTSF.DataSet := ctacteccb.facturas;
  F.Cells[0, 0] := 'Nº Comprobante'; F.Cells[1, 0] := 'Fecha'; F.Cells[2, 0] := 'Monto'; F.Cells[3, 0] := 'F. 1º vto.';
  F.Cells[4, 0] := 'F. 2º vto.'; F.Cells[5, 0] := 'F. ult. vto.'; F.Cells[6, 0] := 'R.1vto.'; F.Cells[7, 0] := 'R.2vto.'; F.Cells[8, 0] := 'Concepto de la Operación';
  P.Cells[0, 0] := 'Recibo'; P.Cells[1, 0] := 'Fecha'; P.Cells[2, 0] := 'Concepto'; P.Cells[3, 0] := 'Monto';
  D.Cells[0, 0] := 'It.'; D.Cells[1, 0] := 'Nro. de Cheque'; D.Cells[2, 0] := 'Entidad Bancaria'; D.Cells[3, 0] := 'Fecha'; D.Cells[4, 0] := 'Monto'; D.Cells[5, 0] := 'Concepto Operación'; D.Cells[6, 0] := 'Id.Bco.';
  codosp.SetFocus;
  if FileExists(dbs.DirSistema + '\set_recibos.ini') then Begin
    AssignFile(archivo, dbs.DirSistema + '\set_recibos.ini');
    reset(archivo);
    ReadLn(archivo, e);
    ReadLn(archivo, x);
    if e = 1 then editarRecibo.Checked := True else editarRecibo.Checked := False;
    if x > 0 then Panel18.Height := x;
    closeFile(archivo);
  end;
  grid.RecuperarAnchoColumnas(frmControlPagos, F);
  grid.RecuperarAnchoColumnas(frmControlPagos, P);
  grid.RecuperarAnchoColumnas(frmControlPagos, D);
  hFecha.Text := utiles.setFechaActual;
  Application.CreateForm(TDispositivo, Dispositivo);
end;

procedure TfrmControlPagos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ctacteccb.desconectar;
  grid.GuardarAnchoColumnas(frmControlPagos, F);
  grid.GuardarAnchoColumnas(frmControlPagos, P);
  grid.GuardarAnchoColumnas(frmControlPagos, D);
  AssignFile(archivo, dbs.DirSistema + '\set_recibos.ini');
  rewrite(archivo);
  if editarRecibo.Checked then WriteLn(archivo, 1) else WriteLn(archivo, 0);
  WriteLn(archivo, Panel18.Height);
  closeFile(archivo);
  if Assigned(fmEleObraSociales) then Begin
    fmEleObraSociales.Release; fmEleObraSociales := Nil;
  end;
  Dispositivo.Release; Dispositivo := Nil;
end;

procedure TfrmControlPagos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmControlPagos.TabSheet2Show(Sender: TObject);
begin
  codosf.SetFocus;
end;

procedure TfrmControlPagos.BuscarObraSocialFClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codosf.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosOSF;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := Nil;
end;

procedure TfrmControlPagos.fechafKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if sucursalf.Enabled then sucursalf.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechaf) then Begin
      fechavto1.Text := utiles.FechaSumarDias(fechaf.Text, 30);
      fechavto1.SetFocus;
    end;
end;

procedure TfrmControlPagos.sucursalfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codosf.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    sucursalf.Text := utiles.sLlenarIzquierda(sucursalf.Text, 4, '0');
    numerof.SetFocus;
  end;
end;

procedure TfrmControlPagos.numerofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then sucursalf.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(numerof.Text)) > 0 then Begin
      numerof.Text := utiles.sLlenarIzquierda(numerof.Text, 8, '0');
      CargarFactura;
      montof.SetFocus;
    end;
end;

procedure TfrmControlPagos.montofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then numerof.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    montof.Text := utiles.FormatearNumero(montof.Text);
    if StrToFloat(montof.Text) > 0 then fechaf.SetFocus;
  end;

end;

procedure TfrmControlPagos.conceptofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then montof.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    btnRegistrarF.Enabled := True;
    btnRegistrarF.SetFocus;
  end;
end;

procedure TfrmControlPagos.btnRegistrarFClick(Sender: TObject);
begin
  if (obsocial.Buscar(codosf.Text)) and (Length(Trim(sucursalf.Text)) > 0) and (numerof.Text > '00000000') and (utiles.ctrlFecha(fechaf.Text, '')) and (Length(Trim(montof.Text)) > 0) then Begin
    ctacteccb.RegistrarFactura(codosf.Text, sucursalf.Text, numerof.Text, fechaf.Text, fechavto1.Text, fechavto2.Text, fechavtou.Text, conceptof.Text, StrToFloat(montof.Text), StrToFloat(recargovto1.Text), StrToFloat(recargovto2.Text));
    CargarDatosFacturas;
    btnCancelarFClick(Sender);
    btnRegistrarF.Enabled := False;
  end else
    utiles.msgError('Hay Datos Erroneos o Inexistentes ...!');
end;

procedure TfrmControlPagos.btnCancelarFClick(Sender: TObject);
begin
  sucursalf.Text := ''; numerof.Text := ''; conceptof.Text := ''; montof.Text := utiles.FormatearNumero('0'); fechaf.Text := '';
  fechavto1.Text := ''; fechavto2.Text := ''; fechavtou.Text := ''; recargovto1.Text := montof.Text; recargovto2.Text := montof.Text;
  sucursalf.Enabled := True; numerof.Enabled := True;
  GroupBox2.Enabled := False;
  codosf.SetFocus;
end;

procedure TfrmControlPagos.codosfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codosf.Text) then BuscarObraSocialFClick(Sender) else CargarDatosOSF;
end;

procedure TfrmControlPagos.EditarItemsFactura1Click(Sender: TObject);
begin
  if Length(Trim(F.Cells[0, F.Row])) > 0 then Begin
    Panel5.Enabled   := True;
    sucursalf.Text   := Copy(F.Cells[0, F.Row], 1, 4);
    numerof.Text     := Copy(F.Cells[0, F.Row], 6, 8);
    fechaf.Text      := F.Cells[1, F.Row];
    montof.Text      := F.Cells[2, F.Row];
    fechavto1.Text   := F.Cells[3, F.Row];
    fechavto2.Text   := F.Cells[4, F.Row];
    fechavtou.Text   := F.Cells[5, F.Row];
    recargovto1.Text := F.Cells[6, F.Row];
    recargovto2.Text := F.Cells[7, F.Row];
    conceptof.Text   := F.Cells[8, F.Row];
    sucursalf.Enabled := False; numerof.Enabled := False;
    fechaf.SetFocus;
  end;
end;

procedure TfrmControlPagos.BorrarItems1Click(Sender: TObject);
begin
  if ctacteccb.BuscarFactura(codosf.Text, Copy(F.Cells[0, F.Row], 1, 4), Copy(F.Cells[0, F.Row], 6, 8)) then
    if utiles.msgSiNo('Seguro para Borrar Factura Nro. ' + Copy(F.Cells[0, F.Row], 1, 4) + '-' + Copy(F.Cells[0, F.Row], 6, 8)) then Begin
      ctacteccb.BorrarFactura(codosf.Text, Copy(F.Cells[0, F.Row], 1, 4), Copy(F.Cells[0, F.Row], 6, 8));
      grid.BorrarRenglon_SinRenumerar(F);
    end;
  codosf.SetFocus;
end;

procedure TfrmControlPagos.fechavto1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fechaf.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechavto1) then Begin
      fechavto2.Text := utiles.FechaSumarDias(fechaf.Text, 45);
      fechavto2.SetFocus;
    end;
end;

procedure TfrmControlPagos.fechavto2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fechavto1.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechavto2) then Begin
      fechavtou.Text := utiles.FechaSumarDias(fechaf.Text, 60);
      fechavtou.SetFocus;
    end;
end;

procedure TfrmControlPagos.fechavtouKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fechavto2.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechavtou) then recargovto1.SetFocus;
end;

procedure TfrmControlPagos.recargovto1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then fechavtou.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(recargovto1.Text)) > 0 then recargovto2.SetFocus;
end;

procedure TfrmControlPagos.recargovto2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then recargovto1.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(recargovto2.Text)) > 0 then conceptof.SetFocus;
end;

procedure TfrmControlPagos.btnBuscarOSPClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codosp.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosOSP;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := Nil;
end;

procedure TfrmControlPagos.codospKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not obsocial.Buscar(codosp.Text) then btnBuscarOSPClick(Self);
    CargarDatosOSP;
  end;
end;

procedure TfrmControlPagos.fechapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then montop.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechap) then conceptop.SetFocus;
end;

procedure TfrmControlPagos.conceptopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then numerop.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(conceptop.Text)) > 0 then
      if controlarPagos then Begin
        btnRegistrarPago.Enabled := True;
        btnRegistrarPago.SetFocus;
      end;
end;

procedure TfrmControlPagos.montopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then numerop.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(montop.Text)) > 0 then Begin
      montop.Text := utiles.FormatearNumero(montop.Text);
      fechap.SetFocus;
    end;
end;

procedure TfrmControlPagos.sucursalpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then montop.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    sucursalp.Text := utiles.sLlenarIzquierda(sucursalp.Text, 4, '0');
    numerop.SetFocus;
  end;
end;

procedure TfrmControlPagos.numeropKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then sucursalp.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(numerop.Text)) > 0 then Begin
      numerop.Text := utiles.sLlenarIzquierda(numerop.Text, 8, '0');
      CargarRecibo;
      GroupBox3.Enabled := True;
      montop.SetFocus;
    end;
end;

procedure TfrmControlPagos.btnRegistrarPagoClick(Sender: TObject);
begin
  if controlarPagos then Begin
    ctacteccb.RegistrarPago(codosp.Text, sucursalp.Text, numerop.Text, fechap.Text, conceptop.Text, StrToFloat(montop.Text));
    CargarPagos;
    btnRegistrarPago.Enabled := False;
    GroupBox1.Enabled := True;
    nrocheque.SetFocus;
  end;
end;

procedure TfrmControlPagos.btnCancelarPagoClick(Sender: TObject);
begin
  codosp.Text := ''; sucursalp.Text := ''; numerop.Text := ''; conceptop.Text := ''; fechap.Text := ''; montop.Text := ''; osp.Caption := '';
  codosp.SetFocus;
end;

procedure TfrmControlPagos.ajExpendioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    ajExpendio.Text := utiles.sLlenarIzquierda(ajExpendio.Text, 4, '0');
    ajRecibo.SetFocus;
  end;
end;

procedure TfrmControlPagos.ajReciboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    ajRecibo.Text := utiles.sLlenarIzquierda(ajRecibo.Text, 8, '0');
    btnAplicarRecibo.Enabled := True;
    btnAplicarRecibo.SetFocus;
  end;
end;

procedure TfrmControlPagos.btnAplicarReciboClick(Sender: TObject);
begin
  ajExpendio.Text := utiles.sLlenarIzquierda(ajExpendio.Text, 4, '0');
  ajRecibo.Text := utiles.sLlenarIzquierda(ajRecibo.Text, 8, '0');
  ctacteccb.RegistrarRecibo(ajExpendio.Text, ajRecibo.Text);
  btnAplicarRecibo.Enabled := False;
  ajExpendio.SetFocus;
end;

procedure TfrmControlPagos.BuscarBancoClick(Sender: TObject);
begin
  Application.CreateForm(TfmListBancos, fmListBancos);
  fmListBancos.introSalir := True;
  fmListBancos.ShowModal;
  if fmListBancos.seleccionOK then Begin
    codbanco.Text := entbcos.tabla.FieldByName('codbanco').AsString;
    CargarDatosBanco;
  end;
  fmListBancos.Release; fmListBancos := Nil;
end;

procedure TfrmControlPagos.fechachequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codbanco.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechacheque) then montocheque.SetFocus;
end;

procedure TfrmControlPagos.conceptochequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then montocheque.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not controlarDatosCheque then utiles.msgError('Controle, hay datos Incompletos o Erroneos ...!') else Begin
      btnRegistrarCheque.Enabled := True;
      btnRegistrarCheque.SetFocus;
    end;
end;

procedure TfrmControlPagos.btnRegistrarChequeClick(Sender: TObject);
var
  i: Integer;
begin
  if not modificado then Begin
    Inc(items);
    i := items;
  end else
    i := D.Row;

  D.Cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 2, '0');
  D.Cells[1, i] := nrocheque.Text;
  D.Cells[2, i] := entbco.Caption;
  D.Cells[3, i] := fechacheque.Text;
  D.Cells[4, i] := montocheque.Text;
  D.Cells[5, i] := conceptocheque.Text;
  D.Cells[6, i] := codbanco.Text;
  CalcularTotalDistribuido;
  modificado := False;

  btnCancelarChequeClick(Self);
  btnRegistrarCheque.Enabled := False;
end;

procedure TfrmControlPagos.montochequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then fechacheque.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(montocheque.Text)) > 0 then Begin
      montocheque.Text := utiles.FormatearNumero(montocheque.Text);
      conceptocheque.SetFocus;
    end;
end;

procedure TfrmControlPagos.nrochequeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then Begin
    GroupBox1.Enabled := False;
    conceptop.SetFocus;
  end;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nrocheque.Text)) > 0 then Begin
      nrocheque.Text := utiles.sLlenarIzquierda(nrocheque.Text, 10, '0');
      codbanco.SetFocus;
    end;
  if Key = VK_ESCAPE then
    if btnGuardarCheques.Enabled then btnGuardarCheques.SetFocus;
end;

procedure TfrmControlPagos.codbancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then nrocheque.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(codbanco.Text)) > 0 then codbanco.Text := utiles.sLlenarIzquierda(codbanco.Text, 3, '0');
    if not entbcos.Buscar(codbanco.Text) then BuscarBancoClick(Self);
    CargarDatosBanco;
  end;
end;

procedure TfrmControlPagos.btnCancelarChequeClick(Sender: TObject);
begin
  nrocheque.Text := ''; codbanco.Text := ''; entbco.Caption := ''; fechacheque.Text := ''; montocheque.Text := ''; conceptocheque.Text := '';
  nrocheque.SetFocus;
end;

procedure TfrmControlPagos.btnGuardarChequesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to items do Begin
    if Length(Trim(D.Cells[0, i])) = 0 then Break;
    ctacteccb.RegistrarCheques(sucursalp.Text, numerop.Text, D.Cells[0, i], D.Cells[1, i], D.Cells[6, i], D.Cells[3, i], D.Cells[5, i], StrToFloat(D.Cells[4, i]), items);
  end;
  btnGuardarCheques.Enabled := False;
  IniciarPagos;
  codosp.SetFocus;
end;

procedure TfrmControlPagos.EditarCheque1Click(Sender: TObject);
begin
  if Length(Trim(D.Cells[0, D.Row])) > 0 then Begin
    nrocheque.Text      := D.Cells[1, D.Row];
    codbanco.Text       := D.Cells[6, D.Row];
    entbcos.getDatos(codbanco.Text);
    entbco.Caption      := entbcos.descrip;
    fechacheque.Text    := D.Cells[3, D.Row];
    montocheque.Text    := D.Cells[4, D.Row];
    conceptocheque.Text := D.Cells[5, D.Row];
    nrocheque.SetFocus;
    modificado := True;
  end;
end;

procedure TfrmControlPagos.BorrarCheque1Click(Sender: TObject);
begin
  if Length(Trim(D.Cells[0, D.Row])) > 0 then
    if utiles.msgSiNo('Seguro para Borrar Cheque ' + D.Cells[1, D.Row] + '  ?') then Begin
      grid.BorrarRenglon_SinRenumerar(D);
      grid.RegenerarItems(D, 2);
      Dec(Items);
      CalcularTotalDistribuido;
      GroupBox1.Enabled := True;
      nrocheque.SetFocus;
    end;
end;

procedure TfrmControlPagos.DKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then BorrarCheque1Click(Self);
end;

procedure TfrmControlPagos.TabSheet3Show(Sender: TObject);
begin
  hFecha.SetFocus;
end;

procedure TfrmControlPagos.hFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(hFecha) then btnObrasSociales.SetFocus; 
end;

procedure TfrmControlPagos.btnObrasSocialesClick(Sender: TObject);
begin
  if not Assigned(fmEleObraSociales) then Application.CreateForm(TfmEleObraSociales, fmEleObraSociales);
  fmEleObraSociales.CargarDatos(1);
  fmEleObraSociales.ShowModal;
  infPagos.SetFocus;
end;

procedure TfrmControlPagos.btnDispositivoClick(Sender: TObject);
begin
  if not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
  Dispositivo.ShowModal;
  btnEmitir.SetFocus;
end;

procedure TfrmControlPagos.Button1Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TfrmControlPagos.infPagosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then btnDispositivo.SetFocus;
end;

end.
