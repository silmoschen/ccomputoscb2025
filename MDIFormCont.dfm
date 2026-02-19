object fmSistem: TfmSistem
  Left = 14
  Top = 144
  ClientHeight = 581
  ClientWidth = 798
  Color = clBtnShadow
  ParentFont = True
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenuPersonalizarEntorno
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDFormFill: TLMDFill
    Left = 560
    Top = 136
    Width = 30
    Height = 30
    Bevel.Mode = bmCustom
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 798
      Height = 26
      Align = alClient
      ButtonHeight = 25
      ButtonWidth = 31
      Caption = 'ToolBar1'
      EdgeInner = esNone
      Images = contenedorImg.ImageList1
      TabOrder = 0
      object sistSolicitudes: TToolButton
        Left = 0
        Top = 0
        Hint = 'Facturaci'#243'n Ordenes de Obras Sociales'
        AutoSize = True
        Caption = ' &Facturaci'#243'n '
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = RegistracinOperacionesBingo1Click
      end
      object sistAuditoria: TToolButton
        Left = 23
        Top = 0
        Hint = 'Auditor'#237'a de Ordenes de Obras Sociales Capitadas'
        AutoSize = True
        Caption = '   &Auditor'#237'a   '
        DropdownMenu = PopupMenuAuditoria
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
      end
      object sistLiquidacion: TToolButton
        Left = 46
        Top = 0
        Hint = 'Distribuci'#243'n Pagos Obras Sociales a Laboratorios'
        AutoSize = True
        Caption = ' &Dist. O.S.'
        DropdownMenu = PopupMenuDistribucion
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = DistribucinPagosdeObrasSociales2Click
      end
      object btnContabilidad: TToolButton
        Left = 69
        Top = 0
        Hint = 'M'#243'dulo Contabilidad'
        AutoSize = True
        Caption = ' &Re. Cont.'
        DropdownMenu = PopupMenuCont
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
      end
      object Separador1: TToolButton
        Left = 92
        Top = 0
        Width = 2
        Caption = 'Separador 1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 94
        Top = 0
        Hint = 'Mantenimiento de Datos Maestros'
        AutoSize = True
        Caption = '   A&rchivo'
        DropdownMenu = PopupMenuArchivo
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
      end
      object sistLaboratorios: TToolButton
        Left = 117
        Top = 0
        Hint = 'Mantenimiento Datos de Laboratorios'
        AutoSize = True
        Caption = '&Laboratorios'
        ImageIndex = 15
        ParentShowHint = False
        ShowHint = True
        OnClick = DatosdeLaboratorios1Click
      end
      object sistPacientes: TToolButton
        Left = 140
        Top = 0
        Hint = 'Mantenimiento de Datos de Pacientes'
        AutoSize = True
        Caption = '  &Pacientes   '
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = sistPacientesClick
      end
      object sistObrasSociales: TToolButton
        Left = 163
        Top = 0
        Hint = 'Mantenimiento Datos Obras Sociales'
        AutoSize = True
        Caption = ' &Obras Soc. '
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = sistObrasSocialesClick
      end
      object sisInformesDiarios: TToolButton
        Left = 186
        Top = 0
        Hint = 'Generaci'#243'n de Informes Diarios'
        AutoSize = True
        Caption = '   &Informes'
        DropdownMenu = PopupMenuInformes
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
      end
      object Separador2: TToolButton
        Left = 209
        Top = 0
        Width = 2
        Caption = 'Separador 2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object agenda: TToolButton
        Left = 211
        Top = 0
        Hint = 'Libreta de Direcciones y Agenda'
        AutoSize = True
        Caption = '   Age&nda   '
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        OnClick = agendaClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 562
    Width = 798
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object MainMenu: TMainMenu
    OnChange = MainMenuChange
    Left = 264
    Top = 136
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object RegistracinOperacionesBingo1: TMenuItem
        Caption = '&Facturaci'#243'n de Obras Sociales'
        OnClick = RegistracinOperacionesBingo1Click
      end
      object AuditoaOrdenesObrasSociales1: TMenuItem
        Caption = '&Auditor'#237'a Ordenes Obras Sociales'
        object AuditoriaCentral1: TMenuItem
          Caption = '&Ingreso de Ordenes de Auditor'#237'a'
          OnClick = sistAuditoriaClick
        end
        object AuditoraDiferida1: TMenuItem
          Caption = 'Sincronizaci'#243'n de Ordenes Online'
          OnClick = AuditoraDiferencial1Click
        end
      end
      object DistribucinPagosdeObrasSociales2: TMenuItem
        Caption = '&Distribuci'#243'n Pagos de Obras Sociales'
        OnClick = DistribucinPagosdeObrasSociales2Click
        object Insumos1: TMenuItem
          Caption = '&Distribuci'#243'n Obras Sociales'
          OnClick = DistribucinPagosdeObrasSociales2Click
        end
        object N23: TMenuItem
          Caption = '-'
        end
        object VentadeInsumos2: TMenuItem
          Caption = '&Venta de Insumos'
          OnClick = VentadeInsumos1Click
        end
        object ComprasdeInsumos1: TMenuItem
          Caption = '&Compras de Insumos'
          Visible = False
        end
      end
      object RegistracinContable1: TMenuItem
        Caption = '&Registraci'#243'n Contable'
        object PlandeCuentas2: TMenuItem
          Caption = 'Plan de Cuentas'
          OnClick = PlandeCuentas1Click
        end
        object N26: TMenuItem
          Caption = '-'
        end
        object DefinirEjercicioEconmico2: TMenuItem
          Caption = 'Definir Ejercicio Econ'#243'mico'
          OnClick = DefinirEjercicioEconmico1Click
        end
        object N27: TMenuItem
          Caption = '-'
        end
        object AsientosContables2: TMenuItem
          Caption = 'Asientos Contables'
          OnClick = AsientosContables1Click
        end
        object DefinirdeAsientosModelos1: TMenuItem
          Caption = 'Definir de Asientos Modelos'
          OnClick = DefdeAsientosModelo1Click
        end
        object N28: TMenuItem
          Caption = '-'
        end
        object RenumerarAsientos2: TMenuItem
          Caption = 'Renumerar Asientos'
          OnClick = RenumerarAsientos1Click
        end
        object N29: TMenuItem
          Caption = '-'
        end
        object ExportarAsientos1: TMenuItem
          Caption = 'Exportar Asientos'
          Enabled = False
          OnClick = ExportacindeAsientos1Click
        end
        object ImportarAsientos1: TMenuItem
          Caption = 'Importar Asientos'
          Enabled = False
          OnClick = ImportacindeAsientos1Click
        end
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object FacturacinAFIP1: TMenuItem
        Caption = 'Facturaci'#243'n Electr'#243'nica A.F.I.P.'
        OnClick = FacturacinAFIP1Click
      end
      object ApplicationCreateFormTfmExportarOrdenesSoporteMagneticofmExportarOrdenesSoporteMagnetico1: TMenuItem
        Caption = 'Exportar Ordenes Soporte Digital'
        OnClick = ApplicationCreateFormTfmExportarOrdenesSoporteMagneticofmExportarOrdenesSoporteMagnetico1Click
      end
      object N35: TMenuItem
        Caption = '-'
        Visible = False
      end
      object ExportarDetalleFacturacin1: TMenuItem
        Caption = 'Exportar Detalle Facturaci'#243'n'
        Visible = False
        OnClick = ExportarDetalleFacturacin1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DeduccinMontoDeterminaciones1: TMenuItem
        Caption = 'Deducci'#243'n Monto Determinaciones'
        OnClick = DeduccinMontoDeterminaciones1Click
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object GenerarDatosparaActualizacionesOnLine1: TMenuItem
        Caption = '&Exportar Actualizaciones de Datos'
        OnClick = GenerarDatosparaActualizacionesOnLine1Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Salir1: TMenuItem
        Caption = '&Salir'
        OnClick = Salir1Click
      end
    end
    object Archivo1: TMenuItem
      Caption = 'Ar&chivo'
      object AdministracindeMaestros1: TMenuItem
        Caption = '&Mantenimiento de Datos Maestros'
        object Nomenclaturas2: TMenuItem
          Caption = 'Nomenclaturas'
          object NomencladorNaciomalNormalizado1: TMenuItem
            Caption = '&Nomenclador Naciomal Normalizado'
            ImageIndex = 14
            OnClick = sistNomecladorClick
          end
          object NomencladorBioqumicoUnificado1: TMenuItem
            Caption = 'Nomenclador &Bioqu'#237'mico Unificado'
            OnClick = NomencladorBioqumicoUnificado2Click
          end
          object N22: TMenuItem
            Caption = '-'
          end
          object NomeclaturasObrasSociales1: TMenuItem
            Caption = 'Nomeclaturas Obras Sociales'
            OnClick = NomeclaturasObrasSociales1Click
          end
          object IncluiryExcluirCdigosNomenclatura2: TMenuItem
            Caption = 'Incluir y Excluir C'#243'digos Nomenclatura'
            OnClick = IncluiryExcluirCdigosNomenclatura1Click
          end
          object ActualizarMontosFijosNBU1: TMenuItem
            Caption = 'Actualizar Montos Fijos NBU'
            OnClick = ActualizarMontosFijosNBUdesdeArchivo1Click
          end
        end
        object ObrasSociales1: TMenuItem
          Caption = '&Obras Sociales'
          ImageIndex = 16
          OnClick = sistObrasSocialesClick
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object Laboratorios4: TMenuItem
          Caption = 'Laboratorios'
          object Laboratorios1: TMenuItem
            Caption = 'Definici'#243'n de &Laboratorios'
            ImageIndex = 13
            OnClick = DatosdeLaboratorios1Click
          end
          object CategorasLaboratorios1: TMenuItem
            Caption = 'Ca&tegor'#237'as Laboratorios'
            OnClick = Categoras1Click
          end
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object DatosMaestrosDistribucin2: TMenuItem
          Caption = 'Datos Maestros Distribuci'#243'n'
          object DbitosyCrditosProfDistribucin1: TMenuItem
            Caption = 'D'#233'bitos Creditos Individuales Profesionales'
            OnClick = DbitosyCrditosaProfesionales1Click
          end
          object RetencionesDistribucin2: TMenuItem
            Caption = '&Retenciones Distribuci'#243'n'
            OnClick = Retenciones1Click
          end
          object Coseguros2: TMenuItem
            Caption = 'Coseguros'
            OnClick = Coseguros1Click
          end
          object EntidadesBancarias2: TMenuItem
            Caption = 'Entidades &Bancarias'
            OnClick = EntidadesBancarias1Click
          end
          object N19: TMenuItem
            Caption = '-'
          end
          object PadrndeInsumos2: TMenuItem
            Caption = 'Padr'#243'n de Insumos'
            OnClick = PadrndeInsumos1Click
          end
          object ProveedoresdeInsumos1: TMenuItem
            Caption = 'Proveedores de Insumos'
            OnClick = ProveedoresdeInsumos2Click
          end
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object DatosMaestrosAuditora2: TMenuItem
          Caption = 'Datos Maestros Auditor'#237'a'
          object Zonas2: TMenuItem
            Caption = '&Zonas Auditables'
            OnClick = Zonas1Click
          end
          object Mdicos2: TMenuItem
            Caption = '&M'#233'dicos'
            OnClick = Mdicos1Click
          end
          object abladeDiagnsitcos1: TMenuItem
            Caption = 'Tabla de Diagn'#243'sitcos'
            OnClick = abladeDiagnsitcos2Click
          end
          object ablaDiagnsticosOMS2: TMenuItem
            Caption = 'Tabla Diagn'#243'sticos O.M.S.'
            OnClick = ablaDiagnsticosOMS1Click
          end
          object PadrnAfiliadosaObrasSociales2: TMenuItem
            Caption = '&Padr'#243'n Afiliados a Obras Sociales '
            OnClick = PadrnAfiliadosaObrasSociales1Click
          end
          object ActualizarPadronesAuditora2: TMenuItem
            Caption = '&Actualizar Padrones Auditor'#237'a'
            OnClick = ActualizarPadronesObrasSociales1Click
          end
          object ArancelesDiferencialesObrasSociales2: TMenuItem
            Caption = 'Aranceles Diferenciales Obras Sociales'
            OnClick = ArancelesDiferencialesObrasSociales1Click
          end
          object N31: TMenuItem
            Caption = '-'
          end
          object ParmetrosAuditoria1: TMenuItem
            Caption = '&Par'#225'metros de Auditor'#237'a'
            OnClick = ParmetrosdeAuditoria1Click
          end
        end
        object Comprobantes1: TMenuItem
          Caption = '-'
          OnClick = Comprobantes1Click
        end
        object AgruparObrasSocialesparaFacturar2: TMenuItem
          Caption = '&Agrupar Obras Sociales para Facturar'
          OnClick = AgruparObrasSocialesparaFacturar1Click
        end
        object N33: TMenuItem
          Caption = '-'
          Visible = False
        end
        object abladeComprobantes1: TMenuItem
          Caption = '&Tabla de Comprobantes'
        end
        object ComprobantesRegistrables1: TMenuItem
          Caption = 'Comprobantes &Registrables'
          OnClick = ComprobantesRegistrables1Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object InformesdeUsuario1: TMenuItem
        Caption = '&Informes de Usuario'
        Enabled = False
      end
      object EtiquetasdeUsuario1: TMenuItem
        Caption = '&Etiquetas de Usuario ...'
        Enabled = False
      end
    end
    object Emisin1: TMenuItem
      Caption = 'I&nformes'
      object UBFacturadas1: TMenuItem
        Caption = 'UB Facturadas'
        OnClick = UBFacturadas1Click
      end
      object InformesDiarios1: TMenuItem
        Caption = '&Informes Adicionales Auditor'#237'a'
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object InformesContables2: TMenuItem
        Caption = '&Informes Contables'
        OnClick = InformesContables1Click
      end
    end
    object Estadistica1: TMenuItem
      Caption = 'Es&tad'#237'stica'
      object InformeEstadstico1: TMenuItem
        Caption = '&Informe Estad'#237'stico'
        Enabled = False
        ImageIndex = 6
        OnClick = InformeEstadstico1Click
      end
      object GeneracinEstadsticasIAPOS1: TMenuItem
        Caption = '&Generaci'#243'n Estad'#237'sticas I.A.P.O.S.'
        OnClick = GeneracinEstadsticasIAPOS1Click
      end
      object PrcticasRealizadas1: TMenuItem
        Caption = 'Pr'#225'cticas Realizadas'
        OnClick = PrcticasRealizadas1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object ProyeccinMensualdeCobros1: TMenuItem
        Caption = '&Proyecci'#243'n Mensual de Cobros'
        Enabled = False
      end
      object ProyeccinMensualdeComisionesaPagar1: TMenuItem
        Caption = 'Proyecci'#243'n &Mensual de Comisiones a Pagar'
        Enabled = False
      end
      object ProyeccinMensualdeComisionesPagadas1: TMenuItem
        Caption = 'Proyecci'#243'n Mensual de Comisiones &Pagadas'
        Enabled = False
      end
    end
    object Cerrar1: TMenuItem
      Caption = '&Cerrar'
    end
    object Depurar1: TMenuItem
      Caption = '&Depurar'
      object DatosFactLaboratorios1: TMenuItem
        Caption = '&Datos del Sistema'
        ImageIndex = 2
        OnClick = DatosFactLaboratorios1Click
      end
    end
    object Auditora1: TMenuItem
      Caption = 'A&uditor'#237'a'
    end
    object General2: TMenuItem
      Caption = '&General'
      object CopiasdeSeguridad1: TMenuItem
        Caption = '&Copias de Seguridad'
        ImageIndex = 7
        OnClick = sisBackupClick
      end
      object ConfigurarBackup1: TMenuItem
        Caption = 'Configurar &Backup'
        Enabled = False
        OnClick = ConfigurarBackup1Click
      end
      object RestaurarBackup1: TMenuItem
        Caption = 'Restaurar Backup'
        Enabled = False
        OnClick = RestaurarBackup1Click
      end
      object RepararDatos1: TMenuItem
        Caption = 'Reparar Datos'
        object RepararMdulo1: TMenuItem
          Caption = 'Reparar M'#243'dulo'
          OnClick = RepararDatos1Click
        end
        object SeleccinManual1: TMenuItem
          Caption = 'Selecci'#243'n Manual'
          OnClick = SeleccinManual1Click
        end
      end
      object N34: TMenuItem
        Caption = '-'
      end
      object ConfiguracinAccesosRemotos1: TMenuItem
        Caption = 'Configuraci'#243'n Acceso a Datos Remotos'
        OnClick = ConfiguracinAccesosRemotos1Click
      end
      object ConfigurarAccesoFTP1: TMenuItem
        Caption = 'Configuraci'#243'n FTP, HTTP, WS'
        OnClick = ConfigurarAccesoFTP1Click
      end
      object ReglasExportacinObrasSociales1: TMenuItem
        Caption = 'Reglas Exportaci'#243'n Obras Sociales'
        OnClick = ReglasExportacinObrasSociales1Click
      end
      object DatosdelaEmpresa1: TMenuItem
        Caption = 'Datos de la Empresa'
        OnClick = DatosdelaEmpresa1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Datosdelsistema1: TMenuItem
        Caption = 'Datos del &Sistema'
        OnClick = Datosdelsistema1Click
      end
      object Usuarios1: TMenuItem
        Caption = 'Usuarios'
        OnClick = Usuarios1Click
      end
      object Veriones1: TMenuItem
        Caption = 'Control de Versiones'
        OnClick = Veriones1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Impresoras1: TMenuItem
        Caption = '&Impresoras'
        ImageIndex = 15
        OnClick = Impresoras1Click
      end
      object NivelesdeSeguridad1: TMenuItem
        Caption = '&Personalizar Entorno'
        OnClick = PersonalizarEntornodeTrabajo1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Agenda1: TMenuItem
        Caption = '&Agenda'
        ImageIndex = 11
        OnClick = agendaClick
      end
    end
    object Ver1: TMenuItem
      Caption = 'Ver'
      object BarradeHerramientas1: TMenuItem
        Caption = '&Barra de Herramientas'
        object General1: TMenuItem
          Caption = '&General'
          OnClick = General1Click
        end
        object Estadisticas1: TMenuItem
          Caption = '&Complementos'
          Enabled = False
        end
      end
      object PosicinBarradeHerramientas1: TMenuItem
        Caption = 'Posici'#243'n Barra de Herramientas'
        object Superior1: TMenuItem
          Caption = 'Superior'
          OnClick = Superior1Click
        end
        object Izquierda1: TMenuItem
          Caption = 'Izquierda'
          OnClick = Izquierda1Click
        end
        object Derecha1: TMenuItem
          Caption = 'Derecha'
          OnClick = Derecha1Click
        end
      end
      object Accesos1: TMenuItem
        Caption = '&Accesos'
        ImageIndex = 75
        OnClick = Accesos1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Cascada1: TMenuItem
        Caption = '&Cascada'
        OnClick = Cascada1Click
      end
      object MosaicoHorizontal1: TMenuItem
        Caption = 'Mosaico &Horizontal'
        OnClick = MosaicoHorizontal1Click
      end
      object MosaicoVerical1: TMenuItem
        Caption = 'Mosaico &Verical'
        OnClick = MosaicoVerical1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Acercade1: TMenuItem
        Caption = 'Acerca de...'
        OnClick = Acercade1Click
      end
    end
  end
  object PopupMenuArchivo: TPopupMenu
    Left = 296
    Top = 136
    object Nomenclaturas1: TMenuItem
      Caption = 'Nomenclaturas'
      object NomencladorNacionalNormalizado1: TMenuItem
        Caption = 'Nomenclador Nacional Normalizado'
        OnClick = sistNomecladorClick
      end
      object NomencladorBioqumicoUnificado2: TMenuItem
        Caption = 'Nomenclador Bioqu'#237'mico Unificado'
        OnClick = NomencladorBioqumicoUnificado2Click
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object NomenclaturasObrasSociales1: TMenuItem
        Caption = 'Nomenclaturas Obras Sociales'
        OnClick = NomeclaturasObrasSociales1Click
      end
      object IncluiryExcluirCdigosNomenclatura1: TMenuItem
        Caption = 'Incluir y Excluir C'#243'digos Nomenclatura'
        OnClick = IncluiryExcluirCdigosNomenclatura1Click
      end
      object ActualizarMontosFijosNBU2: TMenuItem
        Caption = 'Actualizar Montos Fijos NBU'
        OnClick = ActualizarMontosFijosNBUdesdeArchivo1Click
      end
    end
    object ObrasSociales2: TMenuItem
      Caption = 'Obras Sociales'
      OnClick = sistObrasSocialesClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object Laboratorios3: TMenuItem
      Caption = 'Laboratorios'
      object Laboratorios2: TMenuItem
        Caption = 'Definici'#243'n de Laboratorios'
        OnClick = DatosdeLaboratorios1Click
      end
      object CategorasLaboratorios2: TMenuItem
        Caption = 'Categor'#237'as Laboratorios'
        OnClick = Categoras1Click
      end
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object DatosMaestrosDistribucin1: TMenuItem
      Caption = 'Datos Maestros Distribuci'#243'n'
      object DbitosCreditosProfDistribucin1: TMenuItem
        Caption = 'D'#233'bitos Creditos Individuales Profesionales'
        OnClick = DbitosyCrditosaProfesionales1Click
      end
      object RetencionesDistribucin1: TMenuItem
        Caption = 'Retenciones Distribuci'#243'n'
        OnClick = Retenciones1Click
      end
      object Coseguros1: TMenuItem
        Caption = 'Coseguros'
        OnClick = Coseguros1Click
      end
      object EntidadesBancarias1: TMenuItem
        Caption = 'Entidades Bancarias'
        OnClick = EntidadesBancarias1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object PadrndeInsumos1: TMenuItem
        Caption = 'Padr'#243'n de Insumos'
        OnClick = PadrndeInsumos1Click
      end
      object ProveedoresdeInsumos2: TMenuItem
        Caption = 'Proveedores de Insumos'
        OnClick = ProveedoresdeInsumos2Click
      end
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object DatosMaestrosAuditora1: TMenuItem
      Caption = 'Datos Maestros Auditor'#237'a'
      object Zonas1: TMenuItem
        Caption = 'Zonas Auditables'
        OnClick = Zonas1Click
      end
      object Mdicos1: TMenuItem
        Caption = 'M'#233'dicos'
        OnClick = Mdicos1Click
      end
      object abladeDiagnsitcos2: TMenuItem
        Caption = 'Tabla de Diagn'#243'sitcos'
        OnClick = abladeDiagnsitcos2Click
      end
      object ablaDiagnsticosOMS1: TMenuItem
        Caption = 'Tabla Diagn'#243'sticos O.M.S.'
        OnClick = ablaDiagnsticosOMS1Click
      end
      object PadrnAfiliadosaObrasSociales1: TMenuItem
        Caption = 'Padr'#243'n Afiliados a Obras Sociales'
        OnClick = PadrnAfiliadosaObrasSociales1Click
      end
      object ActualizarPadronesAuditora1: TMenuItem
        Caption = 'Actualizar Padrones Auditor'#237'a'
        OnClick = ActualizarPadronesObrasSociales1Click
      end
      object ArancelesDiferencialesObrasSociales1: TMenuItem
        Caption = 'Aranceles Diferenciales Obras Sociales'
        OnClick = ArancelesDiferencialesObrasSociales1Click
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object ParmetrosdeAuditoria1: TMenuItem
        Caption = '&Par'#225'metros de Auditoria'
        OnClick = ParmetrosdeAuditoria1Click
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object AgruparObrasSocialesparaFacturar1: TMenuItem
      Caption = '&Agrupar Obras Sociales para Facturar'
      OnClick = AgruparObrasSocialesparaFacturar1Click
    end
    object N32: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Comprobantes2: TMenuItem
      Caption = 'Tabla de Comprobantes'
      OnClick = Comprobantes1Click
    end
    object ComprobantesRegistrables2: TMenuItem
      Caption = 'Def/Aj. Comprobantes Registrables'
      OnClick = ComprobantesRegistrables1Click
    end
  end
  object PopupMenuPersonalizarEntorno: TPopupMenu
    Left = 360
    Top = 136
    object PersonalizarEntornodeTrabajo1: TMenuItem
      Caption = 'Personalizar Entorno de Trabajo'
      OnClick = PersonalizarEntornodeTrabajo1Click
    end
  end
  object PopupMenuDistribucion: TPopupMenu
    Left = 328
    Top = 136
    object DistribucinObrasSociales1: TMenuItem
      Caption = 'Distribuci'#243'n Obras Sociales'
      OnClick = DistribucinPagosdeObrasSociales2Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object VentadeInsumos1: TMenuItem
      Caption = 'Venta de Insumos'
      OnClick = VentadeInsumos1Click
    end
    object CompradeInsumos1: TMenuItem
      Caption = 'Compra de Insumos'
      Visible = False
      OnClick = CompradeInsumos1Click
    end
  end
  object skd: TSkinData
    Active = False
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab]
    Options = [xoPreview, xoToolbarBK]
    Skin3rd.Strings = (
      'TCategoryButtons=scrollbar'
      'TPngBitBtn=pngbitbtn'
      'TVirtualStringTree=scrollbar'
      'TVirtualDrawTree=scrollbar'
      'TTBXDockablePanel=Panel'
      'TAdvPanelGroup=scrollbar'
      'TComboboxex=combobox'
      'TRxSpeedButton=speedbutton'
      'THTMLViewer=scrollbar'
      'TDBCtrlGrid=scrollbar'
      'TfrSpeedButton=speedbutton'
      'TfrTBButton=speedbutton'
      'TControlBar=Panel'
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TAdvMemo=scrollbar'
      'TDBAdvMemo=scrollbar'
      'TcxDBLookupComboBox=combobox'
      'TcxDBComboBox=combobox'
      'TcxDBDateEdit=combobox'
      'TcxDBImageComboBox=combobox'
      'TcxDBCalcEdit=combobox'
      'TcxDBBlobEdit=combobox'
      'TcxDBPopupEdit=combobox'
      'TcxDBFontNameComboBox=combobox'
      'TcxDBShellComboBox=combobox'
      'TRxLookupEdit=combobox'
      'TRxDBLookupCombo=combobox'
      'TRzGroup=panel'
      'TRzButton=button'
      'TRzBitbtn=bitbtn'
      'TRzMenuButton=menubtn'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDateTimeEdit=combobox'
      'TRzColorEdit=combobox'
      'TRzDateTimePicker=combobox'
      'TRzDBDateTimeEdit=combobox'
      'TRzDbColorEdit=combobox'
      'TRzDBDateTimePicker=combobox'
      'TLMDButton=bitbtn'
      'TLMDGroupBox=Groupbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDCalculator=panel'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=panel'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDTreeComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDCalculatorEdit=edit'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TWWDBEDIT=Edit'
      'TcxButton=bitbtn'
      'TcxDBRadioGroup=radiogroup'
      'TcxRadioGroup=radiogroup'
      'TcxGroupbox=groupbox'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinStore = '(none)'
    SkinFormtype = sfMainform
    Version = '4.22.08.28'
    MenuUpdate = True
    MenuMerge = False
    Left = 456
    Top = 136
    SkinStream = {00000000}
  end
  object PopupMenuCont: TPopupMenu
    Left = 496
    Top = 136
    object PlandeCuentas1: TMenuItem
      Caption = 'Plan de Cuentas'
      OnClick = PlandeCuentas1Click
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object DefinirEjercicioEconmico1: TMenuItem
      Caption = 'Definir Ejercicio Econ'#243'mico'
      OnClick = DefinirEjercicioEconmico1Click
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object AsientosContables1: TMenuItem
      Caption = 'Asientos Contables'
      OnClick = AsientosContables1Click
    end
    object DefdeAsientosModelo1: TMenuItem
      Caption = 'Definir de Asientos Modelos'
      OnClick = DefdeAsientosModelo1Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object RenumerarAsientos1: TMenuItem
      Caption = 'Renumerar Asientos'
      OnClick = RenumerarAsientos1Click
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object ExportacindeAsientos1: TMenuItem
      Caption = 'Exportar Asientos'
      Enabled = False
      OnClick = ExportacindeAsientos1Click
    end
    object ImportacindeAsientos1: TMenuItem
      Caption = 'Importar Asientos'
      Enabled = False
      OnClick = ImportacindeAsientos1Click
    end
  end
  object PopupMenuInformes: TPopupMenu
    Left = 528
    Top = 136
    object InformesAdicionalesdeAuditora1: TMenuItem
      Caption = '&Informes Adicionales de Auditor'#237'a'
      OnClick = InformesAdicionalesdeAuditora1Click
    end
    object N24: TMenuItem
      Caption = '-'
    end
    object InformesContables1: TMenuItem
      Caption = 'Informes &Contables'
      OnClick = InformesContables1Click
    end
  end
  object PopupMenuAuditoria: TPopupMenu
    Left = 392
    Top = 136
    object AuditoraGeneral1: TMenuItem
      Caption = 'Ingreso de Ordenes de Auditor'#237'a'
      OnClick = sistAuditoriaClick
    end
    object AuditoraDiferencial1: TMenuItem
      Caption = 'Sincronizaci'#243'n de Ordenes Online'
      OnClick = AuditoraDiferencial1Click
    end
  end
end
