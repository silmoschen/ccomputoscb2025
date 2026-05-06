unit refacturar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, CFacturacionCCB, IBQuery, StdCtrls, CUtilidadesStringGrid,
  Buttons;

type
  TfmRF = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel3: TPanel;
    F: TStringGrid;
    Panel1: TPanel;
    btnRefacturar: TButton;
    btnAll: TCheckBox;
    Si: TSpeedButton;
    Ninguno: TSpeedButton;
    Todos: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnRefacturarClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure SiClick(Sender: TObject);
    procedure NingunoClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure load;
  public
    { Public declarations }
    periodo: string;
    refactura: boolean;
  end;

var
  fmRF: TfmRF;

implementation

{$R *.dfm}

procedure TfmRF.load;
var
  r: TIBQuery;
  i: integer;
begin
  grid.IniciarGrilla(F);

  if (not btnAll.Checked) then r := facturacion.getLaboratoriosARefacturar(periodo)
    else r := facturacion.getLaboratoriosARefacturarAll(periodo);

  r.open; i := 0;
  while not r.eof do begin
    inc(i);
    F.Cells[0, i] := r.fieldbyname('idprof').asstring;
    r.next;
  end;

  r.close; r.free;

  if (i = 0) then btnRefacturar.Enabled := false else btnRefacturar.Enabled := true;
end;

procedure TfmRF.NingunoClick(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to F.RowCount do F.cells[1, i] := ' ';
  F.Refresh;
end;

procedure TfmRF.SiClick(Sender: TObject);
begin
  if Length(Trim(F.cells[0, F.row])) > 0 then Begin
    if F.cells[1, F.row] <> 'S' then F.cells[1, F.row] := 'S' else F.cells[1, F.row] := ' ';
    if (F.row < F.rowcount) and (Length(Trim(F.cells[0, F.row + 1])) > 0) then F.row := F.row + 1;
    F.Refresh;
  end;
end;

procedure TfmRF.TodosClick(Sender: TObject);
var
  i: integer;
begin
  For i := 1 to F.RowCount do begin
    if (F.cells[0, i] = '') then break;
    F.cells[1, i] := 'S';
  end;
  F.Refresh;
end;

//==============================================================================

procedure TfmRF.btnAllClick(Sender: TObject);
begin
  load;
end;

procedure TfmRF.btnRefacturarClick(Sender: TObject);
begin
  refactura := true;
  Close;
end;

procedure TfmRF.FKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) or (Key = VK_RETURN) then Close;
  if Key = VK_SPACE  then SiClick(Sender);
end;

procedure TfmRF.FormShow(Sender: TObject);
begin
  F.Cells[0, 0] := 'Profesional'; F.Cells[1, 0] := 'Sel';

  load;
end;


end.
