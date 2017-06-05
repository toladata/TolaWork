from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from helpdesk.models import *
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

class FeedbackTestCase(TestCase):

    def setUp(self):

        user = User.objects.create_user('john', 'lennon@thebeatles.com', 'johnpassword')
        user.save()
        get_user = User.objects.get(email="lennon@thebeatles.com");

        new_feedback = Feedback.objects.create(submitter=get_user, note="This is a test note", page="Test Page", severity="TestSeverity")
        new_feedback.save()

    def test_feedback_exists(self):

        """Check for Feedback object"""
        get_feedback = Feedback.objects.get(severity="TestSeverity")
        self.assertEqual(Feedback.objects.filter(id=get_feedback.id).count(), 1)

class FAQTestCase(TestCase):

    def setUp(self):
        new_faq = FAQ.objects.create(question="Test question?", answer="Test anwer")
        new_faq.save()

    def test_faq_exists(self):
        get_faq = FAQ.objects.get(question="Test question?")
        self.assertEqual(FAQ.objects.filter(id=get_faq.id).count(), 1)

        




