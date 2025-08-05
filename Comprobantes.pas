unit Comprobantes;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin;

type
  TfmComprobantes = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    idcompr: TMaskEdit;
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

    procedure idcomprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CargarDatos;
  public
    { Public declarations }
    cerrarFinal: boolean;
  end;

var
  fmComprobantes: TfmComprobantes;

implementation

uses CComprob, CUtiles, ImgForms;

{$R *.DFM}

procedure TfmComprobantes.CargarDatos;
begin
  comprobante.getDatos(idcompr.Text);
  descrip.Text  := comprobante.Descrip; // Edito
end;

procedure TfmComprobantes.CheckBox1Click(Sender: TObject);
begin
  ModificarClick(Self);
end;

procedure TfmComprobantes.idcomprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then                               {Edita y Da de Alta Registro ...}
    begin
      if comprobante.Buscar(idcompr.Text) then
        begin
          CargarDatos;
          StatusBar1.Panels[0].Text := '';
          ActiveControl := descrip;
        end
      else
        if utiles.DarDeAlta('Código Comprobante ' + idcompr.Text) then
          begin
            CargarDatos;
            StatusBar1.Panels[0].Text := '';
            ActiveControl := descrip;
          end;
    end;
end;

procedure TfmComprobantes.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idcompr;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      comprobante.Grabar(idcompr.Text, descrip.Text, false);
      ActiveControl := idcompr;
      if cerrarFinal then Close;
    end;
end;

procedure TfmComprobantes.AltaClick(Sender: TObject);
begin
  ActiveControl := idcompr;
end;

procedure TfmComprobantes.BajaClick(Sender: TObject);
begin
  if comprobante.Buscar(idcompr.Text) then
   if utiles.BajaRegistro('Comprobante ' + idcompr.Text) then
    begin
      comprobante.Borrar(idcompr.Text);
      idcompr.Text := comprobante.Idcompr;
      CargarDatos;
    end;
  ActiveControl := idcompr;
end;

procedure TfmComprobantes.ModificarClick(Sender: TObject);
begin
  if comprobante.Buscar(idcompr.Text) then comprobante.Grabar(idcompr.Text, descrip.Text, false);
  ActiveControl := idcompr;
end;

procedure TfmComprobantes.DeshacerClick(Sender: TObject);
begin
  ActiveControl := idcompr;
end;

procedure TfmComprobantes.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmComprobantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  if not cerrarFinal then Begin
    Release; fmComprobantes := nil;
  end;
end;

procedure TfmComprobantes.DBNavigatorBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  idcompr.Text := comprobante.tabla.FieldByName('idcompr').Value;
  CargarDatos;
end;

procedure TfmComprobantes.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
  DTS.DataSet := comprobante.tabla;
  if Length(Trim(idcompr.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := descrip;
  end;
end;

procedure TfmComprobantes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
