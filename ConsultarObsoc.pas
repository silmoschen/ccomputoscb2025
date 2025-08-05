unit ConsultarObsoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, Grids, ComCtrls, ExtCtrls, Buttons, Mask;

type
  TfmConsultarObSoc = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    S: TStringGrid;
    Label1: TLabel;
    codos: TLabel;
    nos: TLabel;
    Label2: TLabel;
    netofact: TEditValid;
    Label3: TLabel;
    totalfact: TEditValid;
    Label4: TLabel;
    perfact: TLabel;
    Label5: TLabel;
    perliq: TLabel;
    Label6: TLabel;
    totos: TLabel;
    Panel4: TPanel;
    btnAjustar: TButton;
    btnCerrar: TButton;
    Panel5: TPanel;
    btnAplicar: TButton;
    btnCancelar: TButton;
    Label8: TLabel;
    idprof: TMaskEdit;
    BuscarProfesional: TBitBtn;
    nprof: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAjustarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure netofactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure totalfactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel3Resize(Sender: TObject);
    procedure BuscarProfesionalClick(Sender: TObject);
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
    procedure TotalFacturado;
    procedure CargarDatosProfesional;
  public
    { Public declarations }
  end;

var
  fmConsultarObSoc: TfmConsultarObSoc;

implementation

uses
  CFacturacionCCB, CUtiles, CUtilidadesStringGrid, CProfesionalCCB, CConfigForms,
  NominaDeProfesionalesLiquidacionOS;

{$R *.dfm}

procedure TfmConsultarObSoc.CargarDatos;
var
  l, t: TStringList;
  i, p: Integer;
Begin
  grid.IniciarGrilla(S);
  t := TStringList.Create;
  t.Add(codos.Caption);
  l := facturacion.setTotalProfesionalesLiquidacion(perliq.Caption, t, False);
  For i := 1 to l.Count do Begin
    profesional.getDatos(Copy(l.Strings[i-1], 1, 6));
    p := Pos(';1', l.Strings[i-1]);
    S.Cells[0, i] := Copy(l.Strings[i-1], 1, 6);
    S.Cells[1, i] := profesional.nombre;
    S.Cells[2, i] := utiles.FormatearNumero(Copy(l.Strings[i-1], 7, p-7));
    S.Cells[3, i] := utiles.FormatearNumero(Copy(l.Strings[i-1], p+2, 10));
  end;
  TotalFacturado;
  S.SetFocus;
end;

procedure TfmConsultarObSoc.TotalFacturado;
var
  i: Integer;
  t: Real;
Begin
  t := 0;
  For i := 1 to S.RowCount do Begin
    if Length(Trim(S.Cells[0, i])) = 0 then Break;
    t := t + StrToFloat(S.Cells[3, i]);
  end;
  totos.Caption := utiles.FormatearNumero(FloatToStr(t));
end;

procedure TfmConsultarObSoc.CargarDatosProfesional;
var
  b: Boolean;
  i: Integer;
Begin
  profesional.getDatos(idprof.Text);
  nprof.Caption := profesional.nombre;
  b := False;
  For i := 1 to S.RowCount do Begin
    if Length(Trim(S.Cells[0, i])) = 0 then Break;
    if S.Cells[0, i] = idprof.Text then Begin
      b := True;
      Break;
    end;
  end;
  if not b then Begin
    netofact.Text  := utiles.FormatearNumero('0');
    totalfact.Text := netofact.Text;
  end;
  netofact.setFocus;
end;

procedure TfmConsultarObSoc.FormShow(Sender: TObject);
begin
  configform.Setear(fmConsultarObSoc);
  S.Cells[0, 0] := 'Id.Prof.'; S.Cells[1, 0] := 'Nombre del Profesional'; S.Cells[2, 0] := 'Neto'; S.Cells[3, 0] := 'Tot.Fact.';
  CargarDatos;
  facturacion.ConectarTotalesProf;
  redim := False;
end;

