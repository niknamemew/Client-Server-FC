program Project1;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ServerMethodsUnit1 in 'conn\SMU\ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  DataModuleHtmlUnit in 'Client\Db\DataModuleHtmlUnit.pas' {DataModuleHtml: TDataModule},
  WebModuleUnit in 'Conn\WMU\WebModuleUnit.pas' {WebModuleUnit: TWebModule},
  MainFormUnit in 'Conn\MainFormUnit.pas' {FormMain};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  FormMain.Visible := True;
  Application.Run;
end.
