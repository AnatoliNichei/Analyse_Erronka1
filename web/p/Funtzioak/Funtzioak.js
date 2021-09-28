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
        let id = new Identifikazioa(erabiltzailea, prompt("Sartu pasahitza:"))
        let xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            if (!JSON.parse(xhttp.responseText)[0]) {
                alert("Pasahitza okerra. Abortatzen!")
            } else {
                alert("Zure saski kodea: " + JSON.parse(xhttp.responseText)[1])
            }
        }
        xhttp.open("POST", "../saskia_gehitu.py");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("u=" + JSON.stringify(id) + "&s=" + JSON.stringify(this));
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