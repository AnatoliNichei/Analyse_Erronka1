const targetDiv = document.getElementById("cartContainer");
const btn = document.getElementById("karritoa");
const image = document.getElementById("btnCloseCart");
const logoffBtn = document.getElementById("logoffBtn");
image.addEventListener("click", animate, false);
logoffBtn.addEventListener("click", logoff, false);

$(btn).click(function () {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + (dd + 1) + 'T00:00';
    document.getElementById("datefield").setAttribute("min", today);
    $(targetDiv).animate({right: '0px'});

    const image = document.getElementById("btnCloseCart");
    image.addEventListener("click", animate, false);
    addToSaskia("$NULL$", 0, 0, 0, 0);

    let btnErosi = document.getElementById("btnSendCart");
    btnErosi.disabled = false;
})

function animate() {
        $(targetDiv).animate({right: '-30%'});
}

class produktua {
    constructor(produktu_kodea, kantitatea, izena, prezioa, irudia) {
        this.produktu_kodea = produktu_kodea;
        this.kantitatea = kantitatea;
        this.izena = izena;
        this.prezioa = prezioa;
        this.irudia = irudia;
    }
}

class user {
    constructor(izena, helbidea) {
        this.izena = izena;
        this.helbidea = helbidea;
    }
}

var products;

function addToSaskia(produktu_kodea, kantitatea, izena, prezioa, irudia) {

    if (getCookie("saskia") != null && getCookie("saskia") !== ""){
        products = getCookie("saskia");
        products = JSON.parse(products);
    } else {
        products = new Object();
    }

    if (produktu_kodea in products) {
        products[produktu_kodea].kantitatea += 1
        // products[produktu_kodea].prezioa += products[produktu_kodea].prezioa
    } else {
        if (produktu_kodea != "$NULL$"){
            var product = new produktua(produktu_kodea, kantitatea, izena, prezioa, irudia)
            products[produktu_kodea] = product
        }
    }

    // console.log(JSON.stringify(products))


    let karritoZerrenda = document.getElementById("KarritoZerrenda");

    prezioGuztira = 0;

    Object.values(products).forEach(key => {
        prezioGuztira += key.prezioa * key.kantitatea;
    });

    if (products && karritoZerrenda) {
        karritoZerrenda.innerHTML = '';
        Object.values(products).map(item => {
            karritoZerrenda.innerHTML += ` 
                <div id="produktuaContainer-${item.izena}" class="produktua-container d-flex flex-row align-items-center">
                    <div class="crop p-2">
                        <img src="${item.irudia}" alt="Cookie">
                    </div>
                    <div id="produktua" class="mr-auto p-2">
                        <p class="produktua-title">
                            <spam id="unitateak-${item.izena}" className="unitateak">x${item.kantitatea}</spam>
                            ${item.izena}
                        </p>
                        <p id="produktu-prezioa-${item.izena}" class="produktu-prezioa">${(item.prezioa * item.kantitatea).toFixed(2)}€</p>
                    </div>
                    <div class="p-2 d-flex flex-column">
                        <img class="arrow-icon arrow-up" id="button-gehitu-${item.izena}" src="../../../../static/images/flechaUp.png">
                        <br>
                        <img class="arrow-icon arrow-down" id="button-kendu-${item.izena}" src="../../../../static/images/flechaDown.png">
                    </div>
                    <div class="p-2">
                        <img class="x-icon" id="button-ezabatu-${item.izena}" src="../../../../static/images/x.png">
                    </div>
                </div>
            `;
        })

        const btnsUp = document.querySelectorAll(".arrow-up");
        btnsUp.forEach((button) =>{
            button.addEventListener("click", gehituGalleta, false);
        })

        const btnsDown = document.querySelectorAll(".arrow-down");
        btnsDown.forEach((button) =>{
            button.addEventListener("click", kenduGalleta, false);
        })

        const btnsDelete = document.querySelectorAll(".x-icon");
        btnsDelete.forEach((button) =>{
            button.addEventListener("click", kenduGalletaGuztiak, false);
        })


        localStorage.setItem("products", JSON.stringify(products));

        setBasket(products);

        let prezioTotala = document.getElementById("price");
        prezioTotala.innerText = prezioGuztira.toFixed(2)+"€";
    }
}

