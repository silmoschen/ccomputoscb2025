unit ExportarDatosOSPami;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, DB, DBCtrls,
  Buttons, CObrasSocialesCCB;

type
  TfmSoporteMagPAMI = class(TForm)
    StatusBar1: TStatusBar;
    DTS1: TDataSource;
    DTS2: TDataSource;
    DTS3: TDataSource;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cuitefector: TMaskEdit;
    bocaefector: TMaskEdit;
    codefector: TMaskEdit;
    depenefector: TMaskEdit;
    rsocialefector: TMaskEdit;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cuitprof: TMaskEdit;
    bocaprof: TMaskEdit;
    codprof: TMaskEdit;
    docprof: TMaskEdit;
    apellidoprof: TMaskEdit;
    nrodocprof: TMaskEdit;
    nombreprof: TMaskEdit;
    prestacionprof: TMaskEdit;
    especialidadprof: TMaskEdit;
    matriculanacprof: TMaskEdit;
    matriculaprovprof: TMaskEdit;
    fechanacprof: TMaskEdit;
    sexoprof: TMaskEdit;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label24: TLabel;
    nrobeneficioafil: TMaskEdit;
    gradoparenafil: TMaskEdit;
    nombreafil: TMaskEdit;
    tipodocafil: TMaskEdit;
    nrodocafil: TMaskEdit;
    Panel10: TPanel;
    DBGrid3: TDBGrid;
    DBNavigator: TDBNavigator;
    Label25: TLabel;
    ComboBox1: TComboBox;
    expresion: TMaskEdit;
    Label27: TLabel;
    idprof: TMaskEdit;
    BuscarProf: TBitBtn;
    nprof: TLabel;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    periodo: TMaskEdit;
    btnProcesar: TButton;
    TabSheet4: TTabSheet;
    Panel11: TPanel;
    Panel12: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DTS4: TDataSource;
    Label34: TLabel;
    uglefector: TMaskEdit;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    DBGrid4: TDBGrid;
    Label35: TLabel;
    Label36: TLabel;
    S: TStringGrid;
    Button5: TButton;
    Label37: TLabel;
    codos: TMaskEdit;
    BuscarOS: TBitBtn;
    os: TLabel;
    TabSheet6: TTabSheet;
    Panel17: TPanel;
    GroupBox2: TGroupBox;
    codigo1: TMaskEdit;
    Label38: TLabel;
    ListBox1: TListBox;
    GroupBox3: TGroupBox;
    Label39: TLabel;
    codigo2: TMaskEdit;
    ListBox2: TListBox;
    GroupBox4: TGroupBox;
    Label40: TLabel;
    periodoemu: TMaskEdit;
    btnProcesarEmu: TButton;
    Label41: TLabel;
    d_calle: TMaskEdit;
    Label42: TLabel;
    d_puerta: TMaskEdit;
    Label43: TLabel;
    telefono: TMaskEdit;
    procedure cuitefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bocaefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure depenefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rsocialefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cuitprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bocaprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure docprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrodocprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure apellidoprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure especialidadprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure matriculaprovprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure matriculanacprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechanacprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sexoprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure prestacionprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrobeneficioafilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradoparenafilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrodocafilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreafilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure tipodocafilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure expresionChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure expresionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarProfClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcesarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure uglefectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure BuscarOSClick(Sender: TObject);
    procedure codigo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codigo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcesarEmuClick(Sender: TObject);
    procedure periodoemuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure d_calleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure d_puertaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure telefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    archivo: TextFile;
    procedure CargarDatosEfector;
    procedure CargarDatosAfiliado;
    procedure DatosProfesional;
    procedure CargarDatosProfesional;
  public
    { Public declarations }
  end;

var
  fmSoporteMagPAMI: TfmSoporteMagPAMI;

implementation

uses
  CSoporteMagneticoPAMI, CProfesionalCCB, CUtiles, CBDT,
  NominaDeProfesionales, CUtilidadesStringGrid, NominaObrasSociales;

{$R *.dfm}

procedure TfmSoporteMagPAMI.CargarDatosEfector;
// Objetivo...: Recuperar los datos del Efector
Begin
  sopmag.getDatosEfector(cuitefector.Text);
  bocaefector.Text    := sopmag.bocaefector;
  codefector.Text     := sopmag.codefector;
  depenefector.Text   := sopmag.depefector;
  rsocialefector.Text := sopmag.rsocialefector;
  uglefector.Text     := sopmag.ugl
