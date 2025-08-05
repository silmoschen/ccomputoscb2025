unit fmFacturacionOnLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, Grids, CUtiles, CAuditoriaFacturacion,
  DBTables, CProfesionalCCB, CConfigForms, IdAntiFreezeBase, IdAntiFreeze,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, IdBaseComponent, IdIntercept, IdLogBase, IdLogDebug, IdFTPCommon, CBDT,
  IBQuery, CUtilidadesStringGrid, CNBU, CFacturacionCCB, CObrasSocialesCCB,
  Buttons;

type
  TfmFactOnLine = class(TForm)
    StatusBar1: TStatusBar;
    IdLogDebug1: TIdLogDebug;
    IdFTP1: TIdFTP;
    IdAntiFreeze1: TIdAntiFreeze;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    estado: TLabel;
    Panel3: TPanel;
    btnCerrar: TButton;
    btnFacturar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    hasta: TMaskEdit;
    desde: TMaskEdit;
    periodo: TMaskEdit;
    btnDescargar: TButton;
    P: TStringGrid;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    host: TEdit;
    ftp: TEdit;
    usuario: TEdit;
    pass: TMaskEdit;
    btnAplicarCambios: TButton;
    Label6: TLabel;
    listLaboratorio: TComboBox;
    listCodigo: TComboBox;
    C: TStringGrid;
    btnFiltrarOs: TButton;
    Si: TSpeedButton;
    Ninguno: TSpeedButton;
    Todos: TSpeedButton;
    Label3: TLabel;
    txtBuscar: TEdit;
    Button1: TButton;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure listLaboratorioChange(Sender: TObject);
    procedure btnDescargarClick(Sender: TObject);
    procedure PKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnFacturarClick(Sender: TObject);
    procedure btnFiltrarOsClick(Sender: TObject);
    procedure SiClick(Sender: TObject);
    procedure NingunoClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure desdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure hastaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure periodoClick(Sender: TObject);
    procedure btnAplicarCambiosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure txtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtBuscarChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    archivo: TextFile;
    redim: boolean;
    AbortTransfer, datosok, ingresotxt: Boolean;
    con: Cardinal;
    TransferrignData: Boolean;
    BytesToTransfer: LongWord;
    STime: TDateTime;
    lista: TStringList;
    function procesarUrl(url: string): TStringList;
    procedure conectarFTP;
    procedure desconectarFTP;
    procedure ChageDir(DirName: String);
    procedure loadOrdenes;
  public
    { Public declarations }
  end;

var
  fmFactOnLine: TfmFactOnLine;

implementation

uses HTTPCliente, login_user, EleccionObrasSociales;

{$R *.dfm}

procedure TfmFactOnLine.conectarFTP;
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
    Password := pass.Text;
    Host     := ftp.Text;
    Connect;
    //Self.ChageDir('');
  finally
  end;
end;

procedure TfmFactOnLine.DesconectarFTP;
begin
  if IdFTP1.Connected then try
    IdFTP1.Disconnect;
    finally
  end
end;

procedure TfmFactOnLine.desdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    if (utiles.ctrlFecha(desde)) then hasta.SetFocus;    
end;

procedure TfmFactOnLine.ChageDir(DirName: String);
begin
  try
    IdFTP1.ChangeDir(DirName);
    {$IFDEF VER140}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}
    {$IFDEF VER185}
    IdFTP1.TransferType := ftASCII;
    {$ENDIF}
  finally
  end;
end;

function TfmFactOnLine.procesarUrl(url: string): TStringList;
var
  l: TStringList;
  i: integer;
begin
  fmClientHTML.Edit1.text := url;
  fmClientHTML.btnDispararClick(self);
  l := TStringList.Create;
  for i := 1 to fmClientHTML.memoHTML.Lines.Count do
    l.Add(fmClientHTML.memoHTML.Lines[i-1]);
  result := l;
end;

procedure TfmFactOnLine.SiClick(Sender: TObject);
var
  i: integer;
