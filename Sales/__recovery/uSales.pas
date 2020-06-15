unit uSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  ComObj, FileCtrl, ActiveX, OleServer,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFmSales = class(TForm)
    pnMain: TPanel;
    gdSales: TDBGrid;
    pnButton: TPanel;
    gdSalesContents: TDBGrid;
    qSales: TADOQuery;
    cSales: TADOConnection;
    dsSales: TDataSource;
    qSalesID: TAutoIncField;
    qSalesSUMM: TBCDField;
    qSalesVERIFICATION: TBooleanField;
    dsSalesContents: TDataSource;
    qSalesContents: TADOQuery;
    qSalesContentsID_SALES: TIntegerField;
    qSalesContentsNAME: TStringField;
    qSalesContentsQTY: TIntegerField;
    qSalesContentsPRICE: TBCDField;
    qSalesContentsSUMM: TBCDField;
    qSalesCLIENT: TStringField;
    btSalesContentsCreate: TButton;
    btDelete: TButton;
    btCreate: TButton;
    btSalesContentsChange: TButton;
    btChange: TButton;
    btSalesExcel: TButton;
    btSalesContentsDelete: TButton;
    btVerification: TButton;
    sdSalesExcel: TSaveDialog;
    qSalesDelet: TADOQuery;
    qSalesContentsDelet: TADOQuery;
    qSalesContentsID_PRODUCT: TAutoIncField;
    qSalesContentsID: TAutoIncField;
    qSalesDATE_CREATE: TDateTimeField;
    qSalesDATE_VERIFICATION: TDateTimeField;
    qSalesDATE: TDateTimeField;
    qSalesVetification: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure qSalesAfterScroll(DataSet: TDataSet);
    procedure btSalesExcelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btSalesContentsDeleteClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure btChangeClick(Sender: TObject);
    procedure btVerificationClick(Sender: TObject);
    procedure btSalesContentsCreateClick(Sender: TObject);
    procedure btSalesContentsChangeClick(Sender: TObject);
    procedure qSalesContentsAfterScroll(DataSet: TDataSet);
    procedure qSalesBeforeClose(DataSet: TDataSet);
    procedure qSalesAfterOpen(DataSet: TDataSet);
    procedure gdSalesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gdSalesContentsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmSales: TFmSales;
  varRecNo: Integer;

implementation

{$R *.dfm}

uses uSaleschange, uSalesContentsChange;

procedure TFmSales.btChangeClick(Sender: TObject);
begin
  fmSalesChange.show;
  fmSalesChange.btCreate.Visible := false;
  fmSalesChange.btChange.Visible := true;
end;

procedure TFmSales.btCreateClick(Sender: TObject);
begin
  fmSalesChange.show;
  fmSalesChange.btCreate.Visible := true;
  fmSalesChange.btChange.Visible := false;
end;

procedure TFmSales.btDeleteClick(Sender: TObject);
begin
  if (MessageDlg('Удалить позицию ?', mtConfirmation, [mbOK, mbCancel], 0)
    = mrOK) then
  begin
    qSalesDelet.Parameters.ParamByName('VAR_ID_SALES').value := qSalesID.value;
    qSalesDelet.ExecSQL;
    qSales.Close;
    qSales.open;
    fmSalesChange.Close;
  end;

end;

procedure TFmSales.btVerificationClick(Sender: TObject);
begin
  if (MessageDlg('Записать измененя?', mtConfirmation, [mbOK, mbCancel], 0)
    = mrOK) then
  begin
    qSalesVetification.Parameters.ParamByName('VAR_ID_SALES').value :=
      qSalesID.value;
    qSalesVetification.ExecSQL;
    qSales.Close;
    qSales.open;
  end;

end;

procedure TFmSales.btSalesExcelClick(Sender: TObject);

const

  xlExcel9795 = $0000002B;
  xlExcel8 = 56;
var
  s: Integer;
  ExlApp, Sheet: OLEVariant;
  Range, Buffer: Variant;
  varLink: string;
begin
  if qSalesContentsID.IsNull then
  begin
    showmessage('В продаже нет товра');
    abort;
  end;

  if sdSalesExcel.Execute then
    varLink := sdSalesExcel.FileName
  else
    abort;
  Buffer := VarArrayCreate([1, qSalesContents.RecordCount + 2, 1, 10],
    varVariant);
  s := 2;
  Buffer[1, 1] := 'ID';
  Buffer[1, 2] := 'Товар';
  Buffer[1, 3] := 'Кол-во';
  Buffer[1, 4] := 'Цена';
  Buffer[1, 5] := 'Сумма';
  Buffer[1, 7] := 'Расходная накладная №' + qSalesID.AsString;

  while not qSalesContents.Eof do
  begin
    Buffer[s, 1] := qSalesContentsID.AsString;
    Buffer[s, 2] := qSalesContentsNAME.AsString;
    Buffer[s, 3] := qSalesContentsQTY.AsString;
    Buffer[s, 4] := qSalesContentsPRICE.AsString;
    Buffer[s, 5] := qSalesContentsSUMM.AsString;
    qSalesContents.Next;
  end;
  qSalesContents.First;

  CoInitialize(Nil);

  ExlApp := CreateOleObject('Excel.Application');
  ExlApp.Visible := false;
  ExlApp.Workbooks.Add;
  Sheet := ExlApp.Workbooks[1].WorkSheets[1];
  Sheet.name := qSalesID.AsString;
  Range := ExlApp.Workbooks[1].WorkSheets[1].Range
    [ExlApp.Workbooks[1].WorkSheets[1].Cells[1, 1],
    ExlApp.Workbooks[1].WorkSheets[1].Cells[s, 10]];
  Range.value := Buffer;
  Sheet.Columns['A:J'].AutoFit;
  Sheet.rows['2'].select;
  ExlApp.ActiveWindow.FreezePanes := true;
  Sheet.Cells[1, 1].select;
  ExlApp.DisplayAlerts := false;
  try
    ExlApp.Workbooks[1].saveas(varLink, 56);
  except
    ExlApp.Workbooks[1].saveas(varLink, 43);
  end;

  ExlApp.Quit;
  ExlApp := Unassigned;
  Sheet := Unassigned;
