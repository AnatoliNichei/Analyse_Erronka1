const targetDiv = document.getElementById("cartContainer");
const btn = document.getElementById("karritoa");
const image = document.getElementById("btnCloseCart");
image.addEventListener("click", animate, false);

$( btn ).click(function() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    if(dd<10){
      dd='0'+dd
    }
    if(mm<10){
      mm='0'+mm
    }

    today = yyyy+'-'+mm+'-'+dd+'T00:00';
    document.getElementById("datefield").setAttribute("min", today);
    $(targetDiv).animate({right: '0px'});

    const image = document.getElementById("btnCloseCart");
    image.addEventListener("click", animate, false);
});

function animate() {
  $(targetDiv).animate({right: '-30%'});
}