unit ProcesamientoDatosLaboratorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, FileCtrl;

type
  TfmPocesarDatosLab = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    periodo: TMaskEdit;
    Label2: TLabel;
    idprof: TMaskEdit;
    BuscarProf: TBitBtn;
    prof: TLabel;
    Label3: TLabel;
    DriveComboBox1: TDriveComboBox;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Button2: TButton;
    dispositivo: TComboBox;
    Label4: TLabel;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPocesarDatosLab: TfmPocesarDatosLab;

implementation

{$R *.DFM}

end.
