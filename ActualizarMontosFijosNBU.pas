unit ActualizarMontosFijosNBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Grids, DBTables;

type
  TfmActMontosFijosNBU = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    nos: TLabel;
    codos: TMaskEdit;
    BuscarObraSocial: TBitBtn;
    Panel3: TPanel;
    A: TStringGrid;
    Panel4: TPanel;
    reg: TLabel;
    btnBuscarArchivo: TButton;
    Panel5: TPanel;
    StatusBar1: TStatusBar;
    OpenDialog: TOpenDialog;
    btnCerrar: TButton;
    btnActualizar: TButton;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    periodo: TMaskEdit;
    procedure BuscarObraSocialClick(Sender: TObject);
    procedure codosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscarArchivoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure AKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    redim: Boolean;
    cantitems: Integer;
    procedure CargarDatosObraSocial;
    procedure CargarPadron(arch: String);
    procedure CargarMontos;
    procedure CargarGrilla(xcodanalisis, xperiodo, xmonto: String);
  public
    { Public declarations }
  end;

var
  fmActMontosFijosNBU: TfmActMontosFijosNBU;

implementation

uses CObrasSocialesCCB, CUtiles, CUtilidadesStringGrid, NominaObrasSociales,
     CConfigForms, CNBU;

{$R *.dfm}

procedure TfmActMontosFijosNBU.CargarDatosObraSocial;
// Objetivo...: Cargar Datos Obra Social
Begin
  obsocial.getDatos(codos.Text);
  nos.Caption := obsocial.Nombre;
  CargarMontos;
  Panel4.Visible := True;
  periodo.SetFocus;
end;

procedure TfmActMontosFijosNBU.CargarPadron(arch: String);
// Objetivo...: Cargar Padron de Archivos
var
  archivo: TextFile;
  l1, codigo, monto: String; p, j, l: Integer;
Begin
  //grid.IniciarGrilla(A);
  StatusBar1.Panels[0].Text := 'Cargando Determinaciones ...!'; StatusBar1.Refresh;
  Refresh;
  AssignFile(archivo, arch);
  reset(archivo); p := 0;
  while not Eof(archivo) do Begin
    Inc(p);
    ReadLn(archivo, l1);
    l1     := TrimLeft(l1);
    codigo := Copy(l1, 1, 6);
    monto  := utiles.FormatearNumero(Copy(Trim(l1), 7, 20));
    if (Length(Trim(codigo)) = 6) and (StrToFloat(monto) > 0) then CargarGrilla(codigo, periodo.Text, Trim(monto));
  end;
  cantitems := p;
  closeFile(archivo);
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  if p > 0 then btnActualizar.Enabled := True else btnActualizar.Enabled := False;
  if btnActualizar.Enabled then btnActualizar.SetFocus;
end;

procedure TfmActMontosFijosNBU.CargarMontos;
var
  r: TQuery;
  i: Integer;
Begin
  grid.IniciarGrilla(A);
  r := obsocial.setAnalisisMontoFijoNBU(codos.Text);
  r.Open; i := 0;
  while not r.Eof do Begin
    nbu.getDatos(r.FieldByName('codanalisis').AsString);
    Inc(i);
    A.Cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 3, '0');
    A.Cells[1, i] := r.FieldByName('codanalisis').AsString;
    A.Cells[2, i] := nbu.Descrip;
    A.Cells[3, i] := utiles.FormatearNumero(r.FieldByName('importe').AsString);
    A.Cells[4, i] := r.FieldByName('periodo').AsString;
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmActMontosFijosNBU.CargarGrilla(xcodanalisis, xperiodo, xmonto: String);

  function BuscarAnalisis(xcodanalisis: string): boolean;
  var
    i: integer;
  begin
    Result := False;
    For i := 1 to A.RowCount do
      if A.cells[0, i] = xcodanalisis then Begin
        Result := True;
        Break;
      end;
  end;

  function ObtenerLinea(xcodanalisis, xperiodo: String): Integer;
  // Objetivo...: Determinar Ranura
  var
    i, j, k: Integer;
    modifica: Boolean;
  Begin
    j := 0; k := 0;
    For i := 1 to A.RowCount do Begin
      if Length(Trim(A.Cells[0, i])) = 0 then Break;
      if Trim(A.Cells[1, i]) = Trim(xcodanalisis) then Begin
        if Length(Trim(xperiodo)) = 7 then k := i;

        if Copy(A.Cells[4, i], 4, 4) + Copy(A.Cells[4, i], 1, 2) = Copy(xperiodo, 4, 4) + Copy(xperiodo, 1, 2) then Begin
          j := i;
          modifica := True;
          Break;
        end;

        if Copy(A.Cells[4, i], 4, 4) + Copy(A.Cells[4, i], 1, 2)  > Copy(xperiodo, 4, 4) + Copy(xperiodo, 1, 2) then Begin
          j := i;
          Break;
        end;
      end;
    end;

    if j > 0 then  Result := j else Result := k;
  end;

