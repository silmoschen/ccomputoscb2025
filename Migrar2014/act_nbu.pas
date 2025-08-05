unit act_nbu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, CBDT, CIDBFM, CUtiles;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  tabla1, tabla2: TTable;
  cod: string;
begin
  ListBox1.Clear;
  tabla1 := datosdb.openDB('nbu-pmo.dbf', '', '', '');
  tabla2 := datosdb.openDB('nbu', '', '', dbs.baseDat);
  tabla2.Open;
  tabla1.open;
  while not tabla1.eof do begin
    if (length(trim(tabla1.FieldByName('codigo').Asstring)) = 6) then cod := tabla1.FieldByName('codigo').Asstring else begin
      cod := '66' + utiles.sLlenarIzquierda(tabla1.FieldByName('codigo').Asstring, 4, '0');
    end;
    ListBox1.Items.Add(cod);

    if (tabla2.FindKey([cod])) then tabla2.edit else tabla2.Append;
    tabla2.FieldByName('codigo').Asstring := cod;
    tabla2.FieldByName('descrip').Asstring := tabla1.FieldByName('descrip').Asstring;
    tabla2.FieldByName('unidad').asfloat := tabla1.FieldByName('unidad').asfloat;
    tabla2.Post;

    tabla1.Next;
  end;



  tabla1.Close;
  tabla2.Close;
  close;

end;

end.
