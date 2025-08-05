unit NominaAjustesIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmAjustesIndividuales = class(TForm)
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
    procedure FormCreate(Sender: TObject);
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
  fmAjustesIndividuales: TfmAjustesIndividuales;

implementation

uses CAjustesIndivCentroBioq, CUtiles, TablaRetenciones,
  TablaAjustesIndividuales;

{$R *.DFM}

procedure TfmAjustesIndividuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not introSalir then Begin
    ajustesindiv.desconectar;
    Release; fmTablaajustesindiv := nil;
  end;
end;

procedure TfmAjustesIndividuales.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Descripción' then ajustesindiv.BuscarPorDescrip(expresion.Text);
  if criterio.Text = 'Código'      then ajustesindiv.BuscarPorItems(expresion.Text);
end;

procedure TfmAjustesIndividuales.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmAjustesIndividuales.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmAjustesIndividuales.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaajustesindiv, fmTablaAjustesIndiv);
  fmTablaAjustesIndiv.AltaClick(nil);
  fmTablaAjustesIndiv.ActiveControl := fmTablaAjustesIndiv.descrip;
  fmTablaAjustesIndiv.NoCerrarFinal := True;
  fmTablaAjustesIndiv.ShowModal;
end;

procedure TfmAjustesIndividuales.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaAjustesIndiv, fmTablaAjustesIndiv);
  fmTablaAjustesIndiv.NoCerrarFinal := True;
  fmTablaAjustesIndiv.items.Text    := ajustesindiv.tabla.FieldByName('items').AsString;
  fmTablaAjustesIndiv.ShowModal;
end;

procedure TfmAjustesIndividuales.FormCreate(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
end;

procedure TfmAjustesIndividuales.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then SpeedButton1Click(Sender);
//  if Key = VK_DELETE then SpeedButton3Click(Sender);
  if Key = VK_RETURN then Begin
   if introSalir then Begin
     seleccionOk := True;
     Close;
   end else
     if Not Panel3.Visible then SpeedButton2Click(Sender) else Begin
        if control = 0 then Begin    // El control es del id
          if codigo.Checked then desde.Text := ajustesindiv.tabla.FieldByName('items').AsString else desde.Text := ajustesindiv.tabla.FieldByName('descrip').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := ajustesindiv.tabla.FieldByName('items').AsString else hasta.Text := ajustesindiv.tabla.FieldByName('descrip').AsString;
          ActiveControl := dispositivo;
        end;
     end;
   end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmAjustesIndividuales.criterioChange(Sender: TObject);
begin
  expresion.Text := '';
  expresionChange(Sender);
end;

procedure TfmAjustesIndividuales.SpeedButton4Click(Sender: TObject);
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

procedure TfmAjustesIndividuales.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmAjustesIndividuales.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmAjustesIndividuales.alfabeticoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmAjustesIndividuales.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Nombre';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmAjustesIndividuales.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmAjustesIndividuales.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmAjustesIndividuales.dispositivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmAjustesIndividuales.emitirClick(Sender: TObject);
var
  salida, ordensalida, entornosal: char;
begin
  if (Length(Trim(desde.Text)) = 0) or (Length(Trim(hasta.Text)) = 0) then utiles.msgError('No se han definido suficientes parámetros ...!') else Begin
    StatusBar1.Panels[0].Text := 'Generando informe ...'; StatusBar1.Refresh;
    DTS.DataSet := nil;
    salida := 'P'; ordensalida := 'C'; entornosal := 'E';
    if dispositivo.Text = 'Impresora' then salida := 'I';
    if alfabetico.Checked then ordensalida := 'A';
    if exclusion.Checked then entornosal := 'X';
    ajustesindiv.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet := ajustesindiv.tabla;
    StatusBar1.Panels[0].Text := '';
  end;
  ActiveControl := cerrar;
end;

procedure TfmAjustesIndividuales.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmAjustesIndividuales.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    Height := 380; Width := 571; Top := 25; Left:=(Screen.Width - Width) div 2;
  end;
  DTS.DataSet := ajustesindiv.tabla;
  if not introSalir then ajustesindiv.conectar;
end;

procedure TfmAjustesIndividuales.desdeClick(Sender: TObject);
begin
  control := 0;
end;

procedure TfmAjustesIndividuales.hastaClick(Sender: TObject);
begin
  control := 1;
end;

procedure TfmAjustesIndividuales.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaAjustesIndiv, fmTablaAjustesIndiv);
  fmTablaAjustesIndiv.items.Text   := ajustesindiv.tabla.FieldByName('items').AsString;
  fmTablaAjustesIndiv.descrip.Text := ajustesindiv.tabla.FieldByName('descrip').AsString;
  fmTablaAjustesIndiv.BajaClick(Sender);
  expresionChange(Self);
  ActiveControl := DBGrid;
end;

end.
