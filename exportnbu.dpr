program exportnbu;

uses
  Forms,
  exportar_nbu in 'exportar_nbu.pas' {fmExportarNBU},
  actualiza in 'padron online pami\actualiza.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmExportarNBU, fmExportarNBU);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
