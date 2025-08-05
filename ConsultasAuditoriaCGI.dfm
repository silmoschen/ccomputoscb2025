object WM: TWM
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'Inicio'
      PathInfo = '/'
      OnAction = WMInicioAction
    end
    item
      Name = 'Consulta'
      PathInfo = '/consulta'
      OnAction = WMConsultaAction
    end>
  Left = 192
  Top = 107
  Height = 150
  Width = 215
end
