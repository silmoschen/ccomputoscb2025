unit FactCompras;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Grids, Mask, ExtCtrls, ComCtrls, ToolWin,
  Buttons, Editv, ImgList, DBTables, BorBtns;

type
  TfmFacturacionCompras = class(TForm)
    StatusBar1: TStatusBar;
    DTS: TDataSource;
    Panel12: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    totalfact: TLabel;
    Label12: TLabel;
    subtotal: TEditValid;
    bonificacion: TEditValid;
    neto: TEditValid;
    ivan: TEditValid;
    recargo: TEditValid;
    Panel5: TPanel;
    Panel6: TPanel;
    tc: TLabel;
    tcomprob: TLabel;
    idcomprobante: TBitBtn;
    Panel11: TPanel;
    Label17: TLabel;
    tot: TLabel;
    Panel8: TPanel;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label15: TLabel;
    nroremito: TMaskEdit;
    contado: TRadioButton;
    ctacte: TRadioButton;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    rsocial: TLabel;
    ncuit: TLabel;
    tipo: TLabel;
    Label22: TLabel;
    codprov: TMaskEdit;
    SelProveedor: TBitBtn;
    sucursal: TMaskEdit;
    numero: TMaskEdit;
    fecha: TMaskEdit;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label18: TLabel;
    codart: TMaskEdit;
    cantidad: TEditValid;
    dto: TEditValid;
    precio: TEditValid;
    selart: TBitBtn;
    Panel9: TPanel;
    registrar: TButton;
    btnCancelar: TButton;
    Panel10: TPanel;
    DetFact: TStringGrid;
    Stock: TStringGrid;
    E: TStringGrid;
    Panel13: TPanel;
    Label13: TLabel;
    dfecha: TMaskEdit;
    Label23: TLabel;
    hfecha: TMaskEdit;
    Label24: TLabel;
    GroupBox5: TGroupBox;
    RadioButton1: TRadioButton;
    Panel14: TPanel;
    btnDispositivoSalida: TButton;
    btnGenerarInforme: TButton;
    Panel15: TPanel;
    btnCerrar: TButton;
    procedure sucursalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure numeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codprovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure subtotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bonificacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure netoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ivanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure recargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nroremitoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DetFactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure contadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idcomprobanteClick(Sender: TObject);
    procedure codartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cantidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure precioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelProveedorClick(Sender: TObject);
    procedure ModificarDet(Sender: TObject);
    procedure idcomprobanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SalirClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure BuscarComprobanteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure selartClick(Sender: TObject);
    procedure registrarClick(Sender: TObject);
    procedure ctacteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ModificarClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure dfechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hfechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDispositivoSalidaClick(Sender: TObject);
    procedure btnGenerarInformeClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { private declarations }
    cr: TQuery;
    tm: string;
    modifica, grabado, redim: Boolean;
    j, nroitems, tmov: Integer;
    salida: char;
    procedure IniciarDatos;
    procedure IniciarDatos2;
    procedure CargarDatos;
    function  DCImporte(monto: string): string;
    function  SubtotalFact: real;
    procedure CargarDatosProveedor;
  public
    { public declarations }
  end;

var
  fmFacturacionCompras: TfmFacturacionCompras;

implementation

uses CFactCompraCCB, CComregi, CProveedorCCB, CInsumos_CentroBioq, CComprob, CUtiles, ImgForms, SelectDatos, provedor,
     NominaProveedores, CConfigForms, NominaDePrecios, CUtilidadesStringGrid,
  Disposit;


{$R *.DFM}

function  TfmFacturacionCompras.DCImporte(monto: string): string;
// Objetivo...: Manejar los Débitos/Créditos para los importes
begin
  if tm = '2' then
      if StrToFloat(monto) > 0 then monto := utiles.FormatearNumero(FloatToStr(StrToFloat(monto) * (-1)));
  Result := utiles.FormatearNumero(monto);
end;

function TfmFacturacionCompras.SubtotalFact: real;
var
  t: real;
  i: integer;
begin
  t := 0;
  For i := 1 to DetFact.RowCount do Begin
    if Length(trim(DetFact.cells[0, i])) = 0 then Break;
    if Length(trim(DetFact.cells[6, i])) > 0 then t := t + StrToFloat(DetFact.cells[6, i]);
  end;
  Result := t;
end;

