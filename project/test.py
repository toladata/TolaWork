from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from helpdesk.models import DocumentationApp
from django.contrib.auth.models import User


class IndicatorTestCase(TestCase):

    def setUp(self):
        user = User.objects.create_user('john', 'lennon@thebeatles.com', 'johnpassword')
        user.save()
        new_documentation = DocumentationApp.objects.create(name="testdoc", documentation="test the documentation")
        new_documentation.save()

    def test_documentation_exists(self):
        """Check for Documentation object"""
        get_documentation = DocumentationApp.objects.get(name="testdoc")
        self.assertEqual(DocumentationApp.objects.filter(id=get_documentation.id).count(), 1)

