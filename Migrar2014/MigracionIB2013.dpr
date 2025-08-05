program MigracionIB2013;

uses
  Forms,
  FormMigrar2013 in 'FormMigrar2013.pas' {Form1},
  CUtilidadesArchivos in '..\..\..\CLASES\CUtilidadesArchivos.pas',
  backup in '..\..\..\Varios\Backup\backup.pas',
  comodines in '..\..\..\Varios\Backup\comodines.pas' {fmAgregarArchivos},
  Lzrw1kh in '..\..\..\Varios\Backup\Lzrw1kh.pas',
  Selectarchivos in '..\..\..\Varios\Backup\Selectarchivos.pas' {fmSeleArchivos},
  Unit1 in '..\..\..\Varios\Backup\Unit1.pas' {fmBackup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.CreateForm(TfmAgregarArchivos, fmAgregarArchivos);
  Application.CreateForm(TfmSeleArchivos, fmSeleArchivos);
  Application.CreateForm(TfmBackup, fmBackup);
  Application.Run;
end.
