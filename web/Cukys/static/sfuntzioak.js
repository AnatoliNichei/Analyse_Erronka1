function submitViaAjax(form, onsuccess, onerror, check) {
    $(form).submit(function(e) {

        e.preventDefault(); // formularioa bidali ordez hurrengoa egin

        if (!check()) {
            return;
        }

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
