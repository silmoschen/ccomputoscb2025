unit ProcesarActualizacionesOnLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, FileCtrl, Mask, IdIntercept,
  IdLogBase, IdLogDebug, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,

  {$IFDEF VER185}
  IdFTP, IdFTPCommon, IdExplicitTLSClientServerBase;
  {$ENDIF}
  {$IFDEF VER140}
  IdFTP;
  {$ENDIF}


type
  TfmActualizacionesOnline = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    estado: TMemo;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    ftphost: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    usuario: TMaskEdit;
    Label3: TLabel;
    contrasenia: TMaskEdit;
    Panel6: TPanel;
    Button1: TButton;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    editarXML: TMemo;
    Panel9: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    documentoXML: TComboBox;
    Panel10: TPanel;
    CheckBox1: TCheckBox;
    aplicar: TButton;
    Label6: TLabel;
    dirftp: TMaskEdit;
    IdFTP1: TIdFTP;
    IdAntiFreeze1: TIdAntiFreeze;
    IdLogDebug1: TIdLogDebug;
    Panel2: TPanel;
    Label26: TLabel;
    procesar: TButton;
    transferir: TButton;
    Panel11: TPanel;
    cerrar: TButton;
    DriveComboBox: TDriveComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    conexiondirecta: TCheckBox;
    CheckBox4: TCheckBox;
    procedure procesarClick(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure documentoXMLChange(Sender: TObject);
    procedure aplicarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure transferirClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Resize(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
    archivo: TextFile;
    datosok, redim: Boolean;
    con: Cardinal;
    TransferrignData: Boolean;
    procedure ConectarFTP;
    procedure DesconectarFTP;
    procedure ChageDir(DirName: String);
    procedure conectarInternet;
    procedure DesconectarInternet;
    procedure EnviarPorEmail(xlista: TStringList);
  public
    { Public declarations }
  end;

var
  fmActualizacionesOnline: TfmActualizacionesOnline;

implementation

uses CObrasSocialesCCB, CNomeclaCCB, CUtiles, CBDT, CUtilidadesArchivos,
  FormAuto, RasDial3, RasDial2, RasDial1, RasDial4, CConfigForms, CNBU,
  EleccionProfesionales, AutenticacionSMTP, CSMTP, CNomeclatura_ObraSocial;

{$R *.dfm}

procedure TfmActualizacionesOnline.conectarFTP;
begin
  if IdFTP1.Connected then try
    if TransferrignData then IdFTP1.Abort;
    IdFTP1.Quit;
    finally
  end else with IdFTP1 do try
    {$IFDEF VER140}
    User := usuario.Text;
    {$ENDIF}
    {$IFDEF VER185}
    UserName := usuario.Text;
    {$ENDIF}
    Password := contrasenia.Text;
    Host := ftphost.Text;
    Connect;
    Self.ChageDir(dirftp.Text);
  finally
  end;
end;

procedure TfmActualizacionesOnline.DesconectarFTP;
begin
  if IdFTP1.Connected then try
    IdFTP1.Disconnect;
    finally
  end
end;

procedure TfmActualizacionesOnline.ChageDir(DirName: String);
begin
  try
    IdFTP1.ChangeDir(DirName);
    {$IFDEF VER140}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}
    {$IFDEF VER185}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}

    estado.Lines.Add('');
    estado.Lines.Add('Cambiando a Directorio ' + DirName);
  finally
  end;
end;

procedure TfmActualizacionesOnline.conectarInternet;
Begin
  Application.CreateForm(TAutoForm, AutoForm);
  Application.CreateForm(TConfigureAutoForm, ConfigureAutoForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TRasDialerForm, RasDialerForm);
  Application.CreateForm(TTimeAutoForm, TimeAutoForm);
  datosok := False;
  if Length(Trim(RasDialerForm.setIPAdress)) = 0 then   // Si No esta conectado
    if utiles.msgSiNo('Los Información a Transferir se Generó Correctamente,', 'Desea Conectarse a Internet y Realizar la Transferencia ?') then Begin
      RasDialerForm.ShowModal;
      con := RasDialerForm.hRasConn;
      datosok := True;
    end;
   StatusBar1.Panels[0].Text := 'Iniciando Transferencia'; StatusBar1.refresh;
  Refresh;
end;

