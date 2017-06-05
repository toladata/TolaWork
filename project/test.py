from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from helpdesk.models import DocumentationApp
from django.contrib.auth.models import User


class DocumentationAppTestCase(TestCase):

    def setUp(self):
        user = User.objects.create_user('john', 'lennon@thebeatles.com', 'johnpassword')
        user.save()
        new_documentation = DocumentationApp.objects.create(name="testdoc", documentation="test the documentation")
        new_documentation.save()

    def test_documentation_exists(self):
        """Check for Documentation object"""
        get_documentation = DocumentationApp.objects.get(name="testdoc")
        self.assertEqual(DocumentationApp.objects.filter(id=get_documentation.id).count(), 1)

class OrganizationTestCase(TestCase):
    def setUp(self):
        new_organization = Organization.objects.create(name="OpenBuild", description="Test OpenBuild description", organization_url="http://open.build")
        new_organization.save()

    def organization_exists(self):
        get_organization = Organization.objects.get(name="OpenBuild")
        self.assertEqual(Organizatio.objects.filter(id=get_organization.id).count(), 1)