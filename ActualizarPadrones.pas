unit ActualizarPadrones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Grids;

type
  TfmActPOS = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    nos: TLabel;
    codos: TMaskEdit;
    BuscarObraSocial: TBitBtn;
    Panel3: TPanel;
    A: TStringGrid;
    Panel4: TPanel;
    btnBuscarArchivo: TButton;
    Panel5: TPanel;
    StatusBar1: TStatusBar;
    OpenDialog: TOpenDialog;
    btnCerrar: TButton;
    btnActualizar: TButton;
    CheckBox1: TCheckBox;
    procedure BuscarObraSocialClick(Sender: TObject);
    procedure codosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscarArchivoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure AKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatosObraSocial;
    procedure CargarPadron(arch: String);
  public
    { Public declarations }
  end;

var
  fmActPOS: TfmActPOS;

implementation

uses CPadronOSCCB, CObrasSocialesCCB, CUtiles, CUtilidadesStringGrid, NominaObrasSociales,
     CConfigForms;

{$R *.dfm}

procedure TfmActPOS.CargarDatosObraSocial;
// Objetivo...: Cargar Datos Obra Social
Begin
  obsocial.getDatos(codos.Text);
  nos.Caption := obsocial.Nombre;
  Panel4.Visible := True;
  btnBuscarArchivo.SetFocus;
end;

procedure TfmActPOS.CargarPadron(arch: String);
// Objetivo...: Cargar Padron de Archivos
var
  archivo: TextFile;
  l1, nstr, doc: String; p, j, l: Integer;
Begin
  grid.IniciarGrilla(A);
  StatusBar1.Panels[0].Text := 'Cargando Padrón ...'; StatusBar1.Refresh;
  Refresh;
  AssignFile(archivo, arch);
  reset(archivo); p := 0;
  while not Eof(archivo) do Begin
    ReadLn(archivo, l1);
    for j := 0 to 9 do begin
      l := Pos(Trim(IntToStr(j)), l1);
      if l > 0 then
        if Length(Trim(Copy(l1, l-1, 1))) = 0 then Break;
    end;

    if (Length(Trim(Copy(TrimLeft(l1), 1, l-1))) > 0) and (Length(Trim(Copy(l1, l, 10))) >= 6) then Begin
      Inc(p);
      nstr := l1;
      doc  := Copy(l1, l, 10);
      doc := utiles.QuitarCaracteresIzquierda(TrimLeft(doc), 'm');
      doc := utiles.QuitarCaracteresIzquierda(TrimLeft(doc), 'f');
      doc := utiles.QuitarCaracteresIzquierda(doc, '0');
      A.Cells[0, p] := Copy(nstr, 1, l-1);
      A.Cells[1, p] := doc;
      A.Cells[2, p] := utiles.RepararFecha(Trim(Copy(l1, l+11, 20)));
    end;
  end;
  closeFile(archivo);
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  StatusBar1.Panels[0].Text := IntToStr(p) + ' Afiliados Recuperados.';
  if p > 0 then btnActualizar.Enabled := True else btnActualizar.Enabled := False;
  if btnActualizar.Enabled then btnActualizar.SetFocus;
end;

procedure TfmActPOS.BuscarObraSocialClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codos.Text := obsocial.tabla.FieldByName('codos').AsString;
    CargarDatosObraSocial;
  end else
    codos.SetFocus;
  fmListObrasSociales.Release; fmListObrasSociales := nil;
end;

procedure TfmActPOS.codosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not obsocial.Buscar(codos.Text) then BuscarObraSocialClick(Sender) else CargarDatosObraSocial;
end;

procedure TfmActPOS.FormShow(Sender: TObject);
begin
  configform.Setear(fmActPOS);
  grid.RecuperarAnchoColumnas(fmActPOS, A);
  obsocial.conectar;
  A.Cells[0, 0] := 'Nombre del Afiliado'; A.Cells[1, 0] := 'Nro. de Documento'; A.Cells[2, 0] := 'F.Nacim.';
  redim := False;
end;

procedure TfmActPOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  grid.GuardarAnchoColumnas(fmActPOS, A);
  configform.Guardar(fmActPOS, redim);
  obsocial.desconectar;
  Release; fmActPOS := nil;
end;

procedure TfmActPOS.btnBuscarArchivoClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    if Length(Trim(OpenDialog.FileName)) > 0 then CargarPadron(OpenDialog.FileName);
end;

procedure TfmActPOS.btnActualizarClick(Sender: TObject);
var
  i: Integer;
begin
  if utiles.msgSiNo('Seguro para Actualizar Padrón Obra Social' + chr(13) + codos.Text + ' - ' + nos.Caption) then Begin
    if padron.conectar(codos.Text) then Begin
      //if CheckBox1.Checked then padron.BorrarAfiliados(codos.Text);
      Refresh;
      for i := 1 to A.RowCount do Begin
        if Length(Trim(A.Cells[0, i])) = 0 then Break;
        padron.Guardar(codos.Text, Trim(A.Cells[1, i]), A.Cells[0, i], '', A.Cells[2, i], CheckBox1.Checked);
        StatusBar1.Panels[0].Text := IntToStr(i) + '  Registros Procesados.'; StatusBar1.Refresh;
      end;
    end;
    btnCerrarClick(Sender);
  end;
end;

procedure TfmActPOS.btnCerrarClick(Sender: TObject);
begin
  Panel4.Visible := False;
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  codos.Text := ''; nos.Caption := '';
  btnActualizar.Enabled := False;
  codos.SetFocus;
  grid.IniciarGrilla(A);
end;

procedure TfmActPOS.AKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if utiles.msgSiNo('Seguro para Eliminar Afiliado ' + A.Cells[0, A.Row]) then Begin
      A.Cells[0, A.Row] := 'XX';
      grid.BorrarRenglon_SinRenumerar(A);
    end;
  if Key = VK_INSERT then grid.InsertarLineasSinRenumerar(A); 
end;

procedure TfmActPOS.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

end.
