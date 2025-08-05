unit os_reglas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, ExtCtrls, CObrasSocialesCCB, DB, StdCtrls;

type
  TfmReglasOs = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator: TDBNavigator;
    Panel3: TPanel;
    DBGrid: TDBGrid;
    DTS: TDataSource;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReglasOs: TfmReglasOs;

implementation

{$R *.dfm}

procedure TfmReglasOs.CheckBox1Click(Sender: TObject);
begin
  DBNavigator.Enabled := checkbox1.Checked;
end;

procedure TfmReglasOs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  Release; fmReglasOs := nil;
end;

procedure TfmReglasOs.FormShow(Sender: TObject);
begin
  obsocial.conectar;
  DTS.DataSet := obsocial.obsocial_reglas;
  DBNavigator.DataSource := dts;
  CheckBox1Click(self);
end;

end.
