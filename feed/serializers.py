from rest_framework import serializers
from helpdesk.models import Ticket
from django.contrib.auth.models import User

class TicketSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Ticket
        fields = ('url','id','title')
