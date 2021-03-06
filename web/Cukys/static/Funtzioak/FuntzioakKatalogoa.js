const btns = document.querySelectorAll(".btnFilter");
const galletaGuztiak = document.querySelectorAll(".galletaGuztiak");

for (i = 0; i < btns.length; i++){

    let element = btns[i];
    btns[i].addEventListener("click", (e) =>{
        e.preventDefault();
        const filter = e.target.dataset.filter;
        Array.from(btns).forEach(function(btn) {
          if (btn.classList.contains("btnFilterFocus")){
            btn.classList.toggle("btnFilterFocus");
          }
        });
        element.classList.toggle("btnFilterFocus");
        galletaGuztiak.forEach((product)=>{
            if (product.classList.contains("d-flex")){
                    product.classList.toggle("d-flex")
                }
            if (filter == "all"){
                if (!product.classList.contains("d-flex")){
                    product.classList.toggle("d-flex")
                }
            } else {
                if(product.classList.contains(filter)){
                    if (!product.classList.contains("d-flex")){
                        product.classList.toggle("d-flex")
                    }
                } else {
                    if (!product.classList.contains("d-none")){
                        product.classList.toggle("d-none")
                    }
                }
            }
        })
    })
}

