unit fmBuscarProfesional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls, DB;

type
  TfmBuscarProf = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    criterio: TComboBox;
    Label2: TLabel;
    expresion: TMaskEdit;
    DBGrid: TDBGrid;
    DTS: TDataSource;
    procedure expresionChange(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure expresionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    seleccionOK: Boolean;
  end;

var
  fmBuscarProf: TfmBuscarProf;

implementation

uses CProfesionalCCB;

{$R *.dfm}

procedure TfmBuscarProf.expresionChange(Sender: TObject);
begin
  if criterio.Text = 'Nombre' then profesional.BuscarPorNombre(expresion.Text);
  if criterio.Text = 'Código' then profesional.BuscarPorCodigo(expresion.Text);
end;

procedure TfmBuscarProf.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Begin
    seleccionOK := True;
    Close;
  end;
end;

procedure TfmBuscarProf.expresionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := DBGrid;
end;

procedure TfmBuscarProf.FormShow(Sender: TObject);
begin
  DTS.DataSet := profesional.tperso;
end;

end.
