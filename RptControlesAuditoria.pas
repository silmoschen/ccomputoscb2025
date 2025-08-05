unit RptControlesAuditoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ToolWin, DBTables, DB, Mask,
  Grids, DBGrids, ExtCtrls;

type
  TfmListadoControlesAuditoria = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Emitir: TBitBtn;
    DispositivoSalida: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    salir: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    periodo: TMaskEdit;
    procedure SalirClick(Sender: TObject);
    procedure FiltroClick(Sender: TObject);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DispositivoSalidaClick(Sender: TObject);
    procedure EmitirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmListadoControlesAuditoria: TfmListadoControlesAuditoria;

implementation

uses CFacturacionCCB, CUtiles, Disposit, CBDT;

{$R *.DFM}

procedure TfmListadoControlesAuditoria.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmListadoControlesAuditoria.FiltroClick(Sender: TObject);
begin
  ActiveControl := DispositivoSalida;
end;

procedure TfmListadoControlesAuditoria.periodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_DOWN) or (Key = VK_RETURN) then
    if utiles.verificarPeriodo(periodo.Text) then ActiveControl := DispositivoSalida;
end;

procedure TfmListadoControlesAuditoria.DispositivoSalidaClick(
  Sender: TObject);
begin
  Dispositivo.ShowModal;
  ActiveControl := Emitir;
end;

procedure TfmListadoControlesAuditoria.EmitirClick(Sender: TObject);
var
  salida: char;
begin
  if Dispositivo.Impresor.Checked then salida := 'I' else salida := 'P';
  StatusBar1.Panels[0].Text := 'Generando reporte ...!';
  Refresh;
  if CheckBox1.Checked then facturacion.ListarContorlesAuditoria(periodo.Text, salida);
  StatusBar1.Panels[0].Text := '';
  ActiveControl := salir;
end;

procedure TfmListadoControlesAuditoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release; fmListadoControlesAuditoria := nil;
end;

procedure TfmListadoControlesAuditoria.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then Begin
    Width := 351; Height := 274; Top := 35; Left:=(Screen.Width - Width) div 2;
  end;
  Application.CreateForm(TDispositivo, Dispositivo);
  periodo.Text  := utiles.setPeriodoActual;
  ActiveControl := periodo;
end;

end.
