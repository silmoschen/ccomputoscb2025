unit EleccionLaboratorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, ExtCtrls, ImgForms, ToolWin, DBTables, StdCtrls, Mask;

type
  TfmEleLaboratorios = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    P: TToolButton;
    A: TToolButton;
    S: TToolButton;
    U: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    buscar: TMaskEdit;
    Label2: TLabel;
    letra: TComboBox;
    Label3: TLabel;
    Panel3: TPanel;
    F: TStringGrid;
    procedure CargarDatos;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure PClick(Sender: TObject);
    procedure buscarChange(Sender: TObject);
    procedure letraChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    nroitems: integer;
  public
    { Public declarations }
    tipo: string; ObSeleccionadas: Boolean;
  end;

var
  fmEleLaboratorios: TfmEleLaboratorios;

implementation

uses CProfesionalCCB, CUtiles;

{$R *.DFM}

procedure TfmEleLaboratorios.CargarDatos;
var
  r: TQuery; i, j: integer;
begin
  r := nil;
  F.cells[0, 0] := 'Obra Social'; F.cells[1, 0] := 'Cód.'; F.cells[2, 0] := 'S';
  For i := 1 to F.RowCount do
    For j := 1 to F.ColCount do F.cells[j-1, i] := '';

   r := profesional.setProfesionalesAlf;
  r.Open; i := 0; r.First;
  while not r.EOF do Begin
    Inc(i);
    F.cells[0, i] := r.FieldByName('nombre').AsString;
    F.cells[1, i] := r.FieldByName('idprof').AsString;
    r.Next;
  end;
  r.Close; r.Free;
  nroItems := i;
  F.Refresh;
  Label3.Caption := '1';
end;

procedure TfmEleLaboratorios.ToolButton1Click(Sender: TObject);
begin
  if Length(Trim(F.cells[0, F.row])) > 0 then Begin
    if F.cells[2, F.row] <> 'X' then F.cells[2, F.row] := 'X' else F.cells[2, F.row] := ' ';
    if (F.row < F.rowcount) and (Length(Trim(F.cells[0, F.row + 1])) > 0) then F.row := F.row + 1;
    F.Refresh;
  end;
end;

procedure TfmEleLaboratorios.ToolButton2Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to nroItems do F.cells[2, i] := 'X';
  F.Refresh;
end;

procedure TfmEleLaboratorios.ToolButton3Click(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to nroItems do F.cells[2, i] := ' ';
  F.Refresh;
end;

procedure TfmEleLaboratorios.PClick(Sender: TObject);
begin
  if Sender = P then F.row := 1;
  if Sender = U then F.row := nroItems;
  if Sender = A then if F.row > 1 then F.row := F.row - 1;
  if Sender = S then if F.row < nroItems then F.row := F.row + 1;
  F.Refresh;
end;

procedure TfmEleLaboratorios.buscarChange(Sender: TObject);
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

procedure TfmEleLaboratorios.letraChange(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to nroItems do Begin
    if UpperCase(letra.Text) = UpperCase(Copy(F.cells[0, i], 1, 1)) then Begin
      F.row := i; F.Refresh; Break;
    end;
  end;
end;

procedure TfmEleLaboratorios.FormCreate(Sender: TObject);
begin
  Left := StrToInt(FormatFloat('####', (Screen.DesktopWidth / 2) - (Width / 2)));
  buscar.Text   := '';
  F.row         := StrToInt(Label3.Caption);
  ActiveControl := buscar;
end;

procedure TfmEleLaboratorios.buscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then Begin
    if F.row > 1 then F.row := F.row - 1;
    ActiveControl := F; F. Refresh;
  end;
  if Key = VK_DOWN then Begin
    if F.row < nroItems then F.row := F.row + 1;
    ActiveControl := F; F. Refresh;
  end;
  if Key = VK_RETURN then Close;
end;

procedure TfmEleLaboratorios.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  Label3.Caption := IntToStr(F.row);

  For i := 1 to F.Row do
    if F.cells[2, i] = 'X' then Begin
      ObSeleccionadas := True;
      Break;
    end;
end;

procedure TfmEleLaboratorios.FKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
