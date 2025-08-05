unit GestionNBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, CNBU, CNomeclaCCB,
  CUtilidadesStringGrid, DBTables, CUtiles;

type
  TfmConversionNBU = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    des1: TLabel;
    codigo1: TMaskEdit;
    Buscar1: TBitBtn;
    Panel7: TPanel;
    S: TStringGrid;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    des2: TLabel;
    codigo2: TMaskEdit;
    Buscar2: TBitBtn;
    Panel4: TPanel;
    T: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure codigo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Buscar1Click(Sender: TObject);
    procedure SKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet1Show(Sender: TObject);
    procedure codigo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Buscar2Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    items: Integer; modificado: Boolean;
    procedure AnexarItems1;
    procedure RegistrarItems1;
    procedure CargarItems1;

    procedure AnexarItems2;
    procedure RegistrarItems2;
    procedure CargarItems2;
  public
    { Public declarations }
  end;

var
  fmConversionNBU: TfmConversionNBU;

implementation

uses NominaNomeclador, Nomina_NBU;

{$R *.dfm}

procedure TfmConversionNBU.AnexarItems1;
var
  i: Integer;
Begin
  nomeclatura.getDatos(codigo1.Text);
  des1.Caption := nomeclatura.descrip;

  if not modificado then Begin
    Inc(items);
    i := items;
  end else
    i := S.Row;

  S.Cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 3, '0');
  S.Cells[1, i] := codigo1.Text;
  S.Cells[2, i] := des1.Caption;
  S.Row         := i;

  RegistrarItems1;

  codigo1.Text := ''; modificado := False;
  codigo1.setFocus;
end;

procedure TfmConversionNBU.RegistrarItems1;
var
  i: Integer;
Begin
  For i := 1 to items do
    nbu.RegistrarCodigo(S.Cells[0, i], 'E', S.Cells[1, i], items);
  if items = 0 then nbu.BorrarCodigo('E');
end;

procedure TfmConversionNBU.CargarItems1;
var
  r: TQuery;
  i: Integer;
Begin
  grid.IniciarGrilla(S);
  r := nbu.setCodigos('E');
  r.Open; i := 0; items := 0;
  while not r.Eof do Begin
    Inc(i);
    nomeclatura.getDatos(r.FieldByName('codigo').AsString);
    S.Cells[0, i] := r.FieldByName('items').AsString;
    S.Cells[1, i] := r.FieldByName('codigo').AsString;
    S.Cells[2, i] := nomeclatura.descrip;
    items         := i;
    S.Row         := i;
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmConversionNBU.AnexarItems2;
var
  i: Integer;
Begin
  nbu.getDatos(codigo2.Text);
  des2.Caption := nbu.descrip;

  if not modificado then Begin
    Inc(items);
    i := items;
  end else
    i := T.Row;

  T.Cells[0, i] := utiles.sLlenarIzquierda(IntToStr(i), 3, '0');
  T.Cells[1, i] := codigo2.Text;
  T.Cells[2, i] := des2.Caption;
  T.Row         := i;

  RegistrarItems2;

  codigo2.Text := ''; modificado := False;
  codigo2.setFocus;
end;

procedure TfmConversionNBU.RegistrarItems2;
var
  i: Integer;
Begin
  For i := 1 to items do
    nbu.RegistrarCodigo(T.Cells[0, i], 'I', T.Cells[1, i], items);
  if items = 0 then nbu.BorrarCodigo('I');
end;

procedure TfmConversionNBU.CargarItems2;
var
  r: TQuery;
  i: Integer;
Begin
  grid.IniciarGrilla(T);
  r := nbu.setCodigos('I');
  r.Open; i := 0; items := 0;
  while not r.Eof do Begin
    Inc(i);
    nbu.getDatos(r.FieldByName('codigo').AsString);
    T.Cells[0, i] := r.FieldByName('items').AsString;
    T.Cells[1, i] := r.FieldByName('codigo').AsString;
    T.Cells[2, i] := nbu.descrip;
    items         := i;
    T.Row         := i;
    r.Next;
  end;
  r.Close; r.Free;
end;

procedure TfmConversionNBU.FormShow(Sender: TObject);
begin
  nbu.conectar;
  S.Cells[0, 0] := 'It.'; S.Cells[1, 0] := 'Código'; S.Cells[2, 0] := 'Descripción';
  T.Cells[0, 0] := 'It.'; T.Cells[1, 0] := 'Código'; T.Cells[2, 0] := 'Descripción';
  CargarItems1;
  codigo1.SetFocus;
end;

procedure TfmConversionNBU.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  nbu.desconectar;
  Release; fmConversionNBU := Nil;
end;

procedure TfmConversionNBU.codigo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if nomeclatura.Buscar(codigo1.Text) then AnexarItems1 else Buscar1Click(Self);
  end;
end;

procedure TfmConversionNBU.Buscar1Click(Sender: TObject);
begin
  Application.CreateForm(TfmListNomeclador, fmListNomeclador);
  fmListNomeclador.introSalir := True;
  fmListNomeclador.ShowModal;
  if fmListNomeclador.seleccionOK then Begin
    codigo1.Text := nomeclatura.tabla.FieldByName('codigo').AsString;
    AnexarItems1;
  end;
  fmListNomeclador.Release; fmListNomeclador := nil;
end;

procedure TfmConversionNBU.SKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if Length(Trim(S.Cells[0, S.Row])) > 0 then Begin
      if utiles.msgSiNo('Seguro para Borrar Items ?') then Begin
        grid.BorrarRenglon(S);
        grid.RegenerarItems(S, 3);
        Dec(items);
        if items > 0 then RegistrarItems1 else nbu.BorrarCodigo('E');
      end;
    end;
end;

procedure TfmConversionNBU.TabSheet1Show(Sender: TObject);
begin
  CargarItems1;
end;

procedure TfmConversionNBU.codigo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if nbu.Buscar(codigo2.Text) then AnexarItems2 else Buscar2Click(Self);
  end;
end;

procedure TfmConversionNBU.Buscar2Click(Sender: TObject);
begin
  Application.CreateForm(TfmListNBU, fmListNBU);
  fmListNBU.introSalir := True;
  fmListNBU.ShowModal;
  if fmListNBU.seleccionOK then Begin
    codigo2.Text := nbu.tabla.FieldByName('codigo').AsString;
    AnexarItems2;
  end;
  fmListNBU.Release; fmListNBU := nil;
end;

procedure TfmConversionNBU.TabSheet2Show(Sender: TObject);
begin
  CargarItems2;
  codigo2.setFocus;
end;

procedure TfmConversionNBU.TKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if Length(Trim(T.Cells[0, T.Row])) > 0 then Begin
      if utiles.msgSiNo('Seguro para Borrar Items ?') then Begin
        grid.BorrarRenglon(T);
        grid.RegenerarItems(T, 3);
        Dec(items);
        if items > 0 then RegistrarItems2 else nbu.BorrarCodigo('I');
      end;
    end;
end;

end.
