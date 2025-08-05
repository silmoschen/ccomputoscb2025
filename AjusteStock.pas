unit AjusteStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Editv, ExtCtrls, CUtiles, CInsumos_Centrobioq;

type
  TfmAjusteStock = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    tipoper: TEditValid;
    cantidad: TEditValid;
    Label3: TLabel;
    codart: TLabel;
    descrip: TLabel;
    Label6: TLabel;
    existencia: TLabel;
    procedure tipoperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cantidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAjusteStock: TfmAjusteStock;

implementation

{$R *.dfm}

procedure TfmAjusteStock.tipoperKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (tipoper.Text = '1') or (tipoper.Text = '2') then cantidad.SetFocus else
    utiles.msgError('Las Opciones son: 1. Agregar / 2. Quitar del Stock ...!');
end;

procedure TfmAjusteStock.cantidadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then tipoper.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(cantidad.Text)) > 0 then Begin
      cantidad.Text := utiles.FormatearNumero(cantidad.Text);
      if tipoper.Text = '1' then insumo.AgregarStock(codart.Caption, StrToFloat(cantidad.Text));
      if tipoper.Text = '2' then insumo.QuitarStock(codart.Caption, StrToFloat(cantidad.Text));
      insumo.BuscarPorDescrip(descrip.Caption);
      Close;
    end;
end;

end.
