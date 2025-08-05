unit Afiliados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Editv, Mask, ExtCtrls, ComCtrls, DBCtrls, DBTables,
  ToolWin, Buttons, DB;

type
  TfmAfiliados = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label18: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    codos: TLabel;
    os: TLabel;
    nrodoc: TMaskEdit;
    nombre: TMaskEdit;
    DTS: TDataSource;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    Label2: TLabel;
    observacion: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    fechanac: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure nrodocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirClick(Sender: TObject);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BajaClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormResize(Sender: TObject);
    procedure observacionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechanacKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
  public
    { Public declarations }
  end;

var
  fmAfiliados: TfmAfiliados;

implementation

{$R *.dfm}

uses CPadronOSCCB, CUtilidadesStringGrid, CUtiles, CConfigForms;

procedure TfmAfiliados.CargarDatos;
begin
  padron.getDatos(codos.Caption, nrodoc.Text);
  if padron.Nombre = '*** INEXISTENTE ***' then nombre.Text := '' else nombre.Text      := padron.Nombre;
  observacion.Text := padron.Observacion;
  fechanac.Text    := padron.Fechanac;
end;

procedure TfmAfiliados.FormShow(Sender: TObject);
begin
  configform.Setear(fmAfiliados);
  if Length(Trim(nrodoc.Text)) > 0 then nombre.SetFocus else nrodoc.SetFocus;
  DTS.DataSet := padron.tabla;
  //if padron.Interbase <> 'S' then DTS.DataSet := padron.tabla;
  //if padron.Interbase = 'S' then DTS.DataSet := padron.tablaIB;
  if Length(Trim(nrodoc.Text)) > 0 then Begin
    CargarDatos;
  end;
  redim := False;
end;

procedure TfmAfiliados.nrodocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    CargarDatos;
    fechanac.SetFocus;
  end;
end;

procedure TfmAfiliados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmAfiliados, redim);
  padron.BuscarPorNombre(nombre.Text); 
  fmAfiliados.Release; fmAfiliados := nil;
end;

procedure TfmAfiliados.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAfiliados.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then fechanac.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then observacion.SetFocus;
end;

procedure TfmAfiliados.BajaClick(Sender: TObject);
begin
  if padron.Buscar(codos.Caption, nrodoc.Text) then
    if utiles.BajaRegistro('Seguro para Eliminar Afiliado Nro. Documento ' + nrodoc.Text) then padron.Borrar(codos.Caption, nrodoc.Text);
end;

procedure TfmAfiliados.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  //if padron.Interbase <> 'S' then nrodoc.Text := padron.tabla.FieldByName('nrodoc').AsString;
  //if padron.Interbase = 'S' then nrodoc.Text := padron.tablaIB.FieldByName('NRODOC').AsString;
  nrodoc.Text := padron.tabla.FieldByName('nrodoc').AsString;
  CargarDatos;
  nombre.setfocus;
end;

procedure TfmAfiliados.FormResize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmAfiliados.observacionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then nombre.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (Length(Trim(nombre.Text)) > 0) and (Length(Trim(nrodoc.Text)) > 0) then Begin
      StatusBar1.Panels[0].Text := 'Registrando ...!'; StatusBar1.Refresh;
      padron.Guardar(codos.Caption, nrodoc.Text, nombre.Text, observacion.Text, fechanac.Text);
      Close;
    end else
      utiles.msgError('Controle, hay Datos Incompletos ...!');
end;

procedure TfmAfiliados.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmAfiliados.fechanacKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then nrodoc.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(fechanac.Text)) = 8 then Begin
      if utiles.ctrlFecha(fechanac) then nombre.SetFocus;
    end else
      nombre.SetFocus;
end;

end.
