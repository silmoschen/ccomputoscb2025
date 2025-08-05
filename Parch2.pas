unit Parch2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Table1: TTable;
    Table2: TTable;
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
  i: Integer;
begin
  i := 0;
  table1.DatabaseName := edit1.Text;
  table1.TableName := 'cab_auditoria';
  table1.Open;

  while not table1.Eof do Begin
    Inc(i);
    Caption := inttostr(i) + ' de ' + inttostr(table1.RecordCount);
    if DirectoryExists(edit1.Text + '\obsoc_pad\' + table1.FieldByName('codos').AsString) then Begin
    table2.DatabaseName := edit1.Text + '\obsoc_pad\' + table1.FieldByName('codos').AsString;
    table2.TableName := 'bioqafil';
    table2.Open;
    table2.SetKey;
    table2.FieldByName('codos').AsString := table1.FieldByName('codos').AsString;
    table2.FieldByName('nrodoc').AsString := table1.FieldByName('nrodoc').AsString;
    if table2.GotoKey then Begin
      table1.Edit;
      table1.FieldByName('nombre').AsString := table2.FieldByName('nombre').AsString;
      table1.Post;
    end;
    table2.Close;
    end;
    table1.Next;
    //if i = 100 then Break;
  end;
  table1.Close;
end;

end.
