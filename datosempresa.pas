unit datosempresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, CDatosEmpresa;

type
  TfmDatosEmpresa = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    rsocial: TMaskEdit;
    Label1: TLabel;
    direccion: TMaskEdit;
    Label3: TLabel;
    telefono: TMaskEdit;
    Label4: TLabel;
    cuit: TMaskEdit;
    Label5: TLabel;
    ptovta: TMaskEdit;
    Label6: TLabel;
    tipo: TMaskEdit;
    Label7: TLabel;
    inicioactividad: TMaskEdit;
    btnGuardar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDatosEmpresa: TfmDatosEmpresa;

implementation

{$R *.dfm}

procedure TfmDatosEmpresa.btnGuardarClick(Sender: TObject);
begin
  empresa.Grabar(rsocial.Text, direccion.text, telefono.Text, cuit.text, ptovta.text, tipo.Text, inicioactividad.text);
end;

procedure TfmDatosEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  empresa.desconectar;
  Close;
end;

procedure TfmDatosEmpresa.FormShow(Sender: TObject);
begin
  empresa.conectar;
  empresa.getDatos;

  rsocial.Text := empresa.rsocial;
  direccion.Text := empresa.direccion;
  telefono.Text := empresa.telefono;
  cuit.Text := empresa.cuit;
  ptovta.Text := empresa.ptovta;
  tipo.Text := empresa.tipo;
  inicioactividad.Text := empresa.inicioactividad;
  rsocial.SetFocus;
end;

end.
