function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function setUser(uname) {
    if (uname != "" && uname != null) {
            setCookie("username", uname, 365)
        }
}

function setBasket(saski) {
    setCookie("saskia", JSON.stringify(saski), 1)
}

function logoff() {
    setCookie("username", "", 365)
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function getBasket() {
    return JSON.parse(getCookie("saskia"))
}

function existsBasket() {
    return getCookie("saskia") !== ""
}

function checkUser() {
    let user = getCookie("username");
    if (user === "") {
        user = prompt("Erabiltzailea sartu:", "")
        setUser(user)
    }
    return user
}

function erabiltzaileaBaieztatu(erabiltzailea) {
    let kontuak;
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../users.py", false);
    xhttp.send();
    kontuak = JSON.parse(xhttp.responseText)
    for (let i = 0; i < kontuak.length; i++) {
        if (kontuak[i] === erabiltzailea) {
            return true
        }
    }
    return false
}

function isValidDate(s) {
    return /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/.test(s)
}

class Identifikazioa {
    constructor(erabiltzailea, pasahitza) {
        this.erabiltzailea = erabiltzailea
        this.pasahitza = pasahitza
    }
}

class Erosketa {
    constructor(produktuKodea, kantitatea) {
        this.produktua = produktuKodea;
        this.kantitatea = kantitatea;
    }
}

class Saskia {
    constructor(erosketak) {
        this.erosketak = erosketak
    }
    igo() {
        let erabiltzailea = checkUser()
        if (!erabiltzaileaBaieztatu(erabiltzailea)) {
            alert("Erabiltzailea ez da existitzen. Abortatzen!")
            logoff()
            return
        }
        let id = new Identifikazioa(erabiltzailea, prompt("Sartu " + erabiltzailea + " erabiltzailearen pasahitza:"))
        let xhttp = new XMLHttpRequest()
        xhttp.open("POST", "../saskia_gehitu.py", false);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("u=" + JSON.stringify(id) + "&s=" + JSON.stringify(this));
        if (!JSON.parse(xhttp.responseText)[0]) {
            alert("Pasahitza okerra!")
            logoff()
            return null
        }
        return JSON.parse(xhttp.responseText)[1]
    }
    save() {
        setBasket(this)
    }
    static from(json){
        return Object.assign(new Saskia([]), json);
    }
    static retrieve() {
        if (existsBasket()) {
            return Saskia.from(getBasket());
        } else {
            return new Saskia([])
        }
    }

}


class Bezeroa {
    constructor(erabiltzailea, izena, abizena, helbidea, telefono, NAN, pasahitza, emaila) {
        this.erabiltzailea = erabiltzailea;
        this.izena = izena;
        this.abizena = abizena;
        this.helbidea = helbidea;
        this.telefono = telefono;
        this.nan = NAN;
        this.pasahitza = pasahitza;
        this.emaila = emaila;
    }
    igo() {
        let xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let response = JSON.parse(xhttp.responseText)
            setUser(response[0])
        }
        xhttp.open("POST", "../erabiltzailea_gehitu.py");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("s=" + JSON.stringify(this));
    }
}

function loadXMLDoc(filename)
{
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", filename, false);
    xhttp.send("");
    return xhttp.responseXML;
}

function sartuTaula(taulaId) {
    let xml = loadXMLDoc("../xml/produktuak.py");
    let xsl = loadXMLDoc("../xml/produktuak.xsl");
    let xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    let resultDocument = xsltProcessor.transformToFragment(xml, document);
    document.getElementById(taulaId).appendChild(resultDocument);
}