begin
  if (utiles.verificarPeriodo(periodo.Text, '') and (length(trim(listCodigo.Text)) = 6)) then else begin
    utiles.msgError('El Período o Profesional es Incorrrecto ...!');
    exit;
  end;

  if (length(trim(P.Cells[0, P.Row])) > 10) then begin
    if (P.Cells[4, P.Row] = '') then begin
      P.Cells[4, P.Row] := periodo.Text;
      P.Cells[5, P.Row] := listCodigo.Text;
      C.Cells[0, P.Row] := listCodigo.Text;
    end else begin
      P.Cells[4, P.Row] := '';
      P.Cells[5, P.Row] := '';
    end;
    btnFacturar.Enabled := true;
    auditoriafact.actualizarEstado(P.Cells[0, P.Row], P.Cells[4, P.Row], P.Cells[5, P.Row]);

    for i:= P.Row + 1 to P.RowCount do begin
      if (length(trim(P.Cells[0, i])) > 5) then begin
        P.Row := i;
        break;
      end;
    end;

    if (ingresotxt) then begin
      ingresotxt := false;
      txtBuscar.Text := '';
      txtBuscar.SetFocus;
    end;

  end;
end;

procedure TfmFactOnLine.SpeedButton1Click(Sender: TObject);
begin
  loadOrdenes;
end;

procedure TfmFactOnLine.TodosClick(Sender: TObject);
var
  j: integer;
begin
  if (utiles.verificarPeriodo(periodo.Text, '') and (length(trim(listCodigo.Text)) = 6)) then else begin
    utiles.msgError('El Período o Profesional es Incorrrecto ...!');
    exit;
  end;

  for j := 1 to P.RowCount do begin
    P.Row := j;
    if (length(trim(P.Cells[1, P.Row])) = 0) then break;
    if (length(trim(P.Cells[0, P.Row])) > 10) then begin
      P.Cells[4, P.Row] := periodo.Text;
      P.Cells[5, P.Row] := listCodigo.Text;
      btnFacturar.Enabled := true;
      auditoriafact.actualizarEstado(P.Cells[0, P.Row], P.Cells[4, P.Row], P.Cells[5, P.Row]);
    end;
  end;
end;

procedure TfmFactOnLine.txtBuscarChange(Sender: TObject);
begin
  if (length(trim(txtBuscar.Text)) = 23) then Button1Click(Self);  
end;

procedure TfmFactOnLine.txtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then Button1Click(Self);
end;

procedure TfmFactOnLine.loadOrdenes();
var
  r, t: TIBQuery;
  i, j, k: integer;
