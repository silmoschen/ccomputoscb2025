unit IngresoOperaciones1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBTables, IniFiles, StdCtrls, Buttons,
  Menus, mxCaptionBarButtons;

type
  TfmIngreso = class(TForm)
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    periodo: TLabel;
    Label2: TLabel;
    codos: TLabel;
    Panel5: TPanel;
    Guardar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel19: TPanel;
    ScrollBox3: TScrollBox;
    Panel4: TPanel;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ScrollBox2: TScrollBox;
    Label3: TLabel;
    fecha: TLabel;
    nos: TLabel;
    Label4: TLabel;
    descrip: TLabel;
    mxCaptionBarButtons1: TmxCaptionBarButtons;
    A: TStringGrid;
    D: TStringGrid;
    T: TStringGrid;
    Label5: TLabel;
    perLiq: TLabel;
    Id: TStringGrid;
    procedure ADrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GuardarClick(Sender: TObject);
    procedure ASelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormResize(Sender: TObject);
    procedure DKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure TDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure TKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mxCaptionBarButtons1Buttons0Click(Sender: TObject);
  private
    { Private declarations }
    Fila, Columna: Integer;
    IniFile : TIniFile; FIniFileName: String; FInitialized: boolean;
    procedure Teclado(SG: TStringGrid; var Key: Word; Shift: TShiftState);
    procedure CargarProfesionales(SG: TStringGrid; ColInicio: Integer; filtro: Boolean);
    procedure CargarProfesionalesCol(SG: TStringGrid; ColInicio: Integer);
    function  CantidadDeItemsIngresados(STG: TStringGrid): Integer;
    function  NumeroDeColumna(STG: TStringGrid; xid: String): Integer;
    function  NumeroDeFila(STG: TStringGrid; xid: String): Integer;
    procedure CargarAjustesPersonales;
    procedure CargarDebitosCreditos;
    procedure DrawCell(SG: TStringGrid; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure CargarDetalleDebitosCreditos;
    procedure CargarItemsRetenciones(SG: TStringGrid);
    procedure CargarDetalleRetenciones;
  public
    { Public declarations }
  end;

var
  fmIngreso: TfmIngreso;

implementation

uses CLiquidacionObrasSocCCB, CProfesionalCCB, CAjustesIndivCentroBioq, CFacturacionCCB, CUtiles, CRetencionesCentroBioq;

{$R *.dfm}

const
    SectionData = 'Data';
    Alto    = 'TAlto';
    Ancho   = 'TAncho';
    PosX    = 'TposX';
    PosY    = 'TposY';

procedure TfmIngreso.Teclado(SG: TStringGrid; var Key: Word; Shift: TShiftState);
Begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_DELETE then SG.Cells[Columna, Fila] := '';

  if (Key = VK_RETURN) or ((Key = VK_DOWN) and (Length(Trim(SG.Cells[SG.Col, SG.Row])) > 0)) then Begin
    if SG.Col > 0 then Begin
        if not (SG.Cells[1, 0] = 'Sel') or (Columna > 1) then
          if Length(Trim(SG.Cells[SG.Col, SG.Row])) > 0 then SG.Cells[SG.Col, SG.Row] := utiles.AlinearStringDerecha(utiles.FormatearNumero(SG.Cells[SG.Col, SG.Row]), 33);
        if (SG.Col < SG.ColCount -1) and (Key = VK_RETURN) then SG.Col := SG.Col + 1 else Begin
          if Key = VK_RETURN then
            if SG.Name <> 'T' then SG.Col := 0 else SG.Col := 1;
          if (SG.Row < SG.RowCount -1) and (Key = VK_RETURN) then SG.Row := SG.Row + 1;
        end
    end else
      if (Length(Trim(SG.Cells[SG.Col, 0])) > 0) and (Key = VK_RETURN) then SG.Col := SG.Col + 1;

    if ((Length(Trim(SG.Cells[0, SG.Row-1])) = 0) or ((SG.Col > 0) and (Length(Trim(SG.Cells[0, SG.Row])) = 0))) and (Key = VK_RETURN) then Begin
      utiles.msgError('No está permitido dejar Items intermedios en blanco ...!');
      if SG.Col = 0 then SG.Cells[0, SG.Row] := '' else
        if SG.Col > 1 then A.Cells[SG.Col-1, SG.Row] := utiles.FormatearNumero(A.Cells[SG.Col-1, SG.Row]) else SG.Cells[SG.Col-1, SG.Row] := '';
      if (SG.Row > 1) and (SG.Col = 0) then SG.Row := SG.Row - 1;
      if (SG.Row > 0) and (SG.Col > 0) then SG.Col := Columna;//0;
      SG.Col := 0;
    end;
  end;
end;

procedure TfmIngreso.DrawCell(SG: TStringGrid; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  Fila := SG.Row; Columna := SG.Col;
  StatusBar1.Panels[1].Text := 'F ' + IntToStr(SG.Row) + ', C ' + IntToStr(SG.Col);
  descrip.Caption := SG.Cells[0, SG.Row];
end;

function  TfmIngreso.CantidadDeItemsIngresados(STG: TStringGrid): Integer;
var
  i: Integer;
Begin
  For i := 1 to STG.RowCount do
    if Length(Trim(STG.Cells[0, i])) = 0 then Break;
  Result := i - 1;
end;

function  TfmIngreso.NumeroDeColumna(STG: TStringGrid; xid: String): Integer;
var
  i: Integer;
Begin
  Result := -1;
  For i := 1 to STG.ColCount do Begin
    if Trim(STG.Cells[i, 0]) = Trim(xid) then Begin
      Result := i;
      Break;
    end;
  end;
end;

function  TfmIngreso.NumeroDeFila(STG: TStringGrid; xid: String): Integer;
var
  i: Integer;
Begin
  Result := -1;
  For i := 1 to STG.RowCount do Begin
    if Trim(STG.Cells[0, i]) = Trim(xid) then Begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TfmIngreso.CargarProfesionales(SG: TStringGrid; ColInicio: Integer; filtro: Boolean);
var
  r: TQuery; i, j: Integer;
begin
  SG.DefaultColWidth := 120;
  SG.ColWidths[0]    := 200;
  SG.Cells[0, 0]     := 'Profesional/Items';
  r := profesional.setProfesionalesAlf;
  r.Open;
  SG.ColCount := r.RecordCount + 1 + (ColInicio - 1); i := 0;
  Id.ColCount := SG.ColCount;
  while not r.Eof do Begin
    profesional.getDatos(r.FieldByName('idprof').AsString);
    if Length(Trim(profesional.Codfact)) = 0 then Begin
      Inc(i);
      SG.Cells[i + ColInicio - 1, 0] := Copy(r.FieldByName('Nombre').AsString, 1, 23);
      Id.Cells[i + ColInicio - 1, 0] := r.FieldByName('IdProf').AsString;
      For j := ColInicio to SG.ColCount - 1 do SG.Cells[j, i] := '';
    end else Begin
      SG.ColCount := SG.ColCount - 1;
      Id.ColCount := Id.ColCount - 1;
    end;
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarProfesionalesCol(SG: TStringGrid; ColInicio: Integer);
var
  r: TQuery; i, j: Integer;
begin
  SG.DefaultColWidth := 140;
  SG.ColWidths[0]    := 200;
  SG.Cells[0, 0]     := 'Profesional/Items';
  r := profesional.setProfesionalesAlf;
  r.Open;
  SG.RowCount  := r.RecordCount + 1;
  Id.RowCount  := SG.RowCount;
  SG.FixedCols := 1; i := 0;
  while not r.Eof do Begin
    Inc(i);
    SG.Cells[0, i] := r.FieldByName('Nombre').AsString;
    Id.Cells[0, i] := r.FieldByName('IdProf').AsString;
    For j := ColInicio to SG.ColCount - 1 do SG.Cells[j, i] := '';
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarDebitosCreditos;
var
  r: TQuery; i, j: Integer;
begin
  r := ajustesindiv.setItems;
  r.Open;
  Id.RowCount := D.RowCount;
  while not r.Eof do Begin
    Inc(i);
    D.Cells [0, i] := Copy(r.FieldByName('Descrip').AsString, 1, 18);
    Id.Cells[0, i] := r.FieldByName('Items').AsString;
    For j := 1 to D.ColCount - 1 do D.Cells[j, i] := utiles.AlinearStringDerecha(utiles.FormatearNumero(r.FieldByName('Importe').AsString), 33);
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarAjustesPersonales;
// Objetivo...: Cargar Ajustes Personales, si es que existen
var
  r: TQuery;
Begin
  r := distribucionos.setItemsAjustesIndividuales(periodo.Caption, codos.Caption);
  r.Open;
  while not r.Eof Do Begin
    A.Cells[0, r.FieldByName('Items').AsInteger] := r.FieldByName('Concepto').AsString;
    A.Cells[NumeroDeColumna(Id, r.FieldByName('idprof').AsString), r.FieldByName('Items').AsInteger] := utiles.AlinearStringDerecha(utiles.FormatearNumero(r.FieldByName('importe').AsString), 33);
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarDetalleDebitosCreditos;
// Objetivo...: Cargar Debitos Creditos Profesionales
var
  r: TQuery; c, f: Integer;
Begin
  r := distribucionos.setItemsDCProf(periodo.Caption);
  r.Open;
  while not r.Eof Do Begin
    D.Cells[0, r.FieldByName('Items').AsInteger] := r.FieldByName('DescriPaj').AsString;
    c := NumeroDeColumna(Id, r.FieldByName('Idprof').AsString);
    f := NumeroDeFila(Id, r.FieldByName('Idajuste').AsString);
    if (c >= 0) and (f >= 0) then
      if r.FieldByName('importeaj').AsFloat <> 0 then D.Cells[c, f] := utiles.AlinearStringDerecha(utiles.FormatearNumero(r.FieldByName('importeaj').AsString), 33) else D.Cells[NumeroDeColumna(Id, r.FieldByName('Idprof').AsString), NumeroDeFila(Id, r.FieldByName('Idajuste').AsString)] := '';
    //if r.FieldByName('importeaj').AsFloat <> 0 then D.Cells[NumeroDeColumna(Id, r.FieldByName('Idprof').AsString), NumeroDeFila(Id, r.FieldByName('Idajuste').AsString)] := utiles.AlinearStringDerecha(utiles.FormatearNumero(r.FieldByName('importeaj').AsString), 33) else D.Cells[NumeroDeColumna(Id, r.FieldByName('Idprof').AsString), NumeroDeFila(Id, r.FieldByName('Idajuste').AsString)] := '';
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarDetalleRetenciones;
// Objetivo...: Cargar Detalle retenciones
var
  r: TQuery; i, j: Integer; Ret, tot, Por: Real;
Begin
  // Obtenemos el Neto a Cobrar por el Profesional, y a partir de ahi aplicamos la retencion
  distribucionos.getDatos(perLiq.Caption, codos.Caption);   // Para Obtener el Monto Facturado
  Por := (100 - distribucionos.Porcentaje) * 0.01;
  facturacion.ConectarTotalesProf;
  For i := 1 to T.RowCount do
    For j := 1 to T.ColCount do Begin
      retenciones.getDatos(Id.Cells[j, 0]);
      if j = 1 then Begin
        Ret := facturacion.setNetoACobrarProfesional(periodo.Caption, Id.Cells[0, i], codos.Caption);
        tot := facturacion.setMontoACobrarProfesional(periodo.Caption, Id.Cells[0, i]);
      end;

      if Ret <> 0 then
        if Ret >= retenciones.Tope then T.Cells[j, i] := utiles.FormatearNumero(FloatToStr((Ret - (tot * Por)) * (retenciones.Porcentaje * 0.01)));
    end;

  facturacion.DesconectarTotalesProf;

  r := distribucionos.setItemsRetenciones(perLiq.Caption, codos.Caption);
  r.Open;
  while not r.Eof Do Begin
    T.Cells[NumeroDeColumna(Id, r.FieldByName('Idret').AsString), NumeroDeFila(Id, r.FieldByName('Idprof').AsString)] := utiles.AlinearStringDerecha(utiles.FormatearNumero(r.FieldByName('importe').AsString), 33);
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmIngreso.CargarItemsRetenciones(SG: TStringGrid);
// Objetivo...: Cargar Detalle de Retenciones
var
  r: TQuery; i: Integer; Ret: Real;
Begin
  facturacion.ConectarTotalesProf;
  r := retenciones.setItems;
  r.Open; i := 0;
  SG.ColCount := r.RecordCount + 1;
  Id.ColCount := SG.ColCount;
  while not r.EOF do Begin
    Inc(i);
    SG.Cells[i, 0] := r.FieldByName('descrip').AsString;
    Id.Cells[i, 0] := r.FieldByName('items').AsString;
    r.Next;
  end;
  facturacion.DesconectarTotalesProf;
end;

procedure TfmIngreso.ADrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  DrawCell(A, ACol, ARow, Rect, State);
end;

procedure TfmIngreso.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if not FInitialized then begin
    FIniFileName := 'datosliq.ini';
    IniFile := TIniFile.Create(FIniFileName);
    FInitialized := TRUE;
    Height       := IniFile.ReadInteger(SectionData, Alto, 375);
    Width        := IniFile.ReadInteger(SectionData, Ancho, 544);
    Top          := IniFile.ReadInteger(SectionData, PosX, 168);
    Left         := IniFile.ReadInteger(SectionData, PosY, 77);
    IniFile.Free;
  end;
  if PageControl1.ActivePageIndex = 0 then Begin
    StatusBar1.Panels[0].Text := 'Cargando Ajustes Individuales'; StatusBar1.Refresh;
    CargarProfesionales(A, 1, True);
    CargarAjustesPersonales;
    ActiveControl := A;
    A.Refresh;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end;
  if PageControl1.ActivePageIndex = 1 then Begin
    StatusBar1.Panels[0].Text := 'Cargando Retenciones'; StatusBar1.Refresh;
    CargarProfesionalesCol(T, 1);
    CargarItemsRetenciones(T);
    CargarDetalleRetenciones;
    ActiveControl := T;
    T.Refresh;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end;
  if PageControl1.ActivePageIndex = 2 then Begin
    StatusBar1.Panels[0].Text := 'Cargando Débitos y Créditos Individuales'; StatusBar1.Refresh;
    D.Refresh;
    CargarProfesionales(D, 1, False);
    CargarDebitosCreditos;
    CargarDetalleDebitosCreditos;
    ActiveControl  := D;
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end;
end;

procedure TfmIngreso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GuardarClick(Sender);
  IniFile := TIniFile.Create(FIniFileName);
  if WindowState = wsNormal then Begin
    IniFile.WriteInteger(SectionData, Ancho, Width);
    IniFile.WriteInteger(SectionData, Alto, Height);
    IniFile.WriteInteger(SectionData, PosX, Top);
    IniFile.WriteInteger(SectionData, PosY, Left);
  end;
  IniFile.Free;
end;

procedure TfmIngreso.AKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Teclado(A, Key, Shift);
  if Key = VK_F5 then mxCaptionBarButtons1Buttons0Click(Sender);
end;

procedure TfmIngreso.GuardarClick(Sender: TObject);
var
  i, j, it, h: Integer; total: Real;
begin
  StatusBar1.Panels[0].Text := 'Registrando Operaciones ...!'; StatusBar1.Refresh;
  if PageControl1.ActivePage = TabSheet1 then Begin    // Debitos y Creditos Personales
    it := CantidadDeItemsIngresados(A);
    For i := 1 to A.RowCount do Begin
      if Length(Trim(A.Cells[0, i])) = 0 then Break;
      For j := 1 to A.ColCount do Begin
        if Length(Trim(A.Cells[j, i])) = 0 then A.Cells[j, i] := '0';
        if Length(Trim(A.Cells[j, i])) > 0 then
          distribucionos.GuardarAjustesIndividuales(periodo.Caption, codos.Caption, Id.Cells[j, 0], utiles.sLlenarIzquierda(IntToStr(i), 3, '0'), A.Cells[0, i], fecha.Caption, 'S', perLiq.Caption, StrToFloat(Trim(A.Cells[j, i])), it);
      end;
    end;

    // Actualizamos el total de Retenciones del Profesional
    total := 0;
    For i := 1 to A.ColCount do Begin
      For j := 1 to A.RowCount do Begin
        if Length(Trim(A.Cells[i, j])) = 0 then Break;
        total := total + StrToFloat(A.Cells[i, j]);
      end;
      if total <> 0 then facturacion.RegistrarNetoACobrarProfesional(periodo.Caption, Id.Cells[i, 0], codos.Caption, total);
      total := 0;
    end;
  end;

  if PageControl1.ActivePage = TabSheet2 then Begin    // Retenciones
    it := 0; h := 0;
    For i := 1 to T.RowCount do Begin
      For j := 1 to T.ColCount do
        if Length(Trim(T.Cells[j, i])) > 0 then
          if StrToFloat(Trim(T.Cells[j, i])) > 0 then Inc(it);
    end;
    For i := 1 to T.RowCount do Begin
      For j := 1 to T.ColCount do
        if Length(Trim(T.Cells[j, i])) > 0 then
          if StrToFloat(Trim(T.Cells[j, i])) > 0 then Begin
            Inc(h);
            distribucionos.GuardarRetenciones(perLiq.Caption, Id.Cells[0, i], utiles.sLlenarIzquierda(IntToStr(h), 3, '0'), Id.Cells[j, 0], codos.Caption, T.Cells[j, 0], StrToFloat(Trim(T.Cells[j, i])), it);
          end;
      if it = 0 then distribucionos.BorrarItemsRetenciones(perLiq.Caption, codos.Caption);
    end;
  end;

  if PageControl1.ActivePage = TabSheet3 then Begin    // Debitos y Creditos Personales
    it := CantidadDeItemsIngresados(D);
    For i := 1 to D.RowCount do Begin
      if Length(Trim(D.Cells[0, i])) = 0 then Break;
      For j := 1 to D.ColCount do Begin
        if Length(Trim(D.Cells[j, i])) = 0 then D.Cells[j, i] := '0';
        if Length(Trim(Id.Cells[j, 0])) > 0 then distribucionos.GuardarDCProf(periodo.Caption, Id.Cells[j, 0], codos.Caption, utiles.sLlenarIzquierda(IntToStr(i), 3, '0'), Id.Cells[0, i], D.Cells[0, i] , StrToFloat(Trim(D.Cells[j, i])), it);
      end;
    end;
  end;

  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmIngreso.ASelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  guardar.Enabled := True;
end;

procedure TfmIngreso.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width := Width - 220;
end;

procedure TfmIngreso.DKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  InputString: string; i: Integer;
begin
  Teclado(D, Key, Shift);
  if Key = VK_F5 then mxCaptionBarButtons1Buttons0Click(Sender);
end;

procedure TfmIngreso.DDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  DrawCell(D, ACol, ARow, Rect, State);
end;

procedure TfmIngreso.TDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  DrawCell(t, ACol, ARow, Rect, State);
end;

procedure TfmIngreso.TKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Teclado(T, Key, Shift);
  if Key = VK_F5 then mxCaptionBarButtons1Buttons0Click(Sender);
end;

procedure TfmIngreso.mxCaptionBarButtons1Buttons0Click(Sender: TObject);
var
  InputString: String; i: Integer;
  SG: TStringGrid;
begin
  InputString:= InputBox('Buscar', 'Profesional', '');
  if PageControl1.ActivePage = TabSheet3 then SG := D;
  if PageControl1.ActivePage = TabSheet1 then SG := A;
  if PageControl1.ActivePage = TabSheet2 then SG := T;
  if (PageControl1.ActivePage = TabSheet1) or (PageControl1.ActivePage = TabSheet3) then Begin
    For i := 1 to SG.ColCount do Begin
      if Copy(trimLeft(lowercase(SG.Cells[i, 0])), 1, Length(trimLeft(inputString))) = trimLeft(lowercase(InputString)) then Begin
        SG.Col := i; SG.Refresh;
        Break;
      end;
    end;
  end;
    if (PageControl1.ActivePage = TabSheet2) then Begin
    For i := 1 to SG.RowCount do Begin
      if Copy(trimLeft(lowercase(SG.Cells[0, i])), 1, Length(trimLeft(inputString))) = trimLeft(lowercase(InputString)) then Begin
        SG.Row := i; SG.Refresh;
        Break;
      end;
    end;
  end;
end;

end.
