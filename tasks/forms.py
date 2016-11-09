try:
    from StringIO import StringIO
except ImportError:
    from io import StringIO

from crispy_forms.helper import FormHelper
import floppyforms as forms
from django.forms import extras, ModelForm
from django.utils.translation import ugettext as _
try:
    from django.contrib.auth import get_user_model
    User = get_user_model()
except ImportError:
    from django.contrib.auth.models import User
try:
    from django.utils import timezone
except ImportError:
    from datetime import datetime as timezone

from tasks.models import Task


class TaskForm(forms.Form):

    task = forms.CharField(
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={'size':'60'}),
        label=_('Summary of the task'),
        )

    submitter_email = forms.EmailField(
        required=False,
        label=_('Submitter E-Mail Address'),
        widget=forms.TextInput(attrs={'size':'60'}),
        help_text=_('This e-mail address will receive copies of all updates to the task.'),
        )

    assigned_to = forms.ChoiceField(
        choices=(),
        required=False,
        label=_('Case owner'),
        help_text=_('If you select an owner other than yourself, they\'ll be '
            'e-mailed details of this ticket immediately.'),
        )

    priority = forms.ChoiceField(
        choices=Task.PRIORITY_CHOICES,
        required=False,
        initial='3',
        label=_('Priority'),
        help_text=_('Please select a priority carefully. If unsure, leave it '
            'as \'3\'.'),
        )

    status = forms.ChoiceField(
        choices=Task.STATUS_CHOICES,
        required=True,
        initial='1',
        label=_('Task status'),
        help_text=_('Select a status'),
        )

    due_date = forms.DateTimeField(
        widget=extras.SelectDateWidget,
        required=False,
        label=_('Due on'),
        )
    # tags = forms.ModelMultipleChoiceField(
    #     queryset=Tag.objects.all(),
    #     )

    def clean_due_date(self):
        data = self.cleaned_data['due_date']
        return data



    def __init__(self, *args, **kwargs):
        """
        Add any custom fields that are defined to the form
        """
        super(TaskForm, self).__init__(*args, **kwargs)

    #Crispy Form Helper to add Bootstrap and layout
    helper = FormHelper()
    helper.form_method = 'post'
    helper.form_class = 'form-horizontal'
    helper.label_class = 'col-sm-2'
    helper.field_class = 'col-sm-6'
    helper.form_error_title = 'Form Errors'
    helper.error_text_inline = True
    helper.help_text_inline = True
    helper.html5_required = True
    helper.form_tag = False

    def save(self, user):
        """
        Writes and returns a Ticket() object
        """

        t = Task( task = self.cleaned_data['title'],
                    submitter_email = self.cleaned_data['submitter_email'],
                    created = timezone.now(),
                    completed_date=self.cleaned_data['completed_date'],
                    status = Task.OPEN_STATUS,
                    note = self.cleaned_data['Note'],
                    project_agreement = self.cleaned_data['project_agreement'],
                    table = self.cleaned_data['table'],
                    priority = self.cleaned_data['priority'],
                    due_date = self.cleaned_data['due_date'],
                  )

        if self.cleaned_data['assigned_to']:
            try:
                u = User.objects.get(id=self.cleaned_data['assigned_to'])
                t.assigned_to = u
            except User.DoesNotExist:
                t.assigned_to = None
        t.save()



