function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function setUser(uname) {
    if (uname !== "" && uname !== null) {
            setCookie("username", uname, 365)
        }
}

function setBasket(saski) {
    setCookie("saskia", JSON.stringify(saski), 1)
}

function logoff() {
    setCookie("saskia", "", 365)
	location.replace("index.html")
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);

        }
    }
    return "";
}

function getBasket() {
    return existsBasket() ? JSON.parse(getCookie("saskia")) : {"erosketak": []}
}

function existsBasket() {
    return getCookie("saskia") !== ""
}

function checkUser() {
    let user = getCookie("username");
    if (user === "") {
        user = document.getElementById("erabiltzailea");
        if (user === null) {
            user = prompt("Sartu erabiltzailea:")
        } else {
            user = user.value
        }
        setUser(user);
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
    constructor(produktua, kantitatea) {
        this.produktua = produktua;
        this.kantitatea = kantitatea;
    }
}

class Produktua{
    constructor(produktuKodea, izena, prezioa, irudia) {
        this.produktuKodea = produktuKodea;
        this.izena = izena;
        this.prezioa = prezioa;
        this.irudia = irudia;
    }
}
class Saskia {
    constructor(erosketak) {
        this.erosketak = erosketak
    }

    save() {
        setCookie("saskia", JSON.stringify(this), 365)
    }

    static retrieve() {
        if (getCookie("saskia") !== null) {
            return Object.assign(new Saskia([]), getCookie("saskia"));
        } else {
            return new Saskia([])
        }
    }

    addProduktua(produktuId, kantitatea, izena, prezioa, irudia) {

        for (let i = 0; i < this.erosketak.length; ++i) {
            if (this.erosketak[i].produktua.produktuKodea == produktuId) {
                this.erosketak[i].kantitatea += kantitatea
                return
            }
        }
        this.erosketak.push(new Erosketa(new Produktua(produktuId, izena, prezioa, irudia), kantitatea))
    }

}

function addToSaskia(prodid, kant, izena, prezioa, irudia) {
    let sask = Saskia.retrieve()
    sask.addProduktua(prodid, kant, izena, prezioa, irudia)
    sask.save()
}


function saskiaEtaDatuakSortu() {
    let saskia = new Saskia([])
    let add = function(produktuId) {
        saskia.addProduktua(produktuId, 1)
    }
    return add
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

function erosketa(deskontua){
    let produktuak = new Array()
    let zenbat = prompt("Zenbat produktu erosi nahi dituzu?")

    for(x = 0; x<zenbat;x++){
        let produktua = prompt("Zein da erosi nahi duzun produktua?");
        let kantitatea = parseInt(prompt("Zenbat erosi nahi duzu?"))
        let erosketa = new Erosketa(produktua, kantitatea)
        produktuak.push(erosketa);
    }
    let saskia = new Saskia(produktuak)

   return erosi(saskia, deskontua)
}

function erosi(saskia, deskontua){

    let xml = loadXMLDoc("../xml/produktuak.py")
    let produktuak = xml.getElementsByTagName("produktua")
    for (let i = 0; i < saskia.erosketak.length; ++i) {
        for (let j = 0, produktu = produktuak[j]; j < produktuak.length; produktu = produktuak[++j]) {
            if (produktu.getElementsByTagName("produktu-kodea")[0].textContent === saskia.erosketak[i].produktua) {
                saskia.erosketak[i].prezioa = parseFloat(produktu.getElementsByTagName("prezioa")[0].textContent)
                saskia.erosketak[i].izena = produktu.getElementsByTagName("izena")[0].textContent
                break
            }
        }
    }

    let ticket = "\n\n" + getCookie("username") + " Hau da zure saskia: \n"
    let prezio_final =0
    for (let i = 0; i < saskia.erosketak.length; i++){
        ticket = ticket + "     - " + saskia.erosketak[i].produktua + "    " + saskia.erosketak[i].prezioa + "??? x " + saskia.erosketak[i].kantitatea + " = " + (saskia.erosketak[i].prezioa * saskia.erosketak[i].kantitatea).toFixed(2) + "??? \n"
        prezio_final += saskia.erosketak[i].prezioa * saskia.erosketak[i].kantitatea
    }
    let descuento
    prezio_final = prezio_final.toFixed(2)
    if (deskontua && prezio_final >= 50){
        ticket += "Prezioa deskontu gabe " + prezio_final + " ??? da.\n"
        prezio_final= (prezio_final * 0.9).toFixed(2)
        ticket += "%10 Deskontua egingo dizugu guztira 50??? edo gehiago gastatu dituzulako \n"
    }else {
        descuento = ""
    }


    ticket += "\nPrezio totala " + prezio_final + " ??? da"

    if (!confirm("Onartu erosketa?" + ticket)) {
        saskia = new Saskia()
        saskia.save()
        alert("Karritoa husten...")
        return
    }

    let kodea = saskia.igo()
    if (kodea === null) {
        saskia = new Saskia()
        saskia.save()
        alert("Karritoa husten...")
        return
    }

    saskia = new Saskia()
    saskia.save()
    alert("Zure saski kodea " + kodea + " da.")
    return

}

function logeatu(){
    let kontuak;
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../users.py", false);
    xhttp.send();
    kontuak = JSON.parse(xhttp.responseText)
    for (let i = 0; i < kontuak.length; i++) {
        let erabiltzaile = document.getElementById("erabiltzailea").value;
        if (kontuak[i] === erabiltzaile) {
            let id = new Identifikazioa(erabiltzaile, document.getElementById("pasahitza").value);
            xhttp = new XMLHttpRequest()
            xhttp.open("POST", "../erabiltzaileaKonprobatu.py", false);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("u=" + JSON.stringify(id));
            if (!JSON.parse(xhttp.responseText)[0]) {
                alert("Pasahitza okerra!")
                logoff()
                return null
            }
            location.replace("index.html")
            setUser(erabiltzaile)
            return null
        }
    }
    alert("Erabiltzaile okerra!")
    return false
}