end;

procedure TfmSoporteMagPAMI.CargarDatosAfiliado;
// Objetivo...: cargar datos del afiliado
Begin
  sopmag.getDatosAfiliado(nrodocafil.Text);
  gradoparenafil.Text   := sopmag.gradoparenafil;
  tipodocafil.Text      := sopmag.tipodocafil;
  nrobeneficioafil.Text := sopmag.nrobeneficioafil;
  nombreafil.Text       := sopmag.nombreafil;
end;

procedure TfmSoporteMagPAMI.DatosProfesional;
// Objetivo...: cargar datos del profesional
Begin
  profesional.getDatos(idprof.Text);
  nprof.Caption := profesional.nombre;
  d_calle.SetFocus;
end;

procedure TfmSoporteMagPAMI.CargarDatosProfesional;
// Objetivo...: cargar datos del profesional
Begin
  sopmag.getDatosProfesional(cuitprof.Text);
  bocaprof.Text          := sopmag.bocaprof;
  codprof.Text           := sopmag.codprof;
  docprof.Text           := sopmag.docprof;
  nrodocprof.Text        := sopmag.nrodocprof;
  apellidoprof.Text      := sopmag.apellidoprof;
  nombreprof.Text        := sopmag.nombreprof;
  apellidoprof.Text      := sopmag.apellidoprof;
  prestacionprof.Text    := sopmag.prestacionprof;
  especialidadprof.Text  := sopmag.especialidadprof;
  matriculaprovprof.Text := sopmag.matriculaprovprof;
  matriculanacprof.Text  := sopmag.matriculanacprof;
  fechanacprof.Text      := sopmag.fechanacprof;
  idprof.Text            := sopmag.idprof;
  sexoprof.Text          := sopmag.sexoprof;
  d_calle.Text           := sopmag.d_calle;
  d_puerta.Text          := sopmag.d_puerta;
  telefono.Text          := sopmag.telefono;
  DatosProfesional;
  cuitprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.cuitefectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(cuitefector.Text)) = 13 then bocaefector.SetFocus;
end;

procedure TfmSoporteMagPAMI.bocaefectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then cuitefector.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(bocaefector.Text)) = 2 then codefector.SetFocus;
end;

procedure TfmSoporteMagPAMI.codefectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then bocaefector.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(bocaefector.Text)) > 0 then uglefector.SetFocus;
end;

procedure TfmSoporteMagPAMI.depenefectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codefector.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(depenefector.Text, '12345678', '1. Nacional, 2. Provincial, 3. Municipal, 4. Obra social, 5. Privado, 6. Sociedad de beneficiencia c/fines de lucro ' +
                                                     '7. Sociedad de beneficiencia sin fines de lucro, 8. Otra') then rsocialefector.SetFocus;
end;

procedure TfmSoporteMagPAMI.rsocialefectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then depenefector.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(rsocialefector.Text)) > 0 then Begin
      if (Length(Trim(cuitefector.Text)) = 13) and (Length(Trim(bocaefector.Text)) = 2) and (Length(Trim(bocaefector.Text)) > 0) and (utiles.Sionoct(depenefector.Text, '12345678', '')) then Begin
        sopmag.RegistrarEfector(cuitefector.Text, bocaefector.Text, codefector.Text, depenefector.Text, rsocialefector.Text, uglefector.Text);
        cuitefector.SetFocus;
      end else
        utiles.msgError('Verifique, hay Datos Incompletos ...!');
    end;
end;

procedure TfmSoporteMagPAMI.FormShow(Sender: TObject);
var
  c: String;
begin
  Height := 360; Width := 548; Top := 30;
  Left:=(Screen.Width - Width) div 2;
  sopmag.conectar;
  DTS1.DataSet := sopmag.efect;
  DTS2.DataSet := sopmag.datprof;
  DTS3.DataSet := sopmag.afil;
  cuitefector.Text := sopmag.efect.FieldByName('cuitefec').AsString;
  sopmag.getDatosEfector(cuitefector.Text);
  CargarDatosEfector;
  S.Cells[0, 0] := 'Nro. Audit. Rech.';
  obsocial.conectar;
  if FileExists(dbs.DirSistema + '\obsexport.ini') then Begin
    AssignFile(archivo, dbs.DirSistema + '\obsexport.ini');
    Reset(archivo);
    ReadLn(archivo, c);
    closeFile(archivo);
    codos.Text := c;
  end;
  obsocial.getDatos(codos.Text);
  os.Caption := obsocial.Nombre;

  if FileExists(dbs.DirSistema + '\codigosexcluir.txt') then
    ListBox1.Items.LoadFromFile(dbs.DirSistema + '\codigosexcluir.txt');
  if FileExists(dbs.DirSistema + '\codigosincluir.txt') then
    ListBox2.Items.LoadFromFile(dbs.DirSistema + '\codigosincluir.txt');

  periodoemu.SetFocus;
