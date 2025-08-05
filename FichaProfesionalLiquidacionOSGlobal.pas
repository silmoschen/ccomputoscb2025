unit FichaProfesionalLiquidacionOSGlobal;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ComCtrls, Mask, ExtCtrls, ToolWin, Buttons,
  Editv, Grids, DBTables, Contnrs;

type
  TfmFichaProfesionalCCB = class(TForm)
    StatusBar1: TStatusBar;
    DTS: TDataSource;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    DBNavigator: TDBNavigator;
    Alta: TToolButton;
    Baja: TToolButton;
    Modificar: TToolButton;
    Buscar: TToolButton;
    Deshacer: TToolButton;
    Salir: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    oper: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    catlab: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    np: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    idprof: TMaskEdit;
    nombre: TMaskEdit;
    telefono: TMaskEdit;
    domicilio: TMaskEdit;
    idcategoria: TMaskEdit;
    nrocuit: TMaskEdit;
    BuscarCat: TBitBtn;
    email: TMaskEdit;
    matricula: TMaskEdit;
    fechamat: TMaskEdit;
    ajustedc: TMaskEdit;
    codfact: TMaskEdit;
    BuscarProf: TBitBtn;
    nivel2: TMaskEdit;
    retieneiva: TMaskEdit;
    periodo: TMaskEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    C: TStringGrid;
    Label21: TLabel;
    id: TLabel;
    pr: TLabel;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    Label22: TLabel;
    idprofret: TLabel;
    nombreret: TLabel;
    Panel8: TPanel;
    R: TStringGrid;
    Label25: TLabel;
    periodoret: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    retivaret: TMaskEdit;
    Label28: TLabel;
    Label29: TLabel;
    ajustedcret: TMaskEdit;
    procedure idprofKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure telefonoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure domicilioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BajaC(Sender: TObject);
    procedure AltaClick(Sender: TObject);
    procedure ModificarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure osocialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure idcategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nrocuitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarCatClick(Sender: TObject);
    procedure matriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fechamatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ajustedcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarProfClick(Sender: TObject);
    procedure codfactKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nivel2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure retieneivaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure periodoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure CKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSheet3Show(Sender: TObject);
    procedure periodoretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure retivaretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ajustedcretKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
    procedure CargarDatos;
    procedure CargarDatosCategoria;
    procedure CargarDatosProf;
    procedure CargarRetiva;
  public
    { public declarations }
    NoCerrarFinal, on2: boolean;
  end;

var
  fmFichaProfesionalCCB: TfmFichaProfesionalCCB;

implementation

uses CProfesionalCCB, CSolAnalisis, CUtiles, CCategoriasCCB,
  NominaDeCategoriasLab, fmBuscarProfesional, CUsuario, CUtilidadesStringGrid;

{$R *.DFM}

procedure TfmFichaProfesionalCCB.CargarDatos;
begin
  profesional.getDatos(idprof.Text);
  nombre.Text      := profesional.Nombre;
  domicilio.Text   := profesional.Domicilio;
  telefono.Text    := profesional.telefono;
  email.Text       := profesional.email;
  nrocuit.Text     := profesional.nrocuit;
  idcategoria.Text := profesional.idcategoria;
  matricula.Text   := profesional.matricula;
  fechamat.Text    := profesional.fechamat;
  ajustedc.Text    := profesional.AjusteDC;
  nivel2.Text      := profesional.Nivel2;
  retieneiva.Text  := profesional.Retieneiva;
  profesional.ObtenerUltimaCategorizacion(idprof.Text);
  idcategoria.Text := profesional.idcategoria;
  periodo.Text     := profesional.Periodo;
  if Length(Trim(retieneiva.Text)) = 0 then retieneiva.Text := 'N';
  CargarDatosCategoria;
  codfact.Text     := profesional.codfact;
  profesional.getDatos(codfact.Text);
  np.Caption       := profesional.nombre;
  profesional.Buscar(idprof.Text);
