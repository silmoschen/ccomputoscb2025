unit tabladezonas;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaZonas = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    idzona: TMaskEdit;
    StatusBar1: TStatusBar;
    zona: TMaskEdit;
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

    procedure idzonaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure zonaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaZonas: TfmTablaZonas;

implementation

uses CZonasCCB, CUtiles, ImgForms, CConfigForms;

{$R *.DFM}

procedure TfmTablaZonas.CargarDatos;
begin
  zonas.getDatos(idzona.Text);
  if Length(Trim(zona.Text)) = 0 then zona.Text := zonas.Zona;
end;

procedure TfmTablaZonas.idzonaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if zonas.Buscar(idzona.Text) then Begin
      CargarDatos;
      ActiveControl := zona;
    end else
      if utiles.DarDeAlta('Seguro para Dara de Alta Zona ' + idzona.Text) then Begin
        CargarDatos;
        ActiveControl := zona;
      end;
    end;
end;

procedure TfmTablaZonas.zonaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idzona;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (Length(Trim(zona.Text)) > 0) and (Length(Trim(idzona.Text)) > 0) then Begin
      zonas.Grabar(idzona.Text, zona.Text);
      Close;
    end;
end;

procedure TfmTablaZonas.AltaClick(Sender: TObject);
begin
  idzona.Text := utiles.sLlenarIzquierda(zonas.Nuevo, 2, '0');
end;

procedure TfmTablaZonas.BajaClick(Sender: TObject);
begin
  if zonas.Buscar(idzona.Text) then
   if utiles.BajaRegistro(' Seguro que desea Eliminar Zona ' + zona.Text + ' ?') then Begin
     zonas.Borrar(idzona.Text);
     idzona.Text := zonas.Idzona;
     CargarDatos;
   end;
  ActiveControl := idzona;
end;

procedure TfmTablaZonas.ModificarClick(Sender: TObject);
begin
  ActiveControl := idzona;
end;

procedure TfmTablaZonas.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaZonas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmTablaZonas, redim);
  DBNavigator.DataSource := nil;
  zonas.BuscarPorZona(zona.Text); 
  Release; fmTablaZonas := nil;
end;

procedure TfmTablaZonas.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  idzona.Text := zonas.tabla.FieldByName('idzona').AsString;
  CargarDatos;
end;

procedure TfmTablaZonas.FormShow(Sender: TObject);
begin
  configform.Setear(fmTablaZonas);
  DTS.DataSet := zonas.tabla;
  CargarDatos;
  ActiveControl := zona;
  redim := False;
end;

procedure TfmTablaZonas.FormResize(Sender: TObject);
begin
  redim := True;
end;

end.
