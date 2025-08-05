unit ConfiguracionBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BorBtns, Editv, ExtCtrls;

type
  TfmConfigBackup = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    diasback: TEditValid;
    OK: TButton;
    manual: TRadioButton;
    alsalir: TRadioButton;
    GroupBox1: TGroupBox;
    Auditoria: TCheckBox;
    Distribucion: TCheckBox;
    Facturacion: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    tback: Integer;
    lista: TStringList;
  public
    { Public declarations }
  end;

var
  fmConfigBackup: TfmConfigBackup;

implementation

uses CBDT, CBackup;

{$R *.dfm}

procedure TfmConfigBackup.FormShow(Sender: TObject);
begin
  if dbs.setOpcionBackup = 0 then alSalir.Checked := True;
  if dbs.setOpcionBackup = 1 then Manual.Checked  := True;
  diasback.Text := IntToStr(dbs.setDiasBack);
  lista := backup.setModulos;
  if lista.Count > 0 then if lista.Strings[0] = 'auditoria' then Auditoria.Checked := True;
  if lista.Count > 1 then if lista.Strings[1] = 'distribucion' then distribucion.Checked := True;
  lista.Destroy;
  Facturacion.Checked := True;
end;

procedure TfmConfigBackup.OKClick(Sender: TObject);
begin
  lista := TStringList.Create;
  if Auditoria.Checked then lista.Add('auditoria');
  if Distribucion.Checked then lista.Add('distribucion');
  backup.RegistrarModulos(lista);
  lista.Destroy;
  if alSalir.Checked then tback := 0;
  if manual.Checked  then tback := 1;
  dbs.ConfigurarBackup(tback);
  dbs.EstablecerDias(StrToInt(diasback.Text));
  Close;
end;

procedure TfmConfigBackup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release; fmConfigBackup := nil;
end;
                                    
end.
