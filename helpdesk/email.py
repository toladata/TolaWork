from django.core.mail import send_mail
from django.template.loader import render_to_string

def email(t,comment, status_text, send_to):

    if status_text == "NEW":
        txt_message = render_to_string('email/new_ticket.txt', {'ticket': t, 'comment': comment })
        html_message = render_to_string('email/new_ticket.html', {'ticket': t, 'comment': comment })
    else:
        txt_message = render_to_string('email/notify.txt', {'ticket': t, 'status': status_text, 'comment': comment })
        html_message = render_to_string('email/notify.html', {'ticket': t, 'status': status_text, 'comment': comment })

    send_mail('[TolaWork] ' + t.title, txt_message,'TolaData <toladatawork@gmail.com>',[send_to],fail_silently=False, html_message=html_message)

def reminders(ticket,send_to):

    txt_message = render_to_string('email/reminders.txt', {'ticket': ticket})
    html_message = render_to_string('email/reminders.html', {'ticket': ticket})

    send_mail('[TolaWork Reminders] ' + ticket.title, txt_message,'TolaData <toladatawork@gmail.com>',[send_to],fail_silently=False, html_message=html_message)