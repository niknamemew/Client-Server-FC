unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Datasnap.DSAuth, IPPeerServer, Datasnap.DSCommonServer, Datasnap.DSHTTP,
  Web.HTTPProd;

type
  TWebModuleMain = class(TWebModule)
    DSServer1: TDSServer;
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServerClass1: TDSServerClass;
    PageProducer1: TPageProducer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleMain;

implementation

uses ServerMethodsUnit1, Web.WebReq, DataModuleHtmlUnit;

{$R *.dfm}

procedure TWebModuleMain.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  //Qui ci sono le risposte HTML di default alla chiamata DefaultHandler
  //Il progetto WebBroker nasce con questo gestore di default
  //Posso inserire direttamente qui dentro le risposte
  //Response.Content := '<html><heading/><body>DataSnap Server</body></html>';
  //Response.Content := '<p>"Hello World" from Delphi</p>'
  //                  + '<p>Ora sul Server: <b>' + DateTimeToStr(Now) + '</b></p>'
  //                  + '<p>HTTP Response: ' + Response.ContentType +  '</p>';
  //Inserisco un componente TPageProducer, nella sua proprieta HTMLDoc vado ad
  //inserire lo scheletro HTML e al suo interno ho inserito dei TAG posizione
  //<#doctitolo> e <#docbody> in modo da andare dinamicamente a cambiare i contenuti
  //nell'evento OnHTMLTag qui sotto, posso metterli direttamente nel
  //ReplaceText:='PROVA' oppure dinamicamente collegarli
  //ad un metodo del DataModule e prendere il contenuto da un DB
end;

procedure TWebModuleMain.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
  var dm:TDataModuleHtml;

begin
  //Qui gestisco evento OnHTMLTag il quale per ogni TAG posizione
  //<#doctitolo> e <#docbody> va a cambiare dinamicamente i contenuti,
  //posso metterli direttamente nel ReplaceText:='PROVA'
  //oppure collegarli ad un metodo del DataModule e prendere il contenuto da un DB

  dm:=TDataModuleHtml.Create(nil);

  try
    if SameText(TagString, 'listaCT') then
      ReplaceText:=dm.GetListaC
    else if SameText(TagString, 'listaFT') then
      ReplaceText:=dm.GetListaF
        else
           ReplaceText:='';
  finally
    dm.Free;
  end;

end;

procedure TWebModuleMain.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

