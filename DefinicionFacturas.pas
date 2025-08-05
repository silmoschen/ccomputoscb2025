unit DefinicionFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Editv, Grids, ComCtrls, Buttons, DB, DBTables, Printers, Mask,
  ExtCtrls, DBCtrls;

const
  cantit = 3;

type
  TfmDefFacturas = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    Label39: TLabel;
    tipoFact: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    definir: TBitBtn;
    cerrar: TBitBtn;
    Panel6: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    incorporar: TBitBtn;
    BitBtn2: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    TC: TStringGrid;
    Panel9: TPanel;
    CD: TStringGrid;
    Panel10: TPanel;
    Label20: TLabel;
    IDCP: TLabel;
    DCCP: TLabel;
    DESP: TLabel;
    Label24: TLabel;
    codnp: TLabel;
    CheckBox1: TCheckBox;
    Panel11: TPanel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label13: TLabel;
    nneto: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    codnumer: TEditValid;
    nroinicial: TEditValid;
    nrofinal: TEditValid;
    nroactual: TEditValid;
    Limpresoras: TComboBox;
    controlstock: TMaskEdit;
    nmaximo: TMaskEdit;
    tipoEmision: TComboBox;
    ncopias: TComboBox;
    impcompr: TMaskEdit;
    resolucion: TEditValid;
    Panel12: TPanel;
    Label18: TLabel;
    IDC: TLabel;
    DCC: TLabel;
    DES: TLabel;
    Label19: TLabel;
    codn: TLabel;
    Panel13: TPanel;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    expendio: TMaskEdit;
    descrip: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure incorporarClick(Sender: TObject);
    procedure CDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nroinicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrofinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nroactualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimpresorasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure definirClick(Sender: TObject);
    procedure codnumerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TCDblClick(Sender: TObject);
    procedure nmaximoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDDblClick(Sender: TObject);
    procedure controlstockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet1Show(Sender: TObject);
    procedure tipoFactChange(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure expendioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure tipoEmisionChange(Sender: TObject);
    procedure LimpresorasChange(Sender: TObject);
    procedure impcomprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tipoEmisionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure resolucionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure codnumerChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    z: integer; modificado, f: boolean;
    tdef: array[1..cantit] of string;
    function  Det_ultimoc: integer;
    function  comprobar_c(c, t: string): boolean;
    procedure DatosComprobante;
    procedure DatosNumeracion;
    procedure CargarNetos;
    procedure ConectarFact;
    procedure CargarComprobantesDef;
  public
    { Public declarations }
  end;

var
  fmDefFacturas: TfmDefFacturas;

implementation

uses CAdmNumCompr, CCNetos, CComregi, CUtiles;

{$R *.DFM}

procedure TfmDefFacturas.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
end;

procedure TfmDefFacturas.DatosComprobante;
// Objetivo...: Actualizar los datos de comoprobantes definidos
begin
  administNum.getDatosDefF(CD.Cells[0, CD.row], CD.Cells[1, CD.row], tdef[tipoFact.ItemIndex + 1]);
  codnumer.Text    := administNum.NCodnumer;
  nroinicial.Text  := utiles.sLLenarIzquierda(administNum.NNroinicial, 8, '0');
  nrofinal.Text    := utiles.sLLenarIzquierda(administNum.NNrofinal, 8, '0');
  nroactual.Text   := utiles.sLLenarIzquierda(administNum.NNroactual, 8, '0');
  Limpresoras.Text := Limpresoras.Items[administNum.NImpresora];
  resolucion.Text  := IntToStr(administNum.NResolucion);
  nmaximo.Text     := IntToStr(administNum.Nnmaximo);
  controlstock.Text:= administNum.Ncontrolstock;
  impcompr.Text    := administNum.Nimpcompr;
  if administNum.Nrecibo = 1 then RadioButton1.Checked := True else RadioButton1.Checked := False;
  if administNum.Nrecibo = 2 then RadioButton2.Checked := True else RadioButton2.Checked := False;

  CargarNetos;
  DatosNumeracion;
  modificado := False;
end;

procedure TfmDefFacturas.CargarNetos;

begin
end;

procedure TfmDefFacturas.DatosNumeracion;
// Objetivo...: Actualizar los datos de comoprobantes definidos - Fact. Normal
begin
  codn.Caption  := codnumer.Text;
  codnp.Caption := codnumer.Text;
  nroinicial.Text := ''; nrofinal.Text := ''; nroactual.Text := ''; nmaximo.Text := '';
  administNum.getDatosNF(codnumer.Text);
  nroinicial.Text       := utiles.sLLenarIzquierda(administNum.NFnroinicial, 8, '0');
  nrofinal.Text         := utiles.sLLenarIzquierda(administNum.NFnrofinal, 8, '0');
  nroactual.Text        := utiles.sLLenarIzquierda(administNum.NFnroactual, 8, '0');
  nmaximo.Text          := IntToStr(administNum.NNmaximo);
  tipoEmision.ItemIndex := administNum.Ncantcopias - 1;
  tipoEmision.Text      := tipoEmision.Items[tipoEmision.ItemIndex];
  administNum.getDatosNF(codnumer.Text);
  expendio.Text         := administNum.NFExpendio;
  descrip.Text          := administNum.NFDesExpen;
end;

procedure TfmDefFacturas.ConectarFact;
// Objetivo...: Conectar Facturación (Normal)
var
  t: TQuery; i: integer;
begin
  administNum.conectar;
  compregis.conectar;
  TC.Cells[0, 0] := 'TC'; TC.Cells[1, 0] := 'IDC'; TC.Cells[2, 0] := 'Descripción';
  CD.Cells[0, 0] := 'TC'; CD.Cells[1, 0] := 'IDC'; CD.Cells[2, 0] := 'Descripción';
  // Impresoras disponibles
  LImpresoras.Items  := printer.Printers;
  LImpresoras.Text   := LImpresoras.Items[0];
  // Cargamos los comprobantes disponibles
  t := compregis.setComprobantesVentas;
  t.Open; t.First; i := 1;
  while not t.EOF do
    begin
      compregis.getDatos(t.FieldByName('idcompr').AsString);
      TC.Cells[0, i] := t.FieldByName('codcomp').AsString;
      TC.Cells[1, i] := t.FieldByName('idcompr').AsString;
      TC.Cells[2, i] := compregis.Descrip;
      Inc(i);
      t.Next;
    end;
  t.Close; t.Free;
  CargarComprobantesDef;
end;

procedure TfmDefFacturas.CargarComprobantesDef;
// Objetivo...: Cargar Comprobantes Definidos de acuerdo al Tipo de Facturación
var
  t: TQuery; i, j: integer;
begin
  For i := 1 to CD.RowCount do
    For j := 1 to CD.ColCount do CD.cells[j - 1, i] := '';
  administNum.conectar;
  // Cargamos los comprobantes definidos
  t := administNum.setComprobantesDefinidos;
  t.Open; t.First; i := 1;
  while not t.EOF do
    begin
      if t.FieldByName('categoria').AsString = tdef[tipoFact.ItemIndex + 1] then Begin
        CD.Cells[0, i] := t.FieldByName('codcomp').AsString;
        CD.Cells[1, i] := t.FieldByName('idcompr').AsString;
        CD.Cells[2, i] := t.FieldByName('descrip').AsString;
        Inc(i);
      end;
      t.Next;
    end;
  controlstock.Text  := administNum.Ncontrolstock;
end;

procedure TfmDefFacturas.FormActivate(Sender: TObject);
begin
  Refresh;
  if not f then Begin
    tdef[1] := 'F01'; tdef[2] := 'F02'; tdef[3] := 'F03';
    tipoFactChange(Sender);
    netos.conectar;
    conectarFact;
    ActiveControl := TC;
    tipoFact.ItemIndex := 0;
    CargarComprobantesDef;
    f := True;
  end;
end;

function TfmDefFacturas.Det_ultimoc: integer;
// Objetivo...: determinar el nro. de items del último comprobante
var
  i: integer;
begin
  For i := 1 to CD.RowCount do
    if Length(Trim(CD.Cells[0, i])) = 0 then Break;
  Result := i;
end;

function TfmDefFacturas.comprobar_c(c, t: string): boolean;
// Objetivo...: verificar si un comprobante ya Existe
var
  i: integer;
begin
  Result := False;
  For i := 1 to CD.RowCount do
    if (CD.cells[1, i] = c) and (CD.cells[0, i] = t) then
      begin
        Result := True;
        z      := i;
        Break;
      end;
end;

procedure TfmDefFacturas.cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDefFacturas.incorporarClick(Sender: TObject);
var
  x: integer;
begin
  if utiles.msgSiNo('Seguro p/Definir Comprobante ?') then Begin
    x := Det_ultimoc;
    if Length(Trim(TC.cells[0, TC.row])) = 0 then utiles.msgError('Comprobante Incorrecto ...!') else
     if not comprobar_c(TC.Cells[1, TC.row], TC.Cells[0, TC.row]) then
      begin
        CD.Cells[0, x] := TC.Cells[0, TC.row];
        CD.Cells[1, x] := TC.Cells[1, TC.row];
        CD.Cells[2, x] := TC.Cells[2, TC.row];
        CD.Row := x;
        ActiveControl  := CD;
        definir.Enabled := True;
      end
    else
      CD.Row := z;
  end;
  modificado := True;
end;

procedure TfmDefFacturas.CDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  x, i: integer;
begin
  if Key = VK_DELETE then
    if utiles.BajaRegistro('Comprobante Seleccionado') then Begin
       if Length(Trim(tipoFact.Items[tipoFact.ItemIndex])) = 0 then tipoFact.ItemIndex := 0;
       administNum.BorrarDefF(CD.cells[0, CD.row], CD.cells[1, CD.row], tdef[tipoFact.ItemIndex + 1]);
       // Lo quitamos de la Grilla
       //Quitamos el Renglon Seleccionado
       For i := CD.row to CD.RowCount do
         //Subimos un Renglon para Recortar el Eliminado
         if Length(Trim(CD.cells[0, i])) > 0 then For x := 1 to CD.ColCount do CD.cells[x - 1, i] := CD.cells[x - 1, i + 1];
    end;
  if Key = VK_RETURN then CDDblClick(Sender);
end;

procedure TfmDefFacturas.nroinicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codnumer;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      nroinicial.Text := utiles.sLlenarIzquierda(nroinicial.Text, 8, '0');
      ActiveControl   := nrofinal;
      modificado      := True;
    end;
end;

procedure TfmDefFacturas.nrofinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nroinicial;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      nrofinal.Text := utiles.sLlenarIzquierda(nrofinal.Text, 8, '0');
      ActiveControl := nroactual;
      modificado    := True;
    end;
end;

procedure TfmDefFacturas.nroactualKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nrofinal;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      nroactual.Text := utiles.sLlenarIzquierda(nroactual.Text, 8, '0');
      ActiveControl  := LImpresoras;
      StatusBar1.Panels[0].Text := 'ENTER - Definir Comprobante';
      modificado     := True;
    end;
end;

procedure TfmDefFacturas.LimpresorasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := nmaximo;
end;

procedure TfmDefFacturas.definirClick(Sender: TObject);
var
  iimp: integer;
begin
  iimp := StrToInt(label22.Caption);
  if Length(Trim(tipoFact.Items[tipoFact.ItemIndex])) = 0 then tipoFact.ItemIndex := 0; 
  administNum.GrabarDefF(CD.cells[0, CD.row], CD.cells[1, CD.row], tdef[tipoFact.ItemIndex + 1], CD.cells[2, CD.row], '');
  if RadioButton1.Checked then administNum.FijarReciboPorDefecto(CD.cells[0, CD.row], CD.cells[1, CD.row], tdef[tipoFact.ItemIndex + 1]);
  if RadioButton2.Checked then administNum.FijarComprobanteComoRemito(CD.cells[0, CD.row], CD.cells[1, CD.row], tdef[tipoFact.ItemIndex + 1]);
  if Length(Trim(codnumer.Text)) > 0 then Begin
    administNum.FijarPuntoDeVenta(codnumer.Text, expendio.Text, descrip.Text);
    administNum.EstablecerCodigoNumeracion(CD.cells[0, CD.row], CD.cells[1, CD.row], tdef[tipoFact.ItemIndex + 1], codnumer.Text, nroinicial.Text, nrofinal.Text, nroactual.Text, iimp, StrToInt(nmaximo.Text), StrToInt(ncopias.Text), StrToInt(resolucion.Text), controlstock.Text, impcompr.Text);
  end;

  StatusBar1.Panels[0].Text := '';
  definir.Enabled := False;
  modificado      := False;
  if PageControl1.ActivePage = TabSheet1 then ActiveControl   := cerrar;
end;

procedure TfmDefFacturas.codnumerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      codnumer.Text := utiles.sLlenarIzquierda(codnumer.Text, 2, '0');
      DatosNumeracion;
      ActiveControl := nroinicial;
    end;
end;

procedure TfmDefFacturas.TCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then incorporarClick(Sender);
end;

procedure TfmDefFacturas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if modificado then Begin
    PageControl1.ActivePageIndex := 0;
    if utiles.msgSiNo('Guardar Cambios Efectuados ?') then definirClick(Sender);
  end;
  Limpresoras.Free;
  netos.desconectar;
  compregis.desconectar;
  administNum.desconectar;
  Release;
  fmDefFacturas := nil;
end;

procedure TfmDefFacturas.TCDblClick(Sender: TObject);
begin
  incorporarClick(Sender);
end;

procedure TfmDefFacturas.nmaximoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    ActiveControl := tipoEmision;
    modificado    := True;
  end;
end;

procedure TfmDefFacturas.CDDblClick(Sender: TObject);
begin
  if modificado then
    if utiles.msgSiNo('Guardar Cambios Efectuados ?') then definirClick(Sender);
  DatosComprobante;
  definir.Enabled := True;
end;

procedure TfmDefFacturas.controlstockKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := impcompr;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(controlstock.Text, 'SN', 'Las posibilidades son S/N ...!') then ActiveControl := tipoEmision;
end;

procedure TfmDefFacturas.TabSheet1Show(Sender: TObject);
begin
  conectarFact;
end;

procedure TfmDefFacturas.tipoFactChange(Sender: TObject);
begin
  CargarComprobantesDef;
  ActiveControl := TC;
end;

procedure TfmDefFacturas.TabSheet3Show(Sender: TObject);
begin
  IDC.Caption  := CD.Cells[0, CD.row];
  DCC.Caption  := CD.Cells[1, CD.row];
  DES.Caption  := CD.Cells[2, CD.row];
  ActiveControl := expendio;
  definir.Enabled := True;
end;

procedure TfmDefFacturas.expendioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    expendio.Text := utiles.sLlenarIzquierda(expendio.Text, 4, '0');
    ActiveControl := descrip;
  end;
end;

procedure TfmDefFacturas.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := expendio;
end;

procedure TfmDefFacturas.TabSheet2Show(Sender: TObject);
begin
  definirClick(Sender);
  if Length(Trim(tipoFact.Items[tipoFact.ItemIndex])) = 0 then tipoFact.ItemIndex := 0;
  DatosComprobante;
  DatosNumeracion;
  IDCP.Caption  := CD.Cells[0, CD.row];
  DCCP.Caption  := CD.Cells[1, CD.row];
  DESP.Caption  := CD.Cells[2, CD.row];
  CODNP.Caption := codnumer.Text;
  if administNum.NimpRapida = 1 then CheckBox1.Checked := True else CheckBox1.Checked := False;
  definir.Enabled := True;
  ActiveControl   := codnumer;
end;

procedure TfmDefFacturas.tipoEmisionChange(Sender: TObject);
begin
  ncopias.ItemIndex := tipoEmision.ItemIndex;
  modificado        := True;
end;

procedure TfmDefFacturas.LimpresorasChange(Sender: TObject);
begin
  label22.Caption := inttostr(limpresoras.ItemIndex);
  modificado      := True;
end;

procedure TfmDefFacturas.impcomprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := tipoEmision;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(impcompr.Text, 'SN', 'Las posibilidades son S/N ...!') then Begin
      ActiveControl := controlstock;
      modificado    := True;
    end;
end;

procedure TfmDefFacturas.tipoEmisionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := impcompr;
end;

procedure TfmDefFacturas.resolucionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := tipoEmision;
  if (Key = VK_DOWN) or (Key = VK_RETURN) then
    if Length(Trim(resolucion.Text)) = 0 then utiles.msgError('Error - La resolución debe ser mayor a 0 ...!') else Begin
      ActiveControl := codnumer;
      modificado    := True;
    end;
end;

procedure TfmDefFacturas.CheckBox1Click(Sender: TObject);
var
  i: shortint;
begin
  if CheckBox1.Checked then i := 1 else i := 0;
  if Length(Trim(codnumer.Text)) = 0 then utiles.msgError('No se seleccionó comprobante ...!') else administNum.ImpresionRapida(codnumer.Text, i);
  modificado := True;
end;

procedure TfmDefFacturas.codnumerChange(Sender: TObject);
begin
  modificado := True;
end;

procedure TfmDefFacturas.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    Height := 324; Width := 442; Top := 35; Left:=(Screen.Width - Width) div 2;
  end;
end;

end.
