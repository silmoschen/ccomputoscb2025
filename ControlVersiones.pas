unit ControlVersiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CActualizacionesCentroComputosCB, DBCtrls, Grids, DBGrids, DB,
  ExtCtrls;

type
  TfmVersiones = class(TForm)
    Panel1: TPanel;
    DTS: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmVersiones: TfmVersiones;

implementation

{$R *.dfm}

procedure TfmVersiones.FormShow(Sender: TObject);
begin
  actualizaciones.conectar;
  DTS.DataSet := actualizaciones.upgradevers;
end;

procedure TfmVersiones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  actualizaciones.desconectar;
  Release; fmVersiones := Nil;
end;

end.
