object fmSalesChange: TfmSalesChange
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1086#1076#1072#1078#1072#1084#1080
  ClientHeight = 151
  ClientWidth = 313
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
    Width = 313
    Height = 151
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 0
    object lbClient: TLabel
      Left = 24
      Top = 24
      Width = 37
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object lbDate: TLabel
      Left = 24
      Top = 64
      Width = 77
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
    end
    object lcClient: TDBLookupComboBox
      Left = 184
      Top = 24
      Width = 105
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsClient
      TabOrder = 0
    end
    object dtpSales: TDateTimePicker
      Left = 184
      Top = 64
      Width = 105
      Height = 21
      Date = 43991.000000000000000000
      Format = 'dd-MM-yyyy'
      Time = 0.934166909719351700
      TabOrder = 1
    end
    object btCreate: TButton
      Left = 24
      Top = 104
      Width = 77
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btCreateClick
    end
  end
  object btChange: TButton
    Left = 184
    Top = 104
    Width = 105
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = btChangeClick
  end
  object qSalesCreate: TADOQuery
    Connection = FmSales.cSales
    Parameters = <
      item
        Name = 'VAR_DATE'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'VAR_ID_CLIENT'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO SALES (DATE, ID_CLIENT)'
      '  VALUES (:VAR_DATE, :VAR_ID_CLIENT);')
    Left = 45
    Top = 88
  end
  object qSalesChange: TADOQuery
    Connection = FmSales.cSales
    Parameters = <
      item
        Name = 'VAR_DATE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'VAR_ID_CLIENT'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'VAR_ID_SALES'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE SALES'
      'SET DATE = :VAR_DATE'
      '   ,ID_CLIENT = :VAR_ID_CLIENT'
      'WHERE ID = :VAR_ID_SALES;')
    Left = 213
    Top = 88
  end
  object qClient: TADOQuery
    Connection = FmSales.cSales
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  tc.ID'
      ' ,tc.NAME'
      'FROM CLIENT tc')
    Left = 120
    Top = 11
    object qClientID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qClientNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsClient: TDataSource
    DataSet = qClient
    Left = 72
    Top = 8
  end
end
