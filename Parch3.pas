unit Parch3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CIDBFM, CBDT, StdCtrls, DBTables, CUtiles;

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
  s, a, b, c: string;
begin
  button1.Caption := 'Trabajando, Espere ...!';
  dbs.NuevaBaseDeDatos('auditoriasj', 'sysdba', 'masterkey');
  t := datosdb.openDB('cab_auditoria', '', '', dbs.baseDat_N);
  t.Open;
  while not t.Eof do begin
    t.Edit;
    if copy(t.fieldbyname('fecha').AsString, 1, 4) <> '2007' then Begin
      s := '2008' + copy(t.fieldbyname('fecha').AsString, 5, 4);
      t.fieldbyname('fecha').AsString := s;
    end;

    if Length(Trim(t.fieldbyname('federivacion').AsString)) = 8 then Begin
      if copy(t.fieldbyname('federivacion').AsString, 1, 4) <> '2007' then Begin
         a := '2008' + copy(t.fieldbyname('federivacion').AsString, 5, 4);
        t.fieldbyname('federivacion').AsString := a;
      end;
    end;

    if Length(Trim(t.fieldbyname('fechafac').AsString)) = 8 then Begin
      if copy(t.fieldbyname('fechafac').AsString, 1, 4) <> '2007' then Begin
        b := '2008' + copy(t.fieldbyname('fechafac').AsString, 5, 4);
        t.fieldbyname('fechafac').AsString := b;
      end;
    end;

    if Length(Trim(t.fieldbyname('fepedido').AsString)) = 8 then Begin
      if copy(t.fieldbyname('fepedido').AsString, 1, 4) <> '2007' then Begin
        c := '2008' + copy(t.fieldbyname('fepedido').AsString, 5, 4);
        t.fieldbyname('fepedido').AsString := c;
      end;
    end;

    t.Post;

    t.Next;
  end;
  datosdb.closeDB(t);
  button1.Caption := 'Trabajo Realizado ...!';
end;

end.