function erosketa(){
    let produktuak = new Array()
    let zenbat = prompt("Zenbat produktu erosi nahi dituzu?")

    for(x = 0; x<zenbat;x++){
        let produktua = prompt("Zein da erosi nahi duzun produktua?");
        let kantitatea = parseInt(prompt("Zenbat erosi nahi duzu?"))
        let erosketa = new Erosketa(produktua, kantitatea)
        produktuak.push(erosketa);
    }
    let saskia = new Saskia(produktuak)

    let xml = loadXMLDoc("../xml/produktuak.py")
    produktuak = xml.getElementsByTagName("produktua")
    for (let i = 0; i < saskia.erosketak.length; ++i) {
        for (let i = 0, produktu = produktuak[i]; i < produktuak.length; produktu = produktuak[++i]) {
            if (produktu.getElementsByTagName("produktu-kodea")[0].textContent === saskia.erosketak[i].produktua) {
                saskia.erosketak[i].prezioa = parseFloat(produktu.getElementsByTagName("prezioa")[0].textContent) * saskia.erosketak[i].kantitatea
                break
            }
        }
    }



    let ticket = "Saski Kodea: " + saskia.igo() + "\n\n" + getCookie("username") + ", hau da zure saskia: \n"
    let prezioa = 0
    for (let i = 0; i < saskia.erosketak.length; ++i) {
        prezioa += saskia.erosketak[i].prezioa
        ticket = ticket + "     - " + saskia.erosketak[i].produktua + "   x" + saskia.erosketak[i].kantitatea + "   =" + saskia.erosketak[i].prezioa + "\n"
    }
    ticket += "Totala:  " + prezioa

    alert(ticket)

}
var saskia = new Array();
function Erosketa_guztira(){

    var erosketa = new Array()
    var erabiltzailea = prompt("Zein da zure izena?");
    var zenbat = prompt("Zenbat produktu erosi nahi dituzu?")
    var saskiKodea = saskia.length + 1;
    for(x=0;x<zenbat;x++){
        var produktua = prompt("Zein da erosi nahi duzun "+ (x+1) +" produktua?");
        var kantitatea = parseInt(prompt("Zenbat "+ produktua +" erosi nahi duzu?"))
        var prezioa = parseFloat(prompt("Zenbat balio du?"))
        erosketa.push({produktua:produktua,saskiKodea:saskiKodea,kantitatea:kantitatea,prezioa:prezioa})
    }


    var ticket = "Saski Kodea: " + saskiKodea + "\n\n" + erabiltzailea + ", hau da zure saskia: \n"
    var prezio_final =0
    for (var i = 0; i < erosketa.length; i++){
        ticket = ticket + "     - " + erosketa[i].produktua +"    "+parseFloat(erosketa[i].prezioa)+"€ x " + erosketa[i].kantitatea + " = " + parseFloat(erosketa[i].prezioa)*erosketa[i].kantitatea +"€ \n"
        prezio_final+=parseFloat(erosketa[i].prezioa)*erosketa[i].kantitatea
    }
    var final_de_ticket = "Prezio totala " + prezio_final + " € da"
    alert(ticket+ "\n" +final_de_ticket)
}

function Erosketa_deskontuarekin(){
    var erosketa = new Array()
    var erabiltzailea = prompt("Zein da zure izena?");
    var zenbat = prompt("Zenbat produktu erosi nahi dituzu?")
    var saskiKodea = saskia.length + 1;
    for(x=0;x<zenbat;x++){
        var produktua = prompt("Zein da erosi nahi duzun "+ (x+1) +" produktua?");
        var kantitatea = parseInt(prompt("Zenbat "+ produktua +" erosi nahi duzu?"))
        var prezioa = parseFloat(prompt("Zenbat balio du?"))
        erosketa.push({produktua:produktua,saskiKodea:saskiKodea,kantitatea:kantitatea,prezioa:prezioa,prezio_linea:prezioa*kantitatea})
    }


    var ticket = "Saski Kodea: " + saskiKodea + "\n\n" + erabiltzailea + ", hau da zure saskia: \n"
    var prezio_final =0
    for (var i = 0; i < erosketa.length; i++){
        ticket = ticket + "     - " + erosketa[i].produktua +"    "+parseFloat(erosketa[i].prezioa)+"€ x " + erosketa[i].kantitatea + " = " + parseFloat(erosketa[i].prezio_linea) +"€ \n"
        prezio_final+=parseFloat(erosketa[i].prezio_linea)
    }
    if (prezio_final >= 50){
        prezio_final= prezio_final * 0.9
        var descuento = "%10 Deskontua egingo dizugu guztira 50€ edo gehiago gastatu dituzulako \n \n"
    }else {
        descuento = ""
    }


    var final_de_ticket = "Prezio totala " + prezio_final + " € da "
    alert(ticket+"\n"+ descuento +final_de_ticket)
}


