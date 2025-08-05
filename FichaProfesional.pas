unit FichaProfesional;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ComCtrls, Mask, ExtCtrls, ToolWin, Buttons,
  Editv, Grids, DBTables;

type
  TfmFichaProfesional = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    DBNavigator: TDBNavigator;
    DTS: TDataSource;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    oper: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    idprof: TMaskEdit;
    nombre: TMaskEdit;
    telefono: TMaskEdit;
    domicilio: TMaskEdit;
    idcategoria: TMaskEdit;
    nrocuit: TMaskEdit;
    catlab: TLabel;
    BuscarCat: TBitBtn;
    Label7: TLabel;
    email: TMaskEdit;
    Label8: TLabel;
    matricula: TMaskEdit;
    Label9: TLabel;
    fechamat: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    retganancias: TMaskEdit;
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure telefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure domicilioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BajaC(Sender: TObject);
    procedure AltaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure osocialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idcategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrocuitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarCatClick(Sender: TObject);
    procedure matriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechamatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure retgananciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
    procedure CargarDatos;
    procedure Guardar;
    procedure CargarDatosCategoria;
  public
    { public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmFichaProfesional: TfmFichaProfesional;

implementation

uses CProfesionalCCB, CSolAnalisis, CUtiles, CCategoriasCCB,
  NominaDeCategoriasLab;

{$R *.DFM}

procedure TfmFichaProfesional.CargarDatos;
begin
  profesional.getDatos(idprof.Text);
  nombre.Text       := profesional.Nombre;
  domicilio.Text    := profesional.Domicilio;
  telefono.Text     := profesional.telefono;
  email.Text        := profesional.email;
  nrocuit.Text      := profesional.nrocuit;
  idcategoria.Text  := profesional.idcategoria;
  matricula.Text    := profesional.matricula;
  fechamat.Text     := profesional.fechamat;
  CargarDatosCategoria;
end;

procedure TfmFichaProfesional.CargarDatosCategoria;
begin
  categoria.getDatos(idcategoria.Text);
  catlab.Caption := categoria.Categoria;
end;

procedure TfmFichaProfesional.BajaC(Sender: TObject);
begin
   if utiles.BajaRegistro('Seguro que desea Eliminar Código de profesional ' + idprof.Text) then Begin
     profesional.Borrar(idprof.Text);
     idprof.Text := profesional.Codigo;
     CargarDatos;
   end;
  ActiveControl := idprof;
end;

//FIN PROCEDIMIENTOS PERSONALIZADOS
procedure TfmFichaProfesional.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      if Length(Trim(idprof.Text)) > 0 then utiles.LlenarIzquierda(idprof, 6, '0');
      if profesional.Buscar(idprof.Text) then
        begin
          CargarDatos;      // Edito
          ActiveControl := nombre;
        end
      else
       if Length(Trim(idprof.Text)) > 0 then
        if utiles.DarDeAlta('Código de profesional ' + idprof.Text) then
          begin
            CargarDatos;  // Inicio - si no existe
            ActiveControl := nombre;
          end;
    end;
end;

procedure TfmFichaProfesional.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then ActiveControl := idprof;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then ActiveControl := domicilio;
end;

procedure TfmFichaProfesional.telefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := domicilio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := nrocuit;
end;

procedure TfmFichaProfesional.domicilioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nombre;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := telefono;
end;

procedure TfmFichaProfesional.AltaClick(Sender: TObject);
begin
  idprof.Text := utiles.sLlenarIzquierda(profesional.Nuevo, 5, '0');
  ActiveControl := idprof;
end;

procedure TfmFichaProfesional.ModificarClick(Sender: TObject);
begin
  ActiveControl := idprof;
end;

procedure TfmFichaProfesional.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFichaProfesional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  if not NoCerrarFinal then Begin
    profesional.desconectar;
    Release; fmFichaprofesional := nil;
  end;
end;

procedure TfmFichaProfesional.DBNavigatorClick(
  Sender: TObject; Button: TNavigateBtn);
begin
  idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
  CargarDatos;
end;

procedure TfmFichaProfesional.osocialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := domicilio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := telefono;
end;

procedure TfmFichaProfesional.idcategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := retganancias;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if not categoria.Buscar(idcategoria.Text) then BuscarCatClick(Sender) else
     if (Length(Trim(idprof.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) and (categoria.Buscar(idcategoria.Text)) then Begin
       CargarDatosCategoria;
       Guardar;
       if NoCerrarFinal then Close else ActiveControl := idprof;
     end else utiles.msgError('No se han Suministrado todos los Datos Obligatorios !!!');
end;

procedure TfmFichaProfesional.Guardar;
begin
  if (Length(Trim(idprof.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) then Begin
    profesional.Grabar(idprof.Text, nombre.Text, domicilio.Text, '', '', telefono.Text, nrocuit.Text, email.Text, idcategoria.Text, matricula.Text, fechamat.Text, '', '');
    if NoCerrarFinal then Close else ActiveControl := idprof;
  end else utiles.msgError('No se suministraron suficientes datos ...!');
end;

procedure TfmFichaProfesional.nrocuitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := telefono;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := email;
end;

procedure TfmFichaProfesional.emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nrocuit;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := matricula;
end;

procedure TfmFichaProfesional.BuscarCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmListCategoriasLab, fmListCategoriasLab);
  fmListCategoriasLab.introSalir := True;
  fmListCategoriasLab.ShowModal;
  if fmListCategoriasLab.SeleccionOK then idcategoria.Text := categoria.tabla.FieldByName('idcategoria').AsString;
  fmListCategoriasLab.Release; fmListCategoriasLab := nil;
  CargarDatosCategoria;
  ActiveControl := idcategoria;
end;

procedure TfmFichaProfesional.matriculaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := email;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := fechamat;
end;

procedure TfmFichaProfesional.fechamatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := fechamat;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := retganancias;
end;

procedure TfmFichaProfesional.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
  if not NoCerrarFinal then profesional.desconectar;
  DTS.DataSet := profesional.tperso;
  ActiveControl := idprof;
  if Length(Trim(idprof.Text)) > 0 then Begin
    if profesional.Buscar(idprof.Text) then CargarDatos;
    ActiveControl := nombre;
  end;
end;

procedure TfmFichaProfesional.retgananciasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := fechamat;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(retganancias.Text, 'SN', 'Las Opciones Válidas son S ó N ...!') then ActiveControl := idcategoria;
end;

end.
