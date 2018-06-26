unit DataModuleHtmlUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDb2, Data.DB, Data.SqlExpr,
  Data.FMTBcd;

type

  TRecordClienti = record
    CODCLIEN: String;
    RAGFATTU: String;
    INDFATTU: String;
    CAPFATTU: String;
    CITFATTU: String;
    PAESFATT: String;
  end;

  TRecordFornitori = record
    CODFORNI: String;
    RAGFORNI: String;
    INDFORNI: String;
    CAPFORNI: String;
    CITFORNI: String;
    CODPAESE: String;
  end;

  TDataModuleHtml = class(TDataModule)
    ConnDavanzam: TSQLConnection;
    DSTemp: TDataSource;
    Qtemp: TSQLQuery;
  private
    { Private declarations }
    FClientiDettaglioPag: string;
    FFornitoDettaglioPAg: string;
    function LeggiListaClientiDaDb:string;
    function LeggiListaFornitoriDaDb:string;
  public
    { Public declarations }
    function GetListaC:string;
    function GetListaF:string;
    function inserisciinlistaClienti (cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function inserisciinlistaFornitori (cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) : string;
    function rimuovidalistaClienti (cod:string) :string;
    function rimuovidalistaFornitori (cod:string) :string;
    function modificainlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function modificainlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
  end;
  var
   c : TrecordClienti;
   b : TrecordFornitori;

//qui asterisco la variabile dell'oggetto e la istanzio di mia volonta' nel
//TWebModuleMain.PageProducer1HTMLTag in modo da liberare la risorsa correttamente

//var
//  DataModuleHtml: TDataModuleHtml;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleHtml }


function TDataModuleHtml.GetListaF: string;
begin
  result:=
          '<div data-role="header">'
          +'<h1>FORNITORI</h1>'
          +'</div><!-- /header -->'
          +'<div data-role="content">'
          +'<p>Cerca: </p>'
          + LeggiListaFornitoriDaDb
          +'</div><!-- /content -->'
          +'<input type="button" data-rel="back" data-inline="true" data-icon="back" style="background-color:#ff00ff"  value="Men�" onclick="chiudi()">'
          +'<h4></h4>'
          +'</div><!-- /footer -->'
          +'</div><!-- /page -->'
end;

function TDataModuleHtml.GetListaC: string;
begin
  result:=
          '<div data-role="header">'
          +'<h1>CLIENTI</h1>'
          +'</div><!-- /header -->'
          +'<div data-role="content">'
          +'<p>Cerca: </p>'
          + LeggiListaClientiDaDb
          +'</div><!-- /content -->'
          +'<input type="button" data-rel="back" data-inline="true" data-icon="back" style="background-color:#ff00ff" value="Men�" onclick="chiudi()">'
          +'<h4></h4>'
          +'</div><!-- /footer -->'
          +'</div><!-- /page -->'
end;

function TDataModuleHtml.LeggiListaClientiDaDb: string;
var ch:char; s:string; c: TRecordClienti;
begin
  s := '<ul data-role="listview" data-inset="true" data-theme="c" data-filter="true">';
  ch:=' ';
  result:='';

  try
    ConnDavanzam.Connected:=false;
    ConnDavanzam.Connected:=true;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

  QTemp.SQL.Clear;
  QTemp.SQL.Add('select CODCLIEN,RAGFATTU,ESRAGFAT,INDFATTU,ESINDFAT,CAPFATTU,CITFATTU,ESCITFAT,PAESFATT ');
  QTemp.SQL.Add('from TCLIENTI ');

  try
    QTemp.Open;
  except
    on e:eDataBaseError do
    begin
        Qtemp.Close;
      exit;
    end;
  end;

  while not QTemp.Eof do
  begin
    c.CODCLIEN:=trim(Qtemp.FieldBYNAME('CODCLIEN').Asstring);
    c.RAGFATTU:=trim(Qtemp.FieldBYNAME('RAGFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESRAGFAT').Asstring) > '' then
      c.RAGFATTU:=c.RAGFATTU +  ' ' + trim(Qtemp.FieldBYNAME('ESRAGFAT').Asstring);

    c.INDFATTU:=trim(Qtemp.FieldBYNAME('INDFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESINDFAT').Asstring) > '' then
      c.INDFATTU:=c.INDFATTU + ' ' + trim(Qtemp.FieldBYNAME('ESINDFAT').Asstring);

    c.CAPFATTU:=trim(Qtemp.FieldBYNAME('CAPFATTU').Asstring);
    c.CITFATTU:=trim(Qtemp.FieldBYNAME('CITFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESCITFAT').Asstring) > '' then
      c.CITFATTU:=c.CITFATTU + ' ' + trim(Qtemp.FieldBYNAME('ESCITFAT').Asstring);

    c.PAESFATT:=trim(Qtemp.FieldBYNAME('PAESFATT').Asstring);

    if ch <> c.codclien[1] then
    begin
      ch :=  c.codclien[1];
      s:=s + '<li data-theme="a">' + c.codclien + '</li>';
    end;

    s:=s + '<li data-role="collapsible" data-collapsed="false">' + c.RAGFATTU + ', ' + c.indfattu + ', ' + c.capfattu + ', ' + c.citfattu + ', ' + c. paesfatt + '</li>';

    Qtemp.Next;
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;


  s:=s + '</ul>';
  Result:=s;

end;

function TDataModuleHtml.LeggiListaFornitoriDaDb: string;
var ch:char; s:string; c: TRecordFornitori;
begin
  s := '<ul data-role="listview" data-inset="true" data-theme="c" data-filter="true">';
  ch:=' ';
  result:='';

  try
    ConnDavanzam.Connected:=false;
    ConnDavanzam.Connected:=true;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

  QTemp.SQL.Clear;
  QTemp.SQL.Add('select CODFORNI,RAGFORNI,ESRAGFOR,INDFORNI,ESINDFOR,CAPFORNI,CITFORNI,ESCITFOR,CODPAESE ');
  QTemp.SQL.Add('from TFORNITORI ');
  QTemp.SQL.Add('order by RAGFORNI ');

  try
    QTemp.Open;
  except
    on e:eDataBaseError do
    begin
        Qtemp.Close;
      exit;
    end;
  end;

  while not QTemp.Eof do
  begin
    c.CODFORNI:=trim(Qtemp.FieldBYNAME('CODFORNI').Asstring);
    c.RAGFORNI:=trim(Qtemp.FieldBYNAME('RAGFORNI').Asstring);
    if trim(Qtemp.FieldBYNAME('ESRAGFOR').Asstring) > '' then
      c.RAGFORNI:=c.RAGFORNI + ' ' + trim(Qtemp.FieldBYNAME('ESRAGFOR').Asstring);

    c.INDFORNI:=trim(Qtemp.FieldBYNAME('INDFORNI').Asstring);
    if trim(Qtemp.FieldBYNAME('ESINDFOR').Asstring) > '' then
      c.INDFORNI:=c.INDFORNI + ' ' + trim(Qtemp.FieldBYNAME('ESINDFOR').Asstring);

    c.CAPFORNI:=trim(Qtemp.FieldBYNAME('CAPFORNI').Asstring);
    c.CITFORNI:=trim(Qtemp.FieldBYNAME('CITFORNI').Asstring);
    if trim(Qtemp.FieldBYNAME('ESCITFOR').Asstring) > '' then
      c.CITFORNI:=c.CITFORNI + ' ' + trim(Qtemp.FieldBYNAME('ESCITFOR').Asstring);

    c.CODPAESE:=trim(Qtemp.FieldBYNAME('CODPAESE').Asstring);

    if ch <> c.codforni[1] then
    begin
      ch :=  c.codforni[1];
      s:=s + '<li data-theme="a">' + c.codforni + '</li>';
    end;

    s:=s + '<li data-role="collapsible" data-collapsed="false">' + c.RAGFORNI + ', ' + c.indforni + ', ' + c.capforni + ', ' + c.citforni + ', ' + c.codpaese + '</a></li>';

    Qtemp.Next;
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;


  s:=s + '</ul>';
  Result:=s;

  //result:= '<li><a href="#">cliente 1</a></li>'
  //         +'<li><a href="#">cliente 2</a></li>'
  //         +'<li><a href="#">cliente 3</a></li>'
end;

function TDataModulehtml.inserisciinlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') or ( paesm='') or ( codiling='') or ( ragm='') or ( esragm='') or ( indim='') or ( esindim='') or ( citm='') or ( escitm='') or ( capm='') or ( tipocons='') or ( prof='') or ( prom='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice cliente e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragfattu e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfat e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indifattu e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifat e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capfattu e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citfattu e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfat e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il paesfatt e' + #39 + ' troppo lungo'
 else if length(paesm)>3  then
    result := 'Il paesmerce e' + #39 + ' troppo lungo'
 else if length(codiling)>1  then
    result := 'Il codiling e' + #39 + ' troppo lungo'
 else if length(ragm)>24  then
    result := 'Il ragmerce e' + #39 + ' troppo lungo'
 else if length(esragm)>24  then
    result := 'L' + #39 + 'esragmer e' + #39 + ' troppo lungo'
 else if length(indim)>24  then
    result := 'I#39indmerce e' + #39 + ' troppo lungo'
 else if length(esindim)>24  then
    result := 'L' + #39 + 'esindmer e' + #39 + ' troppo lungo'
 else if length(citm)>18  then
    result := 'Il citmerce e' + #39 + ' troppo lungo'
 else if length(escitm)>18  then
    result := 'L' + #39 + 'escitmer e' + #39 + ' troppo lungo'
 else if length(capm)>5  then
    result := 'Il capmerce e' + #39 + ' troppo lungo'
 else if length(tipocons)>1  then
    result := 'Il tipocons e' + #39 + ' troppo lungo'
 else if length(prof)>2  then
    result := 'Il profattu e' + #39 + ' troppo lungo'
 else if length(prom)>2  then
    result := 'Il promerce e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into tclienti (CODCLIEN,RAGFATTU,ESRAGFAT,INDFATTU,ESINDFAT,CAPFATTU,CITFATTU,ESCITFAT,PAESFATT,PAESMERC,CODILING,RAGMERCE,ESRAGMER,INDMERCE,ESINDMER,CITMERCE,ESCITMER,CAPMERCE,TIPOCONS,PROFATTU,PROMERCE) values (' + #39 + cod + #39 + ',' + #39 + ragf + #39 + ',' + #39 + esragf + #39 + ',' + #39 + indif + #39 + ',' + #39 + esindif + #39 + ',' + #39 + capf + #39 + ',' + #39 + citf + #39 + ',' + #39 + escitf + #39 + ',' + #39 + paesf + #39 + ',' + #39 + paesm + #39 + ',' + #39 + codiling + #39 + ',' + #39 + ragm + #39 + ',' + #39 + esragm + #39 + ',' + #39 + indim + #39 + ',' + #39 + esindim + #39 + ',' + #39 + citm + #39 + ',' + #39 + escitm + #39 + ',' + #39 + capm + #39 + ',' + #39 + tipocons + #39 + ',' + #39 + prof + #39 + ',' + #39 + prom + #39 + ')');
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModulehtml.inserisciinlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice fornitore e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragforni e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfor e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indiforni e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifor e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capforni e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citforni e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfor e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il codpaese e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into tfornitori (codforni, ragforni, esragfor, indforni, esindfor, capforni, citforni, escitfor, codpaese) values (' + #39 + cod + #39 + ',' + #39 + ragf + #39 + ',' + #39 + esragf + #39 + ',' + #39 + indif + #39 + ',' + #39 + esindif + #39 + ',' + #39 + capf + #39 + ',' + #39 + citf + #39 + ',' + #39 + escitf + #39 + ',' + #39 + paesf + #39 + ')');
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModulehtml.rimuovidalistaClienti(cod: string): string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if cod='' then
    result := 'Devi inserire il codice cliente'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from tclienti where codclien = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

 function TDataModulehtml.rimuovidalistaFornitori(cod: string): string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if cod='' then
    result := 'Devi inserire il codice fornitore'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from tfornitori where codforni = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModulehtml.modificainlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') or ( paesm='') or ( codiling='') or ( ragm='') or ( esragm='') or ( indim='') or ( esindim='') or ( citm='') or ( escitm='') or ( capm='') or ( tipocons='') or ( prof='') or ( prom='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice cliente e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragfattu e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfat e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indifattu e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifat e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capfattu e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citfattu e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfat e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il paesfatt e' + #39 + ' troppo lungo'
 else if length(paesm)>3  then
    result := 'Il paesmerce e' + #39 + ' troppo lungo'
 else if length(codiling)>1  then
    result := 'Il codiling e' + #39 + ' troppo lungo'
 else if length(ragm)>24  then
    result := 'Il ragmerce e' + #39 + ' troppo lungo'
 else if length(esragm)>24  then
    result := 'L' + #39 + 'esragmer e' + #39 + ' troppo lungo'
 else if length(indim)>24  then
    result := 'I#39indmerce e' + #39 + ' troppo lungo'
 else if length(esindim)>24  then
    result := 'L' + #39 + 'esindmer e' + #39 + ' troppo lungo'
 else if length(citm)>18  then
    result := 'Il citmerce e' + #39 + ' troppo lungo'
 else if length(escitm)>18  then
    result := 'L' + #39 + 'escitmer e' + #39 + ' troppo lungo'
 else if length(capm)>5  then
    result := 'Il capmerce e' + #39 + ' troppo lungo'
 else if length(tipocons)>1  then
    result := 'Il tipocons e' + #39 + ' troppo lungo'
 else if length(prof)>2  then
    result := 'Il profattu e' + #39 + ' troppo lungo'
 else if length(prom)>2  then
    result := 'Il promerce e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('update tclienti set RAGFATTU = ' + #39 + ragf + #39 + ',ESRAGFAT = ' + #39 + esragf + #39 + ',INDFATTU = ' + #39 + indif + #39 + ',ESINDFAT = ' + #39 + esindif + #39 + ',CAPFATTU = ' + #39 + capf + #39 + ',CITFATTU = ' +  #39 + citf + #39 + ',ESCITFAT = ' + #39 + escitf + #39 + ',PAESFATT = ' + #39 + paesf + #39 + ',PAESMERC = ' + #39 + paesm + #39 + ',CODILING = ' + #39 + codiling + #39 + ',RAGMERCE = ' + #39 + ragm + #39 + ',ESRAGMER = ' + #39 + esragm + #39 + ',INDMERCE = ' + #39 + indim + #39 + ',ESINDMER = ' + #39 + esindim + #39 + ',CITMERCE = ' + #39 + citm + #39 + ',ESCITMER = ' + #39 + escitm + #39 + ',CAPMERCE = ' + #39 + capm + #39 + ',TIPOCONS = ' + #39 + tipocons + #39 + ',PROFATTU = ' + #39 + prof + #39 + ',PROMERCE = ' + #39 + prom + #39 + ' where codclien = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModulehtml.modificainlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice fornitore e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragforni e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfor e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indiforni e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifor e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capforni e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citforni e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfor e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il codpaese e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('update tfornitori set RAGforni = ' + #39 + ragf + #39 + ',ESRAGFor = ' + #39 + esragf + #39 + ',INDforni = ' + #39 + indif + #39 + ',ESINDFor = ' + #39 + esindif + #39 + ',CAPforni = ' + #39 + capf + #39 + ',CITforni = ' +  #39 + citf + #39 + ',ESCITFor = ' + #39 + escitf + #39 + ',codpaese = ' + #39 + paesf + #39 + ' where codforni = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

end.
