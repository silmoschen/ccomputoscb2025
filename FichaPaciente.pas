unit FichaPaciente;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ComCtrls, Mask, ExtCtrls, ToolWin, Buttons,
  Editv, Grids, DBTables;

type
  TfmFichaPacientes = class(TForm)
    StatusBar1: TStatusBar;
    DTS: TDataSource;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    codpac: TMaskEdit;
    nombre: TMaskEdit;
    Label7: TLabel;
    idprof: TLabel;
    prof: TLabel;
    Label3: TLabel;
    nrodoc: TMaskEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    gravadoiva: TMaskEdit;
    procedure codpacKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BajaC(Sender: TObject);
    procedure AltaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure nrodocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
    procedure gravadoivaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
    redim: Boolean;
    procedure CargarDatos;
    procedure Guardar;
  public
    { public declarations }
    NoCerrarFinal: boolean;
    ivaret: Real;
  end;

var
  fmFichaPacientes: TfmFichaPacientes;

implementation

uses CPacienteCCB, CProfesionalCCB, CSolAnalisis, CUtiles, CConfigForms;

{$R *.DFM}

procedure TfmFichaPacientes.CargarDatos;
begin
  paciente.getDatos(idprof.Caption, codpac.Text);
  nombre.Text      := paciente.Nombre;
  idprof.Caption   := paciente.idprof;
  nrodoc.Text      := paciente.Nrodoc;
  profesional.getDatos(idprof.Caption);
  prof.Caption     := profesional.nombre;
  gravadoiva.Text  := paciente.Gravadoiva;
end;

procedure TfmFichaPacientes.BajaC(Sender: TObject);
begin
  if paciente.Buscar(idprof.Caption, codpac.Text) then
   if utiles.BajaRegistro('Seguro que desea Eliminar Código de Paciente ' + codpac.Text) then
    begin
      paciente.Borrar;
      codpac.Text := paciente.Codpac;
      CargarDatos;
    end;
  ActiveControl := codpac;
end;

//FIN PROCEDIMIENTOS PERSONALIZADOS
procedure TfmFichaPacientes.codpacKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      codpac.Text := utiles.sLlenarIzquierda(codpac.Text, 4, '0');
      if paciente.Buscar(idprof.Caption, codpac.Text) then
        begin
          CargarDatos;      // Edito
          ActiveControl := nrodoc;
          StatusBar1.Panels[0].Text := '';
        end
      else
        if utiles.DarDeAlta('Seguro para Dar de Alta Código de Paciente ' + codpac.Text) then
          begin
            CargarDatos;  // Inicio - si no existe
            ActiveControl := nrodoc;
            StatusBar1.Panels[0].Text := '';
          end;
    end;
end;

procedure TfmFichaPacientes.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then ActiveControl := nrodoc;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then Guardar else utiles.msgError('El Nombre del Paciente es Incorrecto o Nulo ...!');
end;

procedure TfmFichaPacientes.AltaClick(Sender: TObject);
begin
  codpac.Text := utiles.sLlenarIzquierda(paciente.Nuevo(idprof.Caption), 4, '0');
  ActiveControl := nombre;
end;

procedure TfmFichaPacientes.ModificarClick(Sender: TObject);
begin
  ActiveControl := codpac;
end;

procedure TfmFichaPacientes.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFichaPacientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmFichaPacientes, redim);
  paciente.BuscarPorNombre(nombre.Text);
  DBNavigator.DataSource := nil;
  if not NoCerrarFinal then Begin
    paciente.desconectar;
    Release; fmFichaPacientes := nil;
  end;
end;

procedure TfmFichaPacientes.DBNavigatorClick(
  Sender: TObject; Button: TNavigateBtn);
begin
  codpac.Text := paciente.tpaciente.FieldByName('codpac').AsString;
  CargarDatos;
end;

procedure TfmFichaPacientes.Guardar;
begin
  if (Length(Trim(codpac.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) then Begin
    paciente.Grabar(idprof.Caption, codpac.Text, nombre.Text, nrodoc.Text, gravadoiva.Text);
    if NoCerrarFinal then Close else ActiveControl := codpac;
  end else utiles.msgError('No se suministraron suficientes datos ...!');
end;

procedure TfmFichaPacientes.FormShow(Sender: TObject);
var
  f: boolean;
begin
  configform.Setear(fmFichaPacientes);
  if not NoCerrarFinal then paciente.conectar;
  DTS.DataSet := paciente.tpaciente;
  if Length(Trim(codpac.Text)) > 0 then Begin
    f := paciente.Buscar(idprof.Caption, codpac.Text);
    if (f) then CargarDatos;
    profesional.getDatos(idprof.Caption);
    prof.Caption  := profesional.nombre;
    if ivaret > 0 then ActiveControl := gravadoiva else ActiveControl := nombre;
    if not (f) then begin
      if profesional.Retieneiva <> 'S' then Begin
        gravadoiva.Text := 'N';
        nombre.SetFocus;
      end else
        gravadoiva.SetFocus;
    end;
  end;
  redim := False;
end;

procedure TfmFichaPacientes.nrodocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codpac.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then gravadoiva.SetFocus;
end;

procedure TfmFichaPacientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfmFichaPacientes.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmFichaPacientes.gravadoivaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nrodoc.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(gravadoiva.Text, 'SN', 'Las Opciones son S/N ?') then nombre.SetFocus;
end;

end.
