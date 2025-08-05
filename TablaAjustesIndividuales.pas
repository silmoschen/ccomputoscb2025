unit TablaAjustesIndividuales;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaAjustesIndiv = class(TForm)
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
    Label3: TLabel;
    importe: TEditValid;

    procedure itemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure importeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaAjustesIndiv: TfmTablaAjustesIndiv;

implementation

uses CAjustesIndivCentroBioq, CUtiles, ImgForms;

{$R *.DFM}

procedure TfmTablaAjustesIndiv.CargarDatos;
begin
  ajustesindiv.getDatos(items.Text);
  descrip.Text := ajustesindiv.Descrip;
  importe.Text := utiles.FormatearNumero(FloatToStr(ajustesindiv.Importe));
end;

procedure TfmTablaAjustesIndiv.itemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if ajustesindiv.Buscar(items.Text) then Begin
      CargarDatos;
      StatusBar1.Panels[0].Text := '';
      StatusBar1.Panels[1].Text := 'Modifica';
      ActiveControl := descrip;
    end else
      if utiles.DarDeAlta('Items ' + items.Text) then Begin
        CargarDatos;
        StatusBar1.Panels[0].Text := '';
        StatusBar1.Panels[1].Text := 'Nuevo';
        ActiveControl := descrip;
      end;
    end;
end;

procedure TfmTablaAjustesIndiv.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2;
end;

procedure TfmTablaAjustesIndiv.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := items;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(descrip.Text)) > 0 then ActiveControl := importe;
end;

procedure TfmTablaAjustesIndiv.AltaClick(Sender: TObject);
begin
  items.Text    := utiles.sLlenarIzquierda(ajustesindiv.Nuevo, 2, '0');
  ActiveControl := descrip;
end;

procedure TfmTablaAjustesIndiv.BajaClick(Sender: TObject);
begin
  if ajustesindiv.Buscar(items.Text) then
   //if pedido.verifSabor(idcategoria.Text) then utiles.msgError('El Sabor está afectado a Pedidos, Baja Rechazada ...!') else
   if utiles.BajaRegistro(' Seguro para Eliminar Items ' + descrip.Text + ' ?') then Begin
     ajustesindiv.Borrar(items.Text);
     items.Text := ajustesindiv.Items;
     CargarDatos;
   end;
  ActiveControl := descrip;
end;

procedure TfmTablaAjustesIndiv.ModificarClick(Sender: TObject);
begin
  ActiveControl := items;
end;

procedure TfmTablaAjustesIndiv.DeshacerClick(Sender: TObject);
begin
  ActiveControl := items;
end;

procedure TfmTablaAjustesIndiv.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaAjustesIndiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  if not NoCerrarFinal then Begin
    Release; fmTablaAjustesIndiv := nil;
  end;
end;

procedure TfmTablaAjustesIndiv.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  items.Text := ajustesindiv.tabla.FieldByName('items').AsString;
  CargarDatos;
end;

procedure TfmTablaAjustesIndiv.importeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := descrip;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    importe.Text := utiles.FormatearNumero(importe.Text);
    if (Length(Trim(items.Text)) > 0) and (Length(Trim(descrip.Text)) > 0) and (StrToFloat(importe.Text) >= 0) then Begin
      ajustesindiv.Grabar(items.Text, descrip.Text, StrToFloat(importe.Text));
      StatusBar1.Panels[1].Text := 'Guardado';
      ActiveControl := items;
      if NoCerrarFinal then Close;
   end else utiles.msgError('No se Suministraron Suficientes Datos ...!');
  end;
end;

procedure TfmTablaAjustesIndiv.FormShow(Sender: TObject);
begin
  DTS.DataSet := ajustesindiv.tabla;
  if Length(Trim(items.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := descrip;
  end else ActiveControl := items;
end;

end.
