unit detalleFacturado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids;

type
  TfmDetalleFacturado = class(TForm)
    StatusBar1: TStatusBar;
    A: TStringGrid;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDetalleFacturado: TfmDetalleFacturado;

implementation

{$R *.dfm}

end.
