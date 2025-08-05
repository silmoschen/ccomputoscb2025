unit DetalleDeterminacionesOnLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, ExtCtrls, Mask;

type
  TfmEdicionDeterminaciones = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel9: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnRegistrar: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    npaciente: TLabel;
    efector: TLabel;
    HistoriaClinica: TStringGrid;
    Panel10: TPanel;
    Label3: TLabel;
    fecha: TLabel;
    Label4: TLabel;
    nroauditoria: TLabel;
    Label5: TLabel;
    totmes: TLabel;
    Panel5: TPanel;
    Panel11: TPanel;
    Obs: TMemo;
    Panel7: TPanel;
    Panel20: TPanel;
    CR: TStringGrid;
    Panel8: TPanel;
    ID: TButton;
    DI: TButton;
    Panel12: TPanel;
    CA: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    dx: TLabel;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    observacion: TMaskEdit;
    alta: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IDClick(Sender: TObject);
    procedure DIClick(Sender: TObject);
    procedure CAKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CRKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CRKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CADblClick(Sender: TObject);
    procedure CRDblClick(Sender: TObject);
    procedure observacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codos, nrodoc: string;
    redim, seleccionOK, modifica: boolean;
    items1, items2, lh: integer;
    procedure CargarItems;
    procedure CargarHistorial;
    procedure MoverItems(O, D: TStringGrid);
    procedure CalcularMonto;
  end;

var
  fmEdicionDeterminaciones: TfmEdicionDeterminaciones;

implementation

uses
  CAuditoriaCCB, CUtiles, CUtilidadesStringGrid, Contnrs, CNBU, CObrasSocialesCCB,
  CDiagnosticosCCBOMS, CMedicosCCB, CMedicosCabCCB, CConfigForms, CFacturacionCCB,
  AgregarQuitarDetOnLine, CDiagnosticosCCB, CMedicosCCBOS;

{$R *.dfm}

procedure TfmEdicionDeterminaciones.CalcularMonto;
var
  mf, m: real;
begin
  nbu.getDatos(CA.Cells[0, CA.Row]);
  obsocial.getDatos(codos);
  obsocial.SincronizarArancelNBU(codos, Copy(fecha.Caption, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Caption), 1, 4));

  CA.Cells[2, CA.Row] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos, CA.Cells[0, CA.Row], Copy(fecha.Caption, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Caption), 1, 4)) + facturacion.setTot9984));

  auditoriacb.SincronizarArancelDiferencial(codos, Copy(fecha.Caption, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Caption), 1, 4));
  if (auditoriacb.verificarArancelDiferencial(codos)) and (auditoriacb.Aplica = 'S') then Begin
    if not obsocial.BuscarAnalisisMontoFijo(codos, CA.Cells[0, CA.Row]) then Begin
      CA.Cells[3, CA.Row] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos, CA.Cells[0, CA.Row], auditoriacb.UB, auditoriacb.UG, auditoriacb.RIEUB, auditoriacb.RIEUG) + facturacion.setTot9984))
    end else Begin
      CA.Cells[3, CA.Row] := utiles.FormatearNumero(FloatToStr(facturacion.setImporteAnalisis(codos, CA.Cells[0, CA.Row], auditoriacb.UB, auditoriacb.UG, auditoriacb.RIEUB, auditoriacb.RIEUG) + facturacion.setTot9984));
      if auditoriacb.Porcent > 0 then Begin
        m := StrToFloat(CA.Cells[3, CA.Row]) + (StrToFloat(CA.Cells[3, CA.Row]) * (auditoriacb.Porcent * 0.01));
        CA.Cells[3, CA.Row] := utiles.FormatearNumero(FloatToStr(m));
      end;

      // Montos Fijos
      mf := auditoriacb.setMontoFijo(codos, CA.Cells[0, CA.Row], Copy(fecha.Caption, 4, 2) + '/' + Copy(utiles.sExprFecha2000(fecha.Caption), 1, 4));
      if mf > 0 then CA.Cells[3, CA.Row] := utiles.FormatearNumero(FloatToStr(mf));
    end;
  end else
    CA.Cells[3, CA.Row] := utiles.FormatearNumero('0');

  totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) + StrToFloat(CA.Cells[2, CA.Row])));
end;

procedure TfmEdicionDeterminaciones.CargarItems;
var
  l: TObjectList;
  i: Integer;
  objeto: TTAuditoriaCCB;
