unit CIntegridadReferencial;

interface

uses SysUtils, CFacturacionCCB;

type

TTIntegridadReferencial = class(TObject)            // Superclase
 public
  { Declaraciones Públicas }
  constructor Create; virtual;
  destructor  Destroy; override; 

  function   verificarEfector(xidprof: string): boolean;
  function   verificarObraSocial(xcodos: string): boolean;
  function   verificarDeterminacion(xcodigo: string): boolean;

 private
  { Declaraciones Privadas }
end;

function verificarIntegridad: TTIntegridadReferencial;

implementation

var
  xverificarIntegridad: TTIntegridadReferencial = nil;

constructor TTIntegridadReferencial.Create;
begin
  inherited create;
end;

destructor TTIntegridadReferencial.Destroy;
begin
  inherited Destroy;
end;


function TTIntegridadReferencial.verificarEfector(xidprof: string): boolean;
begin
  result := facturacion.verificarEfector(xidprof);
end;

function TTIntegridadReferencial.verificarObraSocial(xcodos: string): boolean;
begin
  result := facturacion.verificarObraSocial(xcodos);
end;

function TTIntegridadReferencial.verificarDeterminacion(xcodigo: string): boolean;
begin
  result := facturacion.verificarObraSocial(xcodigo);
end;

{===============================================================================}

function verificarIntegridad: TTIntegridadReferencial;
begin
  if xverificarIntegridad = nil then
    xverificarIntegridad := TTIntegridadReferencial.Create();
  Result := xverificarIntegridad;
end;

{===============================================================================}

initialization

finalization
  xverificarIntegridad.Free;

end.
