unit tablademedicoss;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaMedicos = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    idprof: TMaskEdit;
    StatusBar1: TStatusBar;
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
    chkInactivo: TCheckBox;

    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure chkInactivoClick(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
    procedure guardar;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaMedicos: TfmTablaMedicos;

implementation

uses CMedicosCCB, CUtiles, ImgForms, CConfigForms;

{$R *.DFM}

procedure TfmTablaMedicos.CargarDatos;
begin
  medico.getDatos(idprof.Text);
  if Length(Trim(nombre.Text)) = 0 then nombre.Text := medico.Nombre;
  chkInactivo.Checked := medico.Inactivo;
end;

procedure TfmTablaMedicos.chkInactivoClick(Sender: TObject);
begin
  guardar;
end;

procedure TfmTablaMedicos.guardar;
begin
  if (Length(Trim(idprof.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) then Begin
      medico.Grabar(idprof.Text, nombre.Text, chkInactivo.Checked);
      Close;
    end else
      utiles.msgError('Controle, hay Datos Incompletos ...!');
end;

procedure TfmTablaMedicos.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if medico.Buscar(idprof.Text) then Begin
      CargarDatos;
      ActiveControl := nombre;
    end else
      if utiles.DarDeAlta('Seguro para Dara de Alta Nombre ' + nombre.Text) then Begin
        CargarDatos;
        ActiveControl := nombre;
      end;
    end;
end;

procedure TfmTablaMedicos.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idprof;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then guardar;
end;

procedure TfmTablaMedicos.AltaClick(Sender: TObject);
begin
  idprof.Text := utiles.sLlenarIzquierda(medico.Nuevo, 4, '0');
end;

procedure TfmTablaMedicos.BajaClick(Sender: TObject);
begin
  if medico.Buscar(idprof.Text) then
   if utiles.BajaRegistro(' Seguro que desea Eliminar Médico ' + nombre.Text + ' ?') then Begin
     medico.Borrar(idprof.Text);
     idprof.Text := medico.Idprof;
     CargarDatos;
   end;
  ActiveControl := idprof;
end;

procedure TfmTablaMedicos.ModificarClick(Sender: TObject);
begin
  ActiveControl := idprof;
end;

procedure TfmTablaMedicos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaMedicos.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  redim := True;
end;

procedure TfmTablaMedicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  medico.BuscarPorNombre(nombre.Text);
  //configform.Guardar(fmTablaMedicos, redim);
  Release; fmTablaMedicos := nil;
end;

procedure TfmTablaMedicos.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  idprof.Text := medico.tabla.FieldByName('idprof').AsString;
  CargarDatos;
end;

procedure TfmTablaMedicos.FormShow(Sender: TObject);
begin
  //configform.Setear(fmTablaMedicos);
  DTS.DataSet := medico.tabla;
  CargarDatos;
  ActiveControl := nombre;
  redim := False;
end;

end.
