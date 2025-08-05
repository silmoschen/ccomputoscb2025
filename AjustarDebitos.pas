unit AjustarDebitos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, CUtiles;

type
  TfmAjustarDebitos = class(TForm)
    Label1: TLabel;
    monto: TEditValid;
    Label2: TLabel;
    pago: TEditValid;
    Label3: TLabel;
    montofact: TEditValid;
    procedure montoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pagoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure montofactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAjustarDebitos: TfmAjustarDebitos;

implementation

{$R *.dfm}

procedure TfmAjustarDebitos.montofactKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    montofact.Text := utiles.FormatearNumero(montofact.Text);
    pago.setFocus;
  end;
end;

procedure TfmAjustarDebitos.montoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    monto.Text := utiles.FormatearNumero(monto.Text);
    Close;
  end;
end;

procedure TfmAjustarDebitos.pagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    pago.Text := utiles.FormatearNumero(pago.Text);
    monto.setFocus;
  end;
end;

end.
