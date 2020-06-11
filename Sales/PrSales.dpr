program PrSales;

uses
  Vcl.Forms,
  uSales in 'uSales.pas' {FmSales} ,
  uSalesChange in 'uSalesChange.pas' {fmSalesChange} ,
  uSalesContentsChange in 'uSalesContentsChange.pas' {fmSalesContentsChange};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmSales, FmSales);
  Application.CreateForm(TfmSalesChange, fmSalesChange);
  Application.CreateForm(TfmSalesContentsChange, fmSalesContentsChange);
  Application.CreateForm(TfmSalesChange, fmSalesChange);
  Application.CreateForm(TfmSalesContentsChange, fmSalesContentsChange);
  Application.Run;

end.
