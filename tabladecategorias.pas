unit tabladecategorias;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaCreditos = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    items: TMaskEdit;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    DBNavigator: TDBNavigator;
    descrip: TMaskEdit;
    DTS: TDataSource;

    procedure itemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
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
  private
    { Private declarations }
    f: boolean;
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaCreditos: TfmTablaCreditos;

implementation

uses CCategoriasCreditosAsociacion, CUtiles, ImgForms;

{$R *.DFM}

procedure TfmTablaCreditos.CargarDatos;
begin
  categoria.getDatos(items.Text);
  descrip.Text  := categoria.Descrip;
end;

procedure TfmTablaCreditos.itemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if categoria.Buscar(items.Text) then Begin
      CargarDatos;
      ActiveControl := descrip;
    end else
      if utiles.DarDeAlta('Seguro para Dara de Alta Items ' + items.Text) then Begin
        CargarDatos;
        ActiveControl := descrip;
      end;
    end;
end;

procedure TfmTablaCreditos.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2;
end;

procedure TfmTablaCreditos.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := items;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (Length(Trim(descrip.Text)) > 0) and (Length(Trim(items.Text)) > 0) then Begin
      categoria.Grabar(items.Text, descrip.Text);
      Close;
    end;
end;

procedure TfmTablaCreditos.AltaClick(Sender: TObject);
begin
  items.Text := utiles.sLlenarIzquierda(categoria.Nuevo, 3, '0'); 
end;

procedure TfmTablaCreditos.BajaClick(Sender: TObject);
begin
  if categoria.Buscar(items.Text) then
   //if pedido.verifSabor(idcategoria.Text) then utiles.msgError('El Sabor está afectado a Pedidos, Baja Rechazada ...!') else
   if utiles.BajaRegistro(' Seguro que desea Eliminar Categoría ' + items.Text + ' ?') then Begin
     categoria.Borrar(items.Text);
     items.Text := categoria.Items;
     CargarDatos;
   end;
  ActiveControl := items;
end;

procedure TfmTablaCreditos.ModificarClick(Sender: TObject);
begin
  ActiveControl := items;
end;

procedure TfmTablaCreditos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaCreditos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if f then Begin
    categoria.desconectar;
    DBNavigator.DataSource := nil;
    if not NoCerrarFinal then Begin
      Release; fmTablaCreditos := nil;
    end;
  end;
end;

procedure TfmTablaCreditos.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  items.Text := categoria.tabla.FieldByName('items').AsString;
  CargarDatos;
end;

procedure TfmTablaCreditos.FormShow(Sender: TObject);
begin
  DTS.DataSet := categoria.tabla;
  CargarDatos;
  ActiveControl := descrip;
end;

end.
