from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from helpdesk.models import *
from project.models import Organization, TolaUser
from django.contrib.auth.models import User
from datetime import datetime


class DocumentationAppTestCase(TestCase):

    def setUp(self):
        new_documentation = DocumentationApp.objects.create(name="testdoc", documentation="test the documentation")
        new_documentation.save()

    def test_documentation_exists(self):

        """Check for Documentation object"""
        get_documentation = DocumentationApp.objects.get(name="testdoc")
        self.assertEqual(DocumentationApp.objects.filter(id=get_documentation.id).count(), 1)

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

class QueueTestCase(TestCase):

    def setUp(self):
        new_queue = Queue.objects.create(title="TestQueue", slug="TestQueue")
        new_queue.save()

    def test_queue_exists(self):
        get_queue = Queue.objects.get(title="TestQueue")
        self.assertEqual(Queue.objects.filter(id=get_queue.id).count(), 1)

class TagTestCase(TestCase):

    def setUp(self):
        new_tag = Tag.objects.create(name="TestCaseTag")
        new_tag.save()

    def test_tag_exists(self):
        get_tag = Tag.objects.get(name="TestCaseTag")
        self.assertEqual(Tag.objects.filter(id=get_tag.id).count(), 1)

class TicketTestCase(TestCase):

    def setUp(self):
        user = User.objects.create_user('doe', 'doe@open.test', 'doepassword')
        user.save()
        get_user = User.objects.get(email="doe@open.test");

        queue = Queue.objects.create(title="TestQueue1", slug="TestQueue1")
        queue.save()
        get_queue = Queue.objects.get(title="TestQueue1")

        organization = Organization.objects.create(name="OpenBuild", description="Test OpenBuild description", organization_url="http://open.build")
        organization.save()
        get_organization = Organization.objects.get(name="OpenBuild")

        new_ticket = Ticket.objects.create(title="Just a TestCase Ticket", queue=get_queue, organization=get_organization, submitter_email=get_user.email)
        new_ticket.save()

    def test_ticket_exists(self):
        get_ticket = Ticket.objects.get(title="Just a TestCase Ticket")
        self.assertEqual(Ticket.objects.filter(id=get_ticket.id).count(), 1)

class FundingOpportunityTestCase(TestCase):

    def setUp(self):
        new_f_opportuity = FundingOpportunity.objects.create(name="Opportunity1", phone="000001111", email="test@test.com", project_description="This is a test Funding opportunity", project_start_date=datetime.now(), total_estimated_amount=120000)
        new_f_opportuity.save()

    def test_fundingopportunity_exists(self):
        get_f_opportunity = FundingOpportunity.objects.get(name="Opportunity1")
        self.assertEqual(FundingOpportunity.objects.filter(id=get_f_opportunity.id).count(), 1)



        
        

        