end;

procedure TfmSoporteMagPAMI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListBox1.Items.SaveToFile(dbs.DirSistema + '\codigosexcluir.txt');
  ListBox2.Items.SaveToFile(dbs.DirSistema + '\codigosincluir.txt');
  obsocial.desconectar;
  sopmag.desconectar;
  Release; fmSoporteMagPAMI := Nil;
end;

procedure TfmSoporteMagPAMI.cuitprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(cuitprof.Text)) = 13 then bocaprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.bocaprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then cuitprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(bocaprof.Text)) > 0 then codprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.codprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then bocaprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(codprof.Text)) > 0 then docprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.docprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then codprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(docprof.Text, 'LELCDNICILMLFPAS', 'Las Opciones son: LE/LC/DNI/CI/LM/LF/PAS') then nrodocprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.nrodocprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then docprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nrodocprof.Text)) > 0 then apellidoprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.apellidoprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nrodocprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(apellidoprof.Text)) > 0 then nombreprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.nombreprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then apellidoprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombreprof.Text)) > 0 then prestacionprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.especialidadprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then prestacionprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(especialidadprof.Text)) > 0 then matriculanacprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.matriculaprovprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then matriculanacprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(matriculaprovprof.Text)) > 0 then fechanacprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.matriculanacprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then especialidadprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(matriculanacprof.Text)) > 0 then matriculaprovprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.fechanacprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then matriculaprovprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.ctrlFecha(fechanacprof) then idprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.sexoprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then idprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if utiles.Sionoct(sexoprof.Text, '123', '1.Masculino / 2.Femenino / 3.Indeterminado ...!') then Begin
      if (Length(Trim(cuitprof.Text)) = 13) and (Length(Trim(bocaprof.Text)) > 0) and (Length(Trim(codprof.Text)) > 0) and (utiles.Sionoct(docprof.Text, 'LELCDNICILMLFPAS', '') and
         (Length(Trim(nrodocprof.Text)) > 0) and (Length(Trim(apellidoprof.Text)) > 0) and (Length(Trim(nombreprof.Text)) > 0) and (Length(Trim(especialidadprof.Text)) > 0) and
         (Length(Trim(matriculaprovprof.Text)) > 0) and (Length(Trim(matriculanacprof.Text)) > 0) and (utiles.ctrlFecha(fechanacprof.Text, ''))) and (profesional.Buscar(idprof.Text)) then Begin
         sopmag.RegistrarProfesional(cuitprof.Text, bocaprof.Text, codprof.Text, docprof.Text, nrodocprof.Text, apellidoprof.Text, nombreprof.Text, prestacionprof.Text, especialidadprof.Text, matriculanacprof.Text, matriculaprovprof.Text, fechanacprof.Text, sexoprof.Text, idprof.Text, d_calle.Text, d_puerta.Text, telefono.Text);
         cuitprof.Text := ''; bocaprof.Text := ''; codprof.Text := ''; docprof.Text := ''; nrodocprof.Text := ''; apellidoprof.Text := ''; nombreprof.Text := ''; prestacionprof.Text := ''; especialidadprof.Text := ''; matriculanacprof.Text := ''; matriculaprovprof.Text := '';
         fechanacprof.Text := ''; sexoprof.Text := ''; idprof.Text := ''; nprof.Caption := '';
         cuitprof.SetFocus;
      end;
    end;
  end;
end;

procedure TfmSoporteMagPAMI.prestacionprofKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nombreprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(prestacionprof.Text)) > 0 then especialidadprof.SetFocus;
end;

procedure TfmSoporteMagPAMI.nrobeneficioafilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nrobeneficioafil.Text)) >= 0 then nombreafil.SetFocus;
end;

