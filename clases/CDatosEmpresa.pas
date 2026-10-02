unit CDatosEmpresa;

interface

uses SysUtils, DB, DBTables, CUtiles, CIDBFM, CBDT;

type

TTDatosEmpresa = class(TObject)            // Superclase
  id, rsocial, direccion, telefono, cuit, ptovta, tipo, inicioactividad, cbu: string;
  tabla: TTable;
 public
  { Declaraciones Pùblicas }
  constructor Create;
  destructor  Destroy;

  procedure   Grabar(xrsocial, xdireccion, xtelefono, xcuit, xptovta, xtipo, xinicioactividad, xcbu: string);
  function    Buscar: boolean;
  procedure   getDatos;

  procedure   conectar;
  procedure   desconectar;
 private
  { Declaraciones Privadas }
end;

function empresa: TTDatosEmpresa;

implementation

var
  xempresa: TTDatosEmpresa = nil;

constructor TTDatosEmpresa.Create;
begin
  inherited Create;
  tabla := datosdb.openDB('datosempresa', 'id');
  conectar;
end;

destructor TTDatosEmpresa.Destroy;
begin
  inherited Destroy;
end;

procedure TTDatosEmpresa.Grabar(xrsocial, xdireccion, xtelefono, xcuit, xptovta, xtipo, xinicioactividad, xcbu: string);
// Objetivo...: Grabar Atributos del Objeto
begin
  if Buscar then tabla.Edit else tabla.Append;
  tabla.FieldByName('rsocial').AsString         := TrimLeft(xrsocial);
  tabla.FieldByName('direccion').AsString       := TrimLeft(xdireccion);
  tabla.FieldByName('telefono').AsString        := TrimLeft(xtelefono);
  tabla.FieldByName('cuit').AsString            := TrimLeft(xcuit);
  tabla.FieldByName('ptovta').AsString          := Trim(xptovta);
  tabla.FieldByName('tipo').AsString            := Trim(xtipo);
  tabla.FieldByName('inicioactividad').AsString := Trim(xinicioactividad);
  if datosdb.verificarSiExisteCampo(tabla, 'cbu') then
    tabla.FieldByName('cbu').AsString           := Trim(xcbu);
  try
    tabla.Post
  except
    tabla.Cancel
  end;
end;

function TTDatosEmpresa.Buscar: boolean;
// Objetivo...: Buscar el Objeto solicitado
begin
 result := datosdb.Buscar(tabla, 'id', '1');
end;

procedure  TTDatosEmpresa.getDatos;
// Objetivo...: Retornar/Iniciar Atributos
begin
  if Buscar then Begin
    rsocial     := tabla.FieldByName('rsocial').AsString;
    direccion   := tabla.FieldByName('direccion').AsString;
    telefono    := tabla.FieldByName('telefono').AsString;
    cuit        := tabla.FieldByName('cuit').AsString;
    ptovta      := tabla.FieldByName('ptovta').AsString;
    tipo        := tabla.FieldByName('tipo').AsString;
    inicioactividad := tabla.FieldByName('inicioactividad').AsString;
    if datosdb.verificarSiExisteCampo(tabla, 'cbu') then
      cbu := tabla.FieldByName('cbu').AsString
    else
      cbu := '';
  end else begin
    rsocial := ''; direccion := ''; telefono := ''; cuit := ''; ptovta := ''; tipo := ''; inicioactividad := ''; cbu := '';
  end;
end;

procedure TTDatosEmpresa.conectar;
// Objetivo...: conectar tablas de persistencia
var
  q: TQuery;
  alias: string;
begin
  if not tabla.Active then tabla.Open;
  tabla.FieldDefs.Update;
  if datosdb.verificarSiExisteCampo(tabla, 'cbu') then Exit;

  alias := tabla.DatabaseName;
  tabla.Close;
  q := TQuery.Create(nil);
  try
    q.DatabaseName := alias;
    q.SQL.Add('ALTER TABLE datosempresa ADD cbu CHAR(50)');
    try
      q.ExecSQL;
    except
      on E: Exception do utiles.msgError(E.Message);
    end;
  finally
    q.Free;
  end;
  if not tabla.Active then tabla.Open;
end;

procedure TTDatosEmpresa.desconectar;
// Objetivo...: cerrar tablas de persistencia
begin
  datosdb.closeDB(tabla);
end;

{===============================================================================}

function empresa: TTDatosEmpresa;
begin
  if xempresa = nil then
    xempresa := TTDatosEmpresa.Create;
  Result := xempresa;
end;

{===============================================================================}

initialization

finalization
  xempresa.Free;

end.
