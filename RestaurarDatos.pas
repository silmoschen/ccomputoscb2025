unit RestaurarDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, CUtiles, StdCtrls, Mask, CFacturacionCCB,
  Grids, CUtilidadesStringGrid, CProfesionalCCB, Buttons, CUtilidadesArchivos,
  CLiquidacionObrasSocCCB, CAuditoriaCCB;

type
  TfmRestaurarBackup = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    periodo: TMaskEdit;
    Panel5: TPanel;
    S: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnRestaurarFact: TButton;
    Panel6: TPanel;
    btnCerrarFact: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    periododist: TMaskEdit;
    Panel10: TPanel;
    D: TStringGrid;
    Panel9: TPanel;
    restaurarDist: TButton;
    Panel11: TPanel;
    btnCerrarDist: TButton;
    Panel12: TPanel;
    Panel13: TPanel;
    restaurarAudit: TButton;
    Panel14: TPanel;
    btnCerrarAudit: TButton;
    Panel15: TPanel;
    Panel16: TPanel;
    Label3: TLabel;
    SpeedButton7: TSpeedButton;
    periodoaudit: TMaskEdit;
    Panel17: TPanel;
    A: TStringGrid;
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnCerrarFactClick(Sender: TObject);
    procedure btnRestaurarFactClick(Sender: TObject);
    procedure SKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure periododistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure restaurarDistClick(Sender: TObject);
    procedure DKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure periodoauditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure restaurarAuditClick(Sender: TObject);
  private
    { Private declarations }
    procedure CargarLaboratotiosFact;
    procedure CargarLaboratotiosDist;
    procedure CargarLaboratotiosAudi;
  public
    { Public declarations }
  end;

var
  fmRestaurarBackup: TfmRestaurarBackup;

implementation

{$R *.dfm}

procedure TfmRestaurarBackup.CargarLaboratotiosFact;
// Objetivo...: Cargar Laboratorios Facturados
var
  l: TStringList;
  i: Integer;
Begin
  StatusBar1.Panels[0].Text := 'Recuperando Backup ...!'; StatusBar1.Refresh;
  profesional.conectar;
  grid.IniciarGrilla(S);
  l := facturacion.setLaboratoriosBackup(periodo.Text);
  For i := 1 to l.Count do Begin
    profesional.getDatos(l.Strings[i-1]);
    S.Cells[0, i] := l.Strings[i-1];
    S.Cells[1, i] := profesional.nombre;
  end;

  l.Destroy;
  profesional.desconectar;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmRestaurarBackup.CargarLaboratotiosDist;
// Objetivo...: Cargar Laboratorios Facturados
var
  l: TStringList;
  i: Integer;
Begin
  StatusBar1.Panels[0].Text := 'Recuperando Backup ...!'; StatusBar1.Refresh;
  grid.IniciarGrilla(D);
  l := distribucionos.setBackup(periododist.Text);
  For i := 1 to l.Count do Begin
    D.Cells[0, i] := utiles.sFormatoFecha(Copy(l.Strings[i-1], 1, 8));
    D.Cells[1, i] := 'Backup Dist. Fecha ' + D.Cells[0, i] + ' Nro. ' + Copy(l.Strings[i-1], 22, 2);
    D.Cells[3, i] := l.Strings[i-1];
  end;

  l.Destroy;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmRestaurarBackup.CargarLaboratotiosAudi;
// Objetivo...: Cargar Laboratorios Auditoria
var
  l: TStringList;
  i: Integer;
Begin
  StatusBar1.Panels[0].Text := 'Recuperando Backup ...!'; StatusBar1.Refresh;
  grid.IniciarGrilla(A);
  l := auditoriacb.setBackup(periodoaudit.Text);
  For i := 1 to l.Count do Begin
    A.Cells[0, i] := utiles.sFormatoFecha(Copy(l.Strings[i-1], 1, 8));
    A.Cells[1, i] := 'Backup Auditoría Fecha ' + A.Cells[0, i];
    A.Cells[3, i] := l.Strings[i-1];
  end;

  l.Destroy;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
end;

procedure TfmRestaurarBackup.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then CargarLaboratotiosFact;
end;

procedure TfmRestaurarBackup.FormShow(Sender: TObject);
begin
  S.Cells[0, 0] := 'Código'; S.Cells[1, 0] := 'Nombre del Profesional';  S.Cells[2, 0] := 'S';
  D.Cells[0, 0] := 'Fecha'; D.Cells[1, 0] := 'Descripción';  D.Cells[2, 0] := 'S';
  A.Cells[0, 0] := 'Fecha'; A.Cells[1, 0] := 'Descripción';  A.Cells[2, 0] := 'S';
  D.ColWidths[3] := -1; A.ColWidths[3] := -1;
  periodo.SetFocus;
end;

