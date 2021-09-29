window.addEventListener("load", () => {
    document.querySelectorAll(".erosi").forEach((botoi) => {
        botoi.addEventListener("click", (evt) => {
            let saskia = Saskia.retrieve()
            alert("Saskira gehitzen...")
            saskia.addProduktua(evt.currentTarget.value, 1)
            setBasket(saskia)
        }, false)
    })
}, false)