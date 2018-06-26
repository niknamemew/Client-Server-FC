object WebModuleMain: TWebModuleMain
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      Producer = PageProducer1
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<!DOCTYPE html>'
      '<html>'
      #9'<head>'
      
        #9'<meta name="viewport" content="width=device-width, initial-scal' +
        'e=1">'
      
        #9'<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.' +
        '1/jquery.mobile-1.0.1.min.css" />'
      
        #9'<script src="http://code.jquery.com/jquery-1.6.4.min.js"></scri' +
        'pt>'
      
        #9'<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-' +
        '1.0.1.min.js"></script>'
      '</head>'
      ''
      '<body>'
      '        <script type="text/javascript">'
      '                function chiudi()'
      '                {'
      
        '                        var conferma = window.confirm("Tornare a' +
        'l men'#249'?");'
      '                        if (conferma)'
      '                                window.close();'
      '                        else'
      '                                return conferma'
      '                }'
      #9#9'function leggilistaclienti()'
      #9#9'{'
      '                        window.open("#listaC");'
      #9#9'}'
      #9#9'function leggilistafornitori()'
      #9#9'{'
      #9#9#9'window.open("#listaF");'
      #9#9'}'
      #9#9'function inseriscicliente()'
      #9#9'{'
      #9#9#9'var cod = document.modulo4.codInC.value;'
      #9#9#9'var ragf = document.modulo4.RagfInC.value;'
      #9#9#9'var esragf = document.modulo4.EsragfInC.value;'
      #9#9#9'var indf = document.modulo4.IndfInC.value;'
      #9#9#9'var esindf = document.modulo4.EsindfInC.value;'
      #9#9#9'var capf = document.modulo4.CapfInC.value;'
      #9#9#9'var citf = document.modulo4.CitfInC.value;'
      #9#9#9'var escitf = document.modulo4.EscitFInC.value;'
      #9#9#9'var paesf = document.modulo4.PaesfInC.value;'
      #9#9#9'var paesm = document.modulo4.PaesmInC.value;'
      #9#9#9'var codiling = document.modulo4.CodilingInC.value;'
      #9#9#9'var ragm = document.modulo4.RagmInC.value;'
      #9#9#9'var esragm = document.modulo4.EsragmInC.value;'
      #9#9#9'var indm = document.modulo4.IndmInC.value;'
      #9#9#9'var esindm = document.modulo4.EsindmInC.value;'
      #9#9#9'var citm = document.modulo4.CitmInC.value;'
      #9#9#9'var escitm = document.modulo4.EscitmInC.value;'
      #9#9#9'var capm = document.modulo4.CapmInC.value;'
      #9#9#9'var tipocons = document.modulo4.TipoconsInC.value;'
      #9#9#9'var prof = document.modulo4.ProfInC.value;'
      #9#9#9'var prom = document.modulo4.PromInC.value;'
      ''
      
        #9#9#9'if (cod=="" || ragf=="" || esragf=="" || indf=="" || esindf==' +
        '"" || capf=="" || citf=="" || escitf=="" || paesf=="" || paesm==' +
        '"" || codiling=="" || ragm=="" || esragm=="" || indm=="" || esin' +
        'dm=="" || citm=="" || escitm=="" || capm=="" || tipocons=="" || ' +
        'prof=="" || prom=="") '
      #9#9#9'{'#9
      
        '                                window.alert("Tutti i parametri ' +
        'sono obbligatori");'
      #9#9#9'} '
      #9#9#9'else if (cod.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il Codice Cliente e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.codInC.focus();'
      #9#9#9'}'
      #9#9#9'else if (ragf.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.RagfInC.focus();'
      #9#9#9'}'
      #9#9#9'else if (esragf.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esragfat e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo4.EsragfInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (indf.length > 24) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'indifattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.IndfInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindf.length > 24) '
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esindifat e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.EsindfInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (capf.length > 5)'
      #9#9#9'{ '
      #9#9#9#9'window.alert("Il capfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.CapfInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (citf.length > 18)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il citfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.CitfInC.focus();'
      #9#9#9'}'
      #9#9#9'else if (escitf.length > 18) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'escitfat e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.EscitFInC.focus();'#9#9#9#9
      #9#9#9'}'
      #9#9#9'else if (paesf.length > 3)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesfatt e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.PaesfInC.focus();'#9#9#9#9
      #9#9#9'}'
      #9#9#9'else if (paesm.length > 3) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.PaesmInC.focus();'#9#9#9#9
      #9#9#9'} '
      #9#9#9'else if (codiling.length > 1)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il codiling e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo4.CodilingInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (ragm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragmerce e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo4.RagmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esragm.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'esragmer e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo4.EsragmInC.focus();'
      #9#9#9'}'
      #9#9#9'else if (indm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("I#39indmerce e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo4.IndmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'esindmer e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo4.EsindmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (citm.length > 18) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il citmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.CitmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (escitm.length > 18) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'escitmer e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.EscitmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (capm.length > 5)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il capmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.CapmInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (tipocons.length > 1)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il tipocons e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.TipoconsInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (prof.length > 2) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il profattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.ProfInC.focus();'
      #9#9#9'} '
      #9#9#9'else if (prom.length > 2)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il promerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo4.PromInC.focus();'
      #9#9#9'} '
      #9#9#9'else '
      #9#9#9'{'
      
        #9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/T' +
        'ServerMethods1/inseriscicliente/" + cod + "/" + ragf + "/" + esr' +
        'agf + "/" + indf + "/" + esindf + "/" + capf + "/" + citf + "/" ' +
        '+ escitf + "/" + paesf + "/" + paesm + "/" + codiling + "/" + ra' +
        'gm + "/" + esragm + "/" + indm + "/" + esindm + "/" + citm + "/"' +
        ' + escitm + "/" + capm + "/" + tipocons + "/" + prof + "/" + pro' +
        'm);'
      '                                win.close();'
      
        '                                window.alert("Esecuzione complet' +
        'ata");'
      '                        }'
      #9#9'}'#9#9
      #9#9'function inseriscifornitore()'
      #9#9'{'
      #9#9#9'var cod = document.modulo5.codInF.value;'
      #9#9#9'var ragf = document.modulo5.RagfInF.value;'
      #9#9#9'var esragf = document.modulo5.EsragfInF.value;'
      #9#9#9'var indf = document.modulo5.IndfInF.value;'
      #9#9#9'var esindf = document.modulo5.EsindfInF.value;'
      #9#9#9'var capf = document.modulo5.CapfInF.value;'
      #9#9#9'var citf = document.modulo5.CitfInF.value;'
      #9#9#9'var escitf = document.modulo5.EscitFInF.value;'
      #9#9#9'var paesf = document.modulo5.PaesfInF.value;'
      #9#9#9
      
        #9#9#9'if (cod=="" || ragf=="" || esragf=="" || indf=="" || esindf==' +
        '"" || capf=="" || citf=="" || escitf=="" || paesf=="") '
      #9#9#9'{'#9
      #9#9#9#9'window.alert("Tutti i parametri sono obbligatori");'
      #9#9#9'} '
      #9#9#9'else if (cod.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il Codice Fornitore e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.codInF.focus();'
      #9#9#9'}'
      #9#9#9'else if (ragf.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.RagfInF.focus();'
      #9#9#9'}'
      #9#9#9'else if (esragf.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esragfor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.EsragfInF.focus();'#9#9#9#9
      #9#9#9'} '
      #9#9#9'else if (indf.length > 24) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'indiforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.IndfInF.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindf.length > 24) '
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esindifor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.EsindfInF.focus();'
      #9#9#9'} '
      #9#9#9'else if (capf.length > 5)'
      #9#9#9'{ '
      #9#9#9#9'window.alert("Il capforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.CapfInF.focus();'
      #9#9#9'} '
      #9#9#9'else if (citf.length > 18)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il citforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.CitfInF.focus();'
      #9#9#9'}'
      #9#9#9'else if (escitf.length > 18) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'escitfor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo5.EscitFInF.focus();'
      #9#9#9'}'
      #9#9#9'else if (paesf.length > 3)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesforn e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo5.PaesfInF.focus();'
      #9#9#9'}'
      #9#9#9'else '
      #9#9#9'{'
      
        #9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/T' +
        'ServerMethods1/inseriscifornitore/" + cod + "/" + ragf + "/" + e' +
        'sragf + "/" + indf + "/" + esindf + "/" + capf + "/" + citf + "/' +
        '" + escitf + "/" + paesf);'
      '                                win.close();'
      
        '                                window.alert("Esecuzione complet' +
        'ata");'
      '                        }'
      #9#9'}'
      #9#9'function eliminacliente()'
      #9#9'{'
      #9#9#9'var cod = document.modulo6.clienteelimina.value;'
      #9#9#9'if ((cod=="") || (cod=="undefined"))'
      #9#9#9'{'
      
        #9#9#9#9'window.alert("Non hai inserito il codice del cliente da canc' +
        'ellare");'
      ''
      #9#9#9'}'
      #9#9#9'else'
      #9#9#9'{'#9
      
        #9#9#9#9'var conferma = window.confirm("Stai per cancellare il client' +
        'e dal codice " + cod);'
      #9#9#9#9'if (conferma)'
      #9#9#9#9'{'
      
        #9#9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/' +
        'TServerMethods1/rimuovicliente/" + cod);'
      #9#9#9#9#9'win.close();'
      #9#9#9#9#9'window.alert("Escuzione completata");'
      #9#9#9#9'}'
      #9#9#9#9'else'
      #9#9#9#9'{'
      #9#9#9#9#9'return conferma;'
      #9#9#9#9'}'
      #9#9#9'}'
      #9#9'}'
      #9#9'function eliminafornitore()'
      #9#9'{'
      #9#9#9'var cod = document.modulo7.fornitoreelimina.value;'
      #9#9#9'if ((cod=="") || (cod=="undefined"))'
      #9#9#9'{'
      
        #9#9#9#9'var conferma = window.alert("Non hai inserito il codice del ' +
        'fornitore da cancellare");'
      ''
      #9#9#9'}'
      #9#9#9'else'
      #9#9#9'{'#9
      
        #9#9#9#9'var conferma = window.confirm("Stai per cancellare il fornit' +
        'ore dal codice " + cod);'
      #9#9#9#9'if (conferma)'
      #9#9#9#9'{'
      
        #9#9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/' +
        'TServerMethods1/rimuovifornitore/" + cod);'
      #9#9#9#9#9'win.close();'
      #9#9#9#9#9'window.alert("Esecuzione completata");'
      #9#9#9#9'}'
      #9#9#9#9'else'
      #9#9#9#9'{'
      #9#9#9#9#9'return conferma;'
      #9#9#9#9'}'
      #9#9#9'}'
      #9#9'}'
      #9#9'function modificacliente()'
      #9#9'{'
      #9#9#9'var cod = document.modulo8.codModC.value;'
      #9#9#9'var ragf = document.modulo8.RagfModC.value;'
      #9#9#9'var esragf = document.modulo8.EsragfModC.value;'
      #9#9#9'var indf = document.modulo8.IndfModC.value;'
      #9#9#9'var esindf = document.modulo8.EsindfModC.value;'
      #9#9#9'var capf = document.modulo8.CapfModC.value;'
      #9#9#9'var citf = document.modulo8.CitfModC.value;'
      #9#9#9'var escitf = document.modulo8.EscitFModC.value;'
      #9#9#9'var paesf = document.modulo8.PaesfModC.value;'
      #9#9#9'var paesm = document.modulo8.PaesmModC.value;'
      #9#9#9'var codiling = document.modulo8.CodilingModC.value;'
      #9#9#9'var ragm = document.modulo8.RagmModC.value;'
      #9#9#9'var esragm = document.modulo8.EsragmModC.value;'
      #9#9#9'var indm = document.modulo8.IndmModC.value;'
      #9#9#9'var esindm = document.modulo8.EsindmModC.value;'
      #9#9#9'var citm = document.modulo8.CitmModC.value;'
      #9#9#9'var escitm = document.modulo8.EscitmModC.value;'
      #9#9#9'var capm = document.modulo8.CapmModC.value;'
      #9#9#9'var tipocons = document.modulo8.TipoconsModC.value;'
      #9#9#9'var prof = document.modulo8.ProfModC.value;'
      #9#9#9'var prom = document.modulo8.PromModC.value;'
      ''
      
        #9#9#9'if (cod=="" || ragf=="" || esragf=="" || indf=="" || esindf==' +
        '"" || capf=="" || citf=="" || escitf=="" || paesf=="" || paesm==' +
        '"" || codiling=="" || ragm=="" || esragm=="" || indm=="" || esin' +
        'dm=="" || citm=="" || escitm=="" || capm=="" || tipocons=="" || ' +
        'prof=="" || prom=="") '
      #9#9#9'{'#9
      #9#9#9#9'window.alert("Tutti i parametri sono obbligatori");'
      #9#9#9'} '
      #9#9#9'else if (cod.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il Codice Cliente e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.codModC.focus();'
      #9#9#9'}'
      #9#9#9'else if (ragf.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.RagfModC.focus();'
      #9#9#9'}'
      #9#9#9'else if (esragf.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esragfat e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo8.EsragfModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (indf.length > 24) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'indifattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.IndfModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindf.length > 24) '
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esindifat e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.EsindfModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (capf.length > 5)'
      #9#9#9'{ '
      #9#9#9#9'window.alert("Il capfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.CapfModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (citf.length > 18)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il citfattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.CitfModC.focus();'
      #9#9#9'}'
      #9#9#9'else if (escitf.length > 18) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'escitfat e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.EscitFModC.focus();'#9#9#9#9
      #9#9#9'}'
      #9#9#9'else if (paesf.length > 3)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesfatt e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.PaesfModC.focus();'#9#9#9#9
      #9#9#9'}'
      #9#9#9'else if (paesm.length > 3) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.PaesmModC.focus();'#9#9#9#9
      #9#9#9'} '
      #9#9#9'else if (codiling.length > 1)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il codiling e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo8.CodilingModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (ragm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragmerce e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo8.RagmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esragm.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'esragmer e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo8.EsragmModC.focus();'
      #9#9#9'}'
      #9#9#9'else if (indm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("I#39indmerce e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo8.IndmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindm.length > 24)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'esindmer e'#39' troppo lungo");  '
      #9#9#9#9'document.modulo8.EsindmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (citm.length > 18) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il citmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.CitmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (escitm.length > 18) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("L'#39'escitmer e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.EscitmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (capm.length > 5)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il capmerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.CapmModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (tipocons.length > 1)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il tipocons e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.TipoconsModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (prof.length > 2) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il profattu e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.ProfModC.focus();'
      #9#9#9'} '
      #9#9#9'else if (prom.length > 2)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il promerce e'#39' troppo lungo");'
      #9#9#9#9'document.modulo8.PromModC.focus();'
      #9#9#9'} '
      #9#9#9'else '
      #9#9#9'{'
      
        #9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/T' +
        'ServerMethods1/modificacliente/" + cod + "/" + ragf + "/" + esra' +
        'gf + "/" + indf + "/" + esindf + "/" + capf + "/" + citf + "/" +' +
        ' escitf + "/" + paesf + "/" + paesm + "/" + codiling + "/" + rag' +
        'm + "/" + esragm + "/" + indm + "/" + esindm + "/" + citm + "/" ' +
        '+ escitm + "/" + capm + "/" + tipocons + "/" + prof + "/" + prom' +
        ');'
      #9#9#9#9'win.close();'
      #9#9#9#9'window.alert("Esecuzione completata");'
      #9#9#9'}'
      #9#9'}'
      #9#9'function modificafornitore()'
      #9#9'{'
      #9#9#9'var cod = document.modulo9.codModf.value;'
      #9#9#9'var ragf = document.modulo9.RagfModf.value;'
      #9#9#9'var esragf = document.modulo9.EsragfModf.value;'
      #9#9#9'var indf = document.modulo9.IndfModf.value;'
      #9#9#9'var esindf = document.modulo9.EsindfModf.value;'
      #9#9#9'var capf = document.modulo9.CapfModf.value;'
      #9#9#9'var citf = document.modulo9.CitfModf.value;'
      #9#9#9'var escitf = document.modulo9.EscitFModf.value;'
      #9#9#9'var paesf = document.modulo9.PaesfModf.value;'
      #9#9#9
      
        #9#9#9'if (cod=="" || ragf=="" || esragf=="" || indf=="" || esindf==' +
        '"" || capf=="" || citf=="" || escitf=="" || paesf=="") '
      #9#9#9'{'#9
      #9#9#9#9'window.alert("Tutti i parametri sono obbligatori");'
      #9#9#9'} '
      #9#9#9'else if (cod.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il Codice Fornitore e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.codModf.focus();'
      #9#9#9'}'
      #9#9#9'else if (ragf.length > 24) '
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il ragforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.RagfModf.focus();'
      #9#9#9'}'
      #9#9#9'else if (esragf.length > 5)'
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esragfor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.EsragfModf.focus();'#9#9#9#9
      #9#9#9'} '
      #9#9#9'else if (indf.length > 24) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'indiforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.IndfModf.focus();'
      #9#9#9'} '
      #9#9#9'else if (esindf.length > 24) '
      #9#9#9'{'
      #9#9#9#9'window.alert("L'#39'esindifor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.EsindfModf.focus();'
      #9#9#9'} '
      #9#9#9'else if (capf.length > 5)'
      #9#9#9'{ '
      #9#9#9#9'window.alert("Il capforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.CapfModf.focus();'
      #9#9#9'} '
      #9#9#9'else if (citf.length > 18)'
      #9#9#9'{'
      #9#9#9#9'window.alert("Il citforni e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.CitfModf.focus();'
      #9#9#9'}'
      #9#9#9'else if (escitf.length > 18) '
      #9#9#9'{ '
      #9#9#9#9'window.alert("L'#39'escitfor e'#39' troppo lungo");'
      #9#9#9#9'document.modulo9.EscitFModf.focus();'
      #9#9#9'}'
      #9#9#9'else if (paesf.length > 3)'
      #9#9#9'{  '
      #9#9#9#9'window.alert("Il paesforn e'#39' troppo lungo"); '
      #9#9#9#9'document.modulo9.PaesfModf.focus();'
      #9#9#9'}'
      #9#9#9'else '
      #9#9#9'{'
      
        #9#9#9#9'win = window.open("http://192.168.88.76:8080/datasnap/rest/T' +
        'ServerMethods1/modificafornitore/" + cod + "/" + ragf + "/" + es' +
        'ragf + "/" + indf + "/" + esindf + "/" + capf + "/" + citf + "/"' +
        ' + escitf + "/" + paesf);'
      #9#9#9#9'win.close();'
      #9#9#9#9'window.alert("Esecuzione completata");'
      #9#9#9'}'
      #9#9'}'
      #9'</script>'
      
        '        <form method="spot" name="modulo1" data-role="page" id="' +
        'principale" data-theme="c">'
      '        <title>Clienti-Fornitori</title>'
      '                <div data-role="header">'
      '                        <h1>Men'#249'</h1>'
      '                </div>'
      
        #9#9'<p><input type="button" value="Lista Clienti" data-inline="tru' +
        'e" data-icon="search" style="background-color:#ff00ff" onclick="' +
        'leggilistaclienti()"></a></p>'
      
        #9#9'<p><input type="button" value="Lista Fornitori" data-inline="t' +
        'rue" data-icon="search" style="background-color:#ff00ff" onclick' +
        '="leggilistafornitori()"></a></p>'
      
        #9#9'<p><a href="#inserisciC" target="blank" value="Inserisci clien' +
        'te"><input type="button" value="Inserisci Cliente" data-inline="' +
        'true" data-icon="plus" style="background-color:#ff00ff"></a></p>'
      
        #9#9'<p><a href="#inserisciF" target="blank"><input type="button" v' +
        'alue="Inserisci Fornitore" data-inline="true" data-icon="plus" s' +
        'tyle="background-color:#ff00ff"></a></p>'
      
        #9#9'<p><a href="#eliminaC" target="blank"><input type="button" val' +
        'ue="Cancella Cliente" data-inline="true" data-icon="minus" style' +
        '="background-color:#ff00ff"></a></p>'
      
        #9#9'<p><a href="#eliminaF" target="blank"><input type="button" val' +
        'ue="Cancella Fornitore" data-inline="true" data-icon="minus" sty' +
        'le="background-color:#ff00ff"></a></p>'
      
        #9#9'<p><a href="#modificaC" target="blank"><input type="button" va' +
        'lue="Modifica Cliente" data-inline="true" data-icon="gear" style' +
        '="background-color:#ff00ff"></a></p>'
      
        #9#9'<p><a href="#modificaF" target="blank"><input type="button" va' +
        'lue="Modifica Fornitore" data-inline="true" data-icon="gear" sty' +
        'le="background-color:#ff00ff"></a></p>'
      #9'</form>'
      
        #9'<form method="spot" name="modulo4" data-role="page" id="inseris' +
        'ciC" data-theme="c">'
      '                <div data-role="header">'
      #9#9#9'<h1>Inserisci Cliente</h1>'
      '                </div>'
      #9#9'<p>Codice Cliente</p>'
      #9#9'<input type="text" name="codInC">'
      #9#9'<p>Ragfattu</p>'
      #9#9'<input type="text" name="RagfInC">'
      #9#9'<p>Esragfat</p>'
      #9#9'<input type="text" name="EsragfInC">'
      #9#9'<p>Indfattu</p>'
      #9#9'<input type="text" name="IndfInC">'
      #9#9'<p>Esindfat</p>'
      #9#9'<input type="text" name="EsindfInC">'
      #9#9'<p>Capfattu</p>'
      #9#9'<input type="text" name="CapfInC">'
      #9#9'<p>Citfattu</p>'
      #9#9'<input type="text" name="CitfInC">'
      #9#9'<p>Escitfat</p>'
      #9#9'<input type="text" name="EscitFInC">'
      #9#9'<p>Paesfatt</p>'
      #9#9'<input type="text" name="PaesfInC">'
      #9#9'<p>Paesmerc</p>'
      #9#9'<input type="text" name="PaesmInC">'
      #9#9'<p>Codiling</p>'
      #9#9'<input type="text" name="CodilingInC">'
      #9#9'<p>Ragmerce</p>'
      #9#9'<input type="text" name="RagmInC">'
      #9#9'<p>Esragmer</p>'
      #9#9'<input type="text" name="EsragmInC">'
      #9#9'<p>Indmerce</p>'
      #9#9'<input type="text" name="IndmInC">'
      #9#9'<p>Esindmer</p>'
      #9#9'<input type="text" name="EsindmInC">'
      #9#9'<p>Citmerce</p>'
      #9#9'<input type="text" name="CitmInC">'
      #9#9'<p>Escitmer</p>'
      #9#9'<input type="text" name="EscitmInC">'
      #9#9'<p>Capmerce</p>'
      #9#9'<input type="text" name="CapmInC">'
      #9#9'<p>Tipocons</p>'
      #9#9'<input type="text" name="TipoconsInC">'
      #9#9'<p>Profattu</p>'
      #9#9'<input type="text" name="ProfInC">'
      #9#9'<p>Promerce</p>'
      #9#9'<input type="text" name="PromInC">'
      
        #9#9'<input type="button" value="Inserisci" style="background-color' +
        ':#ff00ff" onclick="inseriscicliente()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo5" data-role="page" id="inseris' +
        'ciF" data-theme="c">'
      #9#9'<div data-role="header">'
      #9#9#9'<h1>Inserisci Fornitore</h1>'
      '                </div>'
      #9#9'<p>Codice Fornitore</p>'
      #9#9'<input type="text" name="codInF">'
      #9#9'<p>Ragforni</p>'
      #9#9'<input type="text" name="RagfInF">'
      #9#9'<p>Esragfor</p>'
      #9#9'<input type="text" name="EsragfInF">'
      #9#9'<p>Indforni</p>'
      #9#9'<input type="text" name="IndfInF">'
      #9#9'<p>Esindfor</p>'
      #9#9'<input type="text" name="EsindfInF">'
      #9#9'<p>Capforni</p>'
      #9#9'<input type="text" name="CapfInF">'
      #9#9'<p>Citforni</p>'
      #9#9'<input type="text" name="CitfInF">'
      #9#9'<p>Escitfor</p>'
      #9#9'<input type="text" name="EscitFInF">'
      #9#9'<p>Codpaese</p>'
      #9#9'<input type="text" name="PaesfInF">'
      
        #9#9'<input type="button" value="Inserisci" style="background-color' +
        ':#ff00ff" onclick="inseriscifornitore()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo6" data-role="page" id="elimina' +
        'C" data-theme="c">'
      #9#9'<div data-role="header">'
      #9#9#9'<h1>Cancella Cliente</h1>'
      '                </div>'
      #9#9'<p>Codice Cliente</p>'
      #9#9'<input type="text" name="clienteelimina">'
      
        #9#9'<input type="button" value="Elimina" style="background-color:#' +
        'ff00ff" onclick="eliminacliente()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo7" data-role="page" id="elimina' +
        'F" data-theme="c">'
      #9#9'<div data-role="header">'
      #9#9#9'<h1>Cancella Fornitore</h1>'
      '                </div>'
      #9#9'<p>Codice Fornitore</p>'
      #9#9'<input type="text" name="fornitoreelimina">'
      
        #9#9'<input type="button" value="Elimina" style="background-color:#' +
        'ff00ff" onclick="eliminafornitore()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo8" data-role="page" id="modific' +
        'aC" data-theme="c">'
      #9#9'<div data-role="header">'
      #9#9#9'<h1>Modifica Cliente</h1>'
      '                </div>'
      #9#9'<p>Codice Cliente</p>'
      #9#9'<input type="text" name="codModC">'
      #9#9'<p>Ragfattu</p>'
      #9#9'<input type="text" name="RagfModC">'
      #9#9'<p>Esragfat</p>'
      #9#9'<input type="text" name="EsragfModC">'
      #9#9'<p>Indfattu</p>'
      #9#9'<input type="text" name="IndfModC">'
      #9#9'<p>Esindfat</p>'
      #9#9'<input type="text" name="EsindfModC">'
      #9#9'<p>Capfattu</p>'
      #9#9'<input type="text" name="CapfModC">'
      #9#9'<p>Citfattu</p>'
      #9#9'<input type="text" name="CitfModC">'
      #9#9'<p>Escitfat</p>'
      #9#9'<input type="text" name="EscitFModC">'
      #9#9'<p>Paesfatt</p>'
      #9#9'<input type="text" name="PaesfModC">'
      #9#9'<p>Paesmerc</p>'
      #9#9'<input type="text" name="PaesmModC">'
      #9#9'<p>Codiling</p>'
      #9#9'<input type="text" name="CodilingModC">'
      #9#9'<p>Ragmerce</p>'
      #9#9'<input type="text" name="RagmModC">'
      #9#9'<p>Esragmer</p>'
      #9#9'<input type="text" name="EsragmModC">'
      #9#9'<p>Indmerce</p>'
      #9#9'<input type="text" name="IndmModC">'
      #9#9'<p>Esindmer</p>'
      #9#9'<input type="text" name="EsindmModC">'
      #9#9'<p>Citmerce</p>'
      #9#9'<input type="text" name="CitmModC">'
      #9#9'<p>Escitmer</p>'
      #9#9'<input type="text" name="EscitmModC">'
      #9#9'<p>Capmerce</p>'
      #9#9'<input type="text" name="CapmModC">'
      #9#9'<p>Tipocons</p>'
      #9#9'<input type="text" name="TipoconsModC">'
      #9#9'<p>Profattu</p>'
      #9#9'<input type="text" name="ProfModC">'
      #9#9'<p>Promerce</p>'
      #9#9'<input type="text" name="PromModC">'
      
        #9#9'<input type="button" value="Modifica" style="background-color:' +
        '#ff00ff" onclick="modificacliente()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo9" data-role="page" id="modific' +
        'aF" data-theme="c">'
      #9#9'<div data-role="header">'
      #9#9#9'<h1>Modifica Fornitore</h1>'
      '                </div>'
      #9#9'<p>Codice Fornitore</p>'
      #9#9'<input type="text" name="codModf">'
      #9#9'<p>Ragforni</p>'
      #9#9'<input type="text" name="RagfModf">'
      #9#9'<p>Esragfor</p>'
      #9#9'<input type="text" name="EsragfModf">'
      #9#9'<p>Indforni</p>'
      #9#9'<input type="text" name="IndfModf">'
      #9#9'<p>Esindfor</p>'
      #9#9'<input type="text" name="EsindfModf">'
      #9#9'<p>Capforni</p>'
      #9#9'<input type="text" name="CapfModf">'
      #9#9'<p>Citforni</p>'
      #9#9'<input type="text" name="CitfModf">'
      #9#9'<p>Escitfor</p>'
      #9#9'<input type="text" name="EscitFModf">'
      #9#9'<p>Codpaese</p>'
      #9#9'<input type="text" name="PaesfModf">'
      
        #9#9'<input type="button" value="Modifica" style="background-color:' +
        '#ff00ff" onclick="modificafornitore()">'
      
        '                <input type="button" data-rel="back" data-inline' +
        '="true" data-icon="back" style="background-color:#ff00ff" value=' +
        '"Men'#249'" onclick="chiudi()">'
      #9'</form>'
      
        #9'<form method="spot" name="modulo10" data-role="page" id="listaC' +
        '" data-theme="c">'
      #9#9'<#listaCT>'
      ' '#9'</form>'
      
        '        <form method="spot" name="modulo11" data-role="page" id=' +
        '"listaF" data-theme="c">'
      #9#9'<#listaFT>'
      ' '#9'</form>'
      ''
      '</body>'
      '</html>')
    OnHTMLTag = PageProducer1HTMLTag
    Left = 208
    Top = 168
  end
end