end;

procedure TfmFichaProfesionalCCB.CargarDatosCategoria;
begin
  categoria.getDatos(idcategoria.Text);
  catlab.Caption := categoria.Categoria;
  periodo.SetFocus;
end;

procedure TfmFichaProfesionalCCB.CargarDatosProf;
Begin
  profesional.getDatos(codfact.Text);
  np.Caption := profesional.Nombre;
end;

procedure TfmFichaProfesionalCCB.CargarRetiva;
// Objetivo...: Cargar Retenciones de I.V.A.
var
  l: TObjectList;
  i: Integer;
  objeto: TTProfesional;
Begin
  grid.IniciarGrilla(R);
  l := profesional.setListaPosiva(idprofret.Caption);
  for i := 1 to l.Count do Begin
    objeto := TTProfesional(l.Items[i-1]);
    R.Cells[0, i] := objeto.PeriodoIva;
    R.Cells[1, i] := objeto.Retieneiva;
    R.Cells[2, i] := objeto.AjusteDC;
    R.Row         := i;
  end;
  l.Free; l := Nil;
end;

procedure TfmFichaProfesionalCCB.BajaC(Sender: TObject);
begin
   if utiles.BajaRegistro('Seguro que desea Eliminar Código de profesional ' + idprof.Text) then Begin
     profesional.Borrar(idprof.Text);
     idprof.Text := profesional.Codigo;
     if NoCerrarFinal then CargarDatos; 
   end;
  ActiveControl := idprof;
end;

procedure TfmFichaProfesionalCCB.idprofKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then AltaClick(Sender);
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    begin
      if Length(Trim(idprof.Text)) > 0 then utiles.LlenarIzquierda(idprof, 6, '0');
      if profesional.Buscar(idprof.Text) then
        begin
          CargarDatos;      // Edito
          ActiveControl := nombre;
        end
      else
       if Length(Trim(idprof.Text)) > 0 then
        if utiles.DarDeAlta('Código de profesional ' + idprof.Text) then
          begin
            CargarDatos;  // Inicio - si no existe
            ActiveControl := nombre;
          end;
    end;
end;

procedure TfmFichaProfesionalCCB.nombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
  if Key = VK_UP then ActiveControl := idprof;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(nombre.Text)) > 0 then ActiveControl := domicilio;
end;

procedure TfmFichaProfesionalCCB.telefonoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := domicilio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := nrocuit;
end;

procedure TfmFichaProfesionalCCB.domicilioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nombre;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := telefono;
end;

procedure TfmFichaProfesionalCCB.AltaClick(Sender: TObject);
begin
  idprof.Text := utiles.sLlenarIzquierda(profesional.Nuevo, 5, '0');
  ActiveControl := idprof;
end;

procedure TfmFichaProfesionalCCB.ModificarClick(Sender: TObject);
begin
  ActiveControl := idprof;
end;

procedure TfmFichaProfesionalCCB.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFichaProfesionalCCB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBNavigator.DataSource := nil;
  if not NoCerrarFinal then Begin
    profesional.desconectar;
    Release; fmFichaprofesionalCCB := nil;
  end;
end;

procedure TfmFichaProfesionalCCB.DBNavigatorClick(
  Sender: TObject; Button: TNavigateBtn);
begin
  idprof.Text := profesional.tperso.FieldByName('idprof').AsString;
  CargarDatos;
end;

procedure TfmFichaProfesionalCCB.osocialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := domicilio;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := telefono;
end;

procedure TfmFichaProfesionalCCB.idcategoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := codfact;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then Begin
    if not categoria.Buscar(idcategoria.Text) then BuscarCatClick(Sender) else CargarDatosCategoria;
  end;
end;

procedure TfmFichaProfesionalCCB.nrocuitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := telefono;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := email;
end;

procedure TfmFichaProfesionalCCB.emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := nrocuit;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := matricula;
end;

