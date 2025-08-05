unit NominaProveedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmListProveedores = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid: TDBGrid;
    DTS: TDataSource;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    desde: TMaskEdit;
    hasta: TMaskEdit;
    dispositivo: TComboBox;
    Panel4: TPanel;
    emitir: TBitBtn;
    cerrar: TBitBtn;
    Panel5: TPanel;
    codigo: TRadioButton;
    alfabetico: TRadioButton;
    Panel6: TPanel;
    entorno: TRadioButton;
    exclusion: TRadioButton;
    Splitter1: TSplitter;
    Panel7: TPanel;
    Label1: TLabel;
    criterio: TComboBox;
    Label2: TLabel;
    expresion: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure expresionChange(Sender: TObject);
    procedure criterioClick(Sender: TObject);
    procedure expresionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure criterioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure codigoClick(Sender: TObject);
    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure alfabeticoClick(Sender: TObject);
    procedure desdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dispositivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emitirClick(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure alfabeticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
    ordenact: string; control: byte;
    noBuscar, redim: boolean;
  public
    { Public declarations }
    introSalir, seleccionOK: boolean;
  end;

var
  fmListProveedores: TfmListProveedores;

implementation

uses CProveedorCCB, provedor, CUtiles, CConfigForms;

{$R *.DFM}

procedure TfmListProveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not introSalir then proveedor.desconectar;
  configform.Guardar(fmListProveedores, redim);
  if not introSalir then Begin
    Release; fmListProveedores := nil;
  end;
end;

procedure TfmListProveedores.expresionChange(Sender: TObject);
begin
  if noBuscar then Begin
    if criterio.Text = 'Nombre' then proveedor.BuscarPorNombre(expresion.Text);
    if criterio.Text = 'Código' then proveedor.BuscarPorCodigo(expresion.Text);
  end;
end;

procedure TfmListProveedores.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmListProveedores.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then SpeedButton1Click(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmListProveedores.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmMRProveedores, fmMRProveedores);
  fmMRProveedores.AltaClick(nil);
  fmMRProveedores.ShowModal;
  if criterio.Text = 'Código' then  expresion.Text := fmMRProveedores.codprov.Text;
  if criterio.Text = 'Nombre' then  expresion.Text := fmMRProveedores.rsocial.Text;
  fmMRProveedores.Release; fmMRProveedores := nil;
  expresionChange(Sender);
  // Restablece el text expresión
  noBuscar := False;
  expresion.Text := '';
  noBuscar := True;
end;

procedure TfmListProveedores.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfmMRProveedores, fmMRProveedores);
  fmMRProveedores.codprov.Text := proveedor.tperso.FieldByName('codprov').AsString;
  fmMRProveedores.ShowModal;
  if criterio.Text = 'Código' then  expresion.Text := fmMRProveedores.codprov.Text;
  if criterio.Text = 'Nombre' then  expresion.Text := fmMRProveedores.rsocial.Text;
  fmMRProveedores.Release; fmMRProveedores := nil;
  expresionChange(Sender);
  // Restablece el text expresión
  noBuscar := False;
  expresion.Text := '';
  noBuscar := True;
end;

procedure TfmListProveedores.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then SpeedButton1Click(Sender);
  if Key = VK_DELETE then SpeedButton3Click(Sender);
  if Key = VK_RETURN then
   if introSalir then Begin
     seleccionOk := True;
     Close;
   end else
     if Not Panel3.Visible then SpeedButton2Click(Sender) else Begin
        if control = 0 then Begin    // El control es del id
          if codigo.Checked then desde.Text := proveedor.tperso.FieldByName('codprov').AsString else desde.Text := proveedor.tperso.FieldByName('rsocial').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := proveedor.tperso.FieldByName('codprov').AsString else hasta.Text := proveedor.tperso.FieldByName('rsocial').AsString;
          ActiveControl := dispositivo;
        end;
     end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmListProveedores.criterioChange(Sender: TObject);
begin
  expresion.Text := '';
  expresionChange(Sender);
end;

procedure TfmListProveedores.FormShow(Sender: TObject);
begin
  if not introSalir then proveedor.conectar;
  configform.Setear(fmListProveedores);
  DTS.DataSet := proveedor.tperso;
  noBuscar := True;
  expresionChange(Sender);
  redim := False;
end;

procedure TfmListProveedores.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListProveedores.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListProveedores.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Descripción';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListProveedores.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmListProveedores.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmListProveedores.dispositivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmListProveedores.emitirClick(Sender: TObject);
var
  salida, ordensalida, entornosal: char;
begin
  if (Length(Trim(desde.Text)) = 0) or (Length(Trim(hasta.Text)) = 0) then utiles.msgError('No se han definido suficientes parámetros ...!') else Begin
    DTS.DataSet := nil;
    salida := 'P'; ordensalida := 'C'; entornosal := 'E';
    if dispositivo.Text = 'Impresora' then salida := 'I';
    if alfabetico.Checked then ordensalida := 'A';
    if exclusion.Checked then entornosal := 'X';
    proveedor.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet := proveedor.tperso;
  end;
  ActiveControl := cerrar;
end;

procedure TfmListProveedores.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmListProveedores.alfabeticoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListProveedores.SpeedButton4Click(Sender: TObject);
begin
  ordenact := criterio.Text;
  if Not Panel3.Visible then Begin
    Panel3.Visible  := True;
    codigo.Checked  := True; entorno.Checked := True;
    desde.Text := ''; hasta.Text := ''; expresion.Text := '';
    criterio.Text   := 'Código';
    expresionChange(Sender);
    ActiveControl   := desde;
  end;
end;

procedure TfmListProveedores.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfmMRProveedores, fmMRProveedores);
  fmMRProveedores.codprov.Text := proveedor.tperso.FieldByName('codprov').AsString;
  fmMRProveedores.BajaC(Sender);
  fmMRProveedores.Release; fmMRProveedores := nil;
end;

procedure TfmListProveedores.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

end.
