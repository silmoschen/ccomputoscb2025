unit CSFTP;

interface

uses
  Windows, SysUtils, Classes;

function SFTPBuscarCliente(const DirSistema: string): string;
function SFTPPuerto(const PuertoTexto: string): Integer;
function SFTPDescargarArchivo(const DirSistema, Host, Usuario, Password, PuertoTexto,
  DirRemoto, NombreArchivo, DirLocal: string): Boolean;
function SFTPDescargarArchivos(const DirSistema, Host, Usuario, Password, PuertoTexto,
  DirRemoto, DirLocal: string; Archivos: TStrings): Integer;

implementation

const
  CREATE_NO_WINDOW = $08000000;

function DirTemp: string;
var
  Buf: array[0..MAX_PATH] of Char;
  n: DWORD;
begin
  n := GetTempPath(SizeOf(Buf), Buf);
  if n = 0 then
    Result := 'C:\TEMP\'
  else
    SetString(Result, Buf, n);
  if (Result <> '') and (Result[Length(Result)] <> '\') then
    Result := Result + '\';
end;

function SFTPPuerto(const PuertoTexto: string): Integer;
begin
  Result := StrToIntDef(Trim(PuertoTexto), 22);
  if Result <= 0 then
    Result := 22;
end;

function UnirRutaRemota(const DirRemoto, NombreArchivo: string): string;
begin
  Result := StringReplace(Trim(DirRemoto), '\', '/', [rfReplaceAll]);
  if Result = '' then
    Result := NombreArchivo
  else begin
    if Result[Length(Result)] <> '/' then
      Result := Result + '/';
    Result := Result + NombreArchivo;
  end;
end;

function SFTPBuscarCliente(const DirSistema: string): string;
var
  Base, Candidato: string;
  i: Integer;
  Rutas: array[1..8] of string;
begin
  Result := '';
  Base := ExtractFilePath(ParamStr(0));
  Rutas[1] := Base + 'tools\putty\PSCP.EXE';
  Rutas[2] := Base + 'tools\putty\pscp.exe';
  if (DirSistema <> '') and (DirSistema[Length(DirSistema)] <> '\') then
    Candidato := DirSistema + '\'
  else
    Candidato := DirSistema;
  Rutas[3] := Candidato + 'tools\putty\PSCP.EXE';
  Rutas[4] := Candidato + 'tools\putty\pscp.exe';
  Rutas[5] := Base + 'tools\PSCP.EXE';
  Rutas[6] := Candidato + 'tools\PSCP.EXE';
  Rutas[7] := Base + 'PSCP.EXE';
  Rutas[8] := Candidato + 'PSCP.EXE';
  for i := 1 to 8 do begin
    Candidato := Rutas[i];
    if FileExists(Candidato) then begin
      Result := Candidato;
      Exit;
    end;
  end;
end;

function EjecutarOculto(const LineaComando: string): Integer;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  Cmd: array[0..4096] of Char;
  Code: DWORD;
begin
  Result := -1;
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_HIDE;
  StrPCopy(Cmd, LineaComando);
  if not CreateProcess(nil, Cmd, nil, nil, False, CREATE_NO_WINDOW, nil, nil, SI, PI) then
    Exit;
  try
    WaitForSingleObject(PI.hProcess, 180000);
    if GetExitCodeProcess(PI.hProcess, Code) then
      Result := Integer(Code);
  finally
    CloseHandle(PI.hThread);
    CloseHandle(PI.hProcess);
  end;
end;

function SFTPDescargarArchivo(const DirSistema, Host, Usuario, Password, PuertoTexto,
  DirRemoto, NombreArchivo, DirLocal: string): Boolean;
var
  Pscp, PwFile, Local, Remoto, Cmd: string;
  F: TextFile;
  Destino: string;
begin
  Result := False;
  Pscp := SFTPBuscarCliente(DirSistema);
  if Pscp = '' then
    Exit;
  if Trim(Host) = '' then
    Exit;
  if Trim(NombreArchivo) = '' then
    Exit;

  Destino := Trim(DirLocal);
  if Destino = '' then
    Exit;
  if Destino[Length(Destino)] <> '\' then
    Destino := Destino + '\';
  if not DirectoryExists(Destino) then
    ForceDirectories(Destino);

  Local := Destino + NombreArchivo;
  Remoto := UnirRutaRemota(DirRemoto, NombreArchivo);
  PwFile := DirTemp + 'sftp_pw_' + IntToStr(GetCurrentProcessId) + '.tmp';

  AssignFile(F, PwFile);
  Rewrite(F);
  try
    Write(F, Password);
  finally
    CloseFile(F);
  end;

  try
    Cmd := 'cmd.exe /c echo y| "' + Pscp + '" -sftp -P ' + IntToStr(SFTPPuerto(PuertoTexto)) +
           ' -pwfile "' + PwFile + '" ' +
           Trim(Usuario) + '@' + Trim(Host) + ':"' + Remoto + '" "' + Local + '"';
    EjecutarOculto(Cmd);
    Result := FileExists(Local);
  finally
    if FileExists(PwFile) then
      DeleteFile(PwFile);
  end;
end;

function SFTPDescargarArchivos(const DirSistema, Host, Usuario, Password, PuertoTexto,
  DirRemoto, DirLocal: string; Archivos: TStrings): Integer;
var
  i: Integer;
begin
  Result := 0;
  if Archivos = nil then
    Exit;
  for i := 0 to Archivos.Count - 1 do
    if SFTPDescargarArchivo(DirSistema, Host, Usuario, Password, PuertoTexto,
      DirRemoto, Archivos[i], DirLocal) then
      Inc(Result);
end;

end.
