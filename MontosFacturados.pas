unit MontosFacturados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, ComCtrls, ExtCtrls, DBCtrls, ToolWin;

type
  TfmMontosFacturados = class(TForm)
    Panel5: TPanel;
    ScrollBox1: TScrollBox;
    Label7: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    codos: TLabel;
    descrip: TLabel;
    Label1: TLabel;
    periodo: TLabel;
    monto: TEditValid;
    Label2: TLabel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure montoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    redim: Boolean;
  public
    { Public declarations }
  end;

var
  fmMontosFacturados: TfmMontosFacturados;

implementation

uses CFacturacionCCB, CUtiles, CConfigForms;

{$R *.dfm}

procedure TfmMontosFacturados.FormShow(Sender: TObject);
begin
  Refresh;
  if not configform.Setear(fmMontosFacturados) then Left:=(Screen.Width - Width) div 2;
  monto.Text := utiles.FormatearNumero(FloatToStr(facturacion.setTotalFactObraSocial(periodo.Caption, codos.Caption)));
  redim := False;
end;

procedure TfmMontosFacturados.montoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(monto.Text)) > 0 then Begin
      monto.Text := utiles.FormatearNumero(monto.Text);
      facturacion.IngresarMontoFacturadoObraSocial(periodo.Caption, codos.Caption, descrip.Caption, StrToFloat(monto.Text));
      Close;
    end;
end;

procedure TfmMontosFacturados.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMontosFacturados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmMontosFacturados, redim);
end;

procedure TfmMontosFacturados.FormResize(Sender: TObject);
begin
  redim := True;
end;

end.
