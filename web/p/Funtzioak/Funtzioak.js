function pasahitzaBaieztatu() {
    let kontuak;
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        kontuak = JSON.parse(xhttp.responseText)
    }

    xhttp.open("GET", "../users.py");
    xhttp.send();
    let erabiltzailea, pasahitza;
    let buklea = true
    erabiltzailea = prompt("Sartu erabiltzailea:")
    pasahitza = prompt("Sartu pasahitza:")

    for (let i = 0; i < kontuak.length && buklea; i++) {
        if (kontuak[i]["Erabiltzailea"] === erabiltzailea && kontuak[i]["Pasahitza"] === pasahitza) {
            alert("Logeatu egin zara,Oso ondo!")
            buklea = false
        }
    }
    if (buklea) {
        alert("Erabiltzailea eta pasahitza ez dira zuzena")

    }
}

function isValidDate(s) {
    return /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/.test(s)
}


class Erosketa {
    constructor(erabiltzailea, produktua, saskiKodea, kantitatea) {
        this.erabiltzailea = erabiltzailea;
        this.produktua = produktua;
        this.saskiKodea = saskiKodea;
        this.kantitatea = kantitatea;
    }
}

var saskia = new Array();

function erosi(){
    var erabiltzailea = prompt("Zein da zure izena?");
    var produktua = prompt("Zein da erosi nahi duzun produktua?");
    var saskiKodea = saskia.length + 1;
    var kantitatea = parseInt(prompt("Zenbat erosi nahi duzu?"))

    var erosketa = new Erosketa(erabiltzailea, produktua, saskiKodea, kantitatea)
    saskia.push(erosketa);

    var ticket = "Saski Kodea: " + saskiKodea + "\n\n" + erabiltzailea + ", hau da zure saskia: \n"
    for (var i = 0; i < saskia.length; i++){
        ticket = ticket + "     - " + saskia[i].produktua + "   x" + saskia[i].kantitatea + "\n"
    }

    alert(ticket)
}


class Bezeroa {
    constructor(erabiltzailea, izena, abizena, helbidea, telefono, NAN, pasahitza, emaila) {
        this.erabiltzailea = erabiltzailea;
        this.izena = izena;
        this.abizena = abizena;
        this.helbidea = helbidea;
        this.telefono = telefono;
        this.NAN = NAN;
        this.pasahitza = pasahitza;
        this.emaila = emaila;
    }
}

var erabiltzaileak = new Array();

function registratu(){

    var erabiltzailea = prompt("Ezarri zure erabiltzailea");
    var izena = prompt("Zein da zure Izena?");
    var abizena = prompt("Zein da zure Abizena?");
    var helbidea = prompt("Zein da zure Helbidea?");
    var telefono = prompt("Zein da zure Telefonoa?");
    var NAN = prompt("Zein da zure NANa?");
    var pasahitza = prompt("Ezarri pasahitz bat");
    var emaila = prompt("Zein da zure Emaila?");

    var bezeroa = new Bezeroa(erabiltzailea, izena, abizena, helbidea, telefono, NAN, pasahitza, emaila)
    erabiltzaileak.push(bezeroa);

    var stringEreg = "Kaixo " + erabiltzailea + ", Ondo erregistratu egin zara."

    alert(stringEreg)
}