procedure TfmFacturacionCompras.IniciarDatos;
// Objetivo...: Iniciar Datos
Begin
  tc.Caption := ''; tcomprob.Caption := ''; tipo.Caption := ''; sucursal.Text := ''; numero.Text := ''; fecha.Text := ''; codprov.Text := ''; rsocial.Caption := ''; ncuit.Caption := '';
  Panel7.Enabled := False; Panel8.Enabled := False; Panel4.Enabled := False; Panel3.Enabled := False; Panel10.Enabled := False;
  IniciarDatos2;
end;

procedure TfmFacturacionCompras.IniciarDatos2;
// Objetivo...: Iniciar Datos
Begin
  contado.Checked := True; nroremito.Text := ''; fecha.Text := utiles.setFechaActual;
  subtotal.Text := utiles.FormatearNumero('0'); bonificacion.Text := subtotal.Text; bonificacion.Text := subtotal.Text; neto.Text := subtotal.Text; ivan.Text := subtotal.Text; recargo.Text := subtotal.Text;
  totalfact.Caption := subtotal.Text; bonificacion.Text := subtotal.Text;
  codart.Text := ''; cantidad.Text := ''; precio.Text := ''; dto.Text := ''; tot.Caption := '';
  grid.IniciarGrilla(DetFact);
  grid.IniciarGrilla(stock);
  grid.EstablecerValoresPredeterminados(Stock, '0', 1);
  j := 0;
end;

procedure TfmFacturacionCompras.CargarDatos;
// Objetivo...: Cargar los Datos de la Factura
var
  r: TQuery; x: integer;
begin
  IniciarDatos2;
  FactCompra.getDatos(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text);
  if FactCompra._existe then Begin
    fecha.Text      := FactCompra.Fecha;
    nroremito.Text  := FactCompra.Remito;
    contado.Checked := False; ctacte.Checked := False;
    if FactCompra.ctcc = 1 then contado.Checked := True;
    if FactCompra.ctcc = 2 then ctacte.Checked := True;
    compregis.getDatos(tipo.Caption, tc.Caption);
    tcomprob.Caption := compregis.Descrip;
    CargarDatosProveedor;

    grid.IniciarGrilla(DetFact);
    grid.IniciarGrilla(E);
    j := 0;    // Inicia la carga de la Grilla

    r := FactCompra.setItems(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text);
    r.Open; r.First; x := 0;
    while not r.EOF do Begin
      Inc(x);
      insumo.getDatos(r.FieldByName('codart').AsString);
      DetFact.cells[0, x] := utiles.sLLenarIzquierda(IntToStr(x), 3, '0');
      DetFact.cells[1, x] := utiles.FormatearNumero(FloatToStr(r.FieldByName('cantidad').AsFloat));
      DetFact.cells[2, x] := r.FieldByName('codart').AsString;
      DetFact.cells[3, x] := insumo.Descrip;
      DetFact.cells[4, x] := utiles.FormatearNumero(FloatToStr(r.FieldByName('precio').AsFloat));
      DetFact.cells[5, x] := utiles.FormatearNumero(FloatToStr(r.FieldByName('descuento').AsFloat));
      DetFact.cells[6, x] := utiles.FormatearNumero(FloatToStr((r.FieldByName('precio').AsFloat * r.FieldByName('cantidad').AsFloat) - r.FieldByName('descuento').AsFloat));
      DetFact.cells[7, x] := r.FieldByName('idart').AsString;

      Stock.Cells[0, x]   := r.FieldByName('codart').AsString;
      Stock.Cells[1, x]   := utiles.FormatearNumero(FloatToStr(insumo.stock - r.FieldByName('cantidad').AsFloat));
      Stock.Cells[2, x]   := utiles.FormatearNumero(FloatToStr(r.FieldByName('cantidad').AsFloat));

      E.cells[1, x]       := DetFact.cells[1, x];

      r.Next;
    end;
    j := x; r.Close; r.Free;

    tot.Caption := utiles.FormatearNumero(FloatToStr(subtotalFact));

    subtotal.Text     := utiles.FormatearNumero(FloatToStr(FactCompra.Subtotal));
    bonificacion.Text := utiles.FormatearNumero(FloatToStr(FactCompra.Bonif));
    neto.Text         := utiles.FormatearNumero(FloatToStr(FactCompra.Subtotal - FactCompra.Bonif));
    ivan.Text         := utiles.FormatearNumero(FloatToStr(FactCompra.Ivari));
    totalfact.Caption := utiles.FormatearNumero(FloatToStr(FactCompra.Subtotal - FactCompra.Bonif + FactCompra.Ivari + FactCompra.Ivarni));

    compregis.getDatos(tipo.Caption, tc.Caption);
  end;
  if Panel8.Enabled then Begin
    if factcompra.ctcc = 1 then contado.Checked := True;
    if factcompra.ctcc = 2 then ctacte.Checked  := True;
  end;