begin
  grid.IniciarGrilla(CA); grid.IniciarGrilla(CR);

  auditoriacb.getDatos(nroauditoria.Caption);
  diagnosticoOMS.getDatos(auditoriacb.Iddiag);
  dx.Caption := diagnosticoOMS.Codigo + '  ' + diagnosticoOMS.Descrip;
  l := auditoriacb.setOrdenes;
  items1 := 0; items2 := 0;
  for i := 1 to l.Count do Begin
    objeto := TTAuditoriaCCB(l.Items[i-1]);
    if objeto.Estado = 'A' then Begin
      Inc(items1);
      CA.Cells[0, items1] := objeto.Codigo;
      nbu.getDatos(objeto.Codigo);
      CA.Cells[1, items1] := nbu.descrip;
      CA.Cells[2, items1] := utiles.FormatearNumero(FloatToStr(objeto.monto));
      CA.Cells[3, items1] := utiles.FormatearNumero(FloatToStr(objeto.monto_dif));
      totmes.Caption      := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) + StrToFloat(CA.Cells[2, items1])));
    end;
    if objeto.Estado = 'R' then Begin
      Inc(items2);
      CR.Cells[0, items2] := objeto.Codigo;
      nbu.getDatos(objeto.Codigo);
      CR.Cells[1, items2] := nbu.descrip;
    end;
  end;

  l.Free; l := Nil;

  totmes.Caption := utiles.FormatearNumero(FloatToStr(auditoriacb.setTotalAnalisisMensual(fecha.Caption, codos, false)));
  
  if items2 > 0 then CR.Row := items2;
end;

procedure TfmEdicionDeterminaciones.CRDblClick(Sender: TObject);
begin
  modifica := true;
  Button2Click(Self);
end;

procedure TfmEdicionDeterminaciones.CRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then CA.SetFocus;
  if (Key = VK_RETURN) then CRDblClick(Self);
  if (Key = VK_SPACE) then DIClick(Self);
  if (Key = VK_DELETE) then
    if (utiles.msgSiNo('Seguro para Borrar Determinación ' + CR.Cells[1, CR.Row] + ' ?')) then begin
      grid.BorrarRenglon_SinRenumerar(CR);
      CR.SetFocus;
    end;
end;

procedure TfmEdicionDeterminaciones.CRKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := 'SPACE Mueve Items - F5 Agrega Items Autorizado / F6 Agrega Items Rechazado - ESC Cambia de Lista - F9 Ir a Obs. Auditor';
end;

procedure TfmEdicionDeterminaciones.DIClick(Sender: TObject);
begin
  MoverItems(CR, CA);
  CalcularMonto;
end;

procedure TfmEdicionDeterminaciones.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  StatusBar1.Panels[0].Width := Width - (Width div 5);
  Panel12.Width := Width - (Width div 2) - 20;
  observacion.Width := obs.Width;
end;

procedure TfmEdicionDeterminaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  grid.GuardarAnchoColumnas(fmEdicionDeterminaciones, CA);
  grid.GuardarAnchoColumnas(fmEdicionDeterminaciones, CR);
  configform.guardar(fmEdicionDeterminaciones, redim);
end;

procedure TfmEdicionDeterminaciones.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) then Button1Click(Self);
  if (Key = VK_F6) then Button2Click(Self);
  if (Key = VK_F9) then observacion.setFocus;
end;

procedure TfmEdicionDeterminaciones.FormResize(Sender: TObject);
begin
  redim := true;
end;

procedure TfmEdicionDeterminaciones.FormShow(Sender: TObject);
begin
  CA.Cells[0, 0] := 'Código'; CA.Cells[1, 0] := 'Determinación'; CA.Cells[2, 0] := 'Monto'; CA.Cells[3, 0] := 'Monto Dif.';
  CR.Cells[0, 0] := 'Código'; CR.Cells[1, 0] := 'Determinación';
  grid.RecuperarAnchoColumnas(fmEdicionDeterminaciones, CA);
  grid.RecuperarAnchoColumnas(fmEdicionDeterminaciones, CR);
  configform.Setear(fmEdicionDeterminaciones);
  HistoriaClinica.Row := lh;
  if (lh - 10 > 0) then HistoriaClinica.TopRow := lh - 10;
  CA.SetFocus;
  StatusBar1.Panels[0].Text := 'SPACE Mueve Items - F5 Agrega Items Autorizado / F6 Agrega Items Rechazado - ESC Cambia de Lista - F9 Ir a Obs. Auditor';
  redim := false
end;

procedure TfmEdicionDeterminaciones.IDClick(Sender: TObject);
begin
  if (CA.Row > 0) then
    totmes.Caption := utiles.FormatearNumero(FloatToStr(StrToFloat(totmes.Caption) - StrToFloat(CA.Cells[2, CA.Row])));
  MoverItems(CA, CR);
end;

