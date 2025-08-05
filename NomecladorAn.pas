unit NomecladorAn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, DBCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, Editv;

type
  TfmNomeclador = class(TForm)
    StatusBar1: TStatusBar;
    DTS: TDataSource;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    descripc: TLabel;
    trie: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    destoma: TLabel;
    codigo: TMaskEdit;
    descrip: TMaskEdit;
    gastos: TEditValid;
    ub: TEditValid;
    codfact: TMaskEdit;
    buscarCodigo: TBitBtn;
    rie: TCheckBox;
    cftoma: TMaskEdit;
    buscarCod: TBitBtn;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;

    procedure codigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure descripKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AltaClick(Sender: TObject);
    procedure BajaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure DeshacerClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure gastosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codfactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rieClick(Sender: TObject);
    procedure rieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cftomaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CargarDatos;
    procedure DatosFact;
    procedure DatosToma;
  public
    { Public declarations }
    NoCerrarFinal: boolean;
  end;

var
  fmNomeclador: TfmNomeclador;

implementation

uses CNomeclaCCB, CObrasSociales, CUtiles, CPlantAnalisis, ImgForms;

{$R *.DFM}

procedure TfmNomeclador.CargarDatos;
begin
  nomeclatura.getDatos(codigo.Text);
  codfact.Text := nomeclatura.codfact;
  cftoma.Text  := nomeclatura.cftoma;
  descrip.Text := nomeclatura.Descrip;
  gastos.Text  := utiles.FormatearNumero(FloatToStr(nomeclatura.gastos));
  ub.Text      := utiles.FormatearNumero(FloatToStr(nomeclatura.ub));
  if nomeclatura.RIE = '*' then rie.Checked := True else rie.Checked := False;
  DatosFact;
  DatosToma;
end;

procedure TfmNomeclador.DatosFact;
begin
  nomeclatura.getDatos(codfact.Text);
  descripc.Caption := nomeclatura.Descrip;
  nomeclatura.Buscar(codigo.Text);
end;

procedure TfmNomeclador.DatosToma;
begin
  nomeclatura.getDatos(cftoma.Text);
  destoma.Caption := nomeclatura.Descrip;
  nomeclatura.Buscar(codigo.Text);
end;

procedure TfmNomeclador.codigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then                               {Edita y Da de Alta Registro ...}
    begin
      utiles.LlenarIzquierda(codigo, 4, '0');
      if nomeclatura.Buscar(codigo.Text) then
        begin
          CargarDatos;
          StatusBar1.Panels[0].Text := '';
          ActiveControl := descrip;
        end
      else
        if utiles.DarDeAlta('Cód. de Nomeclatura ' + codigo.Text) then
          begin
            CargarDatos;
            StatusBar1.Panels[0].Text := '';
            ActiveControl := descrip;
          end;
    end;
end;

procedure TfmNomeclador.descripKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codigo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(descrip.Text)) > 0 then ActiveControl := codfact;
end;

procedure TfmNomeclador.AltaClick(Sender: TObject);
begin
  codigo.Text := utiles.sLlenarIzquierda(nomeclatura.Nuevo, 4, '0');
  ActiveControl := codigo;
end;

procedure TfmNomeclador.BajaClick(Sender: TObject);
begin
  if utiles.BajaRegistro('Seguro que desea Eliminar Cód. de Nomeclatura ' + codigo.Text) then Begin
    nomeclatura.Borrar(codigo.Text);
    codigo.Text := nomeclatura.Codigo;
    CargarDatos;
  end;
  ActiveControl := codigo;
end;

procedure TfmNomeclador.ModificarClick(Sender: TObject);
begin
  ActiveControl := codigo;
end;

procedure TfmNomeclador.DeshacerClick(Sender: TObject);
begin
  ActiveControl := codigo;
end;

procedure TfmNomeclador.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmNomeclador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.Free;
  if not NoCerrarFinal then Begin
    Release; fmNomeclador := nil;
  end;
end;

procedure TfmNomeclador.DBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  codigo.Text := nomeclatura.tabla.FieldByName('codigo').AsString;
  CargarDatos;
end;

procedure TfmNomeclador.gastosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codfact;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if Length(Trim(gastos.Text)) > 0 then
     begin
       gastos.Text := utiles.FormatearNumero(gastos.Text);
       ActiveControl := ub;
     end;
end;

procedure TfmNomeclador.ubKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := gastos;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if (Length(Trim(codigo.Text)) > 0) and (Length(Trim(descrip.Text)) > 0) then Begin
      ub.Text := utiles.FormatearNumero(ub.Text);
      nomeclatura.Grabar(codigo.Text, codfact.Text, descrip.Text, cftoma.Text, StrToFloat(gastos.Text), StrToFloat(ub.Text));
      ActiveControl := RIE;
    end else utiles.msgError('No se suministraron suficientes datos ...!');
end;

procedure TfmNomeclador.codfactKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := descrip;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(codfact.Text)) = 0 then ActiveControl := cftoma else Begin
      if not nomeclatura.Buscar(codfact.Text) then Begin
        ActiveControl := cftoma;
      end else Begin
        DatosFact;
        ActiveControl := cftoma;
      end;
    end;
end;

procedure TfmNomeclador.rieClick(Sender: TObject);
begin
  if rie.Checked then nomeclatura.EstablecerRIE(codigo.Text) else nomeclatura.QuitarRIE(codigo.Text);
end;

procedure TfmNomeclador.rieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if not NoCerrarFinal then ActiveControl := codigo else Close;
end;

procedure TfmNomeclador.cftomaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codfact;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(codfact.Text)) = 0 then ActiveControl := gastos else Begin
      if not nomeclatura.Buscar(codfact.Text) then Begin
        ActiveControl := gastos;
      end else Begin
        DatosFact;
        ActiveControl := gastos;
      end;
    end;
end;

procedure TfmNomeclador.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
  DTS.DataSet := nomeclatura.tabla;
  if Length(Trim(codigo.Text)) > 0 then Begin
    CargarDatos;
    ActiveControl := descrip;
  end else ActiveControl := codigo;
end;

procedure TfmNomeclador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
