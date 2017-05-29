from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from helpdesk.models import DocumentationApp, Queue, Ticket
from project.models import Organization, TolaUser
from django.contrib.auth.models import User


class DocumentationAppTestCase(TestCase):

    def setUp(self):
        new_documentation = DocumentationApp.objects.create(name="testdoc", documentation="test the documentation")
        new_documentation.save()

    def test_documentation_exists(self):
        """Check for Documentation object"""
        get_documentation = DocumentationApp.objects.get(name="testdoc")
        self.assertEqual(DocumentationApp.objects.filter(id=get_documentation.id).count(), 1)

class QueueTestCase(TestCase):

	def setUp(self):
		queue = Queue.objects.create(title="TestQueue", slug="TestQueue")
		queue.save()

	def test_queue_exists(self):
		get_queue = Queue.objects.get(title="TestQueue")
		self.assertEqual(Queue.objects.filter(id = get_queue.id).count(), 1)
