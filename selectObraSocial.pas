unit selectObraSocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls;

type
  TfmSelObraSocial = class(TForm)
    Panel1: TPanel;
    F: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelObraSocial: TfmSelObraSocial;

implementation

{$R *.dfm}

procedure TfmSelObraSocial.FormShow(Sender: TObject);
begin
  F.Cells[0, 0] := 'Obra Social';
  F.Cells[1, 0] := 'Código';
end;

end.
