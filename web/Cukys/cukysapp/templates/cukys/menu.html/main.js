/* window.addEventListener("load", () => {
    document.querySelectorAll(".erosi").forEach((botoi) => {
        botoi.addEventListener("click", (evt) => {
            if (confirm("Gehitu karritora?")) {
                let kanti = parseInt(prompt("zenbat gehitu?"))
                kanti = kanti > 0 ? kanti : 0
                let saskia = Saskia.retrieve()
                saskia.addProduktua(evt.currentTarget.value, kanti)
                setBasket(saskia)
            }
        }, false)
    })
}, false)
*/