object fmSistemFact: TfmSistemFact
  Left = 14
  Top = 144
  Caption = 
    'shmSOFT - Facturaci'#243'n Centro de Bioqu'#237'micos del Litoral Norte de' +
    ' Santa Fe'
  ClientHeight = 429
  ClientWidth = 720
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
    Left = 240
    Top = 216
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
    Width = 720
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 720
      Height = 51
      ButtonHeight = 25
      Caption = 'ToolBar1'
      EdgeInner = esLowered
      EdgeOuter = esNone
      Images = contenedorImg.ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object sistSolicitudes: TToolButton
        Left = 0
        Top = 0
        Hint = 'Facturaci'#243'n Obras Sociales'
        AutoSize = True
        Caption = '&Facturaci'#243'n '
        DropdownMenu = PopupMenuSistema
        ImageIndex = 0
        ParentShowHint = False
        PopupMenu = PopupMenuSistema
        ShowHint = True
      end
      object sistDeduccion: TToolButton
        Left = 23
        Top = 0
        Hint = 'C'#225'lculos de Determinaciones'
        AutoSize = True
        Caption = ' &Deducci'#243'n  '
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sistDeduccionClick
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Hint = 'Mantenimiento de Datos Maestros'
        AutoSize = True
        Caption = '  &Archivo '
        DropdownMenu = PopupMenuArchivo
        ImageIndex = 4
        ParentShowHint = False
        PopupMenu = PopupMenuArchivo
        ShowHint = True
      end
      object sistProfesionales: TToolButton
        Left = 69
        Top = 0
        Hint = 'Mantenimiento Laboratorios'
        AutoSize = True
        Caption = '&Laboratorios'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = DatosdeLaboratorios1Click
      end
      object sistPacientes: TToolButton
        Left = 92
        Top = 0
        Hint = 'Datos de Pacientes'
        AutoSize = True
        Caption = ' &Pacientes '
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = sistPacientesClick
      end
      object sistObrasSociales: TToolButton
        Left = 115
        Top = 0
        Hint = 'Obras Sociales'
        AutoSize = True
        Caption = '&Obras Soc. '
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = sistObrasSocialesClick
      end
      object sisInformesDiarios: TToolButton
        Left = 138
        Top = 0
        Hint = 'Generaci'#243'n de Informes Diarios'
        AutoSize = True
        Caption = '   &Informes    '
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = sisInformesDiariosClick
      end
      object agenda: TToolButton
        Left = 161
        Top = 0
        Hint = 'Libreta de Direcciones y Agenda'
        AutoSize = True
        Caption = '  A&genda   '
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = agendaClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 410
    Width = 720
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
    Left = 272
    Top = 120
    object Sistema1: TMenuItem
      Caption = '&Sistema'
      object RegistracinOperacionesBingo1: TMenuItem
        Caption = '&Facturaci'#243'n de Obras Sociales'
        ImageIndex = 1
        OnClick = RegistracinOperacionesBingo1Click
      end
      object FacturacindeOrdenesOnLine1: TMenuItem
        Caption = 'Facturaci'#243'n de Ordenes On Line'
        OnClick = FacturacindeOrdenesOnLine1Click
      end
      object ExportarFacturacinSoporteMagntico1: TMenuItem
        Caption = 'Exportar Facturaci'#243'n Soporte Magn'#233'tico'
        OnClick = ExportarFacturacinSoporteMagntico2Click
      end
      object ActulizacindeDatos1: TMenuItem
        Caption = '&Descargar Actulizaciones de Datos'
        OnClick = ActulizacindeDatos1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object FacturacinGlobaldeObrasSociales1: TMenuItem
        Caption = 'Facturaci'#243'n Global de Obras Sociales'
        Enabled = False
      end
      object DistribucindeOrdenesFacturadas1: TMenuItem
        Caption = 'Distribuci'#243'n de Ordenes Facturadas'
        Enabled = False
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Salir1: TMenuItem
        Caption = '&Salir'
        OnClick = Salir1Click
      end
    end
    object Archivo1: TMenuItem
      Caption = '&Archivo'
      object AdministracindeMaestros1: TMenuItem
        Caption = 'Datos &Maestros Facturaci'#243'n Obras Sociales'
        object Nomeclador1: TMenuItem
          Caption = 'Nomenclador Nacional Normalizado'
          ImageIndex = 14
          OnClick = Nomeclador2Click
        end
        object NomencladorUnicoBioqumico2: TMenuItem
          Caption = 'Nomenclador Unico Bioqu'#237'mico'
          OnClick = NomencladorUnicoBioqumico1Click
        end
        object ObrasSociales1: TMenuItem
          Caption = 'Obras Sociales'
          ImageIndex = 16
          OnClick = sistObrasSocialesClick
        end
        object IncluiryExcluirCdigosNomenclatura2: TMenuItem
          Caption = 'Incluir y Excluir C'#243'digos Nomenclatura'
          OnClick = IncluiryExcluirCdigosNomenclatura1Click
        end
        object N12: TMenuItem
          Caption = '-'
        end
        object Laboratorios1: TMenuItem
          Caption = '&Laboratorios'
          ImageIndex = 13
          OnClick = DatosdeLaboratorios1Click
        end
        object CategorasLaboratorios1: TMenuItem
          Caption = 'Ca&tegor'#237'as Laboratorios'
          OnClick = Categoras1Click
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object Comprobantes1: TMenuItem
          Caption = '&Comprobantes'
          OnClick = Comprobantes1Click
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
      Caption = '&Informes'
      object PlandeCuentas2: TMenuItem
        Caption = '&Facturaciones Efectuadas'
        ImageIndex = 8
        OnClick = PlandeCuentas2Click
      end
      object CuentasCorrientes2: TMenuItem
        Caption = '&Cuentas Corrientes'
        Enabled = False
      end
    end
    object Estadistica1: TMenuItem
      Caption = 'Es&tad'#237'stica'
      object InformeEstadstico1: TMenuItem
        Caption = '&Informe Estad'#237'stico'
        Enabled = False
        ImageIndex = 27
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
        Caption = '&Datos Facturados en el Laboratorio'
        ImageIndex = 2
        OnClick = DatosFactLaboratorios1Click
      end
    end
    object Auditora1: TMenuItem
      Caption = 'A&uditor'#237'a'
      object ControlesFinales1: TMenuItem
        Caption = '&Controles Finales'
        ImageIndex = 5
        OnClick = sisAuditoriaClick
      end
    end
    object General2: TMenuItem
      Caption = '&General'
      object CopiasdeSeguridad1: TMenuItem
        Caption = '&Copias de Seguridad'
        ImageIndex = 7
        OnClick = sisBackupClick
      end
      object CopiasSeguridadIngresosdelda1: TMenuItem
        Caption = 'Copias de &Seguridad Ingresos del D'#237'a'
        OnClick = CopiasSeguridadIngresosdelda1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ConfiguracionAccesoRemoto1: TMenuItem
        Caption = 'Configuracion Acceso a Datos Remoto'
        OnClick = ConfiguracionAccesoRemoto1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object ParmetrosdelSistema1: TMenuItem
        Caption = 'Par'#225'metros del Sistema'
        OnClick = ParmetrosdelSistema1Click
      end
      object Datosdelsistema1: TMenuItem
        Caption = 'Datos del &Sistema'
        OnClick = Datosdelsistema1Click
      end
      object Usuarios1: TMenuItem
        Caption = '&Usuarios'
        OnClick = Usuarios1Click
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
        Caption = '&Niveles de Seguridad'
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
    Left = 376
    Top = 120
    object Nomeclador2: TMenuItem
      Caption = 'Nomenclador Nacional Normalizado'
      OnClick = Nomeclador2Click
    end
    object NomencladorUnicoBioqumico1: TMenuItem
      Caption = 'Nomenclador Unico Bioqu'#237'mico'
      OnClick = NomencladorUnicoBioqumico1Click
    end
    object ObrasSociales2: TMenuItem
      Caption = 'Obras Sociales'
      OnClick = sistObrasSocialesClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object Laboratorios2: TMenuItem
      Caption = 'Laboratorios'
      OnClick = DatosdeLaboratorios1Click
    end
    object CategorasLaboratoriod1: TMenuItem
      Caption = 'Categor'#237'as Laboratorios'
      OnClick = Categoras1Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object Comprobantes2: TMenuItem
      Caption = 'Comprobantes'
      OnClick = Comprobantes1Click
    end
    object ComprobantesRegistrables2: TMenuItem
      Caption = 'Comprobantes Registrables'
      OnClick = ComprobantesRegistrables1Click
    end
  end
  object PopupMenuPersonalizarEntorno: TPopupMenu
    Left = 408
    Top = 120
    object PersonalizarEntornodeTrabajo1: TMenuItem
      Caption = 'Personalizar Entorno de Trabajo'
      OnClick = PersonalizarEntornodeTrabajo1Click
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
    Left = 512
    Top = 120
    SkinStream = {00000000}
  end
  object PopupMenuSistema: TPopupMenu
    Left = 304
    Top = 120
    object FacturacindeObrasSociales1: TMenuItem
      Caption = '&Facturaci'#243'n de Obras Sociales'
      ImageIndex = 1
      OnClick = RegistracinOperacionesBingo1Click
    end
    object FacturacindeOrdenesOnLine2: TMenuItem
      Caption = 'Facturaci'#243'n de Ordenes On Line'
      OnClick = FacturacindeOrdenesOnLine1Click
    end
    object ExportarFacturacinSoporteMagntico2: TMenuItem
      Caption = 'Exportar Facturaci'#243'n Soporte Magn'#233'tico'
      OnClick = ExportarFacturacinSoporteMagntico2Click
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object FacturacinGlobaldeObrasSociales2: TMenuItem
      Caption = 'Facturaci'#243'n Global de Obras Sociales'
      Enabled = False
    end
    object DistribucindeOrdenesFacturadas2: TMenuItem
      Caption = 'Distribuci'#243'n de Ordenes Facturadas'
      Enabled = False
    end
  end
end
