unit soportedigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, CObrasSocialesCCB, DBTables,
  CUtiles;

type
  TfmSoporteDigital = class(TForm)
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    periodo: TMaskEdit;
    Label5: TLabel;
    estado: TLabel;
    Label6: TLabel;
    listObraSocial: TComboBox;
    listCodigo: TComboBox;
    Panel3: TPanel;
    btnCerrar: TButton;
    btnFacturar: TButton;
    Label2: TLabel;
    tipo: TMaskEdit;
    sucursal: TMaskEdit;
    numero: TMaskEdit;
    listRegla: TComboBox;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure listObraSocialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSoporteDigital: TfmSoporteDigital;

implementation

{$R *.dfm}

procedure TfmSoporteDigital.btnCerrarClick(Sender: TObject);
begin
    obsocial.desconectar;
  Close;
  fmSoporteDigital.Release; fmSoporteDigital := nil;
end;

procedure TfmSoporteDigital.FormShow(Sender: TObject);
var
  r: TQuery;
  s: boolean;
begin
  obsocial.conectar;
  r := obsocial.setObrasSocialesSoporteDigital;
  r.open;
  while not r.eof do begin
    obsocial.getDatos(r.Fields[0].AsString);
    listObraSocial.Items.Add(obsocial.Nombre);
    listCodigo.Items.Add(obsocial.Codos);
    listRegla.Items.Add(r.Fields[1].AsString);
    if (not s) then begin
      listObraSocial.Text := obsocial.Nombre;
      listCodigo.Text := obsocial.Codos;
      listRegla.Text := r.Fields[1].AsString;
      s := true;
    end;
    r.next;
  end;
  r.close; r.free;
  periodo.Text := utiles.setPeriodoActual;
  periodo.SetFocus;
end;

procedure TfmSoporteDigital.listObraSocialChange(Sender: TObject);
begin
  listCodigo.ItemIndex :=  listObraSocial.ItemIndex;
  listRegla.ItemIndex :=  listObraSocial.ItemIndex;
end;

end.
