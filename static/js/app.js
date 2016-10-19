
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

    var name  = $('#id_name').val(); 
    var email = $('#id_email').val();
    var phone =$('#id_phone').val(); 
    var project_description = $('#id_project_description').val();
    var project_start_date = $('#id_project_start_date').val();
    var total_estimated_amount = $('#id_total_estimated_amount').val();
    var additional_comments = $('#id_additional_comments').val();

    var csrftoken = $("#f_opportunity-form").find('input[name="csrfmiddlewaretoken"]').val();

/*    Funding form validation*/
     if (name == null | name== "") 
          {
            alert("Please fill in your name");
            $('#id_name').focus()
          }
    else if (email == null | email== "") 
          {
            alert("Please fill in your email address");
            $('#id_email').focus();
          }

    else if (phone == null | phone== "") 
          {
            alert("Please fill in your phone/telephone Number");
            $('#id_phone').focus();
          }

    else if (project_description == null | project_description== "") 
          {
            alert("Please provide a description");
            $('#id_project_description').focus();
          }
    else if (project_start_date == null | project_start_date== "") 
          {
            alert("Please select a date");
            $('#id_project_start_date').focus();
          }
    else if(total_estimated_amount == null | total_estimated_amount== "") 
          {
            alert("Please enter amount");
            $('#id_total_estimated_amount').focus();
          }

    $.ajax({
        url : "/create_funding_opportunity/",
        type : "POST", 
        data : {
                name : name, 
                email: email,
                phone: phone, 
                project_description: project_description,
                project_start_date: project_start_date,
                total_estimated_amount: total_estimated_amount,
                additional_comments: additional_comments
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
    console.log(ticket_id);
    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }
    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        },
        headers: { "cache-control": "no-cache" }
    });

    $.ajax({
        url : "/helpdesk/tickets/ticket_edit/?ticket_id="+ticket_id,
        type : "POST", 
        data : {
                title : $('#id_title'+ticket_id).val(), 
                queue : $('#id_queue'+ticket_id).val(), 
                type: $('#id_type'+ticket_id).val(),
                owner: $('#id_owner'+ticket_id).val(),
                priority: $('#id_priority'+ticket_id).val(),
                error_msg: $('#id_error_msg'+ticket_id).val(),
                description: $('#id_description'+ticket_id).val(),
                email: $('#id_email'+ticket_id).val(),
                due_date: $('#id_due_date'+ticket_id).val(),
                edit_tags: $('#id_edit_tags'+ticket_id).val()
             },
        success : function(ticket1) {
                alert("You have Succefully Edited ticket #"+ticket_id+". Your changes will show on Page reload");
                console.log(ticket1); 
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};

//change ticket status
function edit_ticket_status(ticket_id, csrftoken) {
    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }
    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        },
        headers: { "cache-control": "no-cache" }
    });
    var open = $('#st_open'+ticket_id).val();
    /*var reopened = $('#st_reopened'+ticket_id).val();
    var resolved = $('#st_resolved'+ticket_id).val();
    var closed = $('#st_closed'+ticket_id).val();
    var duplicate = $('#st_duplicate'+ticket_id).val();*/
    var comment = $('#commentBox'+ticket_id).val();
    var public = $('#id_public'+ticket_id).val();
    $.ajax({
        url : "/helpdesk/tickets/"+ticket_id+"/post_comment/",
        type : "POST", 
        data : {
            new_status : open,
            comment : comment,
            public : public
            
        },

        success : function(ticket1) {
                alert("You have Succefully updated ticket"+ticket_id+". Your changes will show on Page reload");
                console.log(ticket1); 
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};