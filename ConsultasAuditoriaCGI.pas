unit ConsultasAuditoriaCGI;

interface

uses
  SysUtils, Classes, HTTPApp, CAuditoriaCCB, CObrasSocialesCCB, CUtiles,
  DBTables;

type
  TWM = class(TWebModule)
    procedure WMInicioAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WMConsultaAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    r: TQuery;
    f: Boolean;
  public
    { Public declarations }
  end;

var
  WM: TWM;

implementation

{$R *.DFM}

procedure TWM.WMInicioAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html><head><title>Consulta Ordenes Auditadas</title></head><body>' +
                      '<h1>Consulta de Ordenes Auditadas.</h1><hr>';
  Response.Content := Response.Content +
                      '<a href="consultarordenes.exe/consulta">Consultar</a>';

  Response.Content := Response.Content +
                      '</tr></td>' +
                      '</body></html>';
end;

procedure TWM.WMConsultaAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html><head><title>Consulta Ordenes Auditadas</title></head><body>' +
                      '<h1>Consulta de Ordenes Auditadas.</h1><hr>' +
                      '<table width=100%><tr>' +
                      '<td width=60%><tr>' +
                      'Obra Social:' +
                      '<select name = "obsocial" size=1>';

                      r := obsocial.setObrasSocialesCapitadas;
                      r.Open; f := False;
                      while not r.Eof do Begin
                        if f then Response.Content := Response.Content + '<option>' + r.FieldByName('codos').AsString + ' - ' + r.FieldByName('nombre').AsString + '</option>' else
                          Response.Content := Response.Content + '<option selected>' + r.FieldByName('codos').AsString + ' - ' + r.FieldByName('nombre').AsString + '</option>';
                        f := True;
                        r.Next;
                      end;
                      r.Close;


  Response.Content := Response.Content + '</select>';

  Response.Content := Response.Content +
                      '</tr></td>' +
                      '</body></html>';
end;

end.
