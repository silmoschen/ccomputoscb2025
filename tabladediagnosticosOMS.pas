unit tabladediagnosticosOMS;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Editv;

type
  TfmTablaDiagnosticosOMS = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    codigo: TMaskEdit;
    StatusBar1: TStatusBar;
    descrip: TMaskEdit;
    DTS: TDataSource;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    Label3: TLabel;
    clave: TMaskEdit;
    Label4: TLabel;
    orden: TMaskEdit;
    Label5: TLabel;
    indice: TMaskEdit;
    OMS: TCheckBox;
    Label6: TLabel;
    codrap: TMaskEdit;

    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure claveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel2Resize(Sender: TObject);
    procedure ordenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure indiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OMSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codrapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    redim: Boolean;
    procedure CargarDatos;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmTablaDiagnosticosOMS: TfmTablaDiagnosticosOMS;

implementation

uses CDiagnosticosCCBOMS, CUtiles, ImgForms, CConfigForms;

{$R *.DFM}

procedure TfmTablaDiagnosticosOMS.CargarDatos;
begin
  diagnosticooms.getDatos(codigo.Text);
  descrip.Text := Copy(diagnosticooms.Descrip, 1, 35); 
  clave.Text   := diagnosticooms.Clave;
  indice.Text  := diagnosticooms.Indice;
  orden.Text   := diagnosticooms.Orden;
  oms.Checked  := diagnosticooms.OMS;
  codrap.Text  := diagnosticooms.codrap;
end;

procedure TfmTablaDiagnosticosOMS.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if diagnosticooms.Buscar(codigo.Text) then Begin
      CargarDatos;
      ActiveControl := clave;
    end else
      if utiles.DarDeAlta('Seguro para Código de Diagnóstico ' + codigo.Text) then Begin
        CargarDatos;
        ActiveControl := clave;
      end;
    end;
end;

procedure TfmTablaDiagnosticosOMS.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codrap;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if Length(Trim(descrip.Text)) > 0 then Begin
      if (Length(Trim(codigo.Text)) > 0) and (Length(Trim(clave.Text)) > 0) and (Length(Trim(descrip.Text)) > 0) then Begin
        diagnosticooms.Grabar(codigo.Text, clave.Text, orden.Text, indice.Text, descrip.Text, codrap.Text, oms.Checked);
        Close;
      end else
        utiles.msgError('Controle, hay Datos Incorrectos ...!');
    end;
  end;
end;

procedure TfmTablaDiagnosticosOMS.AltaClick(Sender: TObject);
begin
  codigo.Text  := '';
  descrip.Text := '';
  clave.Text   := '';
  indice.Text  := '';
  orden.Text   := '';
  oms.Checked  := False;
  codrap.Text  := '';
  codigo.SetFocus;
end;

procedure TfmTablaDiagnosticosOMS.BajaClick(Sender: TObject);
begin
  if diagnosticooms.Buscar(codigo.Text) then
   if utiles.BajaRegistro(' Seguro que desea Eliminar Diagnóstico ' + descrip.Text + ' ?') then Begin
     diagnosticooms.Borrar(codigo.Text);
     codigo.Text := diagnosticooms.codigo;
     CargarDatos;
   end;
  ActiveControl := codigo;
end;

procedure TfmTablaDiagnosticosOMS.ModificarClick(Sender: TObject);
begin
  ActiveControl := codigo;
end;

procedure TfmTablaDiagnosticosOMS.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTablaDiagnosticosOMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmTablaDiagnosticosOMS, redim);
  DBNavigator.DataSource := nil;
  diagnosticooms.BuscarPorDescrip(descrip.Text);
  Release; fmTablaDiagnosticosOMS := nil;
end;

procedure TfmTablaDiagnosticosOMS.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  codigo.Text := diagnosticooms.tabla.FieldByName('oms_cod').AsString;
  CargarDatos;
end;

procedure TfmTablaDiagnosticosOMS.FormShow(Sender: TObject);
begin
  configform.Setear(fmTablaDiagnosticosOMS);
  DTS.DataSet := diagnosticooms.tabla;
  CargarDatos;
  ActiveControl := codigo;
  redim := False;
end;

procedure TfmTablaDiagnosticosOMS.claveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codigo.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(clave.Text)) > 0 then orden.SetFocus;
end;

procedure TfmTablaDiagnosticosOMS.Panel2Resize(Sender: TObject);
begin
  redim := True;
end;

procedure TfmTablaDiagnosticosOMS.ordenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then clave.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then indice.SetFocus;
end;

procedure TfmTablaDiagnosticosOMS.indiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then orden.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then oms.SetFocus;
end;

procedure TfmTablaDiagnosticosOMS.OMSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then indice.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then codrap.SetFocus;
end;

procedure TfmTablaDiagnosticosOMS.codrapKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then oms.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    codrap.Text := utiles.sLlenarIzquierda(codrap.Text, 5, '0');
    descrip.SetFocus;
  end;
end;

end.