function gehituGalleta(){
    let products = localStorage.getItem("products");
    products = JSON.parse(products);

    Object.values(products).forEach(key => {
        if (this.id == "button-gehitu-"+key.izena){
            key.kantitatea = key.kantitatea + 1;
            let element = document.getElementById("unitateak-"+key.izena);
            element.innerText = "x" + key.kantitatea;
            element = document.getElementById("produktu-prezioa-"+key.izena);
            element.innerText = (key.kantitatea * key.prezioa).toFixed(2) + "€";

        }
    });

    let prezioTotala = document.getElementById("prezioTotala");

    localStorage.setItem("products", JSON.stringify(products));

    setBasket(products);

    prezioTotala.innerText = prezioTotalaGalletak().toFixed(2)+"€";

}

function prezioTotalaGalletak(){
    let products = localStorage.getItem("products");
    products = JSON.parse(products);
    prezioGuztira = 0;
    Object.values(products).forEach(key => {
        prezioGuztira += key.prezioa * key.kantitatea;
    });
    return prezioGuztira;
}

function kenduGalleta(){
    let products = localStorage.getItem("products");
    products = JSON.parse(products);

    Object.values(products).forEach(key => {
        if (this.id == "button-kendu-"+key.izena){
            if (key.kantitatea > 1){
                key.kantitatea = key.kantitatea - 1;
                let element = document.getElementById("unitateak-"+key.izena);
                element.innerText = "x" + key.kantitatea;
                element = document.getElementById("produktu-prezioa-"+key.izena);
                element.innerText = (key.kantitatea * key.prezioa).toFixed(2) + "€";
            } else {
                removeItem("produktuaContainer-"+key.izena);
                delete products[key.produktu_kodea];
            }
        }
    });


    let prezioTotala = document.getElementById("prezioTotala");

    localStorage.setItem("products", JSON.stringify(products));

    setBasket(products);

    prezioTotala.innerText = prezioTotalaGalletak().toFixed(2)+"€";

}


function kenduGalletaGuztiak(){
    let products = localStorage.getItem("products");
    products = JSON.parse(products);

    Object.values(products).forEach(key => {
        if (this.id == "button-ezabatu-"+key.izena){
            removeItem("produktuaContainer-"+key.izena);
            delete products[key.produktu_kodea];
        }
    });


    let prezioTotala = document.getElementById("prezioTotala");

    localStorage.setItem("products", JSON.stringify(products));

    setBasket(products);

    prezioTotala.innerText = prezioTotalaGalletak().toFixed(2)+"€";

}

function removeItem( itemid ) {
  var element = document.getElementById(itemid );
  element.parentNode.removeChild(element);
}

function erosiError(response) {
    let btnErosi = document.getElementById("btnSendCart")
    btnErosi.disabled = false
    if (response.status == 503) {
        alert("Logeatu behar zara erosketak egiteko.")
    } else if (response.status == 400 && response.responseText == "fechaErronea") {
        alert("Data sartu behar duzu.")
    } else if (response.status == 400 && response.responseText == "fechaPasada") {
        alert("Data balidoa sartu behar duzu.")
    } else {
        alert("Errorea gertatu da. Saiatu berriro geroago.")
    }
}

function erosiKarritoa(response){
    animate();
    window.location.href = "/checkout/";
}

function checkKarritoa(){
    if (getCookie("saskia") != null && getCookie("saskia") !== ""){
        let btnErosi = document.getElementById("btnSendCart");
        btnErosi.disabled = true;
        return true;
    } else {
        return false;
    }
}



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
            return c.substring(name.length, c.length);

        }
    }
    return "";
}

function getBasket() {
    return existsBasket() ? JSON.parse(getCookie("saskia")) : {"erosketak": []}
}

function logoff() {
    setCookie("saskia", "", 0.0001)
}