procedure TfmConsultarObSoc.SKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_RETURN then btnAjustarClick(Self);
  if Key = VK_DELETE then
    if Length(Trim(S.Cells[0, S.Row])) > 0 then Begin
      if utiles.msgSiNo('Seguro para Borrar Items Profesional ' + S.Cells[1, S.Row] + ' ?') then Begin
        StatusBar1.Panels[0].Text := 'Eliminando Items ...!'; StatusBar1.Refresh;
        facturacion.BorrarMontoFacturadoProfesional(perliq.Caption, S.Cells[0, S.Row], codos.Caption);
        CargarDatos;
        if (Length(Trim(S.Cells[0, S.Row])) = 0) and (S.Row > 1) then
          S.Row := S.Row - 1;
      end;
      StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
    end else
      utiles.msgError('El Registro Seleccionado es Incorrecto ...!');
end;

procedure TfmConsultarObSoc.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConsultarObSoc.btnAjustarClick(Sender: TObject);
begin
  if Length(Trim(S.Cells[0, S.Row])) > 0 then Begin
    Panel2.Visible := True;
    idprof.Text    := S.Cells[0, S.Row];
    netofact.Text  := S.Cells[2, S.Row];
    totalfact.Text := S.Cells[3, S.Row];
    CargarDatosProfesional;
  end else begin
    utiles.msgError('El Registro Seleccionado es Incorrecto ...!');
    Panel2.Visible := False;
    S.SetFocus;
  end;
end;

procedure TfmConsultarObSoc.btnCancelarClick(Sender: TObject);
begin
  idprof.Text := ''; nprof.Caption := ''; netofact.Text := ''; totalfact.Text := '';
  Panel2.Visible     := False;
  btnAplicar.Enabled := False;
  S.SetFocus;
end;

procedure TfmConsultarObSoc.netofactKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then idprof.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    netofact.Text := utiles.FormatearNumero(netofact.Text);
    totalfact.SetFocus;
  end;
end;

procedure TfmConsultarObSoc.totalfactKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then netofact.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    totalfact.Text := utiles.FormatearNumero(totalfact.Text);
    btnAplicar.Enabled := True;
    btnAplicar.SetFocus;
  end;
end;

procedure TfmConsultarObSoc.btnAplicarClick(Sender: TObject);
var
  i, n: Integer;
begin
  StatusBar1.Panels[0].Text := 'Registrando Ajuste ...!'; StatusBar1.Refresh;
  if (Length(Trim(netofact.Text)) > 0) and (Length(Trim(totalfact.Text)) > 0) and (profesional.Buscar(idprof.Text)) then Begin
    profesional.getDatos(idprof.Text);
    facturacion.IngresarMontoFacturadoProfesional(perliq.Caption, idprof.Text, S.Cells[1, S.Row], codos.Caption, profesional.Codfact, 0, 0, 0, StrToFloat(totalfact.Text), StrToFloat(netofact.Text));
    facturacion.IngresarMontoFacturadoObraSocial(perliq.Caption, codos.Caption, nos.Caption, StrToFloat(totos.Caption));
    n := 0;
    For i := 1 to S.RowCount do Begin
      if Length(Trim(S.Cells[0, i])) = 0 then Break;
      if S.Cells[0, i] = idprof.Text then Begin
        S.Row := i;
        n     := 1;
        Break;
      end;
    end;
    if n = 0 then Begin
      CargarDatos;
      For i := 1 to S.RowCount do Begin
        if Length(Trim(S.Cells[0, i])) = 0 then Break;
        if S.Cells[0, i] = idprof.Text then Begin
          S.Row := i;
          Break;
        end;
      end;
    end;
    S.Cells[2, S.Row] := netofact.Text;
    S.Cells[3, S.Row] := totalfact.Text;
    TotalFacturado;
    btnCancelarClick(Self);
  end;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmConsultarObSoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmConsultarObSoc, redim);
  facturacion.desConectarTotalesProf;
end;

procedure TfmConsultarObSoc.Panel3Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmConsultarObSoc.BuscarProfesionalClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.ShowModal;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
    CargarDatosProfesional;
  end;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := nil;
  Refresh;
end;

procedure TfmConsultarObSoc.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then S.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if profesional.Buscar(idprof.Text) then CargarDatosProfesional else BuscarProfesionalClick(Self);
  end;
end;

end.
