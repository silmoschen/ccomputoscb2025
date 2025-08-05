program NominaDePacientes;

uses
  Forms,
  NominaPacientes in 'NominaPacientes.pas' {fmListPacientes},
  FichaPaciente in 'FichaPaciente.pas' {fmFichaPacientes},
  ImgForms in '..\..\Interfases\ImgForms.pas' {contenedorImg},
  CPacienteCCB in '..\..\CLASES\CPacienteCCB.pas',
  CIDBFM in '..\..\CLASES\CIDBFM.pas',
  NominaDeProfesionales in 'NominaDeProfesionales.pas' {fmListProfesionales},
  CProfesionalCCB in '..\..\CLASES\CProfesionalCCB.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmListPacientes, fmListPacientes);
  Application.CreateForm(TcontenedorImg, contenedorImg);
  Application.CreateForm(TfmListProfesionales, fmListProfesionales);
  Application.Run;
end.
