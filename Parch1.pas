unit Parch1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CBDT,
  Db, DBTables, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Table1: TTable;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Table2: TTable;
    Table1Periodo: TStringField;
    Table1Idprof: TStringField;
    Table1Codos: TStringField;
    Table1Items: TStringField;
    Table1Orden: TStringField;
    Table1Codpac: TStringField;
    Table1Nombre: TStringField;
    Table1Codanalisis: TStringField;
    Table1N: TStringField;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  table2.databasename := edit1.text;
  table2.open;
  table1.databasename := edit1.text;
  table1.open;
end;

procedure TForm1.Table1CalcFields(DataSet: TDataSet);
begin
  Table2.SetKey;
  table2.FieldByName('idprof').AsString := table1.FieldByName('idprof').AsString;
  table2.FieldByName('codpac').AsString := table1.FieldByName('codpac').AsString;
  if table2.gotokey then Table1.FieldByName('N').AsString := table2.FieldByName('nombre').AsString;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  table1.first;
  while not table1.eof do Begin
    table1.edit;
    table1.fieldbyname('nombre').asstring := table1.Fieldbyname('n').AsString;
    table1.post;
    table1.Next;
  end;

end;

end.
