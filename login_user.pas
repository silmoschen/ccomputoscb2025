unit login_user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask;

type
  TfmLogin = class(TForm)
    Panel1: TPanel;
    Label10: TLabel;
    usuario: TEdit;
    Label11: TLabel;
    pass: TMaskEdit;
    btnOK: TButton;
    btnCancelar: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    login: boolean;
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}

procedure TfmLogin.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfmLogin.btnOKClick(Sender: TObject);
begin
  login := true;
  close;
end;

end.
