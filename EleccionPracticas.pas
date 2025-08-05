unit EleccionPracticas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, ExtCtrls, ImgForms, ToolWin, DBTables, StdCtrls, Mask,
  Buttons, Menus;

type
  TfmElePracticas = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel4: TPanel;
    Si: TSpeedButton;
    Ninguno: TSpeedButton;
    Todos: TSpeedButton;
    P: TSpeedButton;
    A: TSpeedButton;
    S: TSpeedButton;
    U: TSpeedButton;
    Label3: TLabel;
    Actualizar: TSpeedButton;
    PopupMenu: TPopupMenu;
    Seleccionar1: TMenuItem;
    odos1: TMenuItem;
    Ninguno1: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
    F: TStringGrid;
    todosprof: TRadioButton;
    RadioButton1: TRadioButton;
    Panel5: TPanel;
    Label1: TLabel;
    buscar: TMaskEdit;
    procedure SiClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure NingunoClick(Sender: TObject);
    procedure PClick(Sender: TObject);
    procedure buscarChange(Sender: TObject);
    procedure buscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure todosprofClick(Sender: TObject);
    procedure todosprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    nroitems: integer;
  public
    { Public declarations }
    tipo, IdSel, NomSel: string; profSeleccionados, intro, filtrarProfFacturacion, redim, seleccionOK: Boolean; cantidadSel: Integer;
    lista: TStringList;
    procedure CargarDatos;
    procedure SeleccionarProf(xidprof: String);
    procedure FijarProfPredeterminado(xidprof: String);
  end;

var
  fmElePracticas: TfmElePracticas;

implementation

uses CNomeclaCCB, CUtiles, CUtilidadesStringGrid, CConfigForms;

{$R *.DFM}

procedure TfmElePracticas.SeleccionarProf(xidprof: String);
var
  i: integer;
begin
 For i := 1 to F.RowCount do Begin
   if Length(Trim(F.cells[0, i])) = 0 then Break;
   if F.cells[1, i] = xidprof then Begin
     F.cells[2, i] := 'S';
     Break;
   end;
 end;
end;

procedure TfmElePracticas.FijarProfPredeterminado(xidprof: String);
begin
  lista := TStringList.Create;
  lista.Add(xidprof);
end;

procedure TfmElePracticas.CargarDatos;
var
  r: TQuery; i: integer;
begin
  F.cells[0, 0] := 'Profesional'; F.cells[1, 0] := 'Cód.'; F.cells[2, 0] := 'S';

  grid.IniciarGrilla(F);

  if todosprof.Checked then r := nomeclatura.setNomeclaturaAlf else r := nomeclatura.setNomeclaturaRIE;
  r.Open; i := 0; r.First;
  while not r.EOF do Begin
    Inc(i);
    F.cells[0, i] := r.FieldByName('descrip').AsString;
    F.cells[1, i] := r.FieldByName('codigo').AsString;
    r.Next;
  end;
  r.Close; r.Free;
  nroItems := i;
  F.Refresh;
  Label3.Caption := '1';
end;

procedure TfmElePracticas.SiClick(Sender: TObject);
begin
  if Length(Trim(F.cells[0, F.row])) > 0 then Begin
    if F.cells[2, F.row] <> 'S' then F.cells[2, F.row] := 'S' else F.cells[2, F.row] := ' ';
    if (F.row < F.rowcount) and (Length(Trim(F.cells[0, F.row + 1])) > 0) then F.row := F.row + 1;
    F.Refresh;
  end;
end;

procedure TfmElePracticas.TodosClick(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to nroItems do F.cells[2, i] := 'S';
  F.Refresh;
end;

procedure TfmElePracticas.NingunoClick(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to nroItems do F.cells[2, i] := ' ';
  lista := Nil;
  buscar.Text := '';
  F.Refresh;
end;

procedure TfmElePracticas.PClick(Sender: TObject);
begin
  if Sender = P then F.row := 1;
  if Sender = U then F.row := nroItems;
  if Sender = A then if F.row > 1 then F.row := F.row - 1;
  if Sender = S then if F.row < nroItems then F.row := F.row + 1;
  F.Refresh;
end;

procedure TfmElePracticas.buscarChange(Sender: TObject);
var
  caracteres, i: integer;
begin
  caracteres := Length(Trim(buscar.Text));
  For i := 1 to nroItems do Begin
    if UpperCase(buscar.Text) = UpperCase(Copy(F.cells[0, i], 1, caracteres)) then Begin
      F.row := i; F.Refresh; Break;
    end;
  end;
end;

procedure TfmElePracticas.buscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then Begin
    if F.row > 1 then F.row := F.row - 1;
    ActiveControl := F; F. Refresh;
  end;
  if Key = VK_DOWN then Begin
    if F.row < nroItems then F.row := F.row + 1;
    ActiveControl := F; F. Refresh;
  end;
  if Key = VK_RETURN then ActiveControl := F;
end;

procedure TfmElePracticas.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i, j: Integer;
begin
  configform.Guardar(fmElePracticas, redim);
  grid.GuardarAnchoColumnas(fmElePracticas, F);
  lista := TStringList.Create;
  lista.Clear;
  Label3.Caption := IntToStr(F.row);

  j := 0; ProfSeleccionados := False; cantidadSel := 0;
  For i := 1 to F.RowCount - 1 do Begin
    if Length(Trim(F.cells[1, i])) = 0 then Break;
    if Copy(F.cells[2, i], 1, 1) = 'S' then Begin
      IdSel := F.Cells[1, i]; NomSel := F.Cells[0, i];
      Inc(j);
      ProfSeleccionados := True;
      lista.Add(F.cells[1, i]);
    end;
  end;
  cantidadSel := j;
  if j = 1 then
    if F.Row > 1 then F.Row := F.Row - 1;
  if (cantidadSel = 0) and (intro) then Begin
    IdSel := F.Cells[1, F.Row]; NomSel := F.Cells[0, F.Row];   // Valores por defecto
    lista.Add(F.Cells[1, F.Row]);
    ProfSeleccionados := True;
  end;

  if cantidadSel = 0 then lista := Nil;
end;

procedure TfmElePracticas.FKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then Close;
 if Key = VK_RETURN then Begin
   intro := True;
   Close;
 end;
 if Key = VK_SPACE  then SiClick(Sender);
end;

procedure TfmElePracticas.ActualizarClick(Sender: TObject);
begin
  CargarDatos;
end;

procedure TfmElePracticas.FormCreate(Sender: TObject);
begin
  lista := TStringList.Create;
end;

procedure TfmElePracticas.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if not configform.Setear(fmElePracticas) then Left := StrToInt(FormatFloat('####', (Screen.DesktopWidth / 2) - (Width / 2)));
  buscar.Text   := '';
  F.row         := StrToInt(Label3.Caption);
  ActiveControl := buscar;
  redim := false;
  grid.RecuperarAnchoColumnas(fmElePracticas, F);
  buscar.SetFocus;
end;

procedure TfmElePracticas.Panel3Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmElePracticas.todosprofClick(Sender: TObject);
begin
  CargarDatos;
end;

procedure TfmElePracticas.todosprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then F.SetFocus;
end;

end.