procedure TfmEdicionDeterminaciones.Panel1Resize(Sender: TObject);
begin
  redim := true;
end;

procedure TfmEdicionDeterminaciones.btnRegistrarClick(Sender: TObject);
var
  i: integer;
begin
  seleccionOK := true;
  items1 := 0; items2 := 0;
  for i := 1 to CA.RowCount do
    if (length(trim(CA.Cells[0, i])) > 0) then Inc(items1) else break;
  for i := 1 to CR.RowCount do
    if (length(trim(CR.Cells[0, i])) > 0) then Inc(items2) else break;

  Close;
end;

procedure TfmEdicionDeterminaciones.Button1Click(Sender: TObject);
var
  it, i: integer;
begin
  Application.CreateForm(TfmDeterminacionOnLine, fmDeterminacionOnLine);
  fmDeterminacionOnLine.modo.Caption := 'Autoriza';
  if (modifica) then fmDeterminacionOnLine.codanalisis.Text := CA.Cells[0, CA.Row];
  fmDeterminacionOnLine.ShowModal;
  if not (modifica) then begin
    it := 0;
    for i := 1 to CA.RowCount do begin
      if (length(trim(CA.Cells[0, i])) = 0) then break;
      it := it + 1;
    end;
    it := it + 1;
  end else
    it := CA.Row;
  modifica := false;
  CA.Row := it;
  CA.Cells[0, CA.Row] := fmDeterminacionOnLine.codanalisis.Text;
  CA.Cells[1, CA.Row] := fmDeterminacionOnLine.des.Caption;
  CalcularMonto;
  CA.SetFocus;
  fmDeterminacionOnLine.Release; fmDeterminacionOnLine := Nil;
end;

procedure TfmEdicionDeterminaciones.Button2Click(Sender: TObject);
var
  it, i: integer;
begin
  Application.CreateForm(TfmDeterminacionOnLine, fmDeterminacionOnLine);
  fmDeterminacionOnLine.modo.Caption := 'Rechaza';
  if (modifica) then fmDeterminacionOnLine.codanalisis.Text := CR.Cells[0, CR.Row];
  fmDeterminacionOnLine.ShowModal;
  if not (modifica) then begin
    it := 0;
    for i := 1 to CR.RowCount do begin
      if (length(trim(CR.Cells[0, i])) = 0) then break;
      it := it + 1;
    end;
    it := it + 1;
  end else
    it := CR.Row;
  modifica := false;
  CR.Cells[0, CR.Row] := fmDeterminacionOnLine.codanalisis.Text;
  CR.Cells[1, CR.Row] := fmDeterminacionOnLine.des.Caption;
  CR.Row := it;
  CR.SetFocus;
  fmDeterminacionOnLine.Release; fmDeterminacionOnLine := Nil;
end;

procedure TfmEdicionDeterminaciones.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TfmEdicionDeterminaciones.CADblClick(Sender: TObject);
begin
  modifica := true;
  Button1Click(Self);
end;

procedure TfmEdicionDeterminaciones.CAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then CR.SetFocus;
  if (Key = VK_RETURN) then CADblClick(Self);
  if (Key = VK_SPACE) then IDClick(Self);
  if (Key = VK_DELETE) then
    if (utiles.msgSiNo('Seguro para Borrar Determinación ' + CA.Cells[1, CA.Row] + ' ?')) then begin
      grid.BorrarRenglon_SinRenumerar(CA);
      CA.SetFocus;
    end;
end;

procedure TfmEdicionDeterminaciones.CAKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := 'SPACE Mueve Items - F5 Agrega Items Autorizado / F6 Agrega Items Rechazado - ESC Cambia de Lista - F9 Ir a Obs. Auditor';
end;

procedure TfmEdicionDeterminaciones.CargarHistorial;
// Objetivo...: Cargar Datos Historial de Paciente
var
  r: TStringList; idanter, codd: String; i, j, k, m, n, o: Integer;
  z: TObjectList;
  objeto: TTAuditoriaCCB;
  HHCC: TStringGrid;
  historiac: array[1..9] of String;
  listadet: TStringList;

  procedure LineaHist;
  // Objetivo...: Cargar Linea Historial
  Begin
    if lh > 0 then Begin
      Inc(lh);
      HHCC.Cells[0, lh] := '*';
      HHCC.Cells[1, lh] := '-----------------------------------------------------------------------------------------------';
    end;
    Inc(lh); HHCC.Cells[1, lh] := 'Fecha: ' + historiac[1] + historiac[6] + '  Pedido: ' + historiac[8] + '  Diagnósitico: ' + historiac[2];
    Inc(lh); HHCC.Cells[1, lh] := 'Médico: ' + historiac[3] + '  ' + historiac[9];
    Inc(lh); HHCC.Cells[1, lh] := 'Cód. Autorizados: ' + historiac[4];
    Inc(lh); HHCC.Cells[1, lh] := 'Cód. Rechazados : ' + historiac[5];
    if Length(Trim(historiac[7])) > 0 then Begin
      Inc(lh); HHCC.Cells[1, lh] := 'Observación: ' + historiac[7];
    end;
    historiac[7] := '';
    HHCC.Row := lh;
  end;

