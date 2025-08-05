unit ParametrosPlanctas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, DB, DBTables,
  StdCtrls, Forms, DBCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TfmParametrosPlanctas = class(TForm)
    ScrollBox: TScrollBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    cerrar: TBitBtn;
    activo1: TMaskEdit;
    activo2: TMaskEdit;
    activo3: TMaskEdit;
    activo4: TMaskEdit;
    activo5: TMaskEdit;
    imputable1: TMaskEdit;
    imputable2: TMaskEdit;
    imputable3: TMaskEdit;
    imputable4: TMaskEdit;
    imputable5: TMaskEdit;
    dn1: TMaskEdit;
    dn2: TMaskEdit;
    dn3: TMaskEdit;
    dn4: TMaskEdit;
    dn5: TMaskEdit;
    Label18: TLabel;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    aplicar: TBitBtn;
    GroupBox4: TGroupBox;
    codctaref: TLabel;
    cuentaref: TLabel;
    separador: TMaskEdit;
    activo: TMaskEdit;
    pasivo: TMaskEdit;
    patneto: TMaskEdit;
    ganancias: TMaskEdit;
    perdidas: TMaskEdit;
    selcuentapatrimonial: TCheckBox;
    cuenta: TComboBox;
    codcta: TComboBox;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    codctaarea: TComboBox;
    cuentaarea: TComboBox;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    ctaref: TComboBox;
    codcref: TComboBox;
    GroupBox7: TGroupBox;
    cuentapi: TComboBox;
    codctapi: TComboBox;
    cuentacap: TComboBox;
    codctacap: TComboBox;
    Label24: TLabel;
    procedure aplicarClick(Sender: TObject);
    procedure activo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure activo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure activo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure activo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure activo5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imputable1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imputable2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imputable3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imputable4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imputable5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure separadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dn3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dn4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dn5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure activoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pasivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure patnetoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gananciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure perdidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure selcuentapatrimonialClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cuentaChange(Sender: TObject);
    procedure cuentaareaChange(Sender: TObject);
    procedure ctarefChange(Sender: TObject);
    procedure cuentapiChange(Sender: TObject);
    procedure cuentacapChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    SalirCerrando: boolean;
  end;

var
  fmParametrosPlanctas: TfmParametrosPlanctas;

implementation

uses CPlanctasAsociacion, CUtiles;

{$R *.DFM}

procedure TfmParametrosPlanctas.aplicarClick(Sender: TObject);
var
  x: byte;
begin
  {Actulizamos los seteos fijados en los Niveles}
  For x := 1 to 5 do
    begin
      Case x of
        1: planctas.GrabarParam(x, dn1.Text, activo1.Text, imputable1.Text);
        2: planctas.GrabarParam(x, dn2.Text, activo2.Text, imputable2.Text);
        3: planctas.GrabarParam(x, dn3.Text, activo3.Text, imputable3.Text);
        4: planctas.GrabarParam(x, dn4.Text, activo4.Text, imputable4.Text);
        5: planctas.GrabarParam(x, dn5.Text, activo5.Text, imputable5.Text);
      end;
    end;
  planctas.Grabar(activo.Text, pasivo.Text, patneto.Text, ganancias.Text, perdidas.Text, codctaref.Caption, codctaarea.Text, codcref.Text);
  planctas.GrabarSep(separador.Text, StrToInt(ganancias.Text), StrToInt(ganancias.Text));
  cuenta.Enabled := False;
  ActiveControl := Cerrar;
end;