procedure TfmActualizacionesOnline.DesconectarInternet;
Begin
  if (datosok) and (Length(Trim(RasDialerForm.setIPAdress)) > 0) then   // Si solo nos conectamos a Internet para transferir
    if utiles.msgSiNo('Los Datos se Transfirieron Correctamente', 'Quiere Desconectarse de Internet Ahora ?') then Begin
      StatusBar1.Panels[0].Text := 'Desconectando ...!'; Refresh;
      Application.CreateForm(TRasDialerForm, RasDialerForm);
      RasDialerForm.hRasConn := con;
      RasDialerForm.CancelButtonClick(nil);
      StatusBar1.Panels[0].Text := ''; Refresh;
    end;

  if Assigned(RasDialerForm) then Begin
    RasDialerForm.Release; RasDialerForm := nil;
  end;
  if Assigned(ConfigureAutoForm) then Begin
    ConfigureAutoForm.Release; ConfigureAutoForm := nil;
  end;
  if Assigned(AboutForm) then Begin
    AboutForm.Release; AboutForm := nil;
  end;
  if Assigned(TimeAutoForm) then Begin
    TimeAutoForm.Release; TimeAutoForm := nil;
  end;
end;

//------------------------------------------------------------------------------

procedure TfmActualizacionesOnline.procesarClick(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Procesando Datos ...!'; StatusBar1.Refresh;
  estado.Lines.Clear;
  estado.Lines.Add('Procesando Actualizaciones'); estado.Lines.Add('');
  estado.Lines.Add('Generando Datos Iniciales'); estado.Lines.Add('');
  obsocial.PaginaInicialHTML;
  estado.Lines.Add('Exportando Determinaciones con Monto Fijo');
  obsocial.conectar;
  obsocial.ExportarAnalisisMontoFijoXML;
  estado.Lines.Add('Exportando Determinaciones con Monto Fijo NBU');
  obsocial.ExportarAnalisisMontoFijoNBU;
  estado.Lines.Add('Exportando Padrón de Obras Sociales');
  obsocial.ExportarObrasSocialesXML;
  estado.Lines.Add('Exportando Aranceles Obras Sociales');
  obsocial.ExportarArancelesXML;
  estado.Lines.Add('Exportando Aranceles Nomenclador');
  nomeclatura.ExportarNomecladorXML;
  estado.Lines.Add('Exportando Posicion Fiscal Obra Social');
  obsocial.ExportarPosicionFiscalXML;
  nbu.conectar;
  estado.Lines.Add('Exportando Nomenclaturas NBU');
  nbu.Exportar;
  nbu.desconectar;
  // 26/09/2025
  nomeclaturaos.conectar;
  estado.Lines.Add('Exportando Nomenclaturas NBU Obras Sociales');
  nomeclaturaos.Exportar;
  nomeclaturaos.desconectar;
  estado.Lines.Add('Exportando Aranceles NBU');
  obsocial.ExportarArancelesNBUXML;
  estado.Lines.Add('Exportando Unidades NBU');
  obsocial.ExportarUnidadesNBU;
  obsocial.desconectar;
  estado.Lines.Add('Compactando Datos');
  utilesarchivos.CompactarArchivos(dbs.DirSistema + '\actualizaciones_online\upload\estructu\*.*', dbs.DirSistema + '\actualizaciones_online\upload\actol.bck');
  estado.Lines.Add('');
  estado.Lines.Add('Fin de las Actualizaciones');
  StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  transferir.Enabled := True;
  RadioButton1.Enabled := true;
  RadioButton2.Enabled := true;
  RadioButton3.Enabled := true;
  if utiles.msgSiNo('Los Datos han sido Procesados Correctamente, Seguro para Transferirlos Vía FTP/NTFS ?') then begin
    Refresh;
    transferirClick(Self);
  end;
end;

procedure TfmActualizacionesOnline.cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmActualizacionesOnline.documentoXMLChange(Sender: TObject);
begin
  if documentoXML.Text = 'Determinaciones con Monto Fijo' then Begin
    editarXML.Lines.LoadFromFile(dbs.DirSistema + '\actualizaciones_online\upload\apfijos.css');
    CheckBox1.Enabled := True;
    aplicar.Enabled   := True;
  end;
  if documentoXML.Text = 'Padrón de Obras Sociales' then Begin
    editarXML.Lines.LoadFromFile(dbs.DirSistema + '\actualizaciones_online\upload\obsocial.css');
    CheckBox1.Enabled := True;
    aplicar.Enabled   := True;
  end;
  if documentoXML.Text = 'Aranceles de Obras Sociales' then Begin
    editarXML.Lines.LoadFromFile(dbs.DirSistema + '\actualizaciones_online\upload\aranceles_os.css');
    CheckBox1.Enabled := True;
    aplicar.Enabled   := True;
  end;
  if documentoXML.Text = 'Aranceles del Nomeclador' then Begin
    editarXML.Lines.LoadFromFile(dbs.DirSistema + '\actualizaciones_online\upload\nomeclador.css');
    CheckBox1.Enabled := True;
    aplicar.Enabled   := True;
  end;
end;

procedure TfmActualizacionesOnline.aplicarClick(Sender: TObject);
begin
  if documentoXML.Text = 'Determinaciones con Monto Fijo' then Begin
    editarXML.Lines.SaveToFile(dbs.DirSistema + '\actualizaciones_online\upload\apfijos.css');
    CheckBox1.Checked := False;
    CheckBox1.Enabled := False;
    aplicar.Enabled   := False;
  end;
  if documentoXML.Text = 'Padrón de Obras Sociales' then Begin
    editarXML.Lines.SaveToFile(dbs.DirSistema + '\actualizaciones_online\upload\obsocial.css');
    CheckBox1.Checked := False;
    CheckBox1.Enabled := False;
    aplicar.Enabled   := False;
  end;
  if documentoXML.Text = 'Aranceles de Obras Sociales' then Begin
    editarXML.Lines.SaveToFile(dbs.DirSistema + '\actualizaciones_online\upload\aranceles_os.css');
    CheckBox1.Checked := False;
    CheckBox1.Enabled := False;
    aplicar.Enabled   := False;
  end;
  if documentoXML.Text = 'Aranceles del Nomeclador' then Begin
    editarXML.Lines.SaveToFile(dbs.DirSistema + '\actualizaciones_online\upload\nomeclador.css');
    CheckBox1.Checked := False;
    CheckBox1.Enabled := False;
    aplicar.Enabled   := False;
  end;  
  editarXML.Lines.Clear;
  documentoXML.Text := '';
end;

procedure TfmActualizacionesOnline.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then Begin
    editarXML.ReadOnly := False;
    editarXML.SetFocus;
  end else Begin
    editarXML.ReadOnly := True;
  end;
end;

procedure TfmActualizacionesOnline.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then Begin
    Application.CreateForm(TfmAutenticacionSMTP, fmAutenticacionSMTP);
    fmAutenticacionSMTP.ShowModal;
    CheckBox4.Checked := False;
  end;
end;

procedure TfmActualizacionesOnline.Button1Click(Sender: TObject);
begin
  AssignFile(archivo, dbs.DirSistema + '\ftp.ini');
  Rewrite(archivo);
  WriteLn(archivo, ftphost.Text);
  WriteLn(archivo, dirftp.Text);
  WriteLn(archivo, usuario.Text);
  WriteLn(archivo, contrasenia.Text);
  if conexiondirecta.Checked then WriteLn(archivo, '1') else WriteLn(archivo, '0');
  closeFile(archivo);
end;

procedure TfmActualizacionesOnline.FormShow(Sender: TObject);
var
  vhost, vftp, vusuario, vpassword, cd: String;
begin
  configform.Setear(fmActualizacionesOnline);
  if FileExists(dbs.DirSistema + '\ftp.ini') then Begin
    AssignFile(archivo, dbs.DirSistema + '\ftp.ini');
    Reset(archivo);
    ReadLn(archivo, vhost);
    ReadLn(archivo, vftp);
    ReadLn(archivo, vusuario);
    ReadLn(archivo, vpassword);
    ReadLn(archivo, cd);
    closeFile(archivo);
    ftphost.Text     := vhost;
    dirftp.Text      := vftp;
    usuario.Text     := vusuario;
    contrasenia.Text := vpassword;
    if cd = '1' then conexiondirecta.Checked := True else conexiondirecta.Checked := False;
  end;
  redim := False;
  procesar.setFocus;
end;

procedure TfmActualizacionesOnline.EnviarPorEmail(xlista: TStringList);
var
  semail: TTSMTP;
  datosok: Boolean;
  i, j: Integer;
  Prioridad, ReqAut: Integer; ServerSMTP, UsuarioSMTP, PassSMTP: String;

  procedure CargarDatosConfigSMTP;
  var
    v1, v2, v3, v4, v5: String;
  begin
    if FileExists(dbs.DirSistema + '\smtpautenticado.ini') then Begin
      AssignFile(archivo, dbs.DirSistema + '\smtpautenticado.ini');
      Reset(archivo);
      ReadLn(archivo, v1);
      ReadLn(archivo, v2);
      ReadLn(archivo, v3);
      ReadLn(archivo, v4);
      ReadLn(archivo, v5);
      serverSMTP       := v1;
      Prioridad        := StrToInt(v2);
      ReqAut           := StrToInt(v3);
      UsuarioSMTP      := v4;
      PassSMTP         := v5;
      closeFile(archivo);
    end;
  end;

begin

  CargarDatosConfigSMTP;

  semail := TTSMTP.Create;
  semail.ConectarSMTPSinAntiFreeze(UsuarioSMTP, PassSMTP, serverSMTP, 25);

  for i := 1 to xlista.Count do begin
    StatusBar1.Panels[0].Text := 'Enviando a ' + xlista.Strings[i-1]; StatusBar1.Refresh;
    semail.EnviarMensaje(UsuarioSMTP, xlista.Strings[i-1], 'Actualización de Datos al: ' + utiles.setFechaActual,  dbs.DirSistema + '\actualizaciones_online\upload\actol.bck');
    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end;

  semail.DesconectarSMTP;

  semail.Destroy; semail := Nil;
end;

procedure TfmActualizacionesOnline.transferirClick(Sender: TObject);
var
  continuar: Boolean;
  d: char;
  l: TStringList;
  i: Integer;
begin
  if RadioButton1.Checked then Begin  // Transferir a Medio
    if ((Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'a') or (Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'b')) then Begin
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'a' then d := 'a';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'b' then d := 'b';
      ShowMessage('Inserte un Diskette en la Unidad ' + (UpperCase(Copy(DriveComboBox.Text, 1, 1))) + ': para Formatearlo,' + CHR(13) + 'este paso es Obligatorio, si lo omite no podrá' + CHR(13) + 'completar el Proceso de Exportación.');
      Continuar := utilesarchivos.FormatearDiskette(d);
      if Continuar then ShowMessage('El Disco ha sido Formateado Satisfactoriamente, ' + CHR(13) + 'se Procedera a Transferir los Datos al mismo.');
      Refresh;
    end;
    if (Lowercase(Copy(DriveComboBox.Text, 1, 1)) > 'b') then Begin
      Continuar := True;
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'c' then d := 'c';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'd' then d := 'd';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'e' then d := 'e';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'f' then d := 'f';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'g' then d := 'g';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'h' then d := 'h';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'i' then d := 'i';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'j' then d := 'j';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'k' then d := 'k';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'l' then d := 'l';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'm' then d := 'm';
      if Lowercase(Copy(DriveComboBox.Text, 1, 1)) = 'n' then d := 'n';
    end;
    if Continuar then Begin
      estado.Lines.Add('Transfiriendo Datos a ' + (UpperCase(Copy(DriveComboBox.Text, 1, 1))) + ':');
      estado.Lines.Add('');
      StatusBar1.Panels[0].Text := 'Copiando Datos ...!'; StatusBar1.Refresh;
      //utilesarchivos.CopiarArchivos(dbs.DirSistema + '\actualizaciones_online\upload', '*.xml', d + ':');
      utilesarchivos.CopiarArchivos(dbs.DirSistema + '\actualizaciones_online\upload', '*.bck', d + ':');
      StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
      estado.Lines.Add('');
      estado.Lines.Add('Transferencia Finalizada');
      cerrar.SetFocus;
    end;
  end;

  if RadioButton2.Checked then Begin   // Transferir Vía FTP
    if not conexiondirecta.Checked then conectarInternet;
    if (Length(Trim(RasDialerForm.setIPAdress)) > 0) or (conexiondirecta.Checked) then Begin
      conectarFTP;
      if IdFTP1.Connected then begin
        transferir.Enabled := False;
        StatusBar1.Panels[0].Text := 'Transfiriendo Datos ...!'; StatusBar1.refresh;
        estado.Lines.Add('');
        estado.Lines.Add('Iniciando Proceso de Transferencia');
        l := utilesarchivos.setListaArchivos(dbs.DirSistema + '\actualizaciones_online\upload', '*.bck');
        for i := 1 to l.Count do Begin
          estado.Lines.Add('Transfiriendo ' + l.Strings[i-1] + ' a: ' + dirftp.Text);
          IdFTP1.TransferType := ftBinary;
          IdFTP1.Put(l.Strings[i-1], ExtractFileName(l.Strings[i-1]));
          ChageDir(idftp1.RetrieveCurrentDir);
        end;
        estado.Lines.Add('');
        estado.Lines.Add('Transferencia Finalizada');
        StatusBar1.Panels[0].Text := '';
      end;
      desconectarFTP;
    end else
      utiles.msgError('Error - No Hay Conexion Establecida ...!');
    if not conexiondirecta.Checked then DesconectarInternet;
    transferir.Enabled := True;
    cerrar.SetFocus;
  end;

  if RadioButton3.Checked then Begin
    Application.CreateForm(TfmEleProfesional, fmEleProfesional);
    fmEleProfesional.CargarDatos;
    fmEleProfesional.ShowModal;
    if fmEleProfesional.profSeleccionados then
      if (utiles.msgSiNo('Seguro para Enviar Email con Actualización a los Profesionales Seleccionados ?')) then begin
        Refresh;
        EnviarPorEmail(fmEleProfesional.listaemails);
      end;
    fmEleProfesional.Release; fmEleProfesional := Nil;
    transferir.Enabled := True;
    cerrar.SetFocus;
  End;
end;

procedure TfmActualizacionesOnline.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then DriveComboBox.Enabled := True else DriveComboBox.Enabled := False;
end;

procedure TfmActualizacionesOnline.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  configform.Guardar(fmActualizacionesOnline, redim);
end;

procedure TfmActualizacionesOnline.Panel1Resize(Sender: TObject);
begin
  redim := True;
end;

end.