begin
  StatusBar1.Panels[0].Text := 'Cargando Ordenes ...!'; StatusBar1.refresh;
  grid.IniciarGrilla(P);
  grid.IniciarGrilla_Total(C);
  r := auditoriafact.getListOrdenesIB(desde.Text, hasta.Text);
  r.open; i := 0; j := 0; k := 0;
  while not r.eof do begin
    if (utiles.verificarItemsLista(lista, r.fieldbyname('codos').asstring)) then begin
      t := auditoriafact.getListItemsIB(r.fieldbyname('nroauditoria').asstring);
      t.open;
      if (t.RecordCount > 0) then begin
        inc(i);
        inc(k);
        obsocial.getDatos(r.fieldbyname('codos').asstring);
        auditoriafact.getPaciente(r.fieldbyname('nrodoc').asstring, r.fieldbyname('idprof').asstring);
        P.Cells[0, i] := r.fieldbyname('nroauditoria').asstring;
        P.Cells[1, i] := utiles.sFormatoFecha(r.fieldbyname('fecha').asstring);
        P.Cells[2, i] := auditoriafact.nombre + ' (' + auditoriafact.grabadoiva + ')';
        P.Cells[4, i] := r.fieldbyname('periodofact').asstring;
        P.Cells[5, i] := r.fieldbyname('codfact').asstring;
        P.Cells[6, i] := obsocial.Nombre;
        while not t.eof do begin
          nbu.getDatos(t.fieldbyname('codigo').asstring);
          inc(i);
          P.Cells[0, i] := '                                                 ' + t.fieldbyname('items').asstring;
          P.Cells[1, i] := t.fieldbyname('codigo').asstring;
          P.Cells[2, i] := '      ' + nbu.Descrip;
          P.Cells[3, i] := t.fieldbyname('estado').asstring;

          inc(j);
          C.Cells[0, j] := r.fieldbyname('codfact').asstring;
          C.Cells[1, j] := r.fieldbyname('codos').asstring;
          C.Cells[2, j] := t.fieldbyname('items').asstring;
          C.Cells[3, j] := auditoriafact.nrodoc; //'--FE';
          C.Cells[4, j] := auditoriafact.nombre;
          C.Cells[5, j] := t.fieldbyname('codigo').asstring;
          C.Cells[6, j] := 'O' + utiles.sLlenarIzquierda(inttostr(k), 3, '0');
          C.Cells[7, j] := periodo.Text;
          C.Cells[8, j] := auditoriafact.grabadoiva;
          C.Cells[9, j] := r.fieldbyname('nroauditoria').asstring;
          t.next;
        end;
      end;
      t.Close; t.Free;
    end;
    r.next;
  end;
  r.close; r.free;
  StatusBar1.Panels[0].Text := ''; StatusBar1.refresh;
  btnFacturar.Enabled := true;
end;

procedure TfmFactOnLine.NingunoClick(Sender: TObject);
var
  j: integer;
begin
  if (utiles.verificarPeriodo(periodo.Text, '') and (length(trim(listCodigo.Text)) = 6)) then else begin
    utiles.msgError('El Período o Profesional es Incorrrecto ...!');
    exit;
  end;

  for j := 1 to P.RowCount do begin
    P.Row := j;
    if (length(trim(P.Cells[1, P.Row])) = 0) then break;
    if (length(trim(P.Cells[0, P.Row])) > 10) then begin
      P.Cells[4, P.Row] := '';
      P.Cells[5, P.Row] := '';
      btnFacturar.Enabled := false;
      auditoriafact.actualizarEstado(P.Cells[0, P.Row], P.Cells[4, P.Row], P.Cells[5, P.Row]);
    end;
  end;
end;

procedure TfmFactOnLine.periodoClick(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Pulse ENTER para Cargar Ordenes';
end;

procedure TfmFactOnLine.periodoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  f: string;
begin
  if (Key = VK_RETURN) then
    if (utiles.verificarPeriodo(periodo.Text)) then begin
      f := '01/' + copy(periodo.Text, 1, 2) + '/' + copy(periodo.Text, 6, 2);
      desde.Text := '01/' + copy(f, 4, 2) + '/' + copy(f, 7, 2);
      hasta.Text := utiles.ultFechaMes(copy(f, 4, 2), copy(f, 7, 2)) + '/' + copy(f, 4, 2) + '/' + copy(f, 7, 2);
      loadOrdenes;
    end;
end;

procedure TfmFactOnLine.PKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_SPACE) then SiClick(Self);
  if (Key = VK_DELETE) then
    if (length(trim(P.Cells[0, P.Row])) > 10) then begin
      if (utiles.msgSiNo('Seguro para Borrar Orden ' + P.Cells[0, P.Row] + ' ?')) then begin
        auditoriafact.borrar(P.Cells[0, P.Row]);
        loadOrdenes;
      end;
    end;
end;

procedure TfmFactOnLine.btnAplicarCambiosClick(Sender: TObject);
begin
  AssignFile(archivo, dbs.DirSistema + '\ftp_fact.ini');
  Rewrite(archivo);
  WriteLn(archivo, host.Text);
  WriteLn(archivo, ftp.Text);
  WriteLn(archivo, usuario.Text);
  WriteLn(archivo, pass.Text);
  closeFile(archivo);
end;

