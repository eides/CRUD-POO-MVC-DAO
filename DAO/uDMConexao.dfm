object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object conMVC: TFDConnection
    Params.Strings = (
      
        'Database=E:\PROGRAMACAO\Repositorios\GITHUB\CRUD+POO+MVC+DAO\MVC' +
        '.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
end
