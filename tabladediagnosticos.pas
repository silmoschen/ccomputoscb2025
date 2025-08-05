unit tabladediagnosticos;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaDiagnosticos = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    items: TMaskEdit;
    StatusBar1: TStatusBar;
    descrip: TMaskEdit;
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
    Label3: TLabel;
    codigo: TMaskEdit;
    BuscarDiagnostico: TBitBtn;
    ndiagnostico: TLabel;

    procedure itemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
    procedure BuscarDiagnosticoClick(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
    procedure CargarDatosOMS;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaDiagnosticos: TfmTablaDiagnosticos;

implementation

uses CDiagnosticosCCB, CDiagnosticosCCBOMS, CUtiles, ImgForms, CConfigForms,
  NominaDeDiagnosticosOMS;

{$R *.DFM}

procedure TfmTablaDiagnosticos.CargarDatos;
begin
  diagnostico.getDatos(items.Text);
  if Length(Trim(descrip.Text)) = 0 then descrip.Text := diagnostico.Descrip;
  codigo.Text := diagnostico.Codigo;
end;

procedure TfmTablaDiagnosticos.CargarDatosOMS;
// Objetivo...: Cargar Código OMS
Begin
  diagnosticooms.getDatos(codigo.Text);
  ndiagnostico.Caption := diagnosticooms.Descrip;
  descrip.SetFocus;
end;

procedure TfmTablaDiagnosticos.itemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if diagnostico.Buscar(items.Text) then Begin
      CargarDatos;
      ActiveControl := codigo;
    end else
      if utiles.DarDeAlta('Seguro para Código de Diagnóstico ' + items.Text) then Begin
        CargarDatos;
        ActiveControl := codigo;
      end;
    end;
end;

procedure TfmTablaDiagnosticos.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := items;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (Length(Trim(descrip.Text)) > 0) and (Length(Trim(items.Text)) > 0) then Begin
      diagnostico.Grabar(items.Text, descrip.Text, codigo.Text);
      Close;
    end;
end;

procedure TfmTablaDiagnosticos.AltaClick(Sender: TObject);
begin
  items.Text := utiles.sLlenarIzquierda(diagnostico.Nuevo, 4, '0');
end;

procedure TfmTablaDiagnosticos.BajaClick(Sender: TObject);
begin
  if diagnostico.Buscar(items.Text) then
   if utiles.BajaRegistro(' Seguro que desea Eliminar Zona ' + descrip.Text + ' ?') then Begin
     diagnostico.Borrar(items.Text);
     items.Text := diagnostico.items;
     CargarDatos;
   end;
  ActiveControl := items;
end;

procedure TfmTablaDiagnosticos.ModificarClick(Sender: TObject);
begin
  ActiveControl := items;
end;

procedure TfmTablaDiagnosticos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaDiagnosticos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmTablaDiagnosticos, redim);
  DBNavigator.DataSource := nil;
  diagnostico.BuscarPorDescrip(descrip.Text);
  Release; fmTablaDiagnosticos := nil;
end;

procedure TfmTablaDiagnosticos.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  items.Text := diagnostico.tabla.FieldByName('items').AsString;
  CargarDatos;
end;

procedure TfmTablaDiagnosticos.FormShow(Sender: TObject);
begin
  configform.Setear(fmTablaDiagnosticos);
  DTS.DataSet := diagnostico.tabla;
  CargarDatos;
  ActiveControl := codigo;
  redim := False;
end;

procedure TfmTablaDiagnosticos.codigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then items.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if diagnosticooms.VerificarCodigoImputable(codigo.Text) then CargarDatosOMS else BuscarDiagnosticoClick(Self);
  end;
end;

procedure TfmTablaDiagnosticos.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmTablaDiagnosticos.BuscarDiagnosticoClick(Sender: TObject);
begin
   Application.CreateForm(TfmListDiagnosticosOMS, fmListDiagnosticosOMS);
   diagnosticooms.FiltrarCodigosImputables;
   fmListDiagnosticosOMS.IntroSalir := True;
   fmListDiagnosticosOMS.ShowModal;
   diagnosticooms.QuitarFiltro;
   if fmListDiagnosticosOMS.seleccionOK then Begin
     codigo.Text := diagnosticooms.tabla.FieldByName('oms_cod').AsString;
     CargarDatosOMS;
   end else
     codigo.SetFocus;
   fmListDiagnosticosOMS.Release; fmListDiagnosticosOMS := Nil;
end;

end.
