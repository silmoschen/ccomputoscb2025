unit tabladecategoriasLab;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaCategoriasLab = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    idcategoria: TMaskEdit;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    DBNavigator: TDBNavigator;
    categ: TMaskEdit;
    DTS: TDataSource;
    Label3: TLabel;
    porcUB: TEditValid;
    Label4: TLabel;
    porcUG: TEditValid;

    procedure idcategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure categKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure porcUGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure porcUBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaCategoriasLab: TfmTablaCategoriasLab;

implementation

uses CCategoriasCCB, CUtiles, ImgForms;

{$R *.DFM}

procedure TfmTablaCategoriasLab.CargarDatos;
begin
  categoria.getDatos(idcategoria.Text);
  categ.Text  := categoria.Categoria;
  porcUB.Text := utiles.FormatearNumero(FloatToStr(categoria.porcUB));
  porcUG.Text := utiles.FormatearNumero(FloatToStr(categoria.porcUG));
end;

procedure TfmTablaCategoriasLab.idcategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if categoria.Buscar(idcategoria.Text) then Begin
      CargarDatos;
      StatusBar1.Panels[0].Text := '';
      StatusBar1.Panels[1].Text := 'Modifica';
      ActiveControl := categ;
    end else
      if utiles.DarDeAlta('Código de Categoría ' + idcategoria.Text) then Begin
        CargarDatos;
        StatusBar1.Panels[0].Text := '';
        StatusBar1.Panels[1].Text := 'Nuevo';
        ActiveControl := categ;
      end;
    end;
end;

procedure TfmTablaCategoriasLab.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2;
end;

procedure TfmTablaCategoriasLab.categKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idcategoria;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(categ.Text)) > 0 then ActiveControl := porcUB;
end;

procedure TfmTablaCategoriasLab.AltaClick(Sender: TObject);
begin
  ActiveControl := idcategoria;
end;

procedure TfmTablaCategoriasLab.BajaClick(Sender: TObject);
begin
  if categoria.Buscar(idcategoria.Text) then
   //if pedido.verifSabor(idcategoria.Text) then utiles.msgError('El Sabor está afectado a Pedidos, Baja Rechazada ...!') else
   if utiles.BajaRegistro(' Seguro que desea Eliminar Categoría ' + idcategoria.Text + ' ?') then Begin
     categoria.Borrar(idcategoria.Text);
     idcategoria.Text := categoria.Idcategoria;
     CargarDatos;
   end;
  ActiveControl := idcategoria;
end;

procedure TfmTablaCategoriasLab.ModificarClick(Sender: TObject);
begin
  ActiveControl := idcategoria;
end;

procedure TfmTablaCategoriasLab.DeshacerClick(Sender: TObject);
begin
  ActiveControl := idcategoria;
end;

procedure TfmTablaCategoriasLab.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaCategoriasLab.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  idcategoria.Text := categoria.tabla.FieldByName('idcategoria').AsString;
  CargarDatos;
end;

procedure TfmTablaCategoriasLab.porcUGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := porcUB;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    porcUG.Text := utiles.FormatearNumero(porcUG.Text);
    if (Length(Trim(idcategoria.Text)) > 0) and (Length(Trim(categ.Text)) > 0) then Begin
     categoria.Grabar(idcategoria.Text, categ.Text, StrToFloat(porcUB.Text), StrToFloat(porcUG.Text));
     StatusBar1.Panels[1].Text := 'Guardado';
     ActiveControl := idcategoria;
     if NoCerrarFinal then Close;
   end else utiles.msgError('No se suministraron suficientes datos ...!');
  end;
end;

procedure TfmTablaCategoriasLab.porcUBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := categ;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    porcUB.Text := utiles.FormatearNumero(porcUB.Text);
    ActiveControl := porcUG;
  end;
end;

procedure TfmTablaCategoriasLab.FormShow(Sender: TObject);
begin
  DTS.DataSet := categoria.tabla;
  if Length(Trim(idcategoria.Text)) > 0 then Begin
    CargarDatos;
    categ.SetFocus;
  end else
    idcategoria.SetFocus;
end;

procedure TfmTablaCategoriasLab.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