procedure TfmSoporteMagPAMI.gradoparenafilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nrodocafil.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(gradoparenafil.Text)) >= 2 then tipodocafil.SetFocus;
end;

procedure TfmSoporteMagPAMI.nrodocafilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then gradoparenafil.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nrodocafil.Text)) >= 2 then gradoparenafil.SetFocus;
end;

procedure TfmSoporteMagPAMI.nombreafilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then nrobeneficioafil.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(rsocialefector.Text)) > 0 then Begin
      if (Length(Trim(nrodocafil.Text)) > 0) and (Length(Trim(tipodocafil.Text)) > 0) and (Length(Trim(nrobeneficioafil.Text)) > 0) and (Length(Trim(nombreafil.Text)) > 0) and (Length(Trim(gradoparenafil.Text)) > 0) then Begin
        sopmag.RegistrarAfiliado(nrodocafil.Text, tipodocafil.Text, nrobeneficioafil.Text, gradoparenafil.Text, nombreafil.Text);
        nrodocafil.SetFocus;
      end else
        utiles.msgError('Verifique, hay Datos Incompletos ...!');
    end;
end;

procedure TfmSoporteMagPAMI.DBGrid3DblClick(Sender: TObject);
begin
  nrodocafil.Text := sopmag.afil.FieldByName('n_docu').AsString;
  CargarDatosAfiliado;
  nrodocafil.SetFocus;
end;

procedure TfmSoporteMagPAMI.tipodocafilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then gradoparenafil.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(tipodocafil.Text)) > 0 then nrobeneficioafil.SetFocus;
end;

procedure TfmSoporteMagPAMI.expresionChange(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet3 then Begin
    if ComboBox1.Text = 'Nro.Doc.' then sopmag.BuscarNroDoc(expresion.Text);
    if ComboBox1.Text = 'Nombre' then sopmag.BuscarNombre(expresion.Text);
  end;
end;

procedure TfmSoporteMagPAMI.ComboBox1Change(Sender: TObject);
begin
  expresionChange(Self);
end;

procedure TfmSoporteMagPAMI.expresionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then DBGrid3.SetFocus;
end;

procedure TfmSoporteMagPAMI.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then DBGrid3DblClick(Self);
end;

procedure TfmSoporteMagPAMI.TabSheet3Show(Sender: TObject);
begin
  expresionChange(Self);
  DBNavigator.DataSource := DTS3;
end;

procedure TfmSoporteMagPAMI.TabSheet1Show(Sender: TObject);
begin
  DBNavigator.DataSource := DTS1;
end;

procedure TfmSoporteMagPAMI.TabSheet2Show(Sender: TObject);
begin
  DBNavigator.DataSource := DTS2;
end;

procedure TfmSoporteMagPAMI.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then matriculanacprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if profesional.Buscar(idprof.Text) then DatosProfesional else BuscarProfClick(Sender);
end;

procedure TfmSoporteMagPAMI.BuscarProfClick(Sender: TObject);
begin
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  fmListProfesionales.introSalir := True;
  fmListProfesionales.on2        := True;
  fmListProfesionales.ShowModal;
  Refresh;
  if fmListProfesionales.seleccionOK then Begin
    idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
    DatosProfesional;
  end;
  fmListProfesionales.Release; fmListProfesionales := Nil;
end;

procedure TfmSoporteMagPAMI.DBGrid2DblClick(Sender: TObject);
begin
  cuitprof.Text := sopmag.datprof.FieldByName('cuitprof').AsString;
  CargarDatosProfesional;
end;

procedure TfmSoporteMagPAMI.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodo.Text) then Begin
      btnProcesar.Enabled := True;
      btnProcesar.SetFocus;
    end;
end;

procedure TfmSoporteMagPAMI.btnProcesarClick(Sender: TObject);
var
  i: Integer;
  l, l1, l2: TStringList;
begin
  if Length(Trim(codos.Text)) = 0 then Begin
    utiles.msgError('No se Definió la Obra Social ...!');
    codos.SetFocus;
  end else Begin
    l1 := TStringList.Create; l2 := TStringList.Create;
    for i := 1 to ListBox1.Items.Count do l1.Add(ListBox1.Items[i-1]);
    for i := 1 to ListBox2.Items.Count do l2.Add(ListBox2.Items[i-1]);
    StatusBar1.Panels[0].Text := 'Procesando Datos Período ' + periodo.Text + ' ...!'; StatusBar1.Refresh;
    l := sopmag.GanerarDatosParaExportar(periodo.Text, codos.Text, l1, l2);
    grid.IniciarGrilla(S);
    for i := 1 to l.Count do
      S.Cells[0, i] := l.Strings[i-1];
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
    periodo.SetFocus;
  end;
