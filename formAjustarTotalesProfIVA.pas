unit formAjustarTotalesProfIVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons, Mask, CUtiles, CProfesionalCCB,
  CUtilidadesStringgrid, CFacturacionCCB, DBTables, CObrassocialesCCB;

type
  TfmAjustesTotalesIVA = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label14: TLabel;
    Label27: TLabel;
    periodo: TMaskEdit;
    Label47: TLabel;
    idprof: TMaskEdit;
    BuscarProfes: TBitBtn;
    np: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel3: TPanel;
    F: TStringGrid;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idprofKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BuscarProfesClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure periodoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure idprofKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarDatosProfesional;
    procedure CargarTotales;
  public
    { Public declarations }
  end;

var
  fmAjustesTotalesIVA: TfmAjustesTotalesIVA;

implementation

uses NominaDeProfesionalesLiquidacionOS;

{$R *.dfm}

procedure TfmAjustesTotalesIVA.CargarDatosProfesional;
begin
  profesional.getDatos(idprof.Text);
  np.Caption := profesional.nombre;
  profesional.SincronizarListaRetIVA(periodo.Text, idprof.Text);
  grid.IniciarGrilla(F);
end;

procedure TfmAjustesTotalesIVA.CargarTotales;
var
  r: TQuery;
  i, j: integer;
begin
  grid.IniciarGrilla(F);
  if (RadioButton1.Checked) then j := 2 else j := 1;
  r := facturacion.setItemsTotalFacturadoProfesionales(periodo.Text, idprof.Text);
  r.open; i := 0;
  while not r.eof do begin
    if (r.fieldbyname('tipoing').asinteger = j) then begin
      inc(i);
      obsocial.getDatos(r.FieldByName('codos').asstring);
      F.Cells[0, i] := r.FieldByName('codos').asstring;
      F.Cells[1, i] := obsocial.Nombre;
      F.Cells[2, i] := utiles.FormatearNumero(r.FieldByName('monto').asstring);
    end;
    r.next;
  end;
  r.Close; r.free;

  if (i > 0) then F.setFocus;
end;

procedure TfmAjustesTotalesIVA.BuscarProfesClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.on2        := True;
  fmListProfesionalesLiq.ShowModal;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
    CargarDatosProfesional;
  End;
end;

procedure TfmAjustesTotalesIVA.FKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  modo, i: integer;
begin
  if (Key = VK_SPACE) then
    if (utiles.msgSiNo('Seguro para Realizar Cambio ?')) then begin
      if (RadioButton1.Checked) then modo := 1 else modo := 2;
      facturacion.CambiarTipoTotalProfesional(periodo.Text, idprof.Text, F.Cells[0, F.Row], modo);
      i := F.Row;
      CargarTotales;
      F.Row := i;
    end;
end;

procedure TfmAjustesTotalesIVA.FKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := ' SPACE para Realizar el Traspaso';
end;

procedure TfmAjustesTotalesIVA.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width := Width - 150;
end;

procedure TfmAjustesTotalesIVA.FormShow(Sender: TObject);
begin
  periodo.setFocus;
  F.Cells[0, 0] := 'Código'; F.Cells[1, 0] := 'Obra Social'; F.Cells[2, 0] := 'Monto';
end;

procedure TfmAjustesTotalesIVA.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) then periodo.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then begin
    if (profesional.Buscar(idprof.Text)) then CargarDatosProfesional else BuscarProfesClick(Self);
  end;
end;

procedure TfmAjustesTotalesIVA.idprofKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := '';
end;

procedure TfmAjustesTotalesIVA.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.verificarPeriodo(periodo.Text)) then idprof.setFocus;
end;

procedure TfmAjustesTotalesIVA.periodoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text := '';
end;

procedure TfmAjustesTotalesIVA.RadioButton1Click(Sender: TObject);
begin
  CargarTotales;
end;

procedure TfmAjustesTotalesIVA.RadioButton2Click(Sender: TObject);
begin
  CargarTotales;
end;

end.
