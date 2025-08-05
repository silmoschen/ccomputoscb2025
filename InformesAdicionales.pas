unit InformesAdicionales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, Editv;

type
  TfmInformesAdicionales = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    btnDispositivo: TButton;
    emitir: TButton;
    Panel3: TPanel;
    btnCerrar: TButton;
    Panel4: TPanel;
    Label28: TLabel;
    periodo: TMaskEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    Panel5: TPanel;
    Label1: TLabel;
    porcentaje: TEditValid;
    RadioButton2: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDispositivoClick(Sender: TObject);
    procedure emitirClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private
    { Private declarations }
    salida: Char;
    redim: Boolean;
  public
    { Public declarations }
  end;

var
  fmInformesAdicionales: TfmInformesAdicionales;

implementation

uses
  CAuditoriaCCB, CObrasSocialesCCB, CUtiles, Disposit, CConfigForms;

{$R *.dfm}

procedure TfmInformesAdicionales.FormShow(Sender: TObject);
begin
  if not configform.Setear(fmInformesAdicionales) then Begin
    Height := 312; Width := 421;
  end;
  auditoriacb.conectar;
  periodo.Text := utiles.setPeriodoActual;
  periodo.setFocus;
  if not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
  salida := 'P';
  redim := False;
end;

procedure TfmInformesAdicionales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  auditoriacb.desconectar;
  Dispositivo.Release; Dispositivo := Nil;
  configform.Guardar(fmInformesAdicionales, redim);
  Release; fmInformesAdicionales := Nil;
end;

procedure TfmInformesAdicionales.periodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then RadioButton2.SetFocus;
end;

procedure TfmInformesAdicionales.RadioButton1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then btnDispositivo.SetFocus;
end;

procedure TfmInformesAdicionales.btnDispositivoClick(Sender: TObject);
begin
  if not Assigned(Dispositivo) then Application.CreateForm(TDispositivo, Dispositivo);
  Dispositivo.ShowModal;
  salida := 'P';
  if Dispositivo.Impresor.Checked then salida := 'I' else salida := 'P';
  ActiveControl := emitir;
end;

procedure TfmInformesAdicionales.emitirClick(Sender: TObject);
begin
  if utiles.verificarPeriodo(periodo.Text, '') then Begin
    StatusBar1.Panels[0].Text := 'Generando Informe ...!'; StatusBar1.Refresh;
    if RadioButton1.Checked then auditoriacb.ListarMontosFacturadosDiferenciales(periodo.Text, porcentaje.Text, salida);
    if RadioButton2.Checked then auditoriacb.ListarResumenMontosFacturadosDiferenciales(periodo.Text, porcentaje.Text, salida);
    StatusBar1.Panels[0].Text := '';
    btnCerrar.SetFocus;
  end;
end;

procedure TfmInformesAdicionales.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInformesAdicionales.Panel1Resize(Sender: TObject);
begin
  redim := True;
end;

end.