end;

procedure TfmFacturacionCompras.CargarDatosProveedor;
begin
  proveedor.getDatos(codprov.Text);
  rsocial.Caption := proveedor.Nombre;
  ncuit.Caption   := proveedor.Nrocuit;
end;

procedure TfmFacturacionCompras.sucursalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    utiles.LlenarIzquierda(sucursal, 4, '0');
    numero.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.numeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := sucursal;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(numero.Text)) > 0 then Begin
      utiles.LlenarIzquierda(numero, 8, '0');
      fecha.SetFocus;
    end;
end;

procedure TfmFacturacionCompras.fechaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := numero;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fecha) then codprov.SetFocus;
end;

procedure TfmFacturacionCompras.codprovKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then fecha.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(codprov.Text)) > 0 then codprov.Text := utiles.sLlenarIzquierda(codprov.Text, 4, '0');
    if not proveedor.Buscar(codprov.Text) then SelProveedorClick(Sender) else Begin
      CargarDatosProveedor;
      Refresh;
      CargarDatos;
      Panel8.Enabled  := True;
      if contado.Checked then contado.SetFocus else ctacte.SetFocus;
    end;
  end;
end;

procedure TfmFacturacionCompras.subtotalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nroremito.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(subtotal.Text)) > 0 then
      if StrToFloat(subtotal.Text) <> 0 then Begin
        subtotal.Text := DCImporte(subtotal.Text);
        bonificacion.SetFocus;
      end;
end;

procedure TfmFacturacionCompras.bonificacionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then subtotal.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    bonificacion.Text := utiles.FormatearNumero(bonificacion.Text);
    neto.Text := FloatToStr(StrToFloat(subtotal.Text) - StrToFloat(bonificacion.Text));
    neto.Text := DCImporte(neto.Text);
    neto.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.netoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then bonificacion.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    bonificacion.Text := DCImporte(bonificacion.Text);
    ivan.Text         := utiles.FormatearNumero('0');
    recargo.Text      := utiles.FormatearNumero('0');
    ivan.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.ivanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then neto.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    ivan.Text := DCImporte(ivan.Text);
    recargo.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.recargoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ivan.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    totalfact.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(neto.Text) + StrToFloat(ivan.Text) + StrToFloat(recargo.Text)));
    recargo.Text   := DCImporte(recargo.Text);
    Panel3.Enabled := True;
    if factcompra._existe then Panel10.Enabled := True;
    codart.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.nroremitoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then
    if contado.Checked then contado.SetFocus else ctacte.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    utiles.LlenarIzquierda(nroremito, 8, '0');
    Panel4.Enabled := True;
    subtotal.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.DetFactKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_INSERT then Begin
    grid.InsertarLinea(DetFact);
    grid.InsertarLinea(Stock);
    grid.RegenerarItems(DetFact, 3);
    Inc(j);
    codart.SetFocus;
  end;
  if Key = VK_DELETE then
    if utiles.BajaRegistro('Seguro para Borrar Items Nro. ' + DetFact.cells[0, DetFact.row] + ' ?') then Begin
      if factcompra.BuscarCab(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text) then
         insumo.QuitarStock(detfact.Cells[2, detfact.row], StrToFloat(E.Cells[1, detfact.row]));

      grid.BorrarRenglon(DetFact);
      grid.BorrarRenglon(E);
      grid.BorrarRenglon(Stock);
      grid.RegenerarItems(DetFact, 3);
      Dec(j);
      tot.Caption   := utiles.FormatearNumero(FloatToStr(SubtotalFact));
      if j = 0 then Begin // Se eliminaron todos los items, por lo tanto se da de baja el comprobante
        factcompra.Borrar(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text);
        IniciarDatos;
        tc.Caption    := factcompra.tcabecera.FieldByName('idcompr').AsString;
        tipo.Caption  := factcompra.tcabecera.FieldByName('tipo').AsString;
        sucursal.Text := factcompra.tcabecera.FieldByName('sucursal').AsString;
        numero.Text   := factcompra.tcabecera.FieldByName('numero').AsString;
        codprov.Text  := factcompra.tcabecera.FieldByName('idtitular').AsString;
        CargarDatos;
      end else
        codart.SetFocus;
    end;
  if Key = VK_RETURN then ModificarDet(Sender);
