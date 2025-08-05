unit LiquidacionObrasSoc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, DBCtrls, ToolWin, Mask, Editv, Grids,
  Buttons, DBTables, Menus;

type
  TfmLiquidacionOS = class(TForm)
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
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    montofact: TLabel;
    codos: TMaskEdit;
    periodo: TMaskEdit;
    porcentaje: TEditValid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    concepto: TMaskEdit;
    importe: TEditValid;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    BuscarObraSocial: TBitBtn;
    Label13: TLabel;
    totd: TLabel;
    registrar: TBitBtn;
    Cancelar: TBitBtn;
    nos: TLabel;
    F: TStringGrid;
    Label12: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    fecha: TMaskEdit;
    Label9: TLabel;
    Label15: TLabel;
    dist: TLabel;
    Label19: TLabel;
    importefact: TLabel;
    Label20: TLabel;
    impcobrar: TLabel;
    Panel7: TPanel;
    ScrollBox1: TScrollBox;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    D: TStringGrid;
    Panel12: TPanel;
    registraraj: TBitBtn;
    cancelaraj: TBitBtn;
    Panel8: TPanel;
    Label23: TLabel;
    BuscarAjuste: TBitBtn;
    idajuste: TMaskEdit;
    descripaj: TMaskEdit;
    Label24: TLabel;
    importeaj: TEditValid;
    TabSheet3: TTabSheet;
    Panel13: TPanel;
    ScrollBox2: TScrollBox;
    Panel14: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    nprofret: TLabel;
    perret: TLabel;
    idprofret: TMaskEdit;
    BuscarProfRet: TBitBtn;
    Panel15: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    BuscarRet: TBitBtn;
    idret: TMaskEdit;
    DescripRet: TMaskEdit;
    PorcentajeRet: TEditValid;
    Panel16: TPanel;
    Panel17: TPanel;
    T: TStringGrid;
    Panel18: TPanel;
    importeing: TEditValid;
    Label10: TLabel;
    idprof: TMaskEdit;
    BuscarProf: TBitBtn;
    nprof: TLabel;
    Panel20: TPanel;
    Label22: TLabel;
    Label21: TLabel;
    nprofdc: TLabel;
    periododc: TLabel;
    finalizar: TBitBtn;
    PopupMenu: TPopupMenu;
    BorrarMovProf: TMenuItem;
    BorrarMovObraSocial: TMenuItem;
    N1: TMenuItem;
    BorrarPeriodo: TMenuItem;
    PopupMenuModif: TPopupMenu;
    InsertarRegistro1: TMenuItem;
    ModificarItems1: TMenuItem;
    N2: TMenuItem;
    BorrarItems1: TMenuItem;
    idprofdc: TMaskEdit;
    BuscarProfes: TBitBtn;
    TabSheet4: TTabSheet;
    Panel19: TPanel;
    ScrollBox3: TScrollBox;
    PopupMenuModifDet: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    finalizaraj: TBitBtn;
    finalizarret: TBitBtn;
    guardarret: TBitBtn;
    cancelarret: TBitBtn;
    Label17: TLabel;
    importeret: TEditValid;
    TabSheet5: TTabSheet;
    Panel21: TPanel;
    ScrollBox4: TScrollBox;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    IT: TStringGrid;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    PR: TStringGrid;
    Panel30: TPanel;
    generarAjustes: TBitBtn;
    PopupMenuSelItems: TPopupMenu;
    SiNoSeleccin1: TMenuItem;
    N3: TMenuItem;
    odos1: TMenuItem;
    QuitarSelaTodos1: TMenuItem;
    PopupMenuSelProf: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    Panel29: TPanel;
    profpros: TLabel;
    itemspros: TLabel;
    Label18: TLabel;
    per: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarObraSocialClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure porcentajeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarProfClick(Sender: TObject);
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure conceptoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure importeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FDblClick(Sender: TObject);
    procedure FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure registrarClick(Sender: TObject);
    procedure fechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure importeingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure finalizarClick(Sender: TObject);
    procedure BorrarMovProfClick(Sender: TObject);
    procedure BorrarMovObraSocialClick(Sender: TObject);
    procedure BorrarPeriodoClick(Sender: TObject);
    procedure InsertarRegistro1Click(Sender: TObject);
    procedure BorrarItems1Click(Sender: TObject);
    procedure BuscarProfesClick(Sender: TObject);
    procedure idprofdcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CancelarClick(Sender: TObject);
    procedure BuscarAjusteClick(Sender: TObject);
    procedure idajusteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descripajKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure importeajKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure finalizarajClick(Sender: TObject);
    procedure registrarajClick(Sender: TObject);
    procedure cancelarajClick(Sender: TObject);
    procedure TabSheet2Hide(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BuscarRetClick(Sender: TObject);
    procedure idretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PorcentajeRetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idprofretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarProfRetClick(Sender: TObject);
    procedure importeretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure finalizarretClick(Sender: TObject);
    procedure guardarretClick(Sender: TObject);
    procedure cancelarretClick(Sender: TObject);
    procedure TDblClick(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure SiNoSeleccin1Click(Sender: TObject);
    procedure ITKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure odos1Click(Sender: TObject);
    procedure QuitarSelaTodos1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure PRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure generarAjustesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    items, itemsaj, itemsret: Integer; modifica, modificaaj, modificaret: Boolean;
    error: String;
    procedure DatosObraSocial;
    procedure DatosProfesional;
    procedure DatosProfesional1;
    procedure DatosProfesional2;
    procedure IniciarGrilla(G: TStringGrid);
    procedure InsertarLinea(G: TStringGrid);
    procedure BorrarRenglon(G: TStringGrid);
    procedure RegenerarItems(G: TStringGrid);
    procedure TotalizarFact;
    procedure IniciarDatos;
    function  verificarMovProfesional(xidprof: String): Boolean;
    function  verificarOperacion: Boolean;
    procedure CargarDatos;
    procedure CargarDetalleLiq;
    procedure DatosAjuste;
    procedure CargarDebitosCreditosProf;
    procedure DatosRetenciones;
    procedure ImporteRetencion;
    procedure CargarItemsRetenciones;
    function  CantidadItemsSeleccionados: Integer;
    function  CantidadProfesionalesSeleccionados: Integer;
  public
    { Public declarations }
  end;

var
  fmLiquidacionOS: TfmLiquidacionOS;

implementation

uses CLiquidacionObrasSocCCB, CObrasSocialesCCB, CUtiles, CFacturacionCCB,
  NominaObrasSociales, NominaDeProfesionalesLiquidacionOS, CProfesionalLiqOS, CAjustesIndivCentroBioq,
  NominaAjustesIndiv, NominaRet, CRetencionesCentroBioq, IngresoOperaciones;

{$R *.DFM}

procedure TfmLiquidacionOS.DatosObraSocial;
begin
  obsocial.getDatos(codos.Text);
  nos.Caption := obsocial.Nombre;
  montofact.Caption := utiles.FormatearNumero(FloatToStr(facturacion.setTotalFactObraSocial(periodo.Text, codos.Text)));
  CargarDatos;
end;

procedure TfmLiquidacionOS.DatosProfesional;
var
  j: Integer;
begin
  profesional.getDatos(idprof.Text);
  nprof.Caption := profesional.Nombre;

  // Si ya se liquido, Cargamos los Items
  if distribucionos.ExisteLiquidacion then Begin
    CargarDetalleLiq;
    BorrarMovProf.Enabled := distribucionos.ExisteLiquidacion;
  end;

  // Recalculamos los montos de distribucion
  importefact.Caption := utiles.FormatearNumero(FloatToStr(facturacion.setTotalProfesional(periodo.Text, idprof.Text, codos.Text)));
  impcobrar.Caption   := utiles.FormatearNumero(FloatToStr(StrToFloat(importefact.Caption) * (StrToFloat(porcentaje.Text) * 0.01)));

  if StrToFloat(importefact.Caption) <> 0 then Begin   // Anexamos el primer items con lo que debería Cobrar
    if verificarMovProfesional(idprof.Text) then j := F.Row else Begin
      Inc(items);
      j := items;
    end;

    F.cells[0, j] := utiles.sLlenarIzquierda(IntToStr(j), 3, '0');
    F.cells[1, j] := idprof.Text;
    F.cells[2, j] := 'Monto a Cobrar';
    F.cells[3, j] := impcobrar.Caption;
    F.cells[4, j] := 'N';
    finalizar.Enabled := True;
  end;
end;

procedure TfmLiquidacionOS.DatosProfesional1;
begin
  profesional.getDatos(idprofdc.Text);
  nprofdc.Caption := profesional.Nombre;
  Panel8.Enabled := True;
  CargarDebitosCreditosProf;
  ActiveControl := idajuste;
end;

procedure TfmLiquidacionOS.DatosProfesional2;
begin
  profesional.getDatos(idprofret.Text);
  nprofret.Caption := profesional.Nombre;
  error := 'Debe Seleccionar un Profesional con Operaciones desde' + ' la Sesión Ajustes Individuales';
  if verificarOperacion then Begin
    Panel15.Enabled := True;
    ActiveControl   := idret;
  end;
  error := '';
end;

procedure TfmLiquidacionOS.IniciarDatos;
begin
  idprof.Text := ''; nprof.Caption := ''; concepto.Text := ''; importe.Text := utiles.FormatearNumero('0');
  finalizar.Enabled := False; registrar.Enabled := False; GroupBox1.Enabled := False;
  BorrarMovProf.Enabled := False; BorrarMovObraSocial.Enabled := False; BorrarPeriodo.Enabled := False;
  IniciarGrilla(F);
end;

function TfmLiquidacionOS.verificarMovProfesional(xidprof: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  For i := 1 to F.RowCount do Begin
    if Length(Trim(F.cells[0, i])) = 0 then Break;
    if (F.cells[1, i] = xidprof) and (F.cells[4, i] = 'N') then Begin
      F.Row  := i;
      Result := True;
      Break;
    end;
  end;
end;

function TfmLiquidacionOS.verificarOperacion: Boolean;
begin
  Result := False;
  if StrToFloat(importefact.Caption) <> 0 then Result := True else Begin
    if Length(Trim(error)) = 0 then utiles.msgError('El Profesional No Registra Operaciones en esta Obra Social ...!') else utiles.msgError(error);
    idprof.Text := ''; nprof.Caption := ''; idprofdc.Text := ''; nprofdc.Caption := ''; idprofret.Text := ''; nprofret.Caption := '';
  end;
end;

procedure TfmLiquidacionOS.CargarDatos;
begin
  distribucionos.getDatos(periodo.Text, codos.Text);
  porcentaje.Text := utiles.FormatearNumero(FloatToStr(distribucionos.Porcentaje));
  importeing.Text := utiles.FormatearNumero(FloatToStr(distribucionos.Importe));
  dist.Caption    := utiles.FormatearNumero(FloatToStr(StrToFloat(montofact.Caption) * (StrToFloat(porcentaje.Text)) * 0.01));
  fecha.Text      := distribucionos.Fecha;
  idprof.Text     := ''; nprof.Caption := '';
  IniciarGrilla(F);
  BorrarMovObraSocial.Enabled := distribucionos.ExisteLiquidacion;
end;

procedure TfmLiquidacionOS.CargarDetalleLiq;
var
  r: TQuery; i, j, k: Integer;
begin
  r := distribucionos.setItems(periodo.Text, codos.Text, idprof.Text);
  r.Open; i := 0;
  while not r.Eof do Begin
    Inc(i);
    F.Cells[0, i] := r.FieldByName('items').AsString;
    F.Cells[1, i] := r.FieldByName('idprof').AsString;
    F.Cells[2, i] := r.FieldByName('concepto').AsString;
    F.Cells[3, i] := utiles.FormatearNumero(FloatToStr(r.FieldByName('importe').AsFloat));
    F.Cells[4, i] := r.FieldByName('protegido').AsString;
    r.Next;
  end;
  r.Close; r.Free;
  items := i;

  For j := i + 1 to F.RowCount do Begin
    if Length(Trim(F.Cells[0, j])) = 0 then Break;
    For k := 1 to F.ColCount do F.Cells[k-1, j] := '';
  end;

  TotalizarFact;
end;

procedure TfmLiquidacionOS.DatosAjuste;
begin
  ajustesindiv.getDatos(idajuste.Text);
  if idajuste.Text > '00' then descripaj.Text := ajustesindiv.Descrip else descripaj.Text := '';
  importeaj.Text := utiles.FormatearNumero(FloatToStr(ajustesindiv.Importe));
end;

procedure TfmLiquidacionOS.IniciarGrilla(G: TStringGrid);
var
  i, j: integer;
begin
  For i := 1 to G.RowCount do
    For j := 1 to G.ColCount do
      G.cells[j-1, i] := '';
  G.Row := 1; items := 0;
end;

procedure TfmLiquidacionOS.BorrarRenglon(G: TStringGrid);
//Objetivo...: Eliminar una Linea de detalle de la Factura
var
  i, x: integer;
begin
  //Quitamos el Renglon Seleccionado
  For i := G.row to G.RowCount do
    //Subimos un Renglon para Recortar el Eliminado
    if Length(Trim(G.cells[0, i])) > 0 then For x := 1 to G.ColCount do G.cells[x - 1, i] := G.cells[x - 1, i + 1];
  RegenerarItems(G);
end;

procedure TfmLiquidacionOS.InsertarLinea(G: TStringGrid);
// Objetivo...: Insertar un movimiento en el Asiento
var
  i, x, t: integer;
begin
  x := G.RowCount;
  t := G.row;
  while x > t do
    begin
      //Subimos un Renglon para Recortar el Eliminado
      For i := 1 to G.ColCount do G.cells[i - 1, x] := G.cells[i - 1, x - 1];
      G.cells[i - 1, x] := utiles.sLlenarIzquierda(IntToStr(G.row - 1), 3, '0');
      Dec(x);
    end;
  For x := 1 to G.ColCount do G.cells[x - 1, G.row] := '  ';
  RegenerarItems(G);
end;

procedure TfmLiquidacionOS.RegenerarItems;
var
  x: integer;
begin
  // Regeneramos el Nro. de Items
  For x := 1 to F.RowCount do
    if Length(Trim(F.cells[0, x])) = 0 then Break else
      F.Cells[0, x] := utiles.sLLenarIzquierda(IntToStr(x), 3, '0');
end;

procedure TfmLiquidacionOS.TotalizarFact;
var
  i: Integer; total, cobro: Real;
begin
  total := 0;
  For i := 1 to F.RowCount do Begin
    if Length(Trim(F.cells[0, i])) = 0 then Break;
    if F.Cells[4, i] = 'S' then total := total + (StrToFloat(F.cells[3, i]) * (-1)) else cobro := StrToFloat(F.cells[3, i]);
  end;
  totd.Caption      := utiles.FormatearNumero(FloatToStr(total));
  impcobrar.Caption := utiles.FormatearNumero(FloatToStr(cobro - total));
end;

procedure TfmLiquidacionOS.CargarDebitosCreditosProf;
var
  r: TQuery;
  i: Integer;
begin
  IniciarGrilla(D);
  r := distribucionos.setItemsDCProf(periododc.Caption, idprofdc.Text);
  r.Open; i := 0;
  while not r.EOF do Begin
    Inc(i);
    D.Cells[0, i] := r.FieldByName('items').AsString;
    D.Cells[1, i] := r.FieldByName('idajuste').AsString;
    D.Cells[2, i] := r.FieldByName('descripaj').AsString;
    D.Cells[3, i] := utiles.FormatearNumero(r.FieldByName('importeaj').AsString);
    r.Next;
  end;
  r.Close; r.Free;
  itemsaj := i;
end;

procedure TfmLiquidacionOS.DatosRetenciones;
Begin
  retenciones.getDatos(idret.Text);
  DescripRet.Text    := retenciones.Descrip;
  porcentajeret.Text := utiles.FormatearNumero(FloatToStr(retenciones.Porcentaje));
end;

procedure TfmLiquidacionOS.ImporteRetencion;
Begin
  retenciones.getDatos(idret.Text);
  DescripRet.Text := retenciones.Descrip;
  importeret.Text := utiles.FormatearNumero(FloatToStr(StrToFloat(impcobrar.Caption) * (StrToFloat(porcentajeret.Text) * 0.01)));
end;

procedure TfmLiquidacionOS.CargarItemsRetenciones;
var
  r: TQuery; i: Integer;
begin
  IniciarGrilla(T);
  r := distribucionos.setItemsRetenciones(perret.Caption, idprofret.Text);
  r.Open; i := 0;
  while not r.EOF do Begin
    Inc(i);
    T.Cells[0, i] := r.FieldByName('items').AsString;
    T.Cells[1, i] := r.FieldByName('idret').AsString;
    T.Cells[2, i] := r.FieldByName('descrip').AsString;
    T.Cells[3, i] := utiles.FormatearNumero(r.FieldByName('porcentaje').AsString);
    T.Cells[4, i] := utiles.FormatearNumero(r.FieldByName('importe').AsString);
    r.Next;
  end;
  r.Close; r.Free;
  itemsret := i;
end;

function  TfmLiquidacionOS.CantidadItemsSeleccionados: Integer;
var
  i, j: Integer;
Begin
  j := 0;
  For i := 1 to IT.RowCount do Begin
    if Length(Trim(IT.Cells[0, i])) = 0 then Break;
    if IT.Cells[2, i] = 'S' then Inc(j);
  end;
  Result := j;
end;

function  TfmLiquidacionOS.CantidadProfesionalesSeleccionados: Integer;
var
  i, j: Integer;
Begin
  j := 0;
  For i := 1 to PR.RowCount do Begin
    if Length(Trim(PR.Cells[0, i])) = 0 then Break;
    if PR.Cells[2, i] = 'S' then Inc(j);
  end;
  Result := j;
end;

procedure TfmLiquidacionOS.FormShow(Sender: TObject);
begin
  distribucionos.conectar;
  profesional.conectar;
  ajustesindiv.conectar;
  retenciones.conectar;
  porcentaje.Text     := utiles.FormatearNumero('100');
  montofact.Caption   := utiles.FormatearNumero('0');
  totd.Caption        := utiles.FormatearNumero('0');
  dist.Caption        := utiles.FormatearNumero('0');
  importefact.Caption := utiles.FormatearNumero('0');
  impcobrar.Caption   := utiles.FormatearNumero('0');
  periodo.Text        := utiles.setPeriodoActual;
  ActiveControl       := periodo;
  F.Cells[0, 0] := 'Items'; F.Cells[1, 0] := 'Id.Prof.'; F.Cells[2, 0] := 'Concepto'; F.Cells[3, 0] := 'Importe'; F.Cells[4, 0] := 'M';
  D.Cells[0, 0] := 'Items'; D.Cells[1, 0] := 'Id.'; D.Cells[2, 0] := 'Descripción Items'; D.Cells[3, 0] := 'Importe';
  T.Cells[0, 0] := 'It.'; T.Cells[1, 0] := 'Id.'; T.Cells[2, 0] := 'Descripción Retención'; T.Cells[3, 0] := 'Porc.'; t.Cells[4, 0] := 'Monto Ret.';
end;

procedure TfmLiquidacionOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  distribucionos.desconectar;
  profesional.desconectar;
  ajustesindiv.desconectar;
  retenciones.desconectar;
end;

procedure TfmLiquidacionOS.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then Begin
      BorrarPeriodo.Enabled := True;
      ActiveControl := codos;
    end else BorrarPeriodo.Enabled := False;
end;

procedure TfmLiquidacionOS.codosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := periodo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not obsocial.Buscar(codos.Text) then BuscarObraSocialClick(Sender);
    DatosObraSocial;
    if StrToFloat(montofact.Caption) <> 0 then ActiveControl := porcentaje else Begin
      utiles.msgError('La Obra Social no Registro Operaciones ...');
      codos.Text := '';
    end;
  end;
end;

procedure TfmLiquidacionOS.BuscarObraSocialClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  codos.Text := obsocial.tabla.FieldByName('codos').AsString;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
  Refresh;
end;

procedure TfmLiquidacionOS.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLiquidacionOS.porcentajeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codos;
  if (Key = VK_RETURN) or (Key = VK_DOWN) and (Length(Trim(porcentaje.Text)) > 0) then Begin
    porcentaje.Text := utiles.FormatearNumero(porcentaje.Text);
    dist.Caption    := utiles.FormatearNumero(FloatToStr(StrToFloat(montofact.Caption) * (StrToFloat(porcentaje.Text)) * 0.01));
    if StrToFloat(montofact.Caption) > 0 then ActiveControl := importeing else Begin
      utiles.msgError('Obra Social sin Ordenes Facturadas ...!');
      ActiveControl := periodo;
    end;
  end;
end;

procedure TfmLiquidacionOS.BuscarProfClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.ShowModal;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprof.Text    := profesional.tperso.FieldByName('idprof').AsString;
    idprofdc.Text  := idprof.Text;
    idprofret.Text := idprof.Text;
    Refresh;
    DatosProfesional;
    if verificarOperacion then Begin
      concepto.Enabled := True; importe.Enabled := True;
      ActiveControl := concepto;
    end else Begin
      concepto.Enabled := False; importe.Enabled := False;
    end;
  end;
  TotalizarFact;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := nil;
end;

procedure TfmLiquidacionOS.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if Length(Trim(F.Cells[0, 1])) > 0 then ActiveControl := finalizar;
  if Key = VK_UP then ActiveControl := codos;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not profesional.Buscar(idprof.Text) then BuscarProfClick(Sender) else Begin
      DatosProfesional;
      if verificarOperacion then Begin
        concepto.Enabled := True; importe.Enabled := True;
        idprofdc.Text    := idprof.Text;
        idprofret.Text   := idprof.Text;
        ActiveControl := concepto;
      end else Begin
        concepto.Enabled := False; importe.Enabled := False;
      end;
    end;
  end;
end;

procedure TfmLiquidacionOS.conceptoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idprof;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(concepto.Text)) > 0 then ActiveControl := importe;
  if Key = VK_ESCAPE then finalizarClick(Sender);
end;

procedure TfmLiquidacionOS.importeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  j: Integer;
begin
  if Key = VK_UP then ActiveControl := concepto;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if Length(Trim(importe.Text)) > 0 then
   if StrToFloat(importe.Text) <> 0 then Begin
    importe.Text := utiles.FormatearNumero(importe.Text);

    // Agregamos el Items
    if not Modifica then Begin
      Inc(items);
      j := items;
    end else j := F.Row;

    F.cells[0, j] := utiles.sLlenarIzquierda(IntToStr(j), 3, '0');
    F.cells[1, j] := idprof.Text;
    F.cells[2, j] := concepto.Text;
    F.cells[3, j] := utiles.FormatearNumero(importe.Text);   //utiles.FormatearNumero(FloatToStr(StrToFloat(importe.Text) * (-1)));
    F.cells[4, j] := 'S';

    Modifica := False;

    concepto.Text := ''; importe.Text := utiles.FormatearNumero('0');

    TotalizarFact;
    F.Row := j;
    finalizar.Enabled := True;

    ActiveControl     := concepto;
  end;
end;

procedure TfmLiquidacionOS.FDblClick(Sender: TObject);
begin
  if F.cells[4, F.Row] <> 'N' then Begin
    Modifica := True;
    concepto.Text := F.cells[2, F.Row];
    importe.Text  := utiles.FormatearNumero(F.cells[3, F.Row]); //utiles.FormatearNumero(FloatToStr(StrToFloat(F.cells[3, F.Row]) * (-1)));
  end else
    utiles.msgError('No esta Permitido realizar cambios en este Items ...!');
  ActiveControl := concepto;
end;

procedure TfmLiquidacionOS.FKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then FDblClick(Sender);
  if Key = VK_INSERT then InsertarRegistro1Click(Sender);
  if Key = VK_DELETE then BorrarItems1Click(Sender);
end;

procedure TfmLiquidacionOS.registrarClick(Sender: TObject);
var
  i: Integer;
begin
  if (utiles.verificarPeriodo(periodo.Text)) and (obsocial.Buscar(codos.Text)) and (StrToFloat(porcentaje.Text) > 0) and (StrToFloat(importeing.Text) > 0) and (utiles.ctrlFecha(fecha)) and (profesional.Buscar(idprof.Text)) and (Length(Trim(F.Cells[0, 1])) > 0) then Begin
    For i := 1 to Items do
      distribucionos.Guardar(periodo.Text, codos.Text, F.cells[1, i], F.cells[0, i], F.cells[2, i], fecha.Text, F.Cells[4, i], StrToFloat(F.Cells[3, i]), StrToFloat(importeing.Text), StrToFloat(porcentaje.Text), Items);

    IniciarDatos;
    IniciarGrilla(F);
    registrar.Enabled := False; cancelar.Enabled := False; GroupBox1.Enabled := True;
    ActiveControl := idprof;
  end else Begin
    utiles.msgError('No se han Suministrado Correctamente los Datos ...!');
    ActiveControl := periodo;
  end;
end;

procedure TfmLiquidacionOS.fechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := porcentaje;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if utiles.ctrlFecha(fecha) then Begin
    GroupBox1.Enabled := True;
    ActiveControl     := idprof;
  end;
end;

procedure TfmLiquidacionOS.importeingKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := porcentaje;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if Length(Trim(importeing.Text)) > 0 then
    if StrToFloat(importeing.Text) > 0 then Begin
      importeing.Text := utiles.FormatearNumero(importeing.Text);
      if (StrToFloat(importeing.Text)) <= (StrToFloat(dist.Caption)) then ActiveControl := fecha else utiles.msgError('El Importe Ingresado No Debe superar el Importe Ajustado ...!'); 
    end;
end;

procedure TfmLiquidacionOS.TabSheet2Show(Sender: TObject);
begin
  periododc.Caption := periodo.Text; Refresh;
  if Length(Trim(idprofdc.Text)) > 0 then Begin
    //idprofdc.Text   := idprof.Text;
    nprofdc.Caption := nprof.Caption;
    ActiveControl   := idprofdc;
    DatosProfesional1;
  end else Begin
    idprofdc.Text   := '';
    nprofdc.Caption := '';
    ActiveControl   := idprofdc;
    IniciarGrilla(D);
  end;
end;

procedure TfmLiquidacionOS.finalizarClick(Sender: TObject);
begin
  if Length(Trim(F.Cells[0, 1])) > 0 then Begin
    registrar.Enabled := True;  cancelar.Enabled := True;
    ActiveControl := registrar;
  end else utiles.msgError('No se han Registrado Items ...!');
end;

procedure TfmLiquidacionOS.BorrarMovProfClick(
  Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro para Eliminar Movimiento Obra Social: ' + nos.Caption + ',' + CHR(13) + 'Profesional: ' + nprof.Caption + ', ' + ' del Período: ' + periodo.Text) then Begin
    distribucionos.BorrarMovimientosProfesional(periodo.Text, codos.Text, idprof.Text);
    IniciarDatos;
    ActiveControl := periodo;
  end;
end;

procedure TfmLiquidacionOS.BorrarMovObraSocialClick(
  Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro para Eliminar Movimiento Obra Social: ' + nos.Caption + ',' + CHR(13) + ', ' + ' del Período: ' + periodo.Text) then Begin
    distribucionos.BorrarMovimientosObraSocial(periodo.Text, codos.Text);
    IniciarDatos;
    ActiveControl := periodo;
  end;
end;

procedure TfmLiquidacionOS.BorrarPeriodoClick(
  Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro para Eliminar Movimiento Período: ' + periodo.Text + CHR(13) + 'ADVERTENCIA: Esta Operación Elimina Todas las Operaciones de Todos los Profesionales y Obras Sociales') then Begin
    distribucionos.BorrarPeriodo(periodo.Text);
    IniciarDatos;
    ActiveControl := periodo;
  end;
end;

procedure TfmLiquidacionOS.InsertarRegistro1Click(Sender: TObject);
begin
  InsertarLinea(F);
  modifica := True;
  ActiveControl := concepto;
end;

procedure TfmLiquidacionOS.BorrarItems1Click(Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro para Eliminar Items ' + F.cells[0, F.Row] + ' ' + F.cells[2, F.Row]) then Begin
    BorrarRenglon(F);
    Dec(items);
    TotalizarFact;
  end;
  ActiveControl := concepto;
end;

procedure TfmLiquidacionOS.BuscarProfesClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.ShowModal;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprofdc.Text := profesional.tperso.FieldByName('idprof').AsString;
    Refresh;
    DatosProfesional1;
  end;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := nil;
end;

procedure TfmLiquidacionOS.idprofdcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not profesional.Buscar(idprofDC.Text) then BuscarProfesClick(Sender) else DatosProfesional1;
end;

procedure TfmLiquidacionOS.CancelarClick(Sender: TObject);
begin
  IniciarDatos;
  codos.Text := ''; porcentaje.Text := utiles.FormatearNumero('0'); importeing.Text := porcentaje.Text; fecha.Text := ''; dist.Caption := porcentaje.Text; montofact.Caption := porcentaje.Text; nos.Caption := '';
  cancelar.Enabled := False;
  ActiveControl := codos;
end;

procedure TfmLiquidacionOS.BuscarAjusteClick(Sender: TObject);
begin
  Application.CreateForm(TfmAjustesIndividuales, fmAjustesIndividuales);
  fmAjustesIndividuales.introSalir := True;
  fmAjustesIndividuales.ShowModal;
  fmAjustesIndividuales.Release; fmAjustesIndividuales := nil;
  idajuste.Text := ajustesindiv.tabla.FieldByName('items').AsString;
  DatosAjuste;
  ActiveControl := descripaj;
  Refresh;
end;

procedure TfmLiquidacionOS.idajusteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if Length(Trim(D.Cells[0, 1])) > 0 then Begin
      registraraj.Enabled := True;
      ActiveControl := registraraj;
    end;
  if Key = VK_UP then ActiveControl := idprofdc;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not ajustesindiv.Buscar(idajuste.Text) then BuscarAjusteClick(Sender);
    DatosAjuste;
    ActiveControl := descripaj;
  end;
end;

procedure TfmLiquidacionOS.descripajKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idajuste;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(descripaj.Text)) > 0 then ActiveControl := importeaj;
end;

procedure TfmLiquidacionOS.importeajKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  j: Integer;
begin
  if Key = VK_UP then ActiveControl := descripaj;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(importeaj.Text)) > 0 then Begin
      importeaj.Text := utiles.FormatearNumero(importeaj.Text);

      if (ajustesindiv.Buscar(idajuste.Text)) and (Length(Trim(descripaj.Text)) > 0) and (StrToFloat(importeaj.Text) <> 0) then Begin

        if not modificaaj then Inc(itemsaj);
        if not modificaaj then j := itemsaj else j := D.Row;

        D.Cells[0, j] := utiles.sLlenarIzquierda(IntToStr(j), 3, '0');
        D.Cells[1, j] := idajuste.Text;
        D.Cells[2, j] := descripaj.Text;
        D.Cells[3, j] := utiles.FormatearNumero(importeaj.Text);
        D.Row         := j;

        idajuste.Text := ''; descripaj.Text := ''; importeaj.Text := utiles.FormatearNumero('0');
        finalizaraj.Enabled := True;

        ActiveControl := idajuste;

      end else utiles.msgError('No se han Suministrado Suficientes Datos ...!');
    end;
end;

procedure TfmLiquidacionOS.DKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then DDblClick(Sender);
  if Key = VK_INSERT then MenuItem1Click(Sender);
  if Key = VK_DELETE then MenuItem4Click(Sender);
  ActiveControl := idajuste;
end;

procedure TfmLiquidacionOS.DDblClick(Sender: TObject);
begin
  if Length(D.cells[0, D.Row]) > 0 then Begin
    Modifica := True;
    idajuste.Text  := D.cells[1, D.Row];
    descripaj.Text := D.cells[2, D.Row];
    importeaj.Text := D.cells[3, D.Row];
  end else
    utiles.msgError('No esta Permitido realizar cambios en este Items ...!');
  ActiveControl := descripaj;
end;

procedure TfmLiquidacionOS.MenuItem1Click(Sender: TObject);
begin
  InsertarLinea(D);
  modifica := True;
end;

procedure TfmLiquidacionOS.MenuItem4Click(Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro para Eliminar Items ' + D.cells[0, D.Row] + ' ' + D.cells[2, D.Row]) then Begin
    BorrarRenglon(D);
    Dec(itemsaj);
  end;
  ActiveControl := idajuste;
end;

procedure TfmLiquidacionOS.finalizarajClick(Sender: TObject);
begin
  if Length(Trim(D.Cells[0, 1])) > 0 then Begin
    registraraj.Enabled := True; ActiveControl := registraraj;
  end;
end;

procedure TfmLiquidacionOS.registrarajClick(Sender: TObject);
var
  i: Integer;
begin
  if (profesional.Buscar(idprofdc.Text)) and (Length(Trim(D.Cells[0, 1])) > 0) then
    For i := 1 to D.RowCount do Begin
      if Length(Trim(D.Cells[0, i])) = 0 then Break;
      distribucionos.GuardarDCProf(periododc.Caption, idprofdc.Text, D.Cells[0, i], D.Cells[1, i], D.Cells[2, i], StrToFloat(D.Cells[3, i]), itemsaj);
    end;

  cancelarajClick(Sender);
end;

procedure TfmLiquidacionOS.cancelarajClick(Sender: TObject);
begin
  idprofdc.Text := ''; nprofdc.Caption := ''; idajuste.Text := ''; descripaj.Text := ''; importeaj.Text := utiles.FormatearNumero('0');
  registrar.Enabled := False; finalizaraj.Enabled := False; registraraj.Enabled := False;
  IniciarGrilla(D);
  ActiveControl := idprofdc;
end;

procedure TfmLiquidacionOS.TabSheet2Hide(Sender: TObject);
begin
  Panel8.Enabled := False;
end;

procedure TfmLiquidacionOS.TabSheet3Show(Sender: TObject);
begin
  perret.Caption := periodo.Text;
  if Length(Trim(idprofret.Text)) > 0 then Begin
    nprofret.Caption := profesional.nombre;
  end;

  CargarItemsRetenciones;
end;

procedure TfmLiquidacionOS.BuscarRetClick(Sender: TObject);
begin
  Application.CreateForm(TfmListRetenciones, fmListRetenciones);
  fmListRetenciones.introSalir := True;
  fmListRetenciones.ShowModal;
  if fmListRetenciones.seleccionOK then Begin
    idret.Text := retenciones.tabla.FieldByName('items').AsString;
    Refresh;
    DatosRetenciones;
    if idret.Text = '00' then ActiveControl := descripret else ActiveControl := porcentajeret;
  end else ActiveControl := idret;
  fmListRetenciones.Release; fmListRetenciones := nil;
end;

procedure TfmLiquidacionOS.idretKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then finalizarretClick(Sender);
  if Key = VK_UP then ActiveControl := idprofret;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not retenciones.Buscar(idret.Text) then BuscarRetClick(Sender) else Begin
      if idret.Text <> '00' then Begin
        descripret.Text := retenciones.Descrip;
        ActiveControl   := PorcentajeRet;
      end else ActiveControl := descripret;
    end;
  end;
end;

procedure TfmLiquidacionOS.PorcentajeRetKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := descripret;
  if (Key = VK_RETURN) or (Key = VK_DOWN) and (Length(Trim(porcentajeret.Text)) > 0) then Begin
    ImporteRetencion;
    ActiveControl := importeRet;
  end;
end;

procedure TfmLiquidacionOS.idprofretKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not profesional.Buscar(idprofret.Text) then BuscarProfRetClick(Sender) else DatosProfesional2;
end;

procedure TfmLiquidacionOS.BuscarProfRetClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.ShowModal;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprof.Text    := profesional.tperso.FieldByName('idprof').AsString;
    idprofdc.Text  := profesional.tperso.FieldByName('idprof').AsString;
    idprofret.Text := profesional.tperso.FieldByName('idprof').AsString;
    Refresh;
    DatosProfesional;
    DatosProfesional2;
  end;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := nil;
end;

procedure TfmLiquidacionOS.importeretKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  j: Integer;
begin
  if Key = VK_UP then ActiveControl := PorcentajeRet;
  if (Key = VK_RETURN) or (Key = VK_DOWN) and (Length(Trim(importeret.Text)) > 0) then Begin
    importeret.Text := utiles.FormatearNumero(importeret.Text);

    // Agregamos el Items
    if not ModificaRet then Begin
      Inc(itemsRet);
      j := itemsRet;
    end else j := T.Row;

    T.cells[0, j] := utiles.sLlenarIzquierda(IntToStr(j), 2, '0');
    T.cells[1, j] := idret.Text;
    T.cells[2, j] := descripret.Text;
    T.cells[3, j] := porcentajeret.Text;
    T.cells[4, j] := importeret.Text;

    Modificaret := False;

    idret.Text := ''; descripret.Text := ''; porcentajeret.Text := utiles.FormatearNumero('0'); importeret.Text := utiles.FormatearNumero('0');

    finalizarret.Enabled := True;
    T.Row := j;

    ActiveControl := idret;
  end;
end;

procedure TfmLiquidacionOS.finalizarretClick(Sender: TObject);
begin
  if Length(Trim(T.Cells[0, 1])) > 0 then Begin
    guardarret.Enabled := True;
    ActiveControl := guardarret;
  end;
end;

procedure TfmLiquidacionOS.guardarretClick(Sender: TObject);
var
  i: Integer;
begin
  if (profesional.Buscar(idprofret.Text)) and (Length(Trim(T.Cells[0, 1])) > 0) then
    For i := 1 to T.RowCount do Begin
      if Length(Trim(T.Cells[0, i])) = 0 then Break;
      distribucionos.GuardarRetenciones(perret.Caption, idprofret.Text, T.Cells[0, i], T.Cells[1, i], T.Cells[2, i], StrToFloat(T.Cells[4, i]), StrToFloat(T.Cells[3, i]), itemsret);
    end;

  cancelarretClick(Sender);
end;

procedure TfmLiquidacionOS.cancelarretClick(Sender: TObject);
begin
  idprofret.Text := ''; nprofret.Caption := ''; idret.Text := ''; descripret.Text := ''; importeret.Text := utiles.FormatearNumero('0'); porcentajeret.Text := utiles.FormatearNumero('0');
  registrar.Enabled := False; finalizaraj.Enabled := False; registraraj.Enabled := False;
  IniciarGrilla(T);
  ActiveControl := idprofret;
end;

procedure TfmLiquidacionOS.TDblClick(Sender: TObject);
begin
  if Length(Trim(T.cells[4, T.Row])) > 0 then Begin
    ModificaRet        := True;
    idret.Text         := T.cells[1, T.Row];
    descripret.Text    := T.cells[2, T.Row];
    porcentajeret.Text := T.cells[3, T.Row];
    importeret.Text    := T.cells[4, T.Row];
  end;
  ActiveControl := idret;
end;

procedure TfmLiquidacionOS.TabSheet5Show(Sender: TObject);
var
  r: TQuery; i: Integer;
begin
  Refresh;
  IniciarGrilla(IT); IniciarGrilla(PR);
  r := ajustesindiv.setItems; r.Open; i := 0;
  while not r.Eof do Begin
    if r.FieldByName('Items').AsString > '00' then Begin
      Inc(i);
      IT.Cells[0, i] := r.FieldByName('Descrip').AsString;
      IT.Cells[1, i] := r.FieldByName('Items').AsString;
      IT.Cells[3, i] := utiles.FormatearNumero(r.FieldByName('Items').AsString);
    end;
    r.Next;
  end;
  r.Close; r.Free;
  r := profesional.setProfesionalesAlf; r.Open; i := 0;
  while not r.Eof do Begin
    Inc(i);
    PR.Cells[0, i] := r.FieldByName('Nombre').AsString;
    PR.Cells[1, i] := r.FieldByName('Idprof').AsString;
    r.Next;
  end;
  r.Close; r.Free;
  per.Caption := periodo.Text;
end;

procedure TfmLiquidacionOS.SiNoSeleccin1Click(Sender: TObject);
begin
  if IT.Cells[2, IT.Row] = 'S' then IT.Cells[2, IT.Row] := ' ' else IT.Cells[2, IT.Row] := 'S';
  if CantidadItemsSeleccionados > 0 then PR.Enabled := True else PR.Enabled := False;
end;

procedure TfmLiquidacionOS.ITKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then SiNoSeleccin1Click(Sender);
  if Key = VK_RETURN then ActiveControl := PR;
end;

procedure TfmLiquidacionOS.odos1Click(Sender: TObject);
var
  i: Integer;
begin
  For i := 1 to IT.RowCount do Begin
    if Length(Trim(IT.Cells[0, i])) = 0 then Break;
    IT.Cells[2, i] := 'S';
  end;
  PR.Enabled := True;
end;

procedure TfmLiquidacionOS.QuitarSelaTodos1Click(Sender: TObject);
var
  i: Integer;
begin
  For i := 1 to IT.RowCount do Begin
    if Length(Trim(IT.Cells[0, i])) = 0 then Break;
    IT.Cells[2, i] := ' ';
  end;
  PR.Enabled := False;
end;

procedure TfmLiquidacionOS.MenuItem5Click(Sender: TObject);
begin
  if PR.Cells[2, PR.Row] = 'S' then PR.Cells[2, PR.Row] := ' ' else PR.Cells[2, PR.Row] := 'S';
  if CantidadProfesionalesSeleccionados > 0 then generarAjustes.Enabled := True else generarAjustes.Enabled := False;
end;

procedure TfmLiquidacionOS.MenuItem7Click(Sender: TObject);
var
  i: Integer;
begin
  For i := 1 to PR.RowCount do Begin
    if Length(Trim(PR.Cells[0, i])) = 0 then Break;
    PR.Cells[2, i] := 'S';
  end;
  generarAjustes.Enabled := True;
end;

procedure TfmLiquidacionOS.MenuItem8Click(Sender: TObject);
var
  i: Integer;
begin
  For i := 1 to PR.RowCount do Begin
    if Length(Trim(PR.Cells[0, i])) = 0 then Break;
    PR.Cells[2, i] := ' ';
  end;
  generarAjustes.Enabled := False;
end;

procedure TfmLiquidacionOS.PRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then MenuItem5Click(Sender);
end;

procedure TfmLiquidacionOS.generarAjustesClick(Sender: TObject);
var
  i, j: Integer;
begin
  For j := 1 to IT.RowCount do Begin
    IT.Row := j;
    if Length(Trim(IT.Cells[0, j])) = 0 then Break;
    if IT.Cells[2, j] = 'S' then Begin
      For i := 1 to PR.RowCount do Begin
        if Length(Trim(PR.Cells[0, i])) = 0 then Break;
        if PR.Cells[2, i] = 'S' then
          distribucionos.GuardarDCProf(periodo.Text, PR.Cells[1, i], '-' + utiles.sLlenarIzquierda(IntToStr(i), 2, '0'), IT.Cells[1, j], IT.Cells[0, j], StrToFloat(IT.Cells[3, j]), 0);
      end;
    end;
  end;
  generarajustes.Enabled := False;
end;

procedure TfmLiquidacionOS.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfmIngreso, fmIngreso);
  fmIngreso.ShowModal;
  fmIngreso.Release; fmIngreso := Nil;
end;

end.


