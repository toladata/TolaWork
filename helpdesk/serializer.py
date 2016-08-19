from rest_framework import serializers
from helpdesk.models import Ticket, Queue, FollowUp, TicketDependency, TicketChange, Attachment
from django.contrib.auth.models import User


class QueueSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = Queue
		fields = ('id', 'title')

class UserSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = User
		fields = ('id', 'username', 'email')

class FollowUpSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = FollowUp
		fields = ('id', 'date', 'title', 'comment', 'public', 'ticket', 'user')

class TicketChangeSerializer(serializers.ModelSerializer):
	class Meta:
		model = TicketChange
		fields = ('id', 'field', 'old_value', 'new_value', 'followup')

class AttachmentSerializer(serializers.ModelSerializer):
	class Meta:
		model = Attachment
		fields = ('id', 'filename', 'mime_type', 'size', 'followup')

class TicketSerializer(serializers.ModelSerializer):
	queue = QueueSerializer()
	assigned_to = UserSerializer()
	class Meta:
		model = Ticket
		fields = ('id', 'title', 'created', 'submitter_email', 'status', 'description', 'priority', 'queue', 'assigned_to')

class TicketDependencySerializer(serializers.ModelSerializer):
	ticket = TicketSerializer()
	depends_on = TicketSerializer()
	
	class Meta:
		model = TicketDependency
		fields = ('id','ticket', 'depends_on')