end;

procedure TfmFacturacionCompras.contadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    if not ctacte.Checked then contado.Checked := True;
    ActiveControl := nroremito;
  end;
end;

procedure TfmFacturacionCompras.idcomprobanteClick(Sender: TObject);
begin
 if cr = nil then Begin
   cr := compregis.setComprobantesFacturacionCompras;   // Comprobantes imputables en Compras
   cr.Open;
   cr.FieldByName('codcomp').DisplayLabel := 'Tipo'; cr.FieldByName('idcompr').DisplayLabel := 'Cód.'; cr.FieldByName('descrip').DisplayLabel := 'Descripción del Comprobante';
 end;
 Application.CreateForm(TfmSelDatos, fmSelDatos);
 fmSelDatos.Caption := 'Elección del Comprobante';
 fmSelDatos.DTS.DataSet := cr;
 fmSelDatos.ShowModal;
 GroupBox1.Enabled := True;
 tc.Caption        := cr.FieldByName('idcompr').AsString;
 tipo.Caption      := cr.FieldByName('codcomp').AsString;
 tcomprob.Caption  := cr.FieldByName('descrip').AsString;
 if cr.FieldByName('DC').AsString = 'D' then tm := '1' else tm := '2';
 fmSelDatos.Release; fmSelDatos := nil;
 if (Length(Trim(tc.Caption)) > 0) and (Length(Trim(tipo.Caption)) > 0) then Begin
   Panel7.Enabled := True;
   sucursal.SetFocus;
 end;
end;

procedure TfmFacturacionCompras.codartKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if tot.Caption <> utiles.FormatearNumero(FloatToStr(StrToFloat(subtotal.Text) + StrToFloat(bonificacion.Text))) then utiles.msgError('El (*)Subtotal debe coincidir con el (*)Tot. Facturado ...!') else Begin
      registrar.Enabled := True;
      registrar.SetFocus;
    end;
  if Key = VK_UP then ActiveControl := recargo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    codart.Text := utiles.sLlenarIzquierda(codart.Text, 5, '0'); 
    if not insumo.Buscar(codart.Text) then selartClick(Sender);
    cantidad.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.cantidadKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codart;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(cantidad.Text)) > 0 then Begin
      cantidad.Text := DCimporte(cantidad.Text);
      ActiveControl := precio;
    end;
end;

procedure TfmFacturacionCompras.precioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := cantidad;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(precio.Text)) > 0 then Begin
      precio.Text   := DCImporte(precio.Text);
      ActiveControl := dto;
    end;
end;

procedure TfmFacturacionCompras.dtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := precio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    dto.Text := utiles.FormatearNumero(dto.Text);
    if Length(Trim(dto.Text)) > 0 then Begin
      if StrToFloat(dto.Text) <> 0 then dto.Text := DCImporte(dto.Text);

      // Cargamos una línea de detalle
      if not modifica then Inc(j);
      if not modifica then nroitems := j;
      if modifica then nroitems := DetFact.row;

      insumo.getDatos(codart.Text);
      DetFact.cells[0, nroitems] := utiles.sLlenarIzquierda(IntToStr(nroitems), 3, '0');
      DetFact.cells[1, nroitems] := utiles.FormatearNumero(cantidad.Text);
      DetFact.cells[2, nroitems] := codart.Text;
      DetFact.cells[3, nroitems] := insumo.Descrip;
      DetFact.cells[4, nroitems] := utiles.FormatearNumero(FloatToStr(StrToFloat(precio.Text)));
      DetFact.cells[5, nroitems] := utiles.FormatearNumero(dto.Text);
      DetFact.cells[6, nroitems] := utiles.FormatearNumero(FloatToStr((StrToFloat(precio.Text) * StrToFloat(cantidad.Text) - StrToFloat(dto.Text))));
      DetFact.cells[7, nroitems] := 'S';

      Stock.Cells[0, nroitems] := codart.Text;
      if not factcompra._existe then Stock.Cells[1, nroitems] := utiles.FormatearNumero(FloatToStr(insumo.stock));
      Stock.Cells[2, nroitems] := cantidad.Text;

      DetFact.Row                := nroitems;

      codart.Text := ''; cantidad.Text := ''; precio.Text := ''; dto.Text := '';
      Panel10.Enabled := True;

      tot.Caption := utiles.FormatearNumero(FloatToStr(SubtotalFact));
      if tot.Caption = subtotal.Text then registrar.Enabled := True else registrar.Enabled := False;

      modifica := False;
      ActiveControl := codart;
    end;
  end;
