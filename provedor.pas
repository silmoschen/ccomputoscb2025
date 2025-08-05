unit provedor;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ComCtrls, Mask, ExtCtrls, ToolWin, Buttons;

type
  TfmMRProveedores = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    codprov: TMaskEdit;
    rsocial: TMaskEdit;
    nrocuit: TMaskEdit;
    domicilio: TMaskEdit;
    DTS: TDataSource;
    Label9: TLabel;
    email: TMaskEdit;
    Label10: TLabel;
    telefono: TMaskEdit;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    procedure codprovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rsocialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrocuitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure domicilioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BajaC(Sender: TObject);
    procedure AltaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure emailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure telefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
    redim: Boolean;
    procedure CargarDatos;
  public
    { public declarations }
  end;

var
  fmMRProveedores: TfmMRProveedores;

implementation

uses CProveedorCCB, ImgForms, CUtiles, CConfigForms;

{$R *.DFM}

procedure TfmMRProveedores.CargarDatos;
begin
  proveedor.getDatos(codprov.Text);
  rsocial.Text      := proveedor.Nombre;
  domicilio.Text    := proveedor.Domicilio;
  nrocuit.Text      := proveedor.Nrocuit;
  telefono.Text     := proveedor.telefono;
  email.Text        := proveedor.email;
end;

procedure TfmMRProveedores.BajaC(Sender: TObject);
begin
  if proveedor.Buscar(codprov.Text) then Begin
    CargarDatos;
    if utiles.BajaRegistro('Seguro para Eliminar Proveedor ' + rsocial.Text) then Begin
      proveedor.Borrar(codprov.Text);
    end;
  end;
  ActiveControl := codprov;
end;

//FIN PROCEDIMIENTOS PERSONALIZADOS
procedure TfmMRProveedores.codprovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    utiles.LlenarIzquierda(codprov, 4, '0');
    if proveedor.Buscar(codprov.Text) then Begin
      CargarDatos;      // Edito
      ActiveControl := rsocial;
      StatusBar1.Panels[0].Text := '';
    end else
      if utiles.DarDeAlta('Código de Proveedor ' + codprov.Text) then Begin
        CargarDatos;  // Inicio - si no existe
        ActiveControl := rsocial;
        StatusBar1.Panels[0].Text := '';
      end;
  end;
end;

procedure TfmMRProveedores.rsocialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then ActiveControl := codprov;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := nrocuit;
end;

procedure TfmMRProveedores.nrocuitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := rsocial;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := domicilio;
end;

procedure TfmMRProveedores.domicilioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nrocuit;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := email;
end;

procedure TfmMRProveedores.AltaClick(Sender: TObject);
begin
  codprov.Text  := proveedor.Nuevo;
  ActiveControl := codprov;
end;

procedure TfmMRProveedores.ModificarClick(Sender: TObject);
begin
  ActiveControl := codprov;
end;

procedure TfmMRProveedores.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMRProveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmMRProveedores, redim);
  DBNavigator.DataSource := nil;
end;

procedure TfmMRProveedores.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  codprov.Text := proveedor.tperso.FieldByName('codprov').AsString;
  CargarDatos;
end;

procedure TfmMRProveedores.FormShow(Sender: TObject);
begin
  configform.Setear(fmMRProveedores);
  DTS.DataSet := proveedor.tperso;
  if Length(Trim(codprov.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := rsocial;
  end;
end;

procedure TfmMRProveedores.emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := domicilio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := telefono;
end;

procedure TfmMRProveedores.telefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := email;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if (Length(Trim(codprov.Text)) = 4) and (Length(Trim(rsocial.Text)) > 0) then Begin
      proveedor.Grabar(codprov.Text, rsocial.Text, domicilio.Text, '0000', '000', telefono.Text, nrocuit.Text, '', email.Text);
      Close;
    end else
      utiles.msgError('Controle, los Datos están Incompletos ...!');
  end;
end;

end.
