unit DebitosCreditosEstadisticaIAPOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, Mask, Grids, CUtiles, CDebitosCreditosIAPOS, Contnrs,
  CUtilidadesStringGrid;

type
  TfmAjustesDepositosRetiros = class(TForm)
    Label7: TLabel;
    perliq: TLabel;
    Label1: TLabel;
    concepto: TMaskEdit;
    Label2: TLabel;
    fecha: TMaskEdit;
    Label3: TLabel;
    tipomov: TEditValid;
    Label4: TLabel;
    monto: TEditValid;
    E: TStringGrid;
    procedure conceptoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tipomovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure montoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EDblClick(Sender: TObject);
    procedure EKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    dc: TTDebitosCreditosIapos;
    id: string;
    procedure CargarDatos;
  public
    { Public declarations }
  end;

var
  fmAjustesDepositosRetiros: TfmAjustesDepositosRetiros;

implementation

{$R *.dfm}

procedure TfmAjustesDepositosRetiros.CargarDatos;
var
  i: integer;
  objeto: TTDebitosCreditosIapos;
  l: TObjectList;
begin
  grid.IniciarGrilla(E);
  l := dc.getObjects;
  for i := 1 to l.Count do begin
    objeto := TTDebitosCreditosIapos(l.Items[i-1]);
    E.Cells[0, i] := objeto.Fecha;
    E.Cells[1, i] := objeto.Concepto;
    if (objeto.Tipomov = '1') then
      E.Cells[2, i] := utiles.FormatearNumero(FloatToStr(objeto.Monto))
    else
      E.Cells[3, i] := utiles.FormatearNumero(FloatToStr(objeto.Monto));
    E.Cells[4, i] := objeto.Id;
    E.Row := i;
  end;
  l.Free; l := nil;
end;


procedure TfmAjustesDepositosRetiros.conceptoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (length(trim(concepto.Text)) > 0) then fecha.SetFocus;
end;

procedure TfmAjustesDepositosRetiros.EDblClick(Sender: TObject);
begin
  if (length(trim(E.Cells[0, E.Row])) > 0) then begin
    fecha.Text    := E.Cells[0, E.Row];
    concepto.Text := E.Cells[1, E.Row];
    if (length(trim(E.Cells[2, E.Row])) > 0) then begin
      monto.Text := E.Cells[2, E.Row];
      tipomov.Text := '1';
    end else begin
      monto.Text := E.Cells[3, E.Row];
      tipomov.Text := '2';
    end;
    id := E.Cells[4, E.Row];
  end else
    utiles.msgError('El Registro Seleccionado es Incorrecto ...!');
end;

procedure TfmAjustesDepositosRetiros.EKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then begin
    if (length(trim(E.Cells[0, E.Row])) > 0) then begin
      if (utiles.msgSiNo('Seguro para Borrar Items ?')) then begin
        id := E.Cells[4, E.Row];
        dc.Borrar(id);
        CargarDatos;
        concepto.setFocus;
      end;
    end else
      utiles.msgError('El Registro Seleccionado es Incorrecto ...!');
  end;

end;

procedure TfmAjustesDepositosRetiros.fechaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then concepto.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.ctrlFecha(fecha)) then tipomov.SetFocus;
end;

procedure TfmAjustesDepositosRetiros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dc.desconectar;
  dc.Destroy; dc := Nil;
end;

procedure TfmAjustesDepositosRetiros.FormShow(Sender: TObject);
begin
  E.Cells[0, 0] := 'Fecha'; E.Cells[1, 0] := 'Concepto'; E.Cells[2, 0] := 'Débito'; E.Cells[3, 0] := 'Crédito'; E.Cells[4, 0] := 'Nro.Trans.';
  dc := TTDebitosCreditosIapos.Create;
  dc.conectar(perLiq.Caption);
  CargarDatos;
  concepto.setFocus;
end;

procedure TfmAjustesDepositosRetiros.montoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then tipomov.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then begin
    monto.Text := utiles.FormatearNumero(monto.Text);
    if (strtofloat(monto.Text) <> 0)  then begin
      dc.Registrar(id, fecha.Text, concepto.Text, tipomov.Text, StrToFloat(monto.Text));
      id := ''; fecha.Text := ''; concepto.Text := ''; tipomov.Text := ''; monto.Text := '';
      CargarDatos;
      concepto.setFocus;
    end;
  end;
end;

procedure TfmAjustesDepositosRetiros.tipomovKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then fecha.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.Sionoct(tipomov.Text, '12', 'Las Opciones son: 1. Débito / 2. Crédito ...!')) then monto.SetFocus;
end;

end.