end;

procedure TfmFacturacionCompras.SelProveedorClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProveedores, fmListProveedores);
  fmListProveedores.introSalir := True;
  fmListProveedores.ShowModal;
  if fmListProveedores.seleccionOK then Begin
    codprov.Text := proveedor.tperso.FieldByName('codprov').AsString;
    CargarDatosProveedor;
    Refresh;
    CargarDatos;
    Panel8.Enabled  := True;
    if contado.Checked then contado.SetFocus else ctacte.SetFocus;
  end else Begin
    Panel8.Enabled := False;
    codprov.SetFocus;
  end;
  fmListProveedores.Release; fmListProveedores := nil;
end;

procedure TfmFacturacionCompras.ModificarDet(Sender: TObject);
begin
  modifica       := True;
  nroitems       := DetFact.row;
  codart.Text    := DetFact.cells[2, nroitems];
  cantidad.Text  := DetFact.cells[1, nroitems];
  precio.Text    := DetFact.cells[4, nroitems];
  dto.Text       := DetFact.cells[5, nroitems];

  ActiveControl := codart;
end;

procedure TfmFacturacionCompras.idcomprobanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfmFacturacionCompras.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFacturacionCompras.BajaClick(Sender: TObject);
var
  x: Integer;
begin
  if factcompra.BuscarCab(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text) then
    if utiles.BajaRegistro('Seguro para Eliminar Comprobante Nº: ' + tc.Caption + ' ' + tipo.Caption + ' ' + sucursal.Text + '-' + numero.Text + chr(13) + 'de ' + rsocial.Caption) then Begin
      StatusBar1.Panels[0].Text := 'Eliminando Comprobante ...!'; StatusBar1.Refresh;
      factcompra.Borrar(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text);
      for x := 1 to DetFact.RowCount do Begin
        if Length(Trim(Stock.Cells[0, x])) = 0 then Break;
        insumo.QuitarStock(detfact.Cells[2, x], StrToFloat(detfact.Cells[1, x]));
      end;
      IniciarDatos;
      tc.Caption    := factcompra.tcabecera.FieldByName('idcompr').AsString;
      tipo.Caption  := factcompra.tcabecera.FieldByName('tipo').AsString;
      sucursal.Text := factcompra.tcabecera.FieldByName('sucursal').AsString;
      numero.Text   := factcompra.tcabecera.FieldByName('numero').AsString;
      codprov.Text  := factcompra.tcabecera.FieldByName('idtitular').AsString;
      CargarDatos;
    end;
  idcomprobante.SetFocus;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmFacturacionCompras.BuscarComprobanteClick(Sender: TObject);
begin
  factcompra.tcabecera.Last;
end;

procedure TfmFacturacionCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmFacturacionCompras, redim);
  StatusBar1.Panels[0].Text := 'Desconectando ...!'; StatusBar1.Refresh;
  factcompra.desconectar;
  compregis.desconectar;
  if Assigned(Dispositivo) then Begin
    Dispositivo.Release;
    Dispositivo := Nil;
  end;
  Release; fmFacturacionCompras := nil;
end;

procedure TfmFacturacionCompras.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  GroupBox1.Enabled := True;
  tc.Caption    := factcompra.tcabecera.FieldByName('idcompr').AsString;
  tipo.Caption  := factcompra.tcabecera.FieldByName('tipo').AsString;
  sucursal.Text := factcompra.tcabecera.FieldByName('sucursal').AsString;
  numero.Text   := factcompra.tcabecera.FieldByName('numero').AsString;
  codprov.Text  := factcompra.tcabecera.FieldByName('idtitular').AsString;
  CargarDatos;
end;

