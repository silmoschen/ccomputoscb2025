unit EleccionMeses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Editv, ExtCtrls, CUtiles, CConfigForms;

type
  TfmEleMeses = class(TForm)
    Panel3: TPanel;
    ScrollBox2: TScrollBox;
    StatusBar1: TStatusBar;
    M: TStringGrid;
    procedure MKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
  public
    { Public declarations }
    mesesSel: array[1..12] of String;
    procedure MarcarMes(xmes: String);
  end;

var
  fmEleMeses: TfmEleMeses;

implementation

{$R *.dfm}

procedure TfmEleMeses.MarcarMes(xmes: String);
var
  i: Integer;
Begin
  M.Cells[0, 0]  := 'Nº'; M.Cells[1, 0]  := 'Mes'; M.Cells[2, 0] := 'S';
  M.Cells[0, 1]  := '01'; M.Cells[1, 1]  := 'Enero';
  M.Cells[0, 2]  := '02'; M.Cells[1, 2]  := 'Febrero';
  M.Cells[0, 3]  := '03'; M.Cells[1, 3]  := 'Marzo';
  M.Cells[0, 4]  := '04'; M.Cells[1, 4]  := 'Abril';
  M.Cells[0, 5]  := '05'; M.Cells[1, 5]  := 'Mayo';
  M.Cells[0, 6]  := '06'; M.Cells[1, 6]  := 'Junio';
  M.Cells[0, 7]  := '07'; M.Cells[1, 7]  := 'Julio';
  M.Cells[0, 8]  := '08'; M.Cells[1, 8]  := 'Agosto';
  M.Cells[0, 9]  := '09'; M.Cells[1, 9]  := 'Setiembre';
  M.Cells[0, 10] := '10'; M.Cells[1, 10] := 'Octubre';
  M.Cells[0, 11] := '11'; M.Cells[1, 11] := 'Noviembre';
  M.Cells[0, 12] := '12'; M.Cells[1, 12] := 'Diciembre';
  For i := 1 to 12 do
    if M.Cells[0, i] = xmes then M.Cells[2, i] := 'S';
end;

procedure TfmEleMeses.MKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_SPACE then
    if M.Cells[2, M.Row] = 'S' then M.Cells[2, M.Row] := ' ' else M.Cells[2, M.Row] := 'S';
end;

procedure TfmEleMeses.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i, j: Integer;
begin
  j := 0;
  For i := 1 to 12 do Begin
    if M.Cells[2, i] = 'S' then Begin
      Inc(j);
      mesesSel[j] := M.Cells[0, i];
    end;
  end;
  configform.Guardar(fmEleMeses, redim);
end;

procedure TfmEleMeses.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if not configform.Setear(fmEleMeses) then Left:=(Screen.Width - Width) div 2;
  M.Cells[0, 0] := 'Nº'; M.Cells[1, 0] := 'Mes'; M.Cells[2, 0] := 'S';
  For i := 1 to 12 do Begin
    M.Cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 2, '0');
    M.Cells[1, i] := utiles.setMes(i);
  end;
  redim := False;
end;

procedure TfmEleMeses.Panel3Resize(Sender: TObject);
begin
  redim := True;
end;

end.
