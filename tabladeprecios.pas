unit tabladeprecios;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmInsumos = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    id: TMaskEdit;
    StatusBar1: TStatusBar;
    descrip: TMaskEdit;
    DTS: TDataSource;
    Label3: TLabel;
    precio_vta: TEditValid;
    Label4: TLabel;
    Label5: TLabel;
    precio_com: TEditValid;
    Label6: TLabel;
    Label8: TLabel;
    stock: TEditValid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    stockmin: TEditValid;

    procedure idKeyDown(Sender: TObject; var Key: Word;
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
    procedure precio_vtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure precio_comKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stockKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stockminKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmInsumos: TfmInsumos;

implementation

uses CInsumos_Centrobioq, CUtiles, ImgForms;

{$R *.DFM}

procedure TfmInsumos.CargarDatos;
begin
  insumo.getDatos(id.Text);
  descrip.Text  := insumo.Descrip;
  precio_vta.Text := utiles.FormatearNumero(FloatToStr(insumo.Precio_Vta));
  precio_com.Text := utiles.FormatearNumero(FloatToStr(insumo.Precio_Com));
  stockmin.Text   := utiles.FormatearNumero(FloatToStr(insumo.Stockmin));
  stock.Text      := utiles.FormatearNumero(FloatToStr(insumo.Stock));
end;

procedure TfmInsumos.idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if insumo.Buscar(id.Text) then Begin
      CargarDatos;
      ActiveControl := descrip;
    end else
      if utiles.DarDeAlta('Seguro para Dara de Alta Id. Insumo ' + id.Text) then Begin
        CargarDatos;
        ActiveControl := descrip;
      end;
    end;
end;

procedure TfmInsumos.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2;
end;

procedure TfmInsumos.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := id;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(descrip.Text)) > 0 then precio_vta.SetFocus;
end;

procedure TfmInsumos.AltaClick(Sender: TObject);
begin
  id.Text := utiles.sLlenarIzquierda(insumo.Nuevo, 5, '0');
end;

procedure TfmInsumos.BajaClick(Sender: TObject);
begin
  if insumo.Buscar(id.Text) then
    if utiles.BajaRegistro(' Seguro que desea Eliminar Id. ' + id.Text + ' ?') then Begin
     insumo.Borrar(id.Text);
     id.Text := insumo.tabla.FieldByName('id').AsString;
     CargarDatos;
   end;
  ActiveControl := id;
end;

procedure TfmInsumos.ModificarClick(Sender: TObject);
begin
  ActiveControl := id;
end;

procedure TfmInsumos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInsumos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  Release; fmInsumos := nil;
end;

procedure TfmInsumos.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  id.Text := insumo.tabla.FieldByName('id').AsString;
  CargarDatos;
end;

procedure TfmInsumos.FormShow(Sender: TObject);
begin
  DTS.DataSet := insumo.tabla;
  CargarDatos;
  ActiveControl := descrip;
end;

procedure TfmInsumos.precio_vtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := descrip;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(precio_vta.Text)) > 0 then Begin
      precio_vta.Text := utiles.FormatearNumero(precio_vta.Text);
      precio_com.SetFocus;
    end;
end;

procedure TfmInsumos.precio_comKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := precio_vta;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(precio_com.Text)) > 0 then Begin
      precio_com.Text := utiles.FormatearNumero(precio_com.Text);
      stockmin.SetFocus;
    end;  
end;

procedure TfmInsumos.stockKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := stockmin;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(stock.Text)) > 0 then Begin
      stock.Text := utiles.FormatearNumero(stock.Text);
      if (Length(Trim(id.Text)) > 0) and (Length(Trim(descrip.Text)) > 0) and (Length(Trim(precio_vta.Text)) > 0) and (Length(Trim(precio_com.Text)) > 0) and (Length(Trim(stock.Text)) > 0) then Begin
        insumo.Registrar(id.Text, descrip.Text, StrToFloat(precio_vta.Text), StrToFloat(precio_com.Text), StrToFloat(stockmin.Text), StrToFloat(stock.Text));
        Close;
      end else
        utiles.msgError('Hay Datos Incompletos o Incorrectos ...!'); 
    end;

end;

procedure TfmInsumos.stockminKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := precio_com;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(stockmin.Text)) > 0 then Begin
      stockmin.Text := utiles.FormatearNumero(stockmin.Text);
      stock.setFocus;
    end;
end;

end.
