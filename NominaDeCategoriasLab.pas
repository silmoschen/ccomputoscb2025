unit NominaDeCategoriasLab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmListCategoriasLab = class(TForm)
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
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
    ordenact: string; control: byte;
  public
    { Public declarations }
    introSalir, seleccionOK: boolean;
  end;

var
  fmListCategoriasLab: TfmListCategoriasLab;

implementation

uses CCategoriasCCB, CUtiles, tabladecategoriasLab, CConfigForms;

{$R *.DFM}

procedure TfmListCategoriasLab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmListCategoriasLab, redim);
  if not introSalir then Begin
    categoria.desconectar;
    Release; fmListCategoriasLab := nil;
  end;
end;

procedure TfmListCategoriasLab.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Descripción' then categoria.BuscarPorCategoria(expresion.Text);
  if criterio.Text = 'Código'      then categoria.BuscarPorId(expresion.Text);
end;

procedure TfmListCategoriasLab.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmListCategoriasLab.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmListCategoriasLab.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaCategoriasLab, fmTablaCategoriasLab);
  fmTablaCategoriasLab.AltaClick(nil);
  fmTablaCategoriasLab.ActiveControl := fmTablaCategoriasLab.categ;
  fmTablaCategoriasLab.NoCerrarFinal := True;
  fmTablaCategoriasLab.ShowModal;
end;

procedure TfmListCategoriasLab.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaCategoriasLab, fmTablaCategoriasLab);
  fmTablaCategoriasLab.NoCerrarFinal    := True;
  fmTablaCategoriasLab.idcategoria.Text := categoria.tabla.FieldByName('idcategoria').AsString;
  fmTablaCategoriasLab.ShowModal;
end;

procedure TfmListCategoriasLab.DBGridKeyDown(Sender: TObject; var Key: Word;
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
          if codigo.Checked then desde.Text := categoria.tabla.FieldByName('idcategoria').AsString else desde.Text := categoria.tabla.FieldByName('categoria').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := categoria.tabla.FieldByName('idcategoria').AsString else hasta.Text := categoria.tabla.FieldByName('categoria').AsString;
          ActiveControl := dispositivo;
        end;
     end;
   end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmListCategoriasLab.criterioChange(Sender: TObject);
begin
  expresion.Text := '';
  expresionChange(Sender);
end;

procedure TfmListCategoriasLab.SpeedButton4Click(Sender: TObject);
begin
  ordenact := criterio.Text;
  if Not Panel3.Visible then Begin
    Panel3.Visible  := True;
    codigo.Checked  := True; entorno.Checked := True;
    desde.Text := ''; hasta.Text := ''; expresion.Text := '';
    criterio.Text   := 'Código';
    expresionChange(Sender);
    ActiveControl   := desde;
  end else
    Panel3.Visible := False;
end;

procedure TfmListCategoriasLab.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListCategoriasLab.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListCategoriasLab.alfabeticoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListCategoriasLab.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Nombre';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListCategoriasLab.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmListCategoriasLab.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmListCategoriasLab.dispositivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmListCategoriasLab.emitirClick(Sender: TObject);
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
    categoria.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet   := categoria.tabla;
    StatusBar1.Panels[0].Text := '';
  end;
  ActiveControl := cerrar;
end;

procedure TfmListCategoriasLab.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmListCategoriasLab.FormShow(Sender: TObject);
begin
  if not introSalir then categoria.conectar;
  DTS.DataSet := categoria.tabla;
  if not configform.Setear(fmListCategoriasLab) then Begin
    Height := 382; Width := 571; Top := 25; Left:=(Screen.Width - Width) div 2;
  end;
  redim := False;
end;

procedure TfmListCategoriasLab.desdeClick(Sender: TObject);
begin
  control := 0;
end;

procedure TfmListCategoriasLab.hastaClick(Sender: TObject);
begin
  control := 1;
end;

procedure TfmListCategoriasLab.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfmTablaCategoriasLab, fmTablaCategoriasLab);
  fmTablaCategoriasLab.idcategoria.Text := categoria.tabla.FieldByName('idcategoria').AsString;
  fmTablaCategoriasLab.BajaClick(Sender);
  ActiveControl := DBGrid;
end;

procedure TfmListCategoriasLab.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

end.
