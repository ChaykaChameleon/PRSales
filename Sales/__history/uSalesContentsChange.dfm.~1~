object fmSalesContentsChange: TfmSalesContentsChange
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1090#1086#1074#1072#1088#1072#1084#1080
  ClientHeight = 197
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnMain: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 197
    Align = alClient
    Caption = 'pnMain'
    ShowCaption = False
    TabOrder = 0
    object lbProduct: TLabel
      Left = 31
      Top = 24
      Width = 30
      Height = 13
      Caption = #1058#1086#1074#1072#1088
    end
    object lbQTY: TLabel
      Left = 35
      Top = 107
      Width = 35
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086
    end
    object lbPrice: TLabel
      Left = 35
      Top = 67
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object edQTY: TEdit
      Left = 168
      Top = 104
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object edPrice: TEdit
      Left = 168
      Top = 64
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object btCreate: TButton
      Left = 31
      Top = 144
      Width = 82
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btCreateClick
    end
    object btChange: TButton
      Left = 168
      Top = 144
      Width = 105
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = btChangeClick
    end
    object lcProduct: TDBLookupComboBox
      Left = 168
      Top = 24
      Width = 105
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsProduct
      TabOrder = 4
    end
  end
  object qSalesContents: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'VAR_ID_SALES'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      ' p.ID AS ID_PRODUCT'
      ' ,sc.ID'
      ' ,sc.ID_SALES'
      ' ,p.NAME'
      ' ,sc.QTY'
      ' ,sc.PRICE'
      ' ,sc.SUMM'
      'FROM SALES_CONTENTS sc JOIN PRODUCT p ON sc.ID_PRODUCT = p.ID'
      'WHERE sc.ID_SALES = :VAR_ID_SALES;')
    Left = 388
    Top = 279
    object qSalesContentsID_SALES: TIntegerField
      FieldName = 'ID_SALES'
    end
    object qSalesContentsNAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'NAME'
      Size = 50
    end
    object qSalesContentsQTY: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'QTY'
    end
    object qSalesContentsSUMM: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMM'
      Precision = 19
    end
    object qSalesContentsPRICE: TBCDField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'PRICE'
      Precision = 19
    end
    object qSalesContentsID_PRODUCT: TAutoIncField
      DisplayLabel = 'ID '#1090#1086#1074#1072#1088#1072
      FieldName = 'ID_PRODUCT'
      ReadOnly = True
    end
    object qSalesContentsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object qProduct: TADOQuery
    Connection = FmSales.cSales
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  t.ID'
      ' ,t.NAME'
      'FROM PRODUCT AS t;')
    Left = 72
    Top = 11
    object qProductID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qProductNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsProduct: TDataSource
    DataSet = qProduct
    Left = 128
    Top = 8
  end
  object qCreate: TADOQuery
    Connection = FmSales.cSales
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'VAR_ID_SALES'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_ID_PRODUCT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_QTY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_PRICE'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO SALES_CONTENTS (ID_SALES, ID_PRODUCT, QTY, PRICE)'
      
        '  VALUES ( :VAR_ID_SALES, :VAR_ID_PRODUCT, :VAR_QTY, :VAR_PRICE)' +
        ';')
    Left = 56
    Top = 91
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object qChange: TADOQuery
    Connection = FmSales.cSales
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'VAR_ID_PRODUCT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_QTY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_PRICE'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'VAR_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE SALES_CONTENTS'
      'SET ID_PRODUCT = :VAR_ID_PRODUCT'
      '   ,QTY = :VAR_QTY'
      '   ,PRICE = :VAR_PRICE'
      'WHERE ID = :VAR_ID;')
    Left = 192
    Top = 91
    object AutoIncField2: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
end
