from django.contrib import admin
from easy_select2 import select2_modelform
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin
from helpdesk.models import Queue, Ticket, FollowUp, PreSetReply, KBCategory, Tag
from helpdesk.models import EscalationExclusion, EmailTemplate, KBItem
from helpdesk.models import TicketChange, Attachment, IgnoreEmail
from helpdesk.models import CustomField
from helpdesk.models import UserSettings
from helpdesk.models import DocumentationApp, DocumentationAppAdmin, FAQ, FAQAdmin, FundingOpportunity

class QueueAdmin(admin.ModelAdmin):
    list_display = ('title', 'slug', 'email_address', 'locale')

class TicketAdmin(admin.ModelAdmin):
    list_display = ('title', 'status', 'assigned_to', 'submitter_email',)
    date_hierarchy = 'created'
    list_filter = ('assigned_to', 'status', )
    form = select2_modelform(Ticket)

class TicketChangeInline(admin.StackedInline):
    model = TicketChange

class AttachmentInline(admin.StackedInline):
    model = Attachment

class FollowUpAdmin(admin.ModelAdmin):
    inlines = [TicketChangeInline, AttachmentInline]
    list_display = ('ticket', 'date', 'title', 'comment')
    list_display_links = ('ticket',)
    #list_display = [field.name for field in Book._meta.fields if field.name != "id"]
    #list_display=FollowUpAdmin._meta.get_all_field_names()

class KBItemAdmin(admin.ModelAdmin):
    list_display = ('category', 'title', 'last_updated',)
    list_display_links = ('title',)


class CustomFieldAdmin(admin.ModelAdmin):
    list_display = ('name', 'label', 'data_type')

class EmailTemplateAdmin(admin.ModelAdmin):
    list_display = ('template_name', 'heading', 'locale')
    list_filter = ('locale', )

class UserAdminWithQueueMemberships(UserAdmin):

    def change_view(self, request, object_id, form_url='', extra_context=None):
        self.inlines = (QueueMembershipInline,)

        return super(UserAdminWithQueueMemberships, self).change_view(
            request, object_id, form_url=form_url, extra_context=extra_context)

admin.site.register(Tag)
admin.site.register(Ticket, TicketAdmin)
admin.site.register(Queue, QueueAdmin)
admin.site.register(FollowUp, FollowUpAdmin)
admin.site.register(PreSetReply)
admin.site.register(EscalationExclusion)
admin.site.register(EmailTemplate, EmailTemplateAdmin)
admin.site.register(KBCategory)
admin.site.register(KBItem, KBItemAdmin)
admin.site.register(IgnoreEmail)
admin.site.register(CustomField, CustomFieldAdmin)
admin.site.register(DocumentationApp, DocumentationAppAdmin)
admin.site.register(FAQ, FAQAdmin)
admin.site.register(FundingOpportunity)



