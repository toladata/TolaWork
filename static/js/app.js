
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
function edit_ticket_post(data, csrftoken, ticket_id) {
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

    console.log(data)

    $.ajax({
        url : "/helpdesk/tickets/ticket_edit/?ticket_id="+ticket_id,
        type : "POST", 
        processData: false,
        contentType: false,
        data: data,
        success : function(ticket1) {
                alert("You have Succefully Edited ticket #"+ticket_id+". Your changes will show on Page reload");
                console.log(ticket1); 
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};

function create_ticket(data, csrftoken){

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
        url : "/helpdesk/tickets/submit/",
        type : "POST", 
        processData: false,
        contentType: false,
        data: data,
        success : function(ticket) {
                alert("You have Succefully submitted a ticket!!");
                console.log(ticket); 
                window.location.href = '/helpdesk/tickets/'+ticket.ticket_id;
        },
        error : function(xhr,errmsg,err) {
            console.log("There was a problem submitting your ticket"); 
        }
    });
}

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

   var new_status = $('input[name="new_status'+ticket_id+'"]:checked').val();
   var comment = $('#commentBox'+ticket_id).val();
   var public = $('#id_public'+ticket_id).val();
   var data_object = {
            new_status : new_status,
             comment : comment,
            public : public
           
       };
       
   $.ajax({
       url : "/helpdesk/tickets/"+ticket_id+"/post_comment/",
       type : "POST", 
       data : data_object,

       success : function() {
            alert("You have Succefully updated ticket "+ticket_id+". Your changes will show on Page reload");
       },
       error : function(xhr,errmsg,err) {

           console.log(xhr.status + ": " + xhr.responseText); 
       }
   });
};

//Post a ticket to Github without reloading the page
function send_to_github(ticketid){

  $.get('/helpdesk/tickets/'+ticketid+'/send_to_github/', function(data){
    if (data.success_message) { 
       $.growl.notice({title: "Success Message", message: data.success_message });
       $('#before_github_send').addClass('hidden');
       $('#after_github_send').removeClass('hidden');
    }
    else if (data.failure_message) {
       $.growl.error({title: "Success Message", message: data.failure_message });

    }
    else{
       $.growl.warning({title: "Success Message", message: data.warning_message });

    }
  });
};

function github_sync(){

  $.getJSON("/tickets", function(data) {  

                  var tickets = JSON.parse(data['tickets']);  
                  for (var i = 0; i < tickets.length; i++) {

                      $.ajax({
                            type: 'GET',
                            url: '/githubSync/'+tickets[i].id+'/',
                            timeout: 0,
                            success: function(response) {

                              if (response.status_lbl == "Success") {

                                $.growl.notice({title: response.status_lbl, message: "Ticket ["+response.id+"] is succesfully synced with Github" });
                              }else{
                                $.growl.error({title: response.status_lbl, message: "Ticket ["+response.id+"] Faied to update" });
                              };
                                
                            },       
                             error : function(xhr,errmsg,err) {

                                 console.log(xhr.status + ": " + xhr.responseText); 
                             }
                        });
                    };        
            }); 

};