procedure TfmFichaProfesionalCCB.BuscarCatClick(Sender: TObject);
begin
  Application.CreateForm(TfmListCategoriasLab, fmListCategoriasLab);
  fmListCategoriasLab.introSalir := True;
  fmListCategoriasLab.ShowModal;
  if fmListCategoriasLab.SeleccionOK then Begin
    idcategoria.Text := categoria.tabla.FieldByName('idcategoria').AsString;
    CargarDatosCategoria;
  end else
    ActiveControl := idcategoria;
  fmListCategoriasLab.Release; fmListCategoriasLab := nil;
end;

procedure TfmFichaProfesionalCCB.matriculaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := email;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := fechamat;
end;

procedure TfmFichaProfesionalCCB.fechamatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := matricula;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then ActiveControl := ajustedc;
end;

procedure TfmFichaProfesionalCCB.FormShow(Sender: TObject);
begin
  Left:=(Screen.Width - Width) div 2; Top:=(Screen.Height - Height) div 2;
  if not NoCerrarFinal then profesional.desconectar;
  DTS.DataSet := profesional.tperso;
  ActiveControl := idprof;
  if Length(Trim(idprof.Text)) > 0 then Begin
    if profesional.Buscar(idprof.Text) then CargarDatos;
    ActiveControl := nombre;
  end;
  if on2 then Begin
    Label17.Visible := False;
    nivel2.Visible  := False;
  end else Begin
    Label17.Visible := True;
    nivel2.Visible  := True;
  end;
  C.Cells[0, 0] := 'Periodo'; C.Cells[1, 0] := 'Categoría';
  R.Cells[0, 0] := 'Periodo'; R.Cells[1, 0] := 'Ret. I.V.A.'; R.Cells[2, 0] := 'Ret. Ganancias';
end;

procedure TfmFichaProfesionalCCB.ajustedcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := fechamat;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(ajustedc.Text, 'SN', 'Las Opciones son S o N ...!') then retieneiva.SetFocus;
end;

procedure TfmFichaProfesionalCCB.BuscarProfClick(Sender: TObject);
begin
  Application.CreateForm(TfmBuscarProf, fmBuscarProf);
  fmBuscarProf.ShowModal;
  if fmBuscarProf.SeleccionOK then Begin
    codfact.Text := profesional.tperso.FieldByName('idprof').AsString;
    CargarDatosProf;
    if idprof.Text = codfact.Text then Begin
      utiles.msgError('El Profesional No puede Facturar para Sí Mismo ...!');
      ActiveControl := codfact;
    end else
      ActiveControl := idcategoria;
  end;
  fmBuscarProf.Release; fmBuscarProf := nil;
end;

procedure TfmFichaProfesionalCCB.codfactKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then
    if nivel2.Visible then nivel2.SetFocus else ActiveControl := ajustedc;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if Length(Trim(codfact.Text)) = 0 then Begin
      ActiveControl := idcategoria;
      np.Caption    := '';
    end else Begin
    if not profesional.Buscar(codfact.Text) then BuscarProfClick(Sender) else
      if idprof.Text = codfact.Text then utiles.msgError('El Profesional No puede Facturar para Sí Mismo ...!') else Begin
        CargarDatosProf;
        ActiveControl := idcategoria;
      end;
  end;
end;

procedure TfmFichaProfesionalCCB.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfmFichaProfesionalCCB.nivel2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ajustedc.SetFocus;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(nivel2.Text, 'SN', 'Las Opciones son S o N ...!') then codfact.SetFocus;
end;

procedure TfmFichaProfesionalCCB.retieneivaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := ajustedc;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(retieneiva.Text, 'SN', 'Las Opciones son S o N ...!') then
      if nivel2.Visible then nivel2.SetFocus else ActiveControl := codfact;
end;