procedure TfmRestaurarBackup.SpeedButton1Click(Sender: TObject);
begin
  if Length(Trim(S.cells[0, S.row])) > 0 then Begin
    if S.cells[2, S.row] <> 'S' then S.cells[2, S.row] := 'S' else S.cells[2, S.row] := ' ';
    if (S.row < S.rowcount) and (Length(Trim(S.cells[0, S.row + 1])) > 0) then S.row := S.row + 1;
    S.Refresh;
  end;
end;

procedure TfmRestaurarBackup.SpeedButton2Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to S.RowCount do Begin
    if Length(Trim(S.cells[0, i])) = 0 then Break;
    S.cells[2, i] := 'S';
  end;
  S.Refresh;
end;

procedure TfmRestaurarBackup.SpeedButton3Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to S.RowCount do Begin
    if Length(Trim(S.cells[0, i])) = 0 then Break;
    S.cells[2, i] := '';
  end;
  S.Refresh;
end;

procedure TfmRestaurarBackup.btnCerrarFactClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRestaurarBackup.btnRestaurarFactClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Este Proceso Sobreescribirá los Datos en los Laboratorios Seleccionados,' + chr(13) + 'Seguro para Proceder ?') then Begin
    StatusBar1.Panels[0].Text := ' Restaurando Backup ...!'; StatusBar1.Refresh;
    For i := 1 to S.RowCount do Begin
      if Length(Trim(S.Cells[0, i])) = 0 then Break;
      if S.Cells[2, i] = 'S' then facturacion.RealizarRestauracionLaboratorios(periodo.Text, S.Cells[0, i]);
    end;
    StatusBar1.Panels[0].Text := '';
    btnCerrarFact.SetFocus;
  end;
end;

procedure TfmRestaurarBackup.SKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then SpeedButton1Click(Self);
end;

procedure TfmRestaurarBackup.periododistKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periododist.Text) then CargarLaboratotiosDist;
end;

procedure TfmRestaurarBackup.SpeedButton4Click(Sender: TObject);
begin
  if Length(Trim(D.cells[0, D.row])) > 0 then Begin
    if D.cells[2, D.row] <> 'S' then D.cells[2, D.row] := 'S' else D.cells[2, D.row] := ' ';
    if (D.row < D.rowcount) and (Length(Trim(D.cells[0, D.row + 1])) > 0) then D.row := D.row + 1;
    D.Refresh;
  end;
end;

procedure TfmRestaurarBackup.SpeedButton5Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to D.RowCount do Begin
    if Length(Trim(D.cells[0, i])) = 0 then Break;
    D.cells[2, i] := 'S';
  end;
  D.Refresh;
end;

procedure TfmRestaurarBackup.SpeedButton6Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to D.RowCount do Begin
    if Length(Trim(D.cells[0, i])) = 0 then Break;
    D.cells[2, i] := '';
  end;
  D.Refresh;
end;

procedure TfmRestaurarBackup.restaurarDistClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Este Proceso Sobreescribirá los Datos en las Distribuciones Seleccionadas,' + chr(13) + 'Seguro para Proceder ?') then Begin
    StatusBar1.Panels[0].Text := ' Restaurando Backup ...!'; StatusBar1.Refresh;
    For i := 1 to D.RowCount do Begin
      if Length(Trim(D.Cells[0, i])) = 0 then Break;
      if D.Cells[2, i] = 'S' then distribucionos.RealizarRestauracionLaboratorios(D.Cells[3, i]);
    end;
    StatusBar1.Panels[0].Text := '';
    btnCerrarDist.SetFocus;
  end;
end;

procedure TfmRestaurarBackup.DKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then SpeedButton4Click(Self);
end;

procedure TfmRestaurarBackup.periodoauditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodoaudit.Text) then CargarLaboratotiosAudi;
end;

procedure TfmRestaurarBackup.TabSheet2Show(Sender: TObject);
begin
  periodoaudit.SetFocus;
end;

procedure TfmRestaurarBackup.SpeedButton7Click(Sender: TObject);
var
  i: Integer;
begin
  if Length(Trim(A.cells[0, A.row])) > 0 then Begin
    for i := 1 to A.RowCount do
      if i <> A.Row then A.cells[2, i] := '';
    if A.cells[2, A.row] <> 'S' then A.cells[2, A.row] := 'S' else A.cells[2, A.row] := ' ';
    if (A.row < A.rowcount) and (Length(Trim(A.cells[0, A.row + 1])) > 0) then A.row := A.row + 1;
    A.Refresh;
  end;
end;

procedure TfmRestaurarBackup.restaurarAuditClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Este Proceso Sobreescribirá los Datos del Backup Seleccionado,' + chr(13) + 'Seguro para Proceder ?') then Begin
    StatusBar1.Panels[0].Text := ' Restaurando Backup ...!'; StatusBar1.Refresh;
    For i := 1 to A.RowCount do Begin
      if Length(Trim(A.Cells[0, i])) = 0 then Break;
      if A.Cells[2, i] = 'S' then auditoriacb.RestaurarBackup(A.Cells[3, i]);
    end;
    StatusBar1.Panels[0].Text := '';
    btnCerrarAudit.SetFocus;
  end;
end;

end.
