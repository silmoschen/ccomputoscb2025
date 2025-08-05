unit uploadftp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CFTP, IdAntiFreezeBase, IdAntiFreeze,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, IdBaseComponent, IdIntercept, IdLogBase, IdLogDebug, IdFTPCommon, CUtiles,
  CUtilidadesArchivos, CBDT, Contnrs;

type
  TfmUploadFTP = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    modulo: TLabel;
    btnIniciar: TButton;
    btnCerrar: TButton;
    IdLogDebug1: TIdLogDebug;
    IdFTP1: TIdFTP;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    con: Cardinal;
    AbortTransfer, TransferrignData: Boolean;
    BytesToTransfer: LongWord;
    STime: TDateTime;
    function  procesarUrl(url: string): TStringList;
    procedure conectarFTP;
    procedure desconectarFTP;
    procedure ChageDir(DirName: String);
  public
    { Public declarations }
    __periodo: string;
  end;

var
  fmUploadFTP: TfmUploadFTP;

implementation

uses HTTPCliente;

{$R *.dfm}

function TfmUploadFTP.procesarUrl(url: string): TStringList;
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

procedure TfmUploadFTP.conectarFTP;
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
    UserName := ftp.usuario;
    {$ENDIF}
    Password := ftp.pass;
    Host     := ftp.ftp;
    Connect;
    //Self.ChageDir('');  11/12/2013 - actualizado
  finally
  end;
end;

procedure TfmUploadFTP.DesconectarFTP;
begin
  if IdFTP1.Connected then try
    IdFTP1.Disconnect;
    finally
  end
end;

procedure TfmUploadFTP.ChageDir(DirName: String);
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

procedure TfmUploadFTP.btnCerrarClick(Sender: TObject);
begin
  fmUploadFTP.Release; fmUploadFTP := nil;
  Close;
end;

procedure TfmUploadFTP.btnIniciarClick(Sender: TObject);
var
  l: TStringlist;
  i: integer;
  id, reporte, periodo, tipo, iduser: string;
  c: boolean;
  x: textfile;
