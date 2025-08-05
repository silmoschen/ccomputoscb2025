unit NominaDeProfesionalesGlobal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls, ComCtrls, StdCtrls, Mask;

type
  TfmListProfesionales = class(TForm)
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
    desde: TMaskEdit;
    hasta: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    dispositivo: TComboBox;
    Label6: TLabel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    emitir: TBitBtn;
    cerrar: TBitBtn;
    SpeedButton4: TSpeedButton;
    Panel5: TPanel;
    codigo: TRadioButton;
    alfabetico: TRadioButton;
    Panel6: TPanel;
    entorno: TRadioButton;
    exclusion: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure expresionChange(Sender: TObject);
    procedure criterioClick(Sender: TObject);
    procedure expresionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure criterioChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure codigoClick(Sender: TObject);
    procedure alfabeticoClick(Sender: TObject);
    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure desdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hastaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dispositivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emitirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure desdeClick(Sender: TObject);
    procedure hastaClick(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
  private
    { Private declarations }
    ordenact: string; control: byte;
  public
    { Public declarations }
    introSalir, seleccionOK, dimension, on2, redim: boolean;
    periodo: String;
  end;

var
  fmListProfesionales: TfmListProfesionales;

implementation

uses CProfesionalCCB, CUtiles, FichaProfesionalLiquidacionOS, CCategoriasCCB, CConfigForms;

{$R *.DFM}

procedure TfmListProfesionales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmListProfesionales, redim);
  if not introSalir then Begin
    profesional.desconectar;
    categoria.desconectar;
    Release; fmListProfesionales := nil;
  end;
end;

procedure TfmListProfesionales.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Nombre' then profesional.BuscarPorNombre(expresion.Text);
  if criterio.Text = 'Código' then profesional.BuscarPorCodigo(expresion.Text);
end;

procedure TfmListProfesionales.criterioClick(Sender: TObject);
begin
  ActiveControl := expresion;
end;

procedure TfmListProfesionales.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then SpeedButton1Click(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmListProfesionales.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfmFichaProfesionalCCB, fmFichaProfesionalCCB);
  fmFichaProfesionalCCB.NoCerrarFinal := True;
  fmFichaProfesionalCCB.ShowModal;
  profesional.BuscarPorNombre(fmFichaProfesionalCCB.nombre.Text);
  fmFichaProfesionalCCB.Release; fmFichaProfesionalCCB := nil;
  ActiveControl := DBGrid;
end;

procedure TfmListProfesionales.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfmFichaProfesionalCCB, fmFichaProfesionalCCB);
  fmFichaProfesionalCCB.idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
  fmFichaProfesionalCCB.BajaC(Sender);
  fmFichaProfesionalCCB.Release; fmFichaProfesionalCCB := nil;
  expresionChange(Sender);
end;

procedure TfmListProfesionales.SpeedButton2Click(Sender: TObject);
begin
  if profesional.Buscar(profesional.tperso.FieldByName('idprof').AsString) then Begin
    Application.CreateForm(TfmFichaProfesionalCCB, fmFichaProfesionalCCB);
    fmFichaProfesionalCCB.NoCerrarFinal := True;
    fmFichaProfesionalCCB.idprof.Text   := profesional.tperso.FieldByName('idprof').AsString;
    fmFichaProfesionalCCB.ShowModal;
    profesional.BuscarPorNombre(fmFichaProfesionalCCB.nombre.Text);
    fmFichaProfesionalCCB.Release; fmFichaProfesionalCCB := nil;
  end;
end;

procedure TfmListProfesionales.DBGridKeyDown(Sender: TObject; var Key: Word;
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
          if codigo.Checked then desde.Text := profesional.tperso.FieldByName('idprof').AsString else desde.Text := profesional.tperso.FieldByName('nombre').AsString;
          ActiveControl := hasta;
        end;
        if control = 1 then Begin    // El control es de la descripción
          if codigo.Checked then hasta.Text := profesional.tperso.FieldByName('idprof').AsString else hasta.Text := profesional.tperso.FieldByName('nombre').AsString;
          ActiveControl := dispositivo;
        end;
     end;
  if Key = VK_ESCAPE then Close;
end;

procedure TfmListProfesionales.criterioChange(Sender: TObject);
begin
  expresionChange(Sender);
end;

procedure TfmListProfesionales.SpeedButton4Click(Sender: TObject);
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

procedure TfmListProfesionales.cerrarClick(Sender: TObject);
begin
  Panel3.Visible := False;
  criterio.Text  := ordenact;
  expresionChange(Sender);
  ActiveControl  := expresion;
end;

procedure TfmListProfesionales.codigoClick(Sender: TObject);
begin
  criterio.Text := 'Código';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListProfesionales.alfabeticoClick(Sender: TObject);
begin
  Criterio.Text := 'Descripción';
  expresionChange(Sender);
  desde.Text := ''; hasta.Text := ''; dispositivo.Text := 'Presentación Preliminar';
end;

procedure TfmListProfesionales.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := desde;
end;

procedure TfmListProfesionales.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    if codigo.Checked then ActiveControl := codigo else ActiveControl := alfabetico;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := hasta;
    control := 0;
  end;
end;

procedure TfmListProfesionales.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := desde;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(expresion.Text)) = 0 then ActiveControl := expresion else ActiveControl := dispositivo;
    control := 1;
  end;
end;

procedure TfmListProfesionales.dispositivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then ActiveControl := emitir;
end;

procedure TfmListProfesionales.emitirClick(Sender: TObject);
var
  salida, ordensalida, entornosal: char;
begin
  if (Length(Trim(desde.Text)) = 0) or (Length(Trim(hasta.Text)) = 0) then utiles.msgError('No se han definido suficientes parámetros ...!') else Begin
    DTS.DataSet := nil;
    salida := 'P'; ordensalida := 'C'; entornosal := 'E';
    if dispositivo.Text = 'Impresora' then salida := 'I';
    if alfabetico.Checked then ordensalida := 'A';
    if exclusion.Checked then entornosal := 'X';
    profesional.Listar(ordensalida, desde.Text, hasta.Text, entornosal, salida);
    DTS.DataSet   := profesional.tperso;
  end;
  ActiveControl := cerrar;
end;

procedure TfmListProfesionales.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    if not dimension then Begin
      Height := 382; Width := 571;
      Top := 25;
    end;
    Left:=(Screen.Width - Width) div 2;
  end;
  configform.Setear(fmListProfesionales);
  if not introSalir then Begin
    profesional.conectar;
    categoria.conectar;
  end;
  DTS.DataSet := profesional.tperso;
  expresionChange(Sender);
  expresion.SetFocus;
  redim := False;
end;

procedure TfmListProfesionales.desdeClick(Sender: TObject);
begin
  control := 0;
end;

procedure TfmListProfesionales.hastaClick(Sender: TObject);
begin
  control := 1;
end;

procedure TfmListProfesionales.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

end.