procedure TfmFactOnLine.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFactOnLine.btnDescargarClick(Sender: TObject);
var
  l: TStringList;
  u, p, df, hf, Name: string;
  i: integer;
begin
  Application.CreateForm(TfmLogin, fmLogin);
  fmLogin.ShowModal;
  Refresh;
  if (fmLogin.login) then begin
    estado.Caption := 'ERROR';
    u := fmLogin.usuario.Text;
    p := fmLogin.pass.Text;
    l := procesarUrl(host.Text + '/operaciones/validar_password.php?usuario='+u+'&pass='+p);
    for i := 1 to l.Count do begin
      if (Pos('OK', l[i-1]) > 0) then estado.Caption := 'OK';
    end;
  end;

  if (estado.Caption = 'OK') then begin
    if (utiles.msgSiNo('Seguro para Descargar Ordenes en el Lapdo ' + desde.Text + ' - ' + hasta.Text + ' y Registrarlas para Facturar el Período ' + periodo.Text + ' ?')) then begin

      Refresh;
      estado.Caption := 'ERROR Procesando Ordenes';
      StatusBar1.Panels[0].Text := 'Exportando Datos Remotos ...!'; StatusBar1.refresh;
      df := utiles.FechaCompleta(desde.Text);
      df := copy(df, 7, 4) + copy(df, 4, 2) + copy(df, 1, 2);
      hf := utiles.FechaCompleta(hasta.Text);
      hf := copy(hf, 7, 4) + copy(hf, 4, 2) + copy(hf, 1, 2);
      l := procesarUrl(host.Text + '/operaciones/exportar_ordenes_profesional.php?desde='+df+'&hasta='+hf+'&idprof='+u);
      for i := 1 to l.Count do begin
        if (Pos('OK', l[i-1]) > 0) then estado.Caption := 'OK';
      end;
      StatusBar1.Panels[0].Text := 'Transfiriendo a Equipo Local ...!'; StatusBar1.refresh;

      conectarFTP;
      if IdFTP1.Connected then begin
        l := TStringList.Create;
        IdFTP1.List(l);
        for i := 1 to l.Count do Begin
          if (Pos('.txt', l.Strings[i-1]) > 0) then Begin
            if (Pos('cab_auditoria_' + u + '.txt', l.Strings[i-1]) > 0) then Name := 'cab_auditoria_' + u + '.txt';
            if (Pos('det_auditoria_' + u + '.txt', l.Strings[i-1]) > 0) then Name := 'det_auditoria_' + u + '.txt';
            if (Pos('pac_auditoria_' + u + '.txt', l.Strings[i-1]) > 0) then Name := 'pac_auditoria_' + u + '.txt';
            if Pos('.txt', Name) > 0 then Begin
              StatusBar1.Panels[0].Text := 'Descargando ' + l.Strings[i-1] + ' de: ' + ftp.Text; StatusBar1.Refresh;
              IdFTP1.TransferType := ftBinary;
              BytesToTransfer := IdFTP1.Size(ExtractFileName(l.Strings[i-1]));
              IdFTP1.Get(Name, dbs.DirSistema + '\temp\' + Name, true);
            end;
          End;
        end;
      end;
      DesconectarFTP;

      procesarUrl(host.Text + '/operaciones/borrar_ordenes_profesional.php?idprof='+u);

      StatusBar1.Panels[0].Text := ''; StatusBar1.refresh;

      estado.Caption := 'Descarga OK';

      if (utiles.msgSiNo('El Procesamiento de Datos Remotos se ha Realizado,' + chr(13) +
                       '¿ Procesar los Datos Transferidos ?' + chr(13) +
                       'Este Proceso Puede Demorar Varios Minutos.')) then begin

          StatusBar1.Panels[0].Text := 'Procesando Ordenes ...!'; StatusBar1.refresh;
          Refresh;

          auditoriafact.importar(u, periodo.Text, desde.Text, hasta.Text);

          estado.Caption := 'Procesamiento OK';

          loadOrdenes;

      end else begin
        utiles.msgError('Falta Definir Algun(os) Parametro(s) para el Procesamiento Remoto de Datos ...!');
      end;
    end;


  end;

  fmLogin.release; fmLogin := nil;
end;

procedure TfmFactOnLine.btnFacturarClick(Sender: TObject);
var
  i: integer;
  r, t: TIBQuery;
  l: TStringList;
  fact: boolean;
begin
  if (utiles.msgSiNo('Este Proceso Anularará el Registro de Ordenes Existentes. Utilice este Proceso con Precaución ...!' + chr(13) +
      'Laboratorio: ' + listLaboratorio.Text + ' - Período: ' + periodo.Text)) then begin
    Refresh;

    StatusBar1.Panels[0].Text := 'Iniciando Proceso ...!'; StatusBar1.Refresh;

    loadOrdenes;

    l := TStringList.Create;
    if (lista = nil) then begin
      r := auditoriafact.getListObrasSocialesIB(periodo.Text);
      r.Open;
      while not r.eof do begin
        l.Add(r.fields[0].asstring);
        r.next;
      end;
      r.close; r.free;
    end else
      l := lista;

    auditoriafact.desconectar;

    facturacion.conectar;

    facturacion.factglobal := false;
    facturacion.DireccionarLaboratorio(periodo.Text, listCodigo.Text);

    for i := 0 to l.Count - 1 do facturacion.iniciarFacturacionIBOL(periodo.Text, l.Strings[i]);

    for i := 1 to C.RowCount do begin
      if (C.Cells[1, i] = '') then break;
      if (C.Cells[0, i] <> '') then begin
        if (length(trim(P.Cells[0, i])) > 10) then StatusBar1.Panels[0].Text := 'Procesando Orden ' + P.Cells[0, i]; StatusBar1.Refresh;
        facturacion.GrabarIB(
          periodo.Text,   // periodo
          C.Cells[0, i],  // idprof
          C.Cells[1, i],  // codos
          C.Cells[2, i],  // items
          C.Cells[3, i],  // codpac
          C.Cells[4, i],  // nombre
          C.Cells[5, i],  // codanalisis
          C.Cells[6, i],  // orden
          C.Cells[7, i],  // periodo1
          C.Cells[8, i],  // retiva
          C.Cells[9, i],  // nroauditoria
          false,          // modifica
          false,          // guarda orden interna
          '',
          '',
          '',
          '');
          fact := true;
     end;
     if (fact) then facturacion.vaciarBuffer;
     fact := false;
    end;

    facturacion.desconectar;

    auditoriafact.conectar;

    btnCerrar.SetFocus();

    StatusBar1.Panels[0].Text := ''; StatusBar1.Refresh;
  end;

end;

procedure TfmFactOnLine.btnFiltrarOsClick(Sender: TObject);
var
  i: integer;
  r: TIBQuery;
  l: TStringList;
begin
  l := TStringList.Create;
  r := auditoriafact.getListObrasSocialesIB(periodo.Text);
  r.Open;
  while not r.eof do begin
    l.Add(r.fields[0].asstring);
    r.next;
  end;
  r.close; r.free;
  Application.CreateForm(TfmEleObraSociales, fmEleObraSociales);
  fmEleObraSociales.CargarDatosLista(l);
  fmEleObraSociales.ShowModal;
  lista := fmEleObraSociales.lista;
  Refresh;
  loadOrdenes;
  fmEleObraSociales.Release; fmEleObraSociales := nil;
end;

procedure TfmFactOnLine.Button1Click(Sender: TObject);
var
  i: integer;
begin
  if (txtBuscar.Text = '') then exit;

  for i := 1 to P.RowCount do begin
    if (uppercase(copy(P.Cells[0, i], 7, length(txtBuscar.Text))) = uppercase(txtBuscar.Text)) then begin
      //utiles.msgError(P.Cells[0, i] + ' = ' + txtBuscar.Text);
      //if (P.Cells[0, i] = txtBuscar.Text) then begin
      P.Row := i;
      P.SetFocus;
      ingresotxt := true;
      break;
    end;
  end;

end;

procedure TfmFactOnLine.FormActivate(Sender: TObject);
begin
  redim := false;
end;

procedure TfmFactOnLine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  configform.Guardar(fmFactOnLine, redim);
  grid.GuardarAnchoColumnas(fmFactOnLine, P);
  fmClientHTML.Release; fmClientHTML := nil;
  auditoriafact.desconectar;
  Release; fmFactOnLine := nil;
end;

procedure TfmFactOnLine.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) then txtBuscar.SetFocus;
end;