begin
  if (utiles.msgSiNo('Esta Opción Transferirá los Archivos Procesados a un Servidor Remoto.' + chr(13) + 'Seguro para Proceder ?')) then begin
    Refresh;
    c := false;


    if (modulo.Caption = 'Distribución') then begin
      l := utilesarchivos.setListaArchivos(dbs.DirSistema + '\export_reportes\web_distribucion', '*.txt');
      ftp.conectar;
      ftp.getDatos(1);

      if (ftp.__error <> '') then begin
        utiles.msgError(ftp.__error);
        btnIniciar.Enabled := false;
        exit;
      end;

      StatusBar1.Panels[0].Text := 'Verificando Usuarios ...!'; StatusBar1.Refresh;
      procesarUrl(ftp.host + '/remote/verificar_users.aspx');
      StatusBar1.Panels[0].Text := 'Exportando Datos ...!'; StatusBar1.Refresh;
      if (ftp.Buscar(1)) then c := true;
      ftp.desconectar;
    end;

    if (modulo.Caption = 'Facturación') then begin
      l := utilesarchivos.setListaArchivos(dbs.DirSistema + '\export_reportes\web_facturacion', '*.txt');
      ftp.conectar;
      ftp.getDatos(2);

      if (ftp.__error <> '') then begin
        utiles.msgError(ftp.__error);
        btnIniciar.Enabled := false;
        exit;
      end;

      StatusBar1.Panels[0].Text := 'Verificando Usuarios ...!'; StatusBar1.Refresh;
      procesarUrl(ftp.host + '/remote/verificar_users.aspx');
      StatusBar1.Panels[0].Text := 'Exportando Datos ...!'; StatusBar1.Refresh;
      if (ftp.Buscar(2)) then c := true;
      ftp.desconectar;
    end;

    if (modulo.Caption = 'Resumen Facturación') then begin
      l := utilesarchivos.setListaArchivos(dbs.DirSistema + '\export_reportes\web_resfacturacion', '*.txt');
      ftp.conectar;
      ftp.getDatos(2);

      if (ftp.__error <> '') then begin
        utiles.msgError(ftp.__error);
        btnIniciar.Enabled := false;
        exit;
      end;

      StatusBar1.Panels[0].Text := 'Verificando Usuarios ...!'; StatusBar1.Refresh;
      procesarUrl(ftp.host + '/remote/verificar_users.aspx');
      StatusBar1.Panels[0].Text := 'Exportando Datos ...!'; StatusBar1.Refresh;
      if (ftp.Buscar(2)) then c := true;
      ftp.desconectar;
    end;

    if (modulo.Caption = 'Facturación FTP') then begin
      l := utilesarchivos.setListaArchivos(dbs.DirSistema + '\exportar\ftp', '*.bck');
      ftp.conectar;
      ftp.getDatos(3);

      if (ftp.__error <> '') then begin
        utiles.msgError(ftp.__error);
        btnIniciar.Enabled := false;
        exit;
      end;

      StatusBar1.Panels[0].Text := 'Verificando Usuarios ...!'; StatusBar1.Refresh;
      //procesarUrl(ftp.host + '/remote/verificar_users.aspx');
      StatusBar1.Panels[0].Text := 'Exportando Datos ...!'; StatusBar1.Refresh;
      if (ftp.Buscar(3)) then c := true;
      ftp.desconectar;
    end;

    if (c) then begin
      conectarFTP;
      if IdFTP1.Connected then begin
        StatusBar1.Panels[0].Text := 'Transfiriendo Datos ...!'; StatusBar1.refresh;
        IdFTP1.TransferType := ftBinary;
        for i := 1 to l.Count do Begin
          StatusBar1.Panels[0].Text := 'Transfiriendo ' + ExtractFileName(l.Strings[i-1]) +  ' ...!'; StatusBar1.Refresh;
          IdFTP1.Put(l.Strings[i-1], ExtractFileName(l.Strings[i-1]));
          if (modulo.Caption = 'Distribución') then begin
            id := ExtractFileName(l.Strings[i-1]);
            reporte := id;
            periodo := copy(id, 1, 2) + '-' + copy(id, 3, 4) + '-' + copy(id, 7, 2);
            tipo := 'DI';
            iduser := copy(id, 10, 6);
            StatusBar1.Panels[0].Text := 'Registrando la Entrada ...!'; StatusBar1.Refresh;
            procesarUrl(ftp.host + '/remote/in_reports_distribucion.aspx?id=' + id + chr(38) + 'reporte=' + reporte + chr(38) + 'periodo=' + periodo + chr(38) + 'tipo=' + tipo + chr(38) + 'iduser=' + iduser);
         end;

         if (modulo.Caption = 'Facturación') then begin
            id := ExtractFileName(l.Strings[i-1]);
            reporte := id;
            periodo := copy(id, 1, 2) + '-' + copy(id, 3, 4);
            tipo := 'FA';
            iduser := copy(id, 8, 6);
            StatusBar1.Panels[0].Text := 'Registrando la Entrada ...!'; StatusBar1.Refresh;
            procesarUrl(ftp.host + '/remote/in_reports_distribucion.aspx?id=' + id + chr(38) + 'reporte=' + reporte + chr(38) + 'periodo=' + periodo + chr(38) + 'tipo=' + tipo + chr(38) + 'iduser=' + iduser);
         end;

         if (modulo.Caption = 'Resumen Facturación') then begin
            id := ExtractFileName(l.Strings[i-1]);
            reporte := id;
            periodo := copy(id, 1, 2) + '-' + copy(id, 3, 4);
            tipo := 'RF';
            iduser := copy(id, 8, 6);
            StatusBar1.Panels[0].Text := 'Registrando la Entrada ...!'; StatusBar1.Refresh;
            procesarUrl(ftp.host + '/remote/in_reports_distribucion.aspx?id=' + id + chr(38) + 'reporte=' + reporte + chr(38) + 'periodo=' + periodo + chr(38) + 'tipo=' + tipo + chr(38) + 'iduser=' + iduser);
            {assignfile(x, 'z:\xx.txt');
            rewrite(x);
            writeln(x, ftp.host + '/remote/in_reports_distribucion.aspx?id=' + id + chr(38) + 'reporte=' + reporte + chr(38) + 'periodo=' + periodo + chr(38) + 'tipo=' + tipo + chr(38) + 'iduser=' + iduser);
            closefile(x);}
         end;

         if (modulo.Caption = 'Facturación FTP') then begin
            id := ExtractFileName(l.Strings[i-1]);
            reporte := id;
            periodo := copy(__periodo, 1, 2) + '-' + copy(__periodo, 3, 4);
            tipo := 'FZ';
            iduser := copy(id, 1, 6);
            StatusBar1.Panels[0].Text := 'Registrando la Entrada ...!'; StatusBar1.Refresh;
            try
              procesarUrl(ftp.host + '/remote/in_reports_distribucion.aspx?id=' + id + chr(38) + 'reporte=' + reporte + chr(38) + 'periodo=' + periodo + chr(38) + 'tipo=' + tipo + chr(38) + 'iduser=' + iduser);
            except

            end;

         end;

       end;
       ChageDir(idftp1.RetrieveCurrentDir);
      end;
      desconectarFTP;

    end;
  end;

  if (c = false) then utiles.msgError('Se ha Producido un Error y no se ha Podido Exportar los Datos a la Web ...!');

  Close;
end;

procedure TfmUploadFTP.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  StatusBar1.Panels[0].Width := (Width - (Width div 5));
end;

procedure TfmUploadFTP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmClientHTML.Release; fmClientHTML := nil;
end;

procedure TfmUploadFTP.FormShow(Sender: TObject);
begin
  Application.CreateForm(TfmClientHTML, fmClientHTML);
  fmClientHTML.FormActivate(self);
end;

end.
