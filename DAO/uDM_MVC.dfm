object DMMVC: TDMMVC
  OldCreateOrder = False
  Height = 358
  Width = 357
  object qryPesquisar: TFDQuery
    Connection = DMConexao.conMVC
    SQL.Strings = (
      'select id, nome, telefone from cad_cliente'
      'WHERE (nome like :nome)')
    Left = 72
    Top = 16
    ParamData = <
      item
        Position = 1
        DataType = ftString
        ParamType = ptInput
      end>
    object qryPesquisarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 90
    end
    object qryPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
  end
  object qryInserir: TFDQuery
    Connection = DMConexao.conMVC
    SQL.Strings = (
      'insert into CAD_CLIENTE (ID, NOME, TIPO, DOCUMENTO, TELEFONE)'
      '           values (:ID, :NOME, :TIPO, :DOCUMENTO, :TELEFONE)')
    Left = 136
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 90
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object qryAlterar: TFDQuery
    Connection = DMConexao.conMVC
    SQL.Strings = (
      'update CAD_CLIENTE'
      
        '  set NOME = :NOME,  TIPO = :TIPO,  DOCUMENTO = :DOCUMENTO, TELE' +
        'FONE = :TELEFONE'
      '  where (ID = :ID)')
    Left = 192
    Top = 16
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryExcluir: TFDQuery
    Connection = DMConexao.conMVC
    SQL.Strings = (
      '     delete from CAD_CLIENTE'
      '                      where (ID = :ID)')
    Left = 248
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspPesquisar: TDataSetProvider
    DataSet = qryPesquisar
    Left = 72
    Top = 72
  end
  object cdsPesquisar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptUnknown
        Value = ''
      end>
    ProviderName = 'dspPesquisar'
    Left = 72
    Top = 128
    object cdsPesquisarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 90
    end
    object cdsPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 192
  end
end