end;

procedure TfmSoporteMagPAMI.Button1Click(Sender: TObject);
begin
  if not sopmag.verificarPeriodo(periodo.Text) then utiles.msgError('En este Período No hay Datos Transferidos ...!') else Begin
    sopmag.ConsultarAfiliados(periodo.Text);
    DTS4.DataSet := sopmag.tabla;
  end;
end;

procedure TfmSoporteMagPAMI.Button2Click(Sender: TObject);
begin
  if not sopmag.verificarPeriodo(periodo.Text) then utiles.msgError('En este Período No hay Datos Transferidos ...!') else Begin
    sopmag.ConsultarDatos(periodo.Text);
    DTS4.DataSet := sopmag.tabla;
  end;
end;

procedure TfmSoporteMagPAMI.Button3Click(Sender: TObject);
begin
  if not sopmag.verificarPeriodo(periodo.Text) then utiles.msgError('En este Período No hay Datos Transferidos ...!') else Begin
    sopmag.ConsultarProfesionales(periodo.Text);
    DTS4.DataSet := sopmag.tabla;
  end;
end;

procedure TfmSoporteMagPAMI.Button4Click(Sender: TObject);
begin
  if not sopmag.verificarPeriodo(periodo.Text) then utiles.msgError('En este Período No hay Datos Transferidos ...!') else Begin
    sopmag.ConsultarEfectores(periodo.Text);
    DTS4.DataSet := sopmag.tabla;
  end;
end;

procedure TfmSoporteMagPAMI.uglefectorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then codefector.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(uglefector.Text)) > 0 then rsocialefector.SetFocus;
end;

procedure TfmSoporteMagPAMI.Button5Click(Sender: TObject);
begin
  sopmag.ListarRechazados('P');
  if utiles.msgSiNo('Generar una Copia Impresa ?') then
    sopmag.ListarRechazados('I');
end;

procedure TfmSoporteMagPAMI.BuscarOSClick(Sender: TObject);
begin
  Application.CreateForm(TfmListObrasSociales, fmListObrasSociales);
  fmListObrasSociales.introSalir := True;
  fmListObrasSociales.ShowModal;
  if fmListObrasSociales.seleccionOK then Begin
    codos.Text := obsocial.tabla.FieldByName('codos').AsString;
    obsocial.getDatos(codos.Text);
    os.Caption := obsocial.Nombre;
    AssignFile(archivo, dbs.DirSistema + '\obsexport.ini');
    Rewrite(archivo);
    WriteLn(archivo, codos.Text);
    closeFile(archivo);
    periodo.SetFocus;
  end;
  fmListObrasSociales.Release; fmListObrasSociales := Nil;
end;

procedure TfmSoporteMagPAMI.codigo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if Length(Trim(codigo1.Text)) > 0 then ListBox1.Items.Add(codigo1.Text);
end;

procedure TfmSoporteMagPAMI.codigo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if Length(Trim(codigo2.Text)) > 0 then ListBox2.Items.Add(codigo2.Text);
end;

procedure TfmSoporteMagPAMI.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

procedure TfmSoporteMagPAMI.ListBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ListBox2.Items.Delete(ListBox2.ItemIndex);
end;

procedure TfmSoporteMagPAMI.btnProcesarEmuClick(Sender: TObject);
begin
  sopmag.EmulacionPAMI(periodoemu.Text);
  periodoemu.SetFocus;
end;

procedure TfmSoporteMagPAMI.periodoemuKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.verificarPeriodo(periodoemu.Text) then Begin
      btnProcesarEMU.Enabled := True;
      btnProcesarEMU.SetFocus;
    end;
end;

procedure TfmSoporteMagPAMI.d_calleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then idprof.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then d_puerta.SetFocus;
end;

procedure TfmSoporteMagPAMI.d_puertaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then d_calle.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then telefono.SetFocus;
end;

procedure TfmSoporteMagPAMI.telefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then d_calle.setFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then sexoprof.SetFocus;
end;

end.
