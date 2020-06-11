unit uSalesChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfmSalesChange = class(TForm)
    pnMain: TPanel;
    lbClient: TLabel;
    lbDate: TLabel;
    lcClient: TDBLookupComboBox;
    dtpSales: TDateTimePicker;
    btCreate: TButton;
    btChange: TButton;
    qSalesCreate: TADOQuery;
    qSalesChange: TADOQuery;
    dsClient: TDataSource;
    qClientID: TAutoIncField;
    qClientNAME: TStringField;
    qClient: TADOQuery;
    procedure btCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesChange: TfmSalesChange;

implementation

{$R *.dfm}

uses uSales;

procedure TfmSalesChange.btChangeClick(Sender: TObject);
begin
  qSalesChange.Parameters.ParseSQL(qSalesChange.SQL.Text, True);
  qSalesChange.Parameters.ParamByName('VAR_DATE').value := dtpSales.DateTime;
  qSalesChange.Parameters.ParamByName('VAR_ID_CLIENT').value := qClientID.value;
  qSalesChange.Parameters.ParamByName('VAR_ID_SALES').value :=
    fmSales.qSalesID.value;
  qSalesChange.ExecSQL;
  fmSales.qSales.Close;
  fmSales.qSales.open;
  fmSalesChange.Close;
end;

procedure TfmSalesChange.btCreateClick(Sender: TObject);
begin
  qSalesChange.Parameters.ParseSQL(qSalesChange.SQL.Text, True);
  qSalesCreate.Parameters.ParamByName('VAR_DATE').value := dtpSales.DateTime;
  qSalesCreate.Parameters.ParamByName('VAR_ID_CLIENT').value := qClientID.value;
  qSalesCreate.ExecSQL;
  fmSales.qSales.Close;
  fmSales.qSales.open;
  fmSalesChange.Close;
end;

procedure TfmSalesChange.FormCreate(Sender: TObject);
begin
  qClient.open;
  lcClient.KeyValue := qClient.FieldByName(lcClient.KeyField).value;
end;

end.
