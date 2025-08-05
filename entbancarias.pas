unit entbancarias;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Grids, DBGrids;

type
  TfmBancos = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    codigo: TMaskEdit;
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

    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    introSalir: boolean;
  end;

var
  fmBancos: TfmBancos;

implementation

uses CUtiles, ImgForms, CBancosCentroBioq;

{$R *.DFM}

procedure TfmBancos.CargarDatos;
begin
  entbcos.getDatos(codigo.Text);
  descrip.Text  := entbcos.Descrip; // Edito
end;

procedure TfmBancos.BuscarClick(Sender: TObject);
begin
  {utiles.Hojear(entbcos.tabla, '', entbcos.tabla.IndexDefs.Items[1].Name, entbcos.tabla.IndexFieldNames, nil, 'XX00');
  codigo.Text := entbcos.tabla.FieldByName('codbanco').Value;
  CargarDatos;
  ActiveControl := codigo;}
end;

procedure TfmBancos.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Shift = [ssCtrl]) and (Key = Word('B')) then BajaClick(Sender);
  if Key = VK_F1 then BuscarClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then                               {Edita y Da de Alta Registro ...}
    begin
      if Length(trim(codigo.Text)) = 0 then BuscarClick(Sender);
      utiles.LlenarIzquierda(codigo, 3, '0');
      if entbcos.Buscar(codigo.Text) then
        begin
          CargarDatos;
          StatusBar1.Panels[0].Text := '';
          ActiveControl := descrip;
        end
      else
        if utiles.DarDeAlta('Cód. Banco ' + codigo.Text) then
          begin
            CargarDatos;
            StatusBar1.Panels[0].Text := '';
            ActiveControl := descrip;
          end;
    end;
end;

procedure TfmBancos.FormCreate(Sender: TObject);
begin
  Left := StrToInt(FormatFloat('####', (Screen.DesktopWidth / 2) - (Width / 2)));
  if not introSalir then entbcos.conectar;
  DTS.DataSet := entbcos.tabla;
end;

procedure TfmBancos.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codigo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    entbcos.Grabar(codigo.Text, descrip.Text);
    if introSalir then Close else ActiveControl := codigo;
  end;
end;

procedure TfmBancos.AltaClick(Sender: TObject);
begin
  codigo.Text := utiles.sLlenarIzquierda(entbcos.Nuevo, 3, '0');
  ActiveControl := codigo;
end;

procedure TfmBancos.BajaClick(Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro que desea Eliminar Código de Banco ' + codigo.Text + ' ?') then Begin
    entbcos.Borrar(codigo.Text);
    codigo.Text := entbcos.Codbanco;
    CargarDatos;
  end;
  ActiveControl := codigo;
end;

procedure TfmBancos.ModificarClick(Sender: TObject);
begin
  if entbcos.Buscar(codigo.Text) then entbcos.Grabar(codigo.Text, descrip.Text);
  ActiveControl := codigo;
end;

procedure TfmBancos.DeshacerClick(Sender: TObject);
begin
  ActiveControl := codigo;
end;

procedure TfmBancos.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBancos.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  codigo.Text := entbcos.tabla.FieldByName('codbanco').AsString;
  CargarDatos;
end;

procedure TfmBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DTS.DataSet := nil;
  if not introSalir then Begin
    entbcos.desconectar;
    Release; fmBancos := nil;
  end;
end;

procedure TfmBancos.FormActivate(Sender: TObject);
begin
  if Length(Trim(codigo.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := descrip;
  end;
end;

end.
