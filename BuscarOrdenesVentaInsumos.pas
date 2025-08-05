unit BuscarOrdenesVentaInsumos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfmBuscarOrdenesInsumos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    periodo: TMaskEdit;
    Label3: TLabel;
    idprof: TMaskEdit;
    BuscarProfesional: TBitBtn;
    nos: TLabel;
    btnOK: TButton;
    Panel4: TPanel;
    btnCerrar: TButton;
    S: TStringGrid;
    Panel5: TPanel;
    procedure FormShow(Sender: TObject);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarProfesionalClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel5Resize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatosProfesional;
    procedure CargarOrdenes;
  public
    { Public declarations }
    seleccionOK: Boolean;
  end;

var
  fmBuscarOrdenesInsumos: TfmBuscarOrdenesInsumos;

implementation

uses CUtiles, CProfesionalCCB, CInsumos_CentroBioq, CUtilidadesStringGrid,
     CCVentas_CCB, NominaDeProfesionalesLiquidacionOS, CConfigForms;

{$R *.dfm}

procedure TfmBuscarOrdenesInsumos.CargarDatosProfesional;
Begin
  profesional.getDatos(idprof.Text);
  nos.Caption := profesional.nombre;
  CargarOrdenes;
end;

procedure TfmBuscarOrdenesInsumos.CargarOrdenes;
var
  i: Integer;
  l: TStringList;
Begin
  grid.IniciarGrilla(S);
  l := ventainsumos.setOrdenes(periodo.Text, idprof.Text);

  for i := 1 to l.Count do Begin
    S.Cells[0, i] := utiles.sFormatoFecha(Copy(l.Strings[i-1], 1, 8));
    S.Cells[1, i] := idprof.Text;
    profesional.getDatos(S.Cells[1, i]);
    S.Cells[2, i] := profesional.nombre;
    S.Cells[3, i] := Trim(Copy(l.Strings[i-1], 9, 17));
    S.Row         := i;
  end;

  if i >= 1 then S.SetFocus;
end;

procedure TfmBuscarOrdenesInsumos.FormShow(Sender: TObject);
begin
  S.Cells[0, 0] := 'Fecha'; S.Cells[1, 0] := 'Id.Prof.'; S.Cells[2, 0] := 'Profesional'; S.ColWidths[3] := -1;
  periodo.Text := utiles.setPeriodoActual;
  configform.Setear(fmBuscarOrdenesInsumos);
  idprof.SetFocus;
  redim := False;
end;

procedure TfmBuscarOrdenesInsumos.periodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then idprof.SetFocus;
end;

procedure TfmBuscarOrdenesInsumos.idprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then periodo.SetFocus;
  if(Key = VK_RETURN) or (Key = VK_DOWN) then
    if not profesional.Buscar(idprof.Text) then BuscarProfesionalClick(Self) else CargarDatosProfesional;

end;

procedure TfmBuscarOrdenesInsumos.BuscarProfesionalClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.on2        := True;
  fmListProfesionalesLiq.ShowModal;
  Refresh;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprof.Text := profesional.tperso.FieldByName('idprof').AsString; Refresh;
    CargarDatosProfesional;
  end;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := nil;
end;

procedure TfmBuscarOrdenesInsumos.btnOKClick(Sender: TObject);
begin
  if Length(Trim(S.Cells[0, S.Row])) > 0 then Begin
    seleccionOK := True;
    Close;
  end;
end;

procedure TfmBuscarOrdenesInsumos.SKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if Length(Trim(S.Cells[0, S.Row])) > 0 then btnOK.SetFocus;
end;

procedure TfmBuscarOrdenesInsumos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBuscarOrdenesInsumos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.guardar(fmBuscarOrdenesInsumos, redim);
end;

procedure TfmBuscarOrdenesInsumos.Panel5Resize(Sender: TObject);
begin
  redim := True;
end;

end.