procedure TfmParametrosPlanctas.activo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(activo1.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := activo2;
end;

procedure TfmParametrosPlanctas.activo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo1;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(activo2.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := activo3;
end;

procedure TfmParametrosPlanctas.activo3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo2;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(activo3.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := activo4;
end;

procedure TfmParametrosPlanctas.activo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo3;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(activo4.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := activo5;
end;

procedure TfmParametrosPlanctas.activo5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo4;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(activo5.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := imputable1;
end;

procedure TfmParametrosPlanctas.imputable1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo5;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(imputable1.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := imputable2;
end;

procedure TfmParametrosPlanctas.imputable2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := imputable1;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(imputable2.text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := imputable3;
end;

procedure TfmParametrosPlanctas.imputable3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := imputable2;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(imputable2.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := imputable4;
end;

procedure TfmParametrosPlanctas.imputable4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := imputable4;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(imputable4.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := imputable5;
end;

procedure TfmParametrosPlanctas.imputable5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := imputable4;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if (utiles.sionoct(string(imputable5.Text), 'SN', 'Los posibles Valores son S - N ...!')) then ActiveControl := dn1;
end;

procedure TfmParametrosPlanctas.separadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := dn5;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := activo;
end;

procedure TfmParametrosPlanctas.dn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := imputable5;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := dn2;
end;

procedure TfmParametrosPlanctas.dn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := dn1;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := dn3;
end;

procedure TfmParametrosPlanctas.dn3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := dn2;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := dn4;
end;

procedure TfmParametrosPlanctas.dn4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := dn3;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := dn5;
end;

procedure TfmParametrosPlanctas.dn5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := dn4;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := separador;
end;

procedure TfmParametrosPlanctas.activoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := aplicar;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := pasivo;
end;

procedure TfmParametrosPlanctas.pasivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := activo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := patneto;
end;

procedure TfmParametrosPlanctas.patnetoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := pasivo;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := ganancias;
end;

procedure TfmParametrosPlanctas.gananciasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := patneto;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := perdidas;
end;

procedure TfmParametrosPlanctas.perdidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := ganancias;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := selcuentapatrimonial;
end;


procedure TfmParametrosPlanctas.selcuentapatrimonialClick(Sender: TObject);
var
  t: TQuery;
begin
  //Filtramos solo las cuentas del Patrimonio Neto
  //Si no se definió el digito de las Cuentas Patrimoniales emitimos un mensaje de error
  if selcuentapatrimonial.Checked then Begin
    cuenta.Enabled := True;
    if Length(Trim(patneto.Text)) = 0 then utiles.msgError('No se Definió Dígito para las Cuentas del Patrimonio Neto ...!') else Begin
      t := planctas.ctasPatrimoniales(patneto.Text);
      t.Open; cuenta.Items.Clear; codcta.Items.Clear;
      while not t.Eof do Begin
        cuenta.Items.Add(t.FieldByName('cuenta').AsString);
        codcta.Items.Add(t.FieldByName('codcta').AsString);
        t.Next;
      end;
      t.Close; t.Free;
      if Length(Trim(codctaref.Caption)) > 0 then planctas.Buscar(codctaref.Caption);
      codctaref.Caption := planctas.planctas.FieldByName('codcta').AsString;
      planctas.getDatos(codctaref.Caption);
      cuentaref.Caption := Copy(planctas.Cuenta, 1, 20);
    end;
  end;
end;

procedure TfmParametrosPlanctas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  planctas.desconectar;
end;

procedure TfmParametrosPlanctas.cerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmParametrosPlanctas.FormShow(Sender: TObject);
var
  t: TQuery;
  c, r, m: String;
begin
  Left := StrToInt(FormatFloat('####', (Screen.DesktopWidth / 2) - (Width / 2)));
  planctas.conectar;

  t := planctas.setParam;
  t.Open; t.First;

  t.First;
  while not t.EOF do
    begin
      Case t.FieldByName('NIVEL').Value of
      1: begin
           planctas.getDatosParam(t.FieldByName('NIVEL').Value);
           dn1.Text        := planctas.Descrip;
           activo1.Text    := planctas.nivelact;
           imputable1.Text := planctas.imput;
         end;
      2: begin
           planctas.getDatosParam(t.FieldByName('NIVEL').Value);
           dn2.Text        := planctas.Descrip;
           activo2.Text    := planctas.nivelact;
           imputable2.Text := planctas.imput;
         end;
      3: begin
           planctas.getDatosParam(t.FieldByName('NIVEL').Value);
           dn3.Text        := planctas.Descrip;
           activo3.Text    := planctas.nivelact;
           imputable3.Text := planctas.imput;
         end;
      4: begin
           planctas.getDatosParam(t.FieldByName('NIVEL').Value);
           dn4.Text        := planctas.Descrip;
           activo4.Text    := planctas.nivelact;
           imputable4.Text := planctas.imput;
         end;
      5: begin
           planctas.getDatosParam(t.FieldByName('NIVEL').Value);
           dn5.Text        := planctas.Descrip;
           activo5.Text    := planctas.nivelact;
           imputable5.Text := planctas.imput;
         end;
    end;
    t.Next;
  end;
  t.Close; t.Free;

  planctas.getDatos;
  activo.Text       := planctas.Activo;
  pasivo.Text       := planctas.Pasivo;
  patneto.Text      := planctas.Patneto;
  ganancias.Text    := planctas.Ganancias;
  perdidas.Text     := planctas.Perdidas;
  codctaref.Caption := planctas.Ctaresulta;
  planctas.getDatos(codctaref.Caption);
  cuentaref.Caption := Copy(planctas.Cuenta, 1, 20);
  cuenta.Text       := planctas.cuenta;
  c                 := planctas.codarea;
  r                 := planctas.codref;

  planctas.getDatosSep;
  separador.Text    := planctas.Sepa;

  t := planctas.setCuentasEgresos;
  t.Open; cuentaarea.Items.Clear; codctaarea.Items.Clear;
  while not t.Eof do Begin
    cuentaarea.Items.Add(t.FieldByName('cuenta').AsString);
    codctaarea.Items.Add(t.FieldByName('codcta').AsString);

    if (t.FieldByName('codcta').AsString = c) then Begin
      codctaarea.Text := c;
      cuentaarea.Text := t.FieldByName('cuenta').AsString;
    end;
    t.Next;
  end;
  t.Close; t.Free;

  t := planctas.ctasPatrimoniales(patneto.Text);
  t.Open; ctaref.Items.Clear; codcref.Items.Clear;
  while not t.Eof do Begin
    ctaref.Items.Add(t.FieldByName('cuenta').AsString);
    codcref.Items.Add(t.FieldByName('codcta').AsString);

    if (t.FieldByName('codcta').AsString = r) then Begin
      codcref.Text := r;
      ctaref.Text := t.FieldByName('cuenta').AsString;
    end;
    t.Next;
  end;
  t.Close; t.Free;

  t := planctas.setCuentas;
  t.Open; cuentapi.Items.Clear; codctapi.Items.Clear; cuentacap.Clear; codctacap.Clear;
  {
  r := planctas.codajustepi;
  while not t.Eof do Begin
    if (t.fieldbyname('imputable').AsString = 'S') then begin

      cuentapi.Items.Add(t.FieldByName('cuenta').AsString);
      codctapi.Items.Add(t.FieldByName('codcta').AsString);

      cuentacap.Items.Add(t.FieldByName('cuenta').AsString);
      codctacap.Items.Add(t.FieldByName('codcta').AsString);

      if (t.FieldByName('codcta').AsString = r) then Begin
        codctapi.Text := r;
        cuentapi.Text := t.FieldByName('cuenta').AsString;
      end;

      if (t.FieldByName('codcta').AsString = m) then Begin
        codctacap.Text := m;
        cuentacap.Text := t.FieldByName('cuenta').AsString;
      end;
    end;

    t.Next;
  end;
  t.Close; t.Free;
  }

  ActiveControl := activo1;
end;

procedure TfmParametrosPlanctas.cuentaChange(Sender: TObject);
begin
  codcta.ItemIndex  := cuenta.ItemIndex;
  codctaref.Caption := codcta.Text;
  cuentaref.Caption := Copy(cuenta.Text, 1, 20);
  ActiveControl     := Aplicar;
end;

procedure TfmParametrosPlanctas.cuentapiChange(Sender: TObject);
begin
  codctapi.ItemIndex := cuentapi.ItemIndex;
end;

procedure TfmParametrosPlanctas.cuentaareaChange(Sender: TObject);
begin
  codctaarea.ItemIndex  := cuentaarea.ItemIndex;
  ActiveControl     := Aplicar;
end;

procedure TfmParametrosPlanctas.cuentacapChange(Sender: TObject);
begin
  codctacap.ItemIndex := cuentacap.ItemIndex;
end;

procedure TfmParametrosPlanctas.ctarefChange(Sender: TObject);
begin
  codcref.ItemIndex := ctaref.ItemIndex;
  ActiveControl     := Aplicar;
end;

end.
