
class Produktua {
    constructor(produktu_kodea, kantitatea, izena, prezioa, irudia) {
        this.produktu_kodea = produktu_kodea;
        this.kantitatea = kantitatea;
        this.izena = izena;
        this.prezioa = prezioa;
        this.irudia = irudia;
    }
}


class User {
    constructor(izena, helbidea) {
        this.izenosoa = izena;
        this.helbidea = helbidea;
    }
}

var products;

window.onload = function ()  {
    let products;
    if (getCookie("saskia") != null && getCookie("saskia") !== ""){
        products = getCookie("saskia");
        products = JSON.parse(products);
    } else {
        products = new Object();
    }

    // console.log(JSON.stringify(products))


    let karritoZerrenda = document.getElementById("karritoPayment");

    let prezioGuztira = 0;

    Object.values(products).forEach(key => {
        prezioGuztira += key.prezioa * key.kantitatea;
    });

    if (products && karritoZerrenda) {
        karritoZerrenda.innerHTML = '';
        Object.values(products).map(item => {
            karritoZerrenda.innerHTML += ` 
            <div class="item">
              <span class="price">${(item.prezioa * item.kantitatea).toFixed(2)}€</span>
              <p class="item-name">${item.izena}</p>
              <p class="item-description">${item.kantitatea} unitate</p>
            </div>
            `
        })

        let prezioTotala = document.getElementById("price");
        prezioTotala.innerText = prezioGuztira.toFixed(2)+"€";
    }
    let test = getCookie("userCookie")
    alert(test)
    let usuario = Object.assign(new User(), JSON.parse(getCookie("userCookie")));
    let helbidea = usuario.helbidea
    let izenosoa = usuario.izenosoa

    let txbHelbidea = document.getElementById("txbHelbidea");
    let txtIzenOsoa = document.getElementById("txtIzenAbizena")
    let lblIzenaCheckout = document.getElementById("lblIzenaCheckout");
    txbHelbidea.value = helbidea;
    lblIzenaCheckout.innerText = usuario.izenosoa;
    txtIzenOsoa.value= izenosoa;

}


function bukatuErosketa(){
    alert("Eskerrik asko gure web orrian erosteagatik, hurrengorarte!")
    location.replace("/")
}

function errorErosketa() {
    alert("Errorea gertatu da, eta ez da erosketa gauzatu.")
        let btnErosi = document.getElementById("bukatuErosketa");
        btnErosi.disabled = false;
}

function checkErosketa(){
    if (getCookie("saskia") != null && getCookie("saskia") !== ""){
        let btnErosi = document.getElementById("bukatuErosketa");
        btnErosi.disabled = true;
        return true;
    } else {
        return false;
    }
}

submitViaAjax(document.querySelector('#erosiForm'), bukatuErosketa, errorErosketa, checkErosketa);


// COOKIES

function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function setBasket(saski) {
    setCookie("saskia", JSON.stringify(saski), 1)
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
            let ret = c
                .substring(name.length, c.length)
                .replace(/\\054/g, ',')
                .replace(/\\/g, '')
                .replace(/^"|"+$/g, '');
            if (ret[0] === ret[-1] && ret[0] === '"') {
                return  ret.substring(1, -1)
            } else {
                return ret
            }
        }
    }
    return "";
}

function getBasket() {
    return existsBasket() ? JSON.parse(getCookie("saskia")) : {"erosketak": []}
}

function logoff() {
    setCookie("saskia", "", 365)
}
