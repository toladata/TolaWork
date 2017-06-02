
 $(document).ready(function (){ 

    if (document.getElementById('ticket-field')) {

      document.getElementById('ticket-field').style.display = 'none';
    };

    var triggered = false;
    var trigger = "#";
    var tickets_array = new Array(); 
  
    $.ajax({
           url: "/tasks/tasks/tickets",
           type: "GET",
           success: function (data) {
              array =  $.map(JSON.parse(data.tickets), function (el) {
                   return {
                       label: el.title,
                       queue: el.queue__title,
                       value: el.id
                   };
               });


              $("#id_note, #id_note_edit").autocomplete({
                  source: array,

                  search: function() {
                      if (!triggered) {
                          return false;
                      }
                  },
                  select: function(event, ui) {
                      var text = this.value;
                      var pos = text.lastIndexOf(trigger);

                      if ($('#id_note').is(':focus')){

                        if ($.inArray(ui.item.value, tickets_array) == -1) {
                            tickets_array.push(ui.item.value);

                            $('#tickets_create').append('<li id="item_create'+ui.item.value+'">'+'<a>['+ui.item.queue.toUpperCase()+'-'+ui.item.value+']'+ui.item.label+'</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="removeticket_create('+ui.item.value+')"><span class="label label-danger">Remove</span></a></li>');
                            this.value = text.substring(0, pos);

                            var selectedItem= ui.item.value;
                            document.getElementById('ticket-field').style.display = 'block';
                            var field = '<div id="ticket_create'+selectedItem+'"><span><input type="text" id="tickets[]" name="tickets[]" value="'+selectedItem+'" hidden></span></div>';
                            document.getElementById('ticket-field').innerHTML += field;
                        }else{
                          alert("This ticket is already linked to this task!");
                        }


                      }
                      else{

                        var div_id = document.activeElement.name;
                        console.log(div_id);

                        var linked_tickets = $(".linked_tickets"+div_id+" .ticket_linked"+div_id+"").map(function()         {
                                     return parseInt($(this).val());
                                  }).get();

                        for (var i = 0; i < linked_tickets.length; i++) {
                                tickets_array.push(linked_tickets[i]);
                        };
                        console.log(tickets_array);

                        if ($.inArray(ui.item.value, tickets_array) == -1) {
                            tickets_array.push(ui.item.value);

                            $('#tickets-edit'+div_id).append('<li id="item'+div_id+ui.item.value+'"><a>['+ui.item.queue.toUpperCase()+'-'+ui.item.value+']'+ui.item.label+'</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="removeticket('+ui.item.value+','+ div_id+')"><span class="label label-danger">Remove</span></a></li>');
                              this.value = text.substring(0, pos);

                            var selectedItem= ui.item.value;
                            console.log('ticket-edit-field'+div_id);
                            document.getElementById('ticket-edit-field'+div_id).style.display = 'block';
                            var field = '<div id="ticket'+div_id+selectedItem+'"><span><input type="text" class="ticket_linked'+div_id+' "id="tickets[]" name="tickets[]" value="'+selectedItem+'" hidden></span></div>';
                            document.getElementById('ticket-edit-field'+div_id).innerHTML += field;

                            tickets_array.length = 0;
                          }else

                          {
                            alert("This ticket is already linked to this task!");
                          }
                      }


                      triggered = false;

                      return false;
                  },
                  focus: function() { return false; },
                  minLength: 0

              }).bind("keyup", function() {
                  var text = this.value;
                  var len = text.length;
                  var last;
                  var query;
                  var index;

                  if (triggered) {
                      index = text.lastIndexOf(trigger);
                      query = text.substring(index + trigger.length);
                      $(this).autocomplete("search", query);
                  }
                  else if (len >= trigger.length) {
                      last = text.substring(len - trigger.length);
                      triggered = (last === trigger);
                  }
              });
           }  
       });
 });

//Removing inked Tickets
function removeticket(id, task_id) {
   var elem = document.getElementById("ticket"+task_id+id);
   elem.parentNode.removeChild(elem);
   document.getElementById("item"+task_id+id).style.display = "none";
   return false;
}

function removeticket_create(id) {
   var elem = document.getElementById("ticket_create"+id);
   elem.parentNode.removeChild(elem);
   document.getElementById("item_create"+id).style.display = "none";
   return false;
}
//Submit task  data
function create_task(data, csrftoken) {
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
    console.log(data.tickets);

    $.ajax({
        url : "/tasks/tasks/submit/",
        type : "POST", 
        processData: false,
        contentType: false,
        data: data,
        success : function(task) {
                $.growl.notice({title: "Success Message", message: "You have Succefully Created task #"+task.id });
                window.location.href = "/tasks/tasks/";
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};

//Edit task  data
function edit_task(data, csrftoken, task_id) {
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
        url : "/tasks/"+task_id+"/task_edit/",
        type : "POST", 
        processData: false,
        contentType: false,
        data: data,
        success : function(task) {
                alert("You have Succefully Edited task #"+task_id);
                window.location.reload(true);
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};