procedure TfmFacturacionCompras.FormShow(Sender: TObject);
begin
  if not configform.Setear(fmFacturacionCompras) then Begin
    Width  := 578;
    Height := 410;
  end;
  StatusBar1.Panels[0].Text := 'Conectando ...!'; StatusBar1.Refresh;
  factcompra.conectar;
  compregis.conectar;
  DTS.DataSet := factcompra.tcabecera;
  DetFact.Cells[0,0] := 'Items'; DetFact.Cells[1,0] := 'Cantidad'; DetFact.Cells[2,0] := 'Cód. Artículo'; DetFact.Cells[3,0] := 'Descripción'; DetFact.Cells[4,0] := 'Precio Unit.'; DetFact.Cells[5,0] := 'Descuento'; DetFact.Cells[6,0] := 'Subtotal'; DetFact.Cells[7,0] := 'T';
  IniciarDatos;
  idcomprobante.SetFocus;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  salida := 'P';
  redim := False;
end;

procedure TfmFacturacionCompras.selartClick(Sender: TObject);
begin
  Application.CreateForm(TfmListInsumos, fmListInsumos);
  fmListInsumos.introSalir           := True;
  fmListInsumos.ShowModal;
  Refresh;
  if fmListInsumos.seleccionOK then Begin
    codart.Text := insumo.tabla.FieldByName('id').AsString;
    cantidad.SetFocus;
  end;
  fmListInsumos.Release; fmListInsumos := nil;
end;

procedure TfmFacturacionCompras.registrarClick(Sender: TObject);
var
  x: integer;
begin
  StatusBar1.Panels[0].Text := 'Registrando Comprobante ...!'; StatusBar1.Refresh;
  if factcompra.BuscarCab(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text) then Begin
    For x := 1 to DetFact.rowCount do Begin     // Reajuste de Stock
      if Length(trim(DetFact.cells[1, x])) = 0 then Break;
      insumo.QuitarStock(detfact.Cells[2, x], StrToFloat(E.Cells[1, x]));
    end;
  end;

  if contado.checked then tmov := 1 else tmov := 2;
  For x := 1 to DetFact.rowCount do      // Detalle de la Factura
    if Length(trim(DetFact.cells[1, x])) = 0 then Break else Begin
       Factcompra.Grabar(tc.Caption, tipo.Caption, sucursal.Text, numero.Text, codprov.Text, fecha.Text, nroremito.Text, DetFact.cells[0, x], DetFact.cells[2, x], DetFact.cells[7, x], tmov, StrToFloat(subtotal.Text), StrToFloat(bonificacion.Text), 0, StrToFloat(ivan.Text), StrToFloat(recargo.Text), 0, StrToFloat(DetFact.cells[1, x]), StrToFloat(DetFact.cells[4, x]), StrToFloat(DetFact.cells[5, x]));
       insumo.AgregarStock(detfact.Cells[2, x], StrToFloat(detfact.Cells[1, x]));
    end;
  grabado           := True;
  registrar.Enabled := False;
  IniciarDatos;
  idcomprobante.SetFocus;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmFacturacionCompras.ctacteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    if not ctacte.Checked then contado.Checked := True;
    ActiveControl := nroremito;
  end;
end;

procedure TfmFacturacionCompras.ModificarClick(Sender: TObject);
begin
  if factcompra._existe then Begin
    Panel7.Enabled := True;
    GroupBox1.Enabled := True;
    fecha.SetFocus;
  end;
end;

procedure TfmFacturacionCompras.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmFacturacionCompras.TabSheet2Show(Sender: TObject);
begin
  dfecha.SetFocus;
end;

procedure TfmFacturacionCompras.dfechaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(dfecha) then hfecha.SetFocus;
end;

procedure TfmFacturacionCompras.hfechaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then dfecha.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(hfecha) then RadioButton1.SetFocus;
end;

procedure TfmFacturacionCompras.RadioButton1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then btnDispositivoSalida.SetFocus;
end;

procedure TfmFacturacionCompras.btnDispositivoSalidaClick(Sender: TObject);
begin
  if not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo); 
  Dispositivo.ShowModal;
  if Dispositivo.impresor.Checked then salida := 'I' else salida := 'P';
  btnGenerarInforme.SetFocus;
end;

procedure TfmFacturacionCompras.btnGenerarInformeClick(Sender: TObject);
begin
  factcompra.listFechas(dfecha.Text, hfecha.Text, salida);
  factcompra.Listar;
  btnCerrar.SetFocus;
end;

procedure TfmFacturacionCompras.btnCerrarClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

end.
