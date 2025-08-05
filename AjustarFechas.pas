unit AjustarFechas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, CUtiles, Mask;

type
  TfmAjustarFechas = class(TForm)
    Label1: TLabel;
    fecha: TMaskEdit;
    CheckBox1: TCheckBox;
    procedure fechaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAjustarFechas: TfmAjustarFechas;

implementation

{$R *.dfm}

procedure TfmAjustarFechas.fechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then Close;
end;

end.
