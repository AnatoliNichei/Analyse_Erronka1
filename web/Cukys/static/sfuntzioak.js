$("#contactForm").submit(function(e) {

    e.preventDefault(); // formularioa bidali ordez hurrengoa egin

    var form = $(this);
    var url = form.attr('action');
    
    $.ajax({
           type: "POST",
           url: url,
           data: form.serialize(), // formulario datuak bidali
           success: function()
           {
               alert("Mezua bidalita."); // placeholder
           },
           error: function()
           {
               alert("Errorea gertatu da. Saiatu beriro geroago.")
           }
         });

    
});