procedure TfmFactOnLine.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width := (Width - (Width div 5));
  redim := true;
end;

procedure TfmFactOnLine.FormShow(Sender: TObject);
var
  f: string;
  r: TQuery;
  vhost, vftp, vusuario, vpassword: String;
begin
   configform.Setear(fmFactOnLine);

   Application.CreateForm(TfmClientHTML, fmClientHTML);
   fmClientHTML.FormActivate(self);

   P.Cells[0, 0] := 'Nro. Auditoría/Items';
   P.Cells[1, 0] := 'Fecha/Cód';
   P.Cells[2, 0] := 'Paciente/Determinación';
   P.Cells[3, 0] := 'E';
   P.Cells[4, 0] := 'Período';
   P.Cells[5, 0] := 'Cód. Fact.';
   P.Cells[6, 0] := 'Obra Social';

   auditoriafact.conectar;

   grid.RecuperarAnchoColumnas(fmFactOnLine, P);

   listLaboratorio.Items.Clear;
   listCodigo.Items.Clear;

   r := profesional.setProfesionalesAlf;
   r.open;
   while not r.eof do begin
     if (listLaboratorio.Items.Count = 0) then begin
       listLaboratorio.Text := r.fieldbyname('nombre').asstring + ' (' + r.fieldbyname('idprof').asstring + ')';
       listCodigo.Text := r.fieldbyname('idprof').asstring;
     end;
     listLaboratorio.Items.Add(r.fieldbyname('nombre').asstring + ' (' + r.fieldbyname('idprof').asstring + ')');
     listCodigo.Items.Add(r.fieldbyname('idprof').asstring);
     r.Next;
   end;
   r.close; r.free;

   if (auditoriafact.getFechas) then begin
     desde.Text := auditoriafact.desde;
     hasta.Text := auditoriafact.hasta;
   end else begin
     f := utiles.setFechaActual;
     desde.Text := '01/' + copy(f, 4, 2) + '/' + copy(f, 7, 2);
     hasta.Text := utiles.ultFechaMes(copy(f, 4, 2), copy(f, 7, 2)) + '/' + copy(f, 4, 2) + '/' + copy(f, 7, 2);
   end;
   periodo.Text := utiles.setPeriodoActual;

   loadOrdenes;

   estado.Caption := 'Código de Facturación: ' + listCodigo.Text;

   redim := false;

   if FileExists(dbs.DirSistema + '\ftp_fact.ini') then Begin
     AssignFile(archivo, dbs.DirSistema + '\ftp_fact.ini');
     Reset(archivo);
     ReadLn(archivo, vhost);
     ReadLn(archivo, vftp);
     ReadLn(archivo, vusuario);
     ReadLn(archivo, vpassword);
     closeFile(archivo);
     host.Text     := vhost;
     ftp.Text      := vftp;
     usuario.Text  := vusuario;
     pass.Text     := vpassword;
   end;

   desde.SetFocus;
end;

procedure TfmFactOnLine.hastaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    if (utiles.ctrlFecha(hasta)) then btnDescargar.SetFocus;
end;

procedure TfmFactOnLine.listLaboratorioChange(Sender: TObject);
begin
  listCodigo.ItemIndex := listLaboratorio.ItemIndex;
  estado.Caption := 'Código de Facturación: ' + listCodigo.Text; 
end;

end.
