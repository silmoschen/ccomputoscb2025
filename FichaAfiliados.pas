unit FichaAfiliados;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmFichaAfiliados = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    id: TMaskEdit;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    DBNavigator: TDBNavigator;
    nombre: TMaskEdit;
    DTS: TDataSource;
    Label3: TLabel;
    fecha: TMaskEdit;
    Label5: TLabel;
    nrodoc: TMaskEdit;

    procedure idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure fechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure nrodocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmFichaAfiliados: TfmFichaAfiliados;

implementation

uses CPadronOSCCB, CUtiles, ImgForms, CConfigForms;

{$R *.DFM}

procedure TfmFichaAfiliados.CargarDatos;
begin
  padron.getDatos(id.Text);
  if Length(Trim(nombre.Text)) = 0 then nombre.Text := padron.Nombre;
  nrodoc.Text    := padron.Nrodoc;
  fecha.Text     := padron.FechaNac;
end;

procedure TfmFichaAfiliados.idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if padron.Buscar(id.Text) then Begin
      CargarDatos;
      ActiveControl := nombre;
    end else
      if utiles.DarDeAlta('Seguro para Dar de Alta Id. Afiliado ' + id.Text) then Begin
        CargarDatos;
        ActiveControl := nombre;
      end;
    end;
end;

procedure TfmFichaAfiliados.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := id;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then ActiveControl := fecha;
end;

procedure TfmFichaAfiliados.AltaClick(Sender: TObject);
begin
  id.Text       := utiles.sLlenarIzquierda(padron.Nuevo, 15, '0');
  ActiveControl := nombre;
end;

procedure TfmFichaAfiliados.BajaClick(Sender: TObject);
begin
  if padron.Buscar(id.Text) then
   if utiles.BajaRegistro(' Seguro para Eliminar Afiliado ' + nombre.Text + ' ?') then Begin
     padron.Borrar(id.Text);
     id.Text := padron.Id;
     CargarDatos;
   end;
  ActiveControl := nombre;
end;

procedure TfmFichaAfiliados.ModificarClick(Sender: TObject);
begin
  ActiveControl := nombre;
end;

procedure TfmFichaAfiliados.DeshacerClick(Sender: TObject);
begin
  ActiveControl := nombre;
end;

procedure TfmFichaAfiliados.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFichaAfiliados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmFichaAfiliados);
  if (Length(Trim(id.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) then Begin
    padron.GuardarDatosPersonales(id.Text, nrodoc.Text, nombre.Text, fecha.Text);
    padron.BuscarPorNombre(nombre.Text);
  end;
  DBNavigator.DataSource := nil;
  Release; fmFichaAfiliados := nil;
end;

procedure TfmFichaAfiliados.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  id.Text := padron.tabla.FieldByName('id').AsString;
  CargarDatos;
end;

procedure TfmFichaAfiliados.fechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nombre;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(fecha.Text)) < 8 then nrodoc.SetFocus else
      if utiles.ctrlFecha(fecha) then ActiveControl := nrodoc;
end;

procedure TfmFichaAfiliados.FormShow(Sender: TObject);
begin
  configform.Setear(fmFichaAfiliados);
  DTS.DataSet := padron.tabla;
  if Length(Trim(id.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := nombre;
  end else ActiveControl := id;
end;

procedure TfmFichaAfiliados.nrodocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fecha.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Close;
end;

end.
