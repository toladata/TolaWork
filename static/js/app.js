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

        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText);
        }
    });
};

//Submit ticket edit data
function edit_ticket_post(ticket_id, csrftoken) {

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

    $.ajax({
        url : "/helpdesk/tickets/ticket_edit/?ticket_id="+ticket_id,
        type : "POST", 
        data : {
                title : $('#id_title').val(), 
                queue : $('#id_queue').val(), 
                type: $('#id_type').val(),
                owner: $('#id_owner').val(),
                priority: $('#id_priority').val(),
                error_msg: $('#id_error_msg').val(),
                description: $('#id_description').val(),
                email: $('#id_email').val(),
                due_date: $('#id_due_date').val(),
                edit_tags: $('#id_edit_tags'+ticket_id).val()
             },
        success : function(ticket1) {
                alert("You have Succefully Edited ticket #"+ticket_id+". Your changes will show on Page reload");
                
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};
