object dmDados: TdmDados
  OldCreateOrder = False
  Height = 180
  Width = 313
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=zaq123edc;Persist Security Info=True' +
      ';User ID=root;Data Source=TesteWK;Initial Catalog=testewk'
    LoginPrompt = False
    Left = 88
    Top = 72
  end
  object qrySQL: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 184
    Top = 72
  end
end
