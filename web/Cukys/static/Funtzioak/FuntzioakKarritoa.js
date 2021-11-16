const targetDiv = document.getElementById("cartContainer");
const btn = document.getElementById("karritoa");
const image = document.getElementById("btnCloseCart");
image.addEventListener("click", animate, false);

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

    today = yyyy + '-' + mm + '-' + dd + 'T00:00';
    document.getElementById("datefield").setAttribute("min", today);
    $(targetDiv).animate({right: '0px'});

    const image = document.getElementById("btnCloseCart");
    image.addEventListener("click", animate, false);
});

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

var products = new Object();

function addToSaskia(produktu_kodea, kantitatea, izena, prezioa, irudia) {
    if (produktu_kodea in products) {
        products[produktu_kodea].kantitatea += 1
        // products[produktu_kodea].prezioa += products[produktu_kodea].prezioa
    }
    else {
        var product = new produktua(produktu_kodea, kantitatea, izena, prezioa, irudia)
        products[produktu_kodea] = product
    }

    var precio = document.getElementsByClassName("produktu-prezioa")
    precio
    // console.log(JSON.stringify(products))
    alert(JSON.stringify(products))

}
