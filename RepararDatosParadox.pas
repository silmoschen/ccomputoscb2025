unit RepararDatosParadox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TfmRepararDatosPdx = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    btnReparar: TButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Panel4: TPanel;
    Label1: TLabel;
    periodo: TMaskEdit;
    Label3: TLabel;
    idlaboratorio: TMaskEdit;
    Label2: TLabel;
    nrodist: TMaskEdit;
    Panel3: TPanel;
    btnCerrar: TButton;
    BuscarProf: TBitBtn;
    prof: TLabel;
    procedure CheckBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRepararClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure nrodistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BuscarProfClick(Sender: TObject);
    procedure idlaboratorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRepararDatosPdx: TfmRepararDatosPdx;

implementation

uses
  CUtiles, Main, CBDT, MAINRP, CUtilidadesArchivos, CProfesionalCCB,
  NominaDeProfesionalesLiquidacionOS;

{$R *.dfm}

procedure TfmRepararDatosPdx.CheckBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then periodo.setFocus;
end;

procedure TfmRepararDatosPdx.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then CheckBox1.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then
      if CheckBox4.Checked then nrodist.setFocus else
        if CheckBox5.Checked then idlaboratorio.SetFocus else
          btnReparar.setFocus;
end;

procedure TfmRepararDatosPdx.CheckBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then btnReparar.setFocus;
end;

procedure TfmRepararDatosPdx.btnRepararClick(Sender: TObject);
var
  dirfact, dirgral: String;
  i: Integer;
  l: TStringList;

  procedure Terminar;
  begin
    utiles.msgError('Se han Reparado los Datos, es Necesario Reiniciar la Aplicación ...!', 'Importante');
    Application.Terminate;
  end;

begin
  Application.CreateForm(TMainForm, MainForm);
  MainForm.RadioAlias.ItemIndex     := 1;
  MainForm.rgRebuildScope.ItemIndex := 1;
  MainForm.CheckDoPack.Checked      := True;

  if CheckBox1.Checked then Begin
    MainForm.DirectoryCombo.Text := dbs.DirSistema + '\arch';
    MainForm.Show;
    MainForm.ButtonStartClick(Self);
    MainForm.Close;
    CheckBox1.Font.Style := [fsBold];
    CheckBox1.Checked    := False;
    Terminar;
  end;

  if CheckBox2.Checked then Begin
    MainForm.DirectoryCombo.Text := dbs.DirSistema + '\archdat';
    MainForm.Show;
    MainForm.ButtonStartClick(Self);
    MainForm.Close;
    CheckBox2.Font.Style := [fsBold];
    CheckBox2.Checked    := False;
    Terminar;
  end;

  if CheckBox3.Checked then Begin
    MainForm.DirectoryCombo.Text := dbs.DirSistema + '\auditoria';
    MainForm.Show;
    MainForm.ButtonStartClick(Self);
    MainForm.Close;
    CheckBox3.Font.Style := [fsBold];
    CheckBox3.Checked    := False;
    Terminar;
  end;

  if CheckBox4.Checked then Begin
    if (utiles.verificarPeriodo(periodo.Text)) and ( (nrodist.Text = '01') or (nrodist.Text = '02') ) then Begin
      if DirectoryExists(dbs.DirSistema + '\distribucion\dist' + Copy(periodo.Text, 1, 2) + Copy(periodo.Text, 4, 4) + nrodist.Text) then Begin
        MainForm.DirectoryCombo.Text := dbs.DirSistema + '\distribucion\dist' + Copy(periodo.Text, 1, 2) + Copy(periodo.Text, 4, 4) + nrodist.Text;
        MainForm.Show;
        MainForm.ButtonStartClick(Self);
        MainForm.Close;
        CheckBox4.Font.Style := [fsBold];
        CheckBox4.Checked    := False;
        MainForm.Release; MainForm   := Nil;
        Terminar;
      end else
        utiles.msgError('El Período o la Distribución No Existe ...!')
    end else
      utiles.msgError('El Período o Número de Distribución es Incorrecto ...!');
  end;

  if CheckBox5.Checked then Begin
    if DirectoryExists(dbs.DirSistema + '\fact_lab') then dirfact := dbs.DirSistema + '\fact_lab\' else dirfact := dbs.DirSistema + '\';
    dirfact := dirfact + Copy(periodo.Text, 1, 2) + Copy(periodo.Text, 4, 4) + '\' + idlaboratorio.Text;
    //dirgral := dbs.DirSistema + '\fact_lab\facturaciones\' + Copy(periodo.Text, 1, 2) + Copy(periodo.Text, 4, 4);
    if (utiles.verificarPeriodo(periodo.Text)) then Begin
      if DirectoryExists(dirfact) then Begin

        MainForm.DirectoryCombo.Text := dirfact;
        MainForm.Show;
        MainForm.ButtonStartClick(Self);
        CheckBox5.Font.Style := [fsBold];
        CheckBox5.Checked    := False;
        Terminar;

      end else
        utiles.msgError('El Período de Facturación No Existe ...!')
    end else
      utiles.msgError('El Período o Número de Distribución es Incorrecto ...!');
  end;

  MainForm.Release; MainForm := Nil;
  Close;
end;

procedure TfmRepararDatosPdx.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRepararDatosPdx.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then periodo.setFocus;
end;

procedure TfmRepararDatosPdx.nrodistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (nrodist.Text = '01') or (nrodist.Text = '02') then btnReparar.setFocus else utiles.msgError('El Nro. de Distribución tiene que ser 01 o 02 ...!');
end;

procedure TfmRepararDatosPdx.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked then periodo.setFocus;
end;

procedure TfmRepararDatosPdx.FormShow(Sender: TObject);
begin
  profesional.conectar;
end;

procedure TfmRepararDatosPdx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  profesional.desconectar;
end;

procedure TfmRepararDatosPdx.BuscarProfClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionalesLiq, fmListProfesionalesLiq);
  fmListProfesionalesLiq.introSalir := True;
  fmListProfesionalesLiq.on2        := True;
  fmListProfesionalesLiq.ShowModal;
  Refresh;
  if fmListProfesionalesLiq.seleccionOK then Begin
    idlaboratorio.Text := profesional.tperso.FieldByName('idprof').AsString;
    profesional.getDatos(idlaboratorio.Text);
    prof.Caption := profesional.nombre;
    btnReparar.setFocus;
  end;
  fmListProfesionalesLiq.Release; fmListProfesionalesLiq := Nil;
end;

procedure TfmRepararDatosPdx.idlaboratorioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then periodo.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if profesional.Buscar(idlaboratorio.Text) then Begin
      profesional.getDatos(idlaboratorio.Text);
      prof.Caption := profesional.nombre;
      btnReparar.setFocus;
    end else
      BuscarProfClick(Sender);
  end;
end;

end.
