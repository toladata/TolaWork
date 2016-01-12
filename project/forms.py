from crispy_forms.helper import FormHelper
from crispy_forms.layout import *
from crispy_forms.layout import Layout, Submit, Reset
import floppyforms.__future__ as forms
from helpdesk.models import Feedback
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User


class FeedbackForm(forms.ModelForm):

    class Meta:
        model = Feedback
        fields = '__all__'


    severity = forms.ChoiceField(
        label="Priority",
        choices=(("High", "High"), ("Medium", "Medium"), ("Low", "Low")),
        widget=forms.Select,
        initial='2',
        required=True,
    )

    helper = FormHelper()
    helper.form_method = 'post'
    helper.form_class = 'form-horizontal'
    helper.label_class = 'col-sm-2'
    helper.field_class = 'col-sm-6'
    helper.form_error_title = 'Form Errors'
    helper.error_text_inline = True
    helper.help_text_inline = True
    helper.html5_required = True
    helper.layout = Layout(Fieldset('', 'submitter', 'note', 'page', 'severity'),Submit('submit', 'Submit', css_class='btn-default'), Reset('reset', 'Reset', css_class='btn-warning'))


class RegistrationForm(UserChangeForm):
    """
    Form for registering a new account.
    """
    def __init__(self, *args, **kwargs):
        super(RegistrationForm, self).__init__(*args, **kwargs)
        del self.fields['password']

    class Meta:
        model = User
        fields = '__all__'


    helper = FormHelper()
    helper.form_method = 'post'
    helper.form_class = 'form-horizontal'
    helper.label_class = 'col-sm-2'
    helper.field_class = 'col-sm-6'
    helper.form_error_title = 'Form Errors'
    helper.error_text_inline = True
    helper.help_text_inline = True
    helper.html5_required = True
    helper.layout = Layout(Fieldset('', 'first_name', 'last_name', 'user', 'username', 'password'), Submit('submit', 'Submit', css_class='btn-default'), Reset('reset', 'Reset', css_class='btn-warning'))