Begin
  HHCC := HistoriaClinica;
  listadet := TStringList.Create;
  StatusBar1.Panels[0].Text := 'Recuperando Historial Paciente ...!'; StatusBar1.Refresh;
  {r := auditoriacb.setHistorial(codos, nrodoc, False);
  lh := 0; idanter := '';
  if (r.Count > 0) then begin
  for j := 0 to r.Count - 1 do Begin
    if Copy(r.Strings[j], 1, 10) <> idanter then Begin
      if Length(Trim(idanter)) > 0 then LineaHist;
      m := pos(';1', r.Strings[j]);
      n := pos(';2', r.Strings[j]);
      o := pos(';3', r.Strings[j]);

      historiac[1] := utiles.sFormatoFecha(Copy(r.Strings[j], 11, 8));

      codd := Copy(r.Strings[j], o+2, 6);
      diagnosticooms.getDatosCodRap(codd);
      historiac[2] := diagnosticooms.Descrip + '(' + Copy(r.Strings[j], 33, m - 33) + ')';

      medico.getDatos(Copy(r.Strings[j], 19, 4));
      historiac[3] := medico.Nombre;
      historiac[6] := '  Orden: ' + Copy(r.Strings[j], 24, 10);
      historiac[7] := Copy(r.Strings[j], m+2, n-(m+2));
      historiac[8] := Copy(r.Strings[j], n+2, o-(n+2));
      historiac[4] := '';  historiac[5] := '';
      historiac[9] := 'Méd. Cabecera: ' + medcab.setMedicoCabecera(codos, Copy(r.Strings[j], o+6, 4));
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
  r.Clear;}

  r := auditoriacb.setHistorial(codos, nrodoc, False);
  lh := 0; idanter := '';
  for j := 0 to r.Count - 1 do Begin
    if Copy(r.Strings[j], 1, 10) <> idanter then Begin
      if Length(Trim(idanter)) > 0 then LineaHist;
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
        if (medicoos.Buscar(codos, Copy(r.Strings[j], 19, 5))) then begin
          medicoos.getDatos(codos, copy(r.Strings[j], 19, 5));
          historiac[3] := Copy(r.Strings[j], 19, 5) + ' ' + medicoos.Nombre;
        end;
      end;

      historiac[6] := '  Orden: ' + Copy(r.Strings[j], 1, 10); //Copy(r.Strings[j], 23, 10);
      historiac[7] := Copy(r.Strings[j], m+2, n-(m+2));
      historiac[8] := Copy(r.Strings[j], n+2, o-(n+2));
      historiac[4] := '';  historiac[5] := '';
      if (medcab.BuscarMedicoCabecera(codos, trim(Copy(r.Strings[j], o+7, 6)))) then
        historiac[9] := 'Méd. Cabecera: ' + Copy(r.Strings[j], o+7, 6) + ' ' + medcab.setMedicoCabecera(codos, trim(Copy(r.Strings[j], o+7, 6)))
      else begin
        medicoos.getDatos(codos, Copy(r.Strings[j], o+7, 6));
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

  LineaHist;
  Inc(lh);
  HHCC.Cells[0, lh] := '*';
  HHCC.Cells[1, lh] := '----------------------------------------------------------------------------------------------';

  HHCC.Col    := 0;

  For i := lh + 1 to HHCC.RowCount do begin
    for j := 0 to HHCC.ColCount - 1 do HHCC.Cells[j, i] := '';
  end;
end;

procedure TfmEdicionDeterminaciones.MoverItems(O, D: TStringGrid);
var
  i, j: integer;
begin
  j := 0;
  for i := 1 to D.RowCount do begin
    if (length(trim(D.Cells[0, i])) = 0) then break;
    inc(j);
  end;

  D.Cells[0, j+1] := O.Cells[0, O.Row];
  D.Cells[1, j+1] := O.Cells[1, O.Row];
  D.Row           := j+1;

  grid.BorrarRenglon_SinRenumerar(O);

  if (O.Row > 1) then O.Row := O.Row - 1;
  O.setFocus;
end;

procedure TfmEdicionDeterminaciones.observacionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then btnRegistrar.setFocus;
end;

end.
