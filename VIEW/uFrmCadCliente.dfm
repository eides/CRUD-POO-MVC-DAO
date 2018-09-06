object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de clientes'
  ClientHeight = 432
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 391
    Width = 555
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFechar: TButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 555
    Height = 391
    ActivePage = tsPesq
    Align = alClient
    TabOrder = 0
    object tsPesq: TTabSheet
      Caption = 'tsPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 547
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        object edlPesquisar: TLabeledEdit
          Left = 16
          Top = 24
          Width = 225
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 247
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnMenulPesquisar: TPanel
        Left = 0
        Top = 304
        Width = 547
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 310
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhe: TButton
          Left = 389
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Detalhe'
          TabOrder = 1
          OnClick = btnDetalheClick
        end
        object btnExcluir: TButton
          Left = 468
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object dbgrd1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 60
        Width = 541
        Height = 241
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrd1DblClick
      end
    end
    object tsDados: TTabSheet
      Caption = 'tsDados'
      ImageIndex = 1
      object lblTipo: TLabel
        Left = 16
        Top = 95
        Width = 57
        Height = 13
        Caption = 'Tipo pessoa'
      end
      object edlCodigo: TLabeledEdit
        Left = 16
        Top = 24
        Width = 73
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
      end
      object edlNome: TLabeledEdit
        Left = 16
        Top = 64
        Width = 457
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
      object cbbTipo: TComboBox
        Left = 16
        Top = 112
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = 'F'#237'sico'
        Items.Strings = (
          'F'#237'sico'
          'Juridico')
      end
      object edlDocumento: TLabeledEdit
        Left = 167
        Top = 112
        Width = 155
        Height = 21
        EditLabel.Width = 110
        EditLabel.Height = 13
        EditLabel.Caption = 'Documento(CPF/CNPJ)'
        MaxLength = 15
        TabOrder = 3
      end
      object edlTelefone: TLabeledEdit
        Left = 328
        Top = 112
        Width = 145
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefone'
        MaxLength = 10
        TabOrder = 4
      end
      object pnlCadadtro: TPanel
        Left = 0
        Top = 322
        Width = 547
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 5
        object btnListar: TButton
          Left = 231
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 0
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 310
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 389
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 468
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DMMVC.cdsPesquisar
    Left = 492
    Top = 32
  end
end
