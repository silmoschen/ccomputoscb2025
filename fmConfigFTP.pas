unit fmConfigFTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CFTP, DB, DBCtrls, StdCtrls, Mask;

type
  TfmConfigurarFTP = class(TForm)
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    host: TMaskEdit;
    nftp: TMaskEdit;
    usuario: TMaskEdit;
    Label3: TLabel;
    pass: TMaskEdit;
    btnRegistrar: TButton;
    DBNavigator: TDBNavigator;
    DTS: TDataSource;
    Label4: TLabel;
    id: TMaskEdit;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnRegistrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure cargar;
  public
    { Public declarations }
  end;

var
  fmConfigurarFTP: TfmConfigurarFTP;

implementation

{$R *.dfm}

procedure TfmConfigurarFTP.btnRegistrarClick(Sender: TObject);
begin
  ftp.Registrar(strtoint(trim(id.Text)), host.Text, nftp.Text, usuario.text, pass.Text, '');
end;

procedure TfmConfigurarFTP.cargar;
begin
  ftp.getDatos(ftp.tabla.fieldbyname('id').asinteger);
  id.Text := inttostr(ftp.id);
  host.text := ftp.host;
  nftp.Text := ftp.ftp;
  usuario.Text := ftp.usuario;
  pass.Text := ftp.pass;
end;

procedure TfmConfigurarFTP.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  cargar;
end;

procedure TfmConfigurarFTP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ftp.desconectar;
  close;
end;

procedure TfmConfigurarFTP.FormShow(Sender: TObject);
begin
  ftp.conectar;
  DTS.DataSet := ftp.tabla;
  cargar;
end;

end.
