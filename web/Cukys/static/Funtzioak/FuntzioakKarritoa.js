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

var repeatingStructure = $('<div id="style-10" className="produktuak-container"> \
    <div id="produktuaContainer" className="produktua-container d-flex flex-row align-items-center"> \
        <div className="crop p-2 "> \
            <img src="../../../../static/images/Cookie/cashewCookie.png" alt="Cookie"> \
        </div> \
        <div className="p-2"> \
            <p className="produktua-title"> \
                <spam id="unitateak" className="unitateak">x2</spam> \
                Banana \
            </p> \
            <p className="produktu-prezioa">9,99€</p> \
        </div> \
        <div className="ml-auto p-2"> \
            <img className="x-icon" src="../../../../static/images/x.png"> \
        </div> \
    </div> \
</div>')

function addToSaskia(produktu_kodea, kantitatea, izena, prezioa, irudia) {
    if (produktu_kodea in products) {
        products[produktu_kodea].kantitatea += 1
        // products[produktu_kodea].prezioa += products[produktu_kodea].prezioa
    }
    else {
        var product = new produktua(produktu_kodea, kantitatea, izena, prezioa, irudia)
        products[produktu_kodea] = product
    }

    // console.log(JSON.stringify(products))
    alert(JSON.stringify(products))

    for (i = 0; i < products.length; i++){
        $("#KarritoZerrenda").append($('mytemplate').html());
        var fieldNameElement = document.getElementById('KarritoZerrenda');
        fieldNameElement.innerHTML = "My new text!";
        $({image}).replaceWith(product.irudia)
        $({price}).replaceWith(product.irudia)
        $({irudia}).replaceWith(product.irudia)
    }
}



