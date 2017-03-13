
 $(document).ready(function () { 
    var triggered = false;
    var trigger = "#";
    $.ajax({
           url: "/tasks/tasks/tickets",
           type: "GET",
           success: function (data) {
              array =  $.map(JSON.parse(data.tickets), function (el) {
                   return {
                       label: el.title,
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

                      this.value = text.substring(0, pos)+'<a href="/helpdesk/tickets/'+ui.item.value+'/">[Ticket: '+ui.item.value+']</a>  ';

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

    $.ajax({
        url : "/tasks/tasks/submit/",
        type : "POST", 
        processData: false,
        contentType: false,
        data: data,
        success : function(task) {
                alert("You have Succefully Created task #"+task.id);
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
                window.location.href = "/tasks/tasks/";
        },
        error : function(xhr,errmsg,err) {
            console.log(xhr.status + ": " + xhr.responseText); 
        }
    });
};