function submitViaAjax(form, onsuccess, onerror) {
    $(form).submit(function(e) {

        e.preventDefault(); // formularioa bidali ordez hurrengoa egin

        var form = $(this);
        var url = form.attr('action');
        
        $.ajax({
               type: "POST",
               url: url,
               data: form.serialize(), // formulario datuak bidali
               success: onsuccess,
               error: onerror
             });

        
    });
}
