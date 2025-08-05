unit PropiedadesEscritorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, StdCtrls, CheckLst, ExtCtrls, ComCtrls;

type
  TfrmPropiedadesEscritorio = class(TForm)
    PageControl1: TPageControl;
    tblFondo: TTabSheet;
    Panel2: TPanel;
    Panel6: TPanel;
    Fondo: TImage;
    Panel3: TPanel;
    btnExaminar: TButton;
    BorCheck1: TCheckBox;
    tblBotones: TTabSheet;
    Panel4: TPanel;
    botones: TCheckListBox;
    Panel5: TPanel;
    Memo: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    estilo: TComboBox;
    OpenPictureDialog: TOpenPictureDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropiedadesEscritorio: TfrmPropiedadesEscritorio;

implementation

{$R *.dfm}

end.
