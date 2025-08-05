unit NominaRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmListRetenciones = class(TForm)
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
    Splitter1: TSplitter;
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
    SpeedButton4: TSpeedButton;
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
    procedure SpeedButton4Click(Sender: TObject);
    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codigoClick(Sender: TObject);
    procedure alfabeticoKeyDown(Sender: TObject; var Key: Word;
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
    procedure FormShow(Sender: TObject);
    procedure desdeClick(Sender: TObject);
    procedure hastaClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    ordenact: string; control: byte;
  public
    { Public declarations }
    introSalir, seleccionOK: boolean;
  end;

var
  fmListRetenciones: TfmListRetenciones;

implementation

uses CRetencionesCentroBioq, CUtiles, TablaRetenciones;

{$R *.DFM}

procedure TfmListRetenciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not introSalir then Begin
    retenciones.desconectar;
    Release; fmListRetenciones := nil;
  end;
end;

procedure TfmListRetenciones.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Descripción' then retenciones.BuscarPorDescrip(expresion.Text);
  if criterio.Text = 'Código'      then retenciones.BuscarPorItems(expresion.Text);
end;

procedure TfmListRetenciones.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmListRetenciones.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmListRetenciones.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaRetenciones, fmTablaRetenciones);
  fmTablaRetenciones.AltaClick(nil);
  fmTablaRetenciones.ActiveControl := fmTablaRetenciones.descrip;
  fmTablaRetenciones.ShowModal;
end;

procedure TfmListRetenciones.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaRetenciones, fmTablaRetenciones);
  fmTablaRetenciones.items.Text    := retenciones.tabla.FieldByName('items').AsString;
  fmTablaRetenciones.ShowModal;
end;

procedure TfmListRetenciones.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then SpeedButton1Click(Sender);
  if Key = VK_RETURN then Begin
   if introSalir then Begin
     seleccionOk := True;
     Close;
   end else
     if Not Panel3.Visible then SpeedButton2Click(Sender) else Begin
        if control = 0 then Begin    // El control es del id
          if codigo.Checked then desde.Text := retenciones.tabla.FieldByName('items').AsString else desde.Text := retenciones.tabla.FieldByName('descrip').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := retenciones.tabla.FieldByName('items').AsString else hasta.Text := retenciones.tabla.FieldByName('descrip').AsString;
          ActiveControl := dispositivo;
        end;
     end;
   end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmListRetenciones.criterioChange(Sender: TObject);
begin
  expresion.Text := '';
  expresionChange(Sender);
end;

procedure TfmListRetenciones.SpeedButton4Click(Sender: TObject);
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

procedure TfmListRetenciones.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListRetenciones.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListRetenciones.alfabeticoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListRetenciones.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Nombre';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListRetenciones.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmListRetenciones.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmListRetenciones.dispositivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmListRetenciones.emitirClick(Sender: TObject);
var
  salida, ordensalida, entornosal: char;
begin
  if (Length(Trim(desde.Text)) = 0) or (Length(Trim(hasta.Text)) = 0) then utiles.msgError('No se han definido suficientes parámetros ...!') else Begin
    StatusBar1.Panels[0].Text := 'Generando informe ...'; StatusBar1.Refresh;
    //DTS.DataSet := nil;
    salida := 'P'; ordensalida := 'C'; entornosal := 'E';
    if dispositivo.Text = 'Impresora' then salida := 'I';
    if alfabetico.Checked then ordensalida := 'A';
    if exclusion.Checked then entornosal := 'X';
    retenciones.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet := retenciones.tabla;
    StatusBar1.Panels[0].Text := '';
  end;
  ActiveControl := cerrar;
end;

procedure TfmListRetenciones.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmListRetenciones.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    Height := 380; Width := 571; Top := 25; Left:=(Screen.Width - Width) div 2;
  end;
  DTS.DataSet := retenciones.tabla;
  if not introSalir then retenciones.conectar;
end;

procedure TfmListRetenciones.desdeClick(Sender: TObject);
begin
  control := 0;
end;

procedure TfmListRetenciones.hastaClick(Sender: TObject);
begin
  control := 1;
end;

procedure TfmListRetenciones.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaRetenciones, fmTablaRetenciones);
  fmTablaRetenciones.items.Text   := retenciones.tabla.FieldByName('items').AsString;
  fmTablaRetenciones.descrip.Text := retenciones.tabla.FieldByName('descrip').AsString;
  fmTablaRetenciones.BajaClick(Sender);
  ActiveControl := DBGrid;
end;

end.