var
  i, l, j, it: integer;
  modifica: Boolean;
begin
  modifica := BuscarAnalisis(xcodanalisis);

  For j := 1 to A.RowCount do Begin
    it := j;
    if Length(Trim(A.Cells[0, j])) = 0 then Break;
  end;

  if not modifica then i := it else i := A.row;

  l := obtenerlinea(xcodanalisis, xperiodo);  // Buscamos la Ranura para Mantener el orden con los códigos
  if l > 0 then Begin
    if not modifica then Begin
      l := l + 1;
      A.Row := l;
      grid.InsertarLinea(A, 3);
      i := l;
    end;

    if modifica then Begin
      A.Row := l;
      i     := l;
    end;
  end;

  nbu.getDatos(xcodanalisis);
  A.cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 3, '0');
  A.cells[1, i] := xcodanalisis;
  A.cells[2, i] := nbu.descrip;
  A.cells[3, i] := xmonto;
  if Length(Trim(xperiodo)) = 7 then A.cells[4, i] := xperiodo else A.Cells[4, i] := '';
  modifica := False;
  A.row    := i;
end;

//------------------------------------------------------------------------------

procedure TfmActMontosFijosNBU.BuscarObraSocialClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codos.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocial;
  end else
    codos.SetFocus;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmActMontosFijosNBU.codosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codos.Text) then BuscarObraSocialClick(Sender) else CargarDatosObraSocial;
end;

procedure TfmActMontosFijosNBU.FormShow(Sender: TObject);
begin
  if not configform.Setear(fmActMontosFijosNBU) then Begin
    Width := 507; Height := 393;
  end;
  grid.RecuperarAnchoColumnas(fmActMontosFijosNBU, A);
  obsocial.conectar;
  A.Cells[0, 0] := 'It.'; A.Cells[1, 0] := 'Código'; A.Cells[2, 0] := 'Determinación'; A.Cells[3, 0] := 'Monto'; A.Cells[4, 0] := 'Período';
  redim := False;
end;

procedure TfmActMontosFijosNBU.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  grid.GuardarAnchoColumnas(fmActMontosFijosNBU, A);
  configform.Guardar(fmActMontosFijosNBU, redim);
  obsocial.desconectar;
  Release; fmActMontosFijosNBU := nil;
end;

procedure TfmActMontosFijosNBU.btnBuscarArchivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    if Length(Trim(OpenDialog.FileName)) > 0 then CargarPadron(OpenDialog.FileName);
end;

procedure TfmActMontosFijosNBU.btnActualizarClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Seguro Determinaciones Monto Fijo ' + chr(13) + codos.Text + ' - ' + nos.Caption) then Begin
    for i := 1 to A.RowCount do Begin
      if Length(Trim(A.Cells[0, i])) = 0 then Break;
      obsocial.GrabarAnalisisMontoFijoNBU(codos.Text, A.Cells[0, i], A.Cells[1, i], A.Cells[4, i], '', StrToFloat(A.Cells[3, i]), cantitems);
    end;
    btnCerrarClick(Sender);
  end;
end;

procedure TfmActMontosFijosNBU.btnCerrarClick(Sender: TObject);
begin
  Panel4.Visible := False;
  reg.Caption := '';
  codos.Text := ''; nos.Caption := '';
  btnActualizar.Enabled := False;
  codos.SetFocus;
  grid.IniciarGrilla(A);
end;

procedure TfmActMontosFijosNBU.AKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if utiles.msgSiNo('Seguro para Eliminar Afiliado ' + A.Cells[0, A.Row]) then Begin
      A.Cells[0, A.Row] := 'XX';
      grid.BorrarRenglon_SinRenumerar(A);
    end;
  if Key = VK_INSERT then grid.InsertarLineasSinRenumerar(A); 
end;

procedure TfmActMontosFijosNBU.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmActMontosFijosNBU.periodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codos.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then btnBuscarArchivo.SetFocus;
end;

end.