procedure TfmFichaProfesionalCCB.periodoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := idcategoria;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if utiles.verificarPeriodo(periodo.Text) then Begin
    if (Length(Trim(idprof.Text)) > 0) and (Length(Trim(nombre.Text)) > 0) and (categoria.Buscar(idcategoria.Text)) and (utiles.Sionoct(ajustedc.Text, 'SN', '')) and (utiles.verificarPeriodo(periodo.Text, '')) then
      if idprof.Text = codfact.Text then utiles.msgError('El Profesional No Puede Facturar para Sí Mismo ...!') else Begin
        if Not nivel2.Visible then profesional.Grabar(idprof.Text, nombre.Text, domicilio.Text, '', '', telefono.Text, nrocuit.Text, email.Text, idcategoria.Text, matricula.Text, fechamat.Text, ajustedc.Text, codfact.Text, nivel2.Text, retieneiva.Text) else
          profesional.Grabar(idprof.Text, nombre.Text, domicilio.Text, '', '', telefono.Text, nrocuit.Text, email.Text, idcategoria.Text, matricula.Text, fechamat.Text, ajustedc.Text, codfact.Text, nivel2.Text, retieneiva.Text);
        profesional.RegistrarCategorizacion(idprof.Text, periodo.Text, idcategoria.Text);
        if NoCerrarFinal then Close else ActiveControl := idprof;
    end else utiles.msgError('No se han Suministrado todos los Datos Obligatorios ...!');
  end;
end;

procedure TfmFichaProfesionalCCB.TabSheet2Show(Sender: TObject);
var
  l: TStringList;
  i: Integer;
begin
  id.Caption     := idprof.Text;
  pr.Caption     := nombre.Text;
  grid.IniciarGrilla(C);
  l := profesional.setCambiosDeCategoria(id.Caption);
  For i := 1 to l.Count do Begin
    C.Cells[0, i] := Copy(l.Strings[i-1], 7, 7);
    C.Cells[1, i] := Copy(l.Strings[i-1], 14, 1);
  end;
  l.Destroy;
end;

procedure TfmFichaProfesionalCCB.CKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if Length(Trim(C.Cells[0, C.Row])) > 0 then
      if utiles.msgSiNo('Seguro para Borrar Categorización ?') then Begin
        profesional.BorrarCategorizacion(id.Caption, C.Cells[0, C.Row]);
        TabSheet2Show(Self);
      end;
end;

procedure TfmFichaProfesionalCCB.TabSheet3Show(Sender: TObject);
begin
  idprofret.Caption := idprof.Text;
  nombreret.Caption := nombre.Text;
  CargarRetiva;
  periodoret.SetFocus;
end;

procedure TfmFichaProfesionalCCB.periodoretKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
   if utiles.verificarPeriodo(periodoret.Text) then retivaret.SetFocus;
end;

procedure TfmFichaProfesionalCCB.retivaretKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := periodoret;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(retivaret.Text, 'SN', 'Las Opciones son S o N ...!') then ajustedcret.SetFocus;
end;

procedure TfmFichaProfesionalCCB.RKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    if Length(Trim(R.Cells[0, R.Row])) > 0 then
      if utiles.msgSiNo('Seguro para Borrar Retención I.V.A. / Ganancias ?') then Begin
        profesional.BorrarPosiva(idprofret.Caption, R.Cells[0, R.Row]);
        CargarRetiva;
        periodoret.SetFocus;
      end;
end;

procedure TfmFichaProfesionalCCB.ajustedcretKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then ActiveControl := retivaret;
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
    if utiles.Sionoct(ajustedcret.Text, 'SN', 'Las Opciones son S o N ...!') then Begin
      if (utiles.verificarPeriodo(periodoret.Text, '')) and (utiles.Sionoct(retivaret.Text, 'SN', '')) then Begin
        profesional.RegistrarPosiva(idprofret.Caption, periodoret.Text, retivaret.Text, ajustedcret.Text);
        CargarRetiva;
        periodoret.Text := ''; retivaret.Text := ''; ajustedcret.Text := '';
        periodoret.SetFocus;
      end;
    end;
end;

end.
