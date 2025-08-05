unit modifperiodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, CUtiles;

type
  TfmModificarPeriodoFact = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    periodo: TLabel;
    Label2: TLabel;
    idprof: TLabel;
    nprof: TLabel;
    Label3: TLabel;
    nuevoperiodo: TMaskEdit;
    Label4: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure nuevoperiodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    seleccionOK: Boolean;
  end;

var
  fmModificarPeriodoFact: TfmModificarPeriodoFact;

implementation

{$R *.dfm}

procedure TfmModificarPeriodoFact.Button1Click(Sender: TObject);
begin
  seleccionOK := True;
  Close;
end;

procedure TfmModificarPeriodoFact.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmModificarPeriodoFact.nuevoperiodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(nuevoperiodo.Text) then
      if nuevoperiodo.Text <> periodo.Caption then Begin
        button1.Enabled := True;
        button1.SetFocus;
      end else Begin
        utiles.msgError('El Nuevo Período Debe ser distinto al Período Actual ...!');
        button1.Enabled := False;
      end;
end;

end.
