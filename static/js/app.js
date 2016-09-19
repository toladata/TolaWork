//App specific JavaScript

function create_post() {


    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }
    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        }
    });

    var csrftoken = $("#f_opportunity-form").find('input[name="csrfmiddlewaretoken"]').val();

    $.ajax({
        url : "/create_funding_opportunity/",
        type : "POST", 
        data : {
                name : $('#id_name').val(), 
                email: $('#id_email').val(),
                phone:$('#id_phone').val(), 
                project_description: $('#id_project_description').val(),
                project_start_date: $('#id_project_start_date').val(),
                total_estimated_amount: $('#id_total_estimated_amount').val(),
                additional_comments: $('#id_additional_comments').val()
             },

        success : function(json) {
            $('#id_name').val('');
            $('#id_email').val('');
            $('#id_phone').val('');
            $('#id_project_description').val('');
            $('#id_project_start_date').val('');
            $('#id_total_estimated_amount').val('');
            $('#id_additional_comments').val('');

            $('#fundingModal').modal('hide')
        },

        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};