end;

procedure TFmSales.btSalesContentsChangeClick(Sender: TObject);
begin
  fmSalesContentsChange.show;
  fmSalesContentsChange.btCreate.Visible := false;
  fmSalesContentsChange.btChange.Visible := true;
  qSalesContentsAfterScroll(qSalesContents);
end;

procedure TFmSales.btSalesContentsCreateClick(Sender: TObject);
begin
  fmSalesContentsChange.show;
  fmSalesContentsChange.btCreate.Visible := true;
  fmSalesContentsChange.btChange.Visible := false;
  qSalesContentsAfterScroll(qSalesContents);
end;

procedure TFmSales.btSalesContentsDeleteClick(Sender: TObject);
begin
  if (MessageDlg('Удалить позицию ?', mtConfirmation, [mbOK, mbCancel], 0)
    = mrOK) then
  begin
    qSalesContentsDelet.Parameters.ParamByName('VAR_ID_SALES_CONTENTS').value :=
      qSalesContentsID.value;
    qSalesContentsDelet.ExecSQL;
    qSalesContents.Close;
    qSalesContents.open;
    qSales.Close;
    qSales.open;
    fmSalesContentsChange.Close;
    qSalesContentsAfterScroll(qSalesContents);
  end;
end;

procedure TFmSales.FormCreate(Sender: TObject);
begin
  qSalesContents.open;
  qSales.open;
end;

procedure TFmSales.FormShow(Sender: TObject);
begin
  if not cSales.Connected then
  begin
    showmessage('Данные не подтверждены');
    abort;
  end;

end;

procedure TFmSales.gdSalesContentsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46) and (ssCtrl in Shift) then
    abort;
end;

procedure TFmSales.gdSalesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46) and (ssCtrl in Shift) then
    abort;
end;

procedure TFmSales.qSalesAfterOpen(DataSet: TDataSet);
begin
  if (varRecNo < 0) then
    qSales.RecNo := varRecNo;
end;

procedure TFmSales.qSalesBeforeClose(DataSet: TDataSet);
begin
  // showmessage(qSales.RecNo.ToString);
  try
    varRecNo := qSales.RecNo;
  finally
    varRecNo := 1;
  end;
end;

procedure TFmSales.qSalesAfterScroll(DataSet: TDataSet);
begin
  qSalesContents.Parameters.ParamByName('VAR_ID_SALES').value := qSalesID.value;
  qSalesContents.Close;
  qSalesContents.open;
  if qSalesVERIFICATION.value then
  begin
    btVerification.Font.Style := [fsStrikeOut];
    btDelete.Enabled := false;
    btChange.Enabled := false;
    btSalesContentsCreate.Enabled := false;
    btSalesContentsDelete.Enabled := false;
    btSalesContentsChange.Enabled := false;
  end
  else
  begin
    btVerification.Font.Style := [];
    btDelete.Enabled := true;
    btChange.Enabled := true;
    btSalesContentsCreate.Enabled := true;
    btSalesContentsDelete.Enabled := true;
    btSalesContentsChange.Enabled := true;
  end;

  if qSalesContentsID.IsNull then
  begin
    btSalesContentsDelete.Enabled := false;
    btSalesContentsChange.Enabled := false;
  end
  else
  begin
    btSalesContentsDelete.Enabled := true;
    btSalesContentsChange.Enabled := true;
  end;

end;

procedure TFmSales.qSalesContentsAfterScroll(DataSet: TDataSet);
begin
  if assigned(fmSalesContentsChange) then
    if fmSalesContentsChange.btChange.Visible then
    begin
      fmSalesContentsChange.edQTY.Text := qSalesContentsQTY.AsString;
      fmSalesContentsChange.edPrice.Text := qSalesContentsPRICE.AsString;
      fmSalesContentsChange.lcProduct.KeyValue :=
        qSalesContentsID_PRODUCT.AsString;
    end
    else
    begin
      fmSalesContentsChange.edQTY.Text := '';
      fmSalesContentsChange.edPrice.Text := '';
      fmSalesContentsChange.lcProduct.KeyValue := 1;
    end;

end;

end.
