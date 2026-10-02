// ************************************************************************ //
// Cliente SOAP Delphi 7 de este middleware (evaluaciones-api).
// Operaciones: test, obtUltNum, facturar, getTiposCbte, getTiposIva, getTiposDoc.
// WSAA lo hace el servidor. No hay login ni token/sign.
// ************************************************************************ //

unit facturaService3;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  defWSDL = 'https://evaluaciones-api.innovarecode.com/arpsoa/ws/facturaService?wsdl';
  defURL  = 'https://evaluaciones-api.innovarecode.com/arpsoa/ws/facturaService';
  defSvc  = 'FacturaServicesImplService';
  defPrt  = 'FacturaServicesImplPort';

type
  alicIva              = class;                 { "http://services.arpsoa.com.ar/" }
  cbteAsoc             = class;                 { "http://services.arpsoa.com.ar/" }
  ivaTipo              = class;                 { "http://services.arpsoa.com.ar/" }
  docTipo              = class;                 { "http://services.arpsoa.com.ar/" }
  cbteTipo             = class;                 { "http://services.arpsoa.com.ar/" }
  tributo              = class;                 { "http://services.arpsoa.com.ar/" }

  alicIva = class(TRemotable)
  private
    FbaseImp: Double;
    Fid: Integer;
    Fimporte: Double;
  published
    property baseImp: Double read FbaseImp write FbaseImp;
    property id: Integer read Fid write Fid;
    property importe: Double read Fimporte write Fimporte;
  end;

  cbteAsoc = class(TRemotable)
  private
    Fnro: Int64;
    FptoVta: Integer;
    Ftipo: Integer;
  published
    property nro: Int64 read Fnro write Fnro;
    property ptoVta: Integer read FptoVta write FptoVta;
    property tipo: Integer read Ftipo write Ftipo;
  end;

  ivaTipo = class(TRemotable)
  private
    Fdesc: WideString;
    FfchDesde: WideString;
    FfchHasta: WideString;
    Fid: WideString;
  published
    property desc: WideString read Fdesc write Fdesc;
    property fchDesde: WideString read FfchDesde write FfchDesde;
    property fchHasta: WideString read FfchHasta write FfchHasta;
    property id: WideString read Fid write Fid;
  end;

  docTipo = class(TRemotable)
  private
    Fdesc: WideString;
    FfchDesde: WideString;
    FfchHasta: WideString;
    Fid: Integer;
  published
    property desc: WideString read Fdesc write Fdesc;
    property fchDesde: WideString read FfchDesde write FfchDesde;
    property fchHasta: WideString read FfchHasta write FfchHasta;
    property id: Integer read Fid write Fid;
  end;

  cbteTipo = class(TRemotable)
  private
    Fdesc: WideString;
    FfchDesde: WideString;
    FfchHasta: WideString;
    Fid: Integer;
  published
    property desc: WideString read Fdesc write Fdesc;
    property fchDesde: WideString read FfchDesde write FfchDesde;
    property fchHasta: WideString read FfchHasta write FfchHasta;
    property id: Integer read Fid write Fid;
  end;

  tributo = class(TRemotable)
  private
    Falic: Double;
    FbaseImp: Double;
    Fdesc: WideString;
    Fid: Smallint;
    Fimporte: Double;
  published
    property alic: Double read Falic write Falic;
    property baseImp: Double read FbaseImp write FbaseImp;
    property desc: WideString read Fdesc write Fdesc;
    property id: Smallint read Fid write Fid;
    property importe: Double read Fimporte write Fimporte;
  end;

  cbteTipoArray = array of cbteTipo;
  ivaTipoArray = array of ivaTipo;
  docTipoArray = array of docTipo;
  alicIvaArray = array of alicIva;
  tributoArray = array of tributo;
  cbteAsocArray = array of cbteAsoc;
  anyTypeArray = array of Variant;

  FacturaService = interface(IInvokable)
  ['{B8E1A4C2-7D53-4F0A-91B6-3C9E5D2A8F17}']
    function  test(const cuit: Int64): WideString; stdcall;
    function  obtUltNum(const cuit: Int64; const ptoVenta: Integer; const tipo: Integer): Integer; stdcall;
    function  facturar(const cuit: Int64; const concepto: Integer; const ptoVenta: Integer; const cbteTipo: Integer; const tipoDoc: Integer; const nroDoc: Int64; const nroDesde: Integer; const nroHasta: Integer;
                       const fecha: WideString; const fechaServiciodesde: WideString; const fechaServicioHasta: WideString; const fechaServicioVenc: WideString; const impNeto: Double; const idMoneda: WideString; const cotizMoneda: Integer; const alicuotas: alicIvaArray; const tributos: tributoArray;
                       const ivas: cbteAsocArray; const condicionIvaReceptor: Integer; const cbu: WideString; const aliasCbu: WideString; const transferencia: WideString; const anulacion: WideString): anyTypeArray; stdcall;
    function  getTiposCbte(const cuit: Int64): cbteTipoArray; stdcall;
    function  getTiposIva(const cuit: Int64): ivaTipoArray; stdcall;
    function  getTiposDoc(const cuit: Int64): docTipoArray; stdcall;
  end;

function GetFacturaService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): FacturaService;

implementation

function GetFacturaService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): FacturaService;
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as FacturaService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(FacturaService), 'http://services.arpsoa.com.ar/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FacturaService), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(FacturaService), [ioDocument]);
  RemClassRegistry.RegisterXSClass(alicIva, 'http://services.arpsoa.com.ar/', 'alicIva');
  RemClassRegistry.RegisterXSClass(cbteAsoc, 'http://services.arpsoa.com.ar/', 'cbteAsoc');
  RemClassRegistry.RegisterXSClass(ivaTipo, 'http://services.arpsoa.com.ar/', 'ivaTipo');
  RemClassRegistry.RegisterXSClass(docTipo, 'http://services.arpsoa.com.ar/', 'docTipo');
  RemClassRegistry.RegisterXSClass(cbteTipo, 'http://services.arpsoa.com.ar/', 'cbteTipo');
  RemClassRegistry.RegisterXSClass(tributo, 'http://services.arpsoa.com.ar/', 'tributo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(cbteTipoArray), 'http://services.arpsoa.com.ar/', 'cbteTipoArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ivaTipoArray), 'http://services.arpsoa.com.ar/', 'ivaTipoArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(docTipoArray), 'http://services.arpsoa.com.ar/', 'docTipoArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(alicIvaArray), 'http://services.arpsoa.com.ar/', 'alicIvaArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tributoArray), 'http://services.arpsoa.com.ar/', 'tributoArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(cbteAsocArray), 'http://services.arpsoa.com.ar/', 'cbteAsocArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(anyTypeArray), 'http://jaxb.dev.java.net/array', 'anyTypeArray');

end.
