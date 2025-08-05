unit Pach4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, StdCtrls, CIDBFM;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  t: TTable;
  c, l: String;
  a: TextFile;

begin
  t := datosdb.openDB('nbu', '');
  t.Open;
  AssignFile(a, 'nbu3.prn');
  reset(a);
  while not eof(a) do Begin
    readln(a, l);
    c := '66' + Copy(l, 4, 4);
    if t.FindKey([c]) then t.Edit else t.Append;
    t.FieldByName('codigo').AsString  := c;
    t.FieldByName('descrip').AsString := Copy(l, 9, 75);
    t.FieldByName('unidad').AsString := Trim(Copy(l, 103, 6));
    t.Post;
    caption := c + '   ' + Copy(l, 9, 75) + '  ' + Trim(Copy(l, 106, 3));
  end;
  datosdb.closeDB(t);
  button1.caption := 'listo';
end;

end.
