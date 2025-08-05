unit NominaDeBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmListBancos = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid: TDBGrid;
    DTS: TDataSource;
    criterio: TComboBox;
    Label1: TLabel;
    expresion: TMaskEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
    SpeedButton4: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure expresionChange(Sender: TObject);
    procedure criterioClick(Sender: TObject);
    procedure expresionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure criterioChange(Sender: TObject);
    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codigoClick(Sender: TObject);
    procedure alfabeticoClick(Sender: TObject);
    procedure alfabeticoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure desdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dispositivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emitirClick(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ordenact: string; control: byte;
  public
    { Public declarations }
    introSalir, seleccionOK, NoCerrarFinal: boolean; xcodnom: string;
  end;

var
  fmListBancos: TfmListBancos;

implementation

uses CBancosCentroBioq, CUtiles, entbancarias;

{$R *.DFM}

procedure TfmListBancos.FormActivate(Sender: TObject);
begin
  if not introSalir then entbcos.conectar;
  DTS.DataSet := entbcos.tabla;
  expresionChange(Sender);
  if Length(Trim(xcodnom)) > 0 then entbcos.BuscarPorNombre(xcodnom);
end;

procedure TfmListBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not introSalir then Begin
    entbcos.desconectar;
    Release; fmListBancos := nil;
  end;
end;

procedure TfmListBancos.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Descripción' then entbcos.BuscarPorNombre(expresion.Text);
  if criterio.Text = 'Código'      then entbcos.BuscarPorCodigo(expresion.Text);
end;

procedure TfmListBancos.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmListBancos.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Begin
    seleccionOK := False;
    Close;
  end;
  if Key = VK_INSERT then SpeedButton1Click(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmListBancos.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmBancos, fmBancos);
  fmBancos.introSalir  := True;
  fmBancos.codigo.Text := utiles.sLlenarIzquierda(entbcos.Nuevo, 3, '0');
  fmBancos.ShowModal;
  expresion.Text       := fmBancos.descrip.Text;
  expresionChange(Sender);
  fmBancos.Release; fmBancos := nil;
  ActiveControl := DBGrid;
end;

procedure TfmListBancos.SpeedButton3Click(Sender: TObject);
begin
  if entbcos.Buscar(entbcos.tabla.FieldByName('codbanco').AsString) then Begin
    Application.CreateForm(TfmBancos, fmBancos);
    fmBancos.codigo.Text := entbcos.tabla.FieldByName('codbanco').AsString;
    fmBancos.BajaClick(Sender);
    expresion.Text       := fmBancos.descrip.Text;
    expresionChange(Sender);
    fmBancos.Release; fmBancos := nil;
  end;
  ActiveControl := DBGrid;
end;

procedure TfmListBancos.SpeedButton2Click(Sender: TObject);
begin
  if entbcos.Buscar(entbcos.tabla.FieldByName('codbanco').AsString) then Begin
    Application.CreateForm(TfmBancos, fmBancos);
    fmBancos.introSalir  := True;
    fmBancos.codigo.Text := entbcos.tabla.FieldByName('codbanco').AsString;
    fmBancos.ShowModal;
    expresion.Text       := fmBancos.descrip.Text;
    expresionChange(Sender);
    fmBancos.Release; fmBancos := nil;
  end;
end;

procedure TfmListBancos.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
end;

procedure TfmListBancos.DBGridKeyDown(Sender: TObject; var Key: Word;
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
          if codigo.Checked then desde.Text := entbcos.tabla.FieldByName('codbanco').AsString else desde.Text := entbcos.tabla.FieldByName('descrip').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := entbcos.tabla.FieldByName('codbanco').AsString else hasta.Text := entbcos.tabla.FieldByName('descrip').AsString;
          ActiveControl := dispositivo;
        end;
     end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmListBancos.criterioChange(Sender: TObject);
begin
  expresionChange(Sender);
end;

procedure TfmListBancos.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListBancos.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListBancos.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Descripción';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListBancos.alfabeticoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListBancos.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmListBancos.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmListBancos.dispositivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmListBancos.emitirClick(Sender: TObject);
var
  salida, ordensalida, entornosal: char;
begin
  if (Length(Trim(desde.Text)) = 0) or (Length(Trim(hasta.Text)) = 0) then utiles.msgError('No se han definido suficientes parámetros ...!') else Begin
    DTS.DataSet := nil;
    salida := 'P'; ordensalida := 'C'; entornosal := 'E';
    if dispositivo.Text = 'Impresora' then salida := 'I';
    if alfabetico.Checked then ordensalida := 'A';
    if exclusion.Checked then entornosal := 'X';
    entbcos.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet   := entbcos.tabla;
  end;
  ActiveControl := cerrar;
end;

procedure TfmListBancos.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmListBancos.SpeedButton4Click(Sender: TObject);
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

procedure TfmListBancos.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    Height := 380; Width := 571; Top := 25; Left:=(Screen.Width - Width) div 2;
  end;
end;

end.
