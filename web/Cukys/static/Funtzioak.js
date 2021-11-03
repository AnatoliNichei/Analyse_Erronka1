function getBasket() {
    return existsBasket() ? JSON.parse($.cookie("saskia")) : {"erosketak": []}
}

function existsBasket() {
    return $.cookie("saskia") !== null
}

function isValidDate(s) {
    return /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/.test(s)
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

    save() {
        $.cookie("saskia", JSON.stringify(this))
    }

    static retrieve() {
        if ($.cookie("saskia") === null) {
            return Object.assign(new Saskia([]), json);
        } else {
            return new Saskia([])
        }
    }

    addProduktua(produktuId, kantitatea) {
        for (let i = 0; i < this.erosketak.length; ++i) {
            if (this.erosketak[i].produktua == produktuId) {
                this.erosketak[i].kantitatea += kantitatea
                return
            }
        }
        this.erosketak.push(new Erosketa(produktuId, kantitatea))
    }

}

$(document).ready(function() {

    if($.cookie("username") === null){
        $("#loginVisible").css("display", "none")
        $("#logoff").css("display", "block")
        let karrito = $("#karritoa")
        if (karrito !== null) {
            karrito.css("display", "block")
        }
    }else{
        $("#loginVisible").css("display", "block")
        $("#logoff").css("display", "none")
        let karrito = $("#karritoa")
        if (karrito !== null) {
            karrito.css("display", "block")
        }
    }});



