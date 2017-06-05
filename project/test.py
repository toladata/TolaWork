from django.test import TestCase
from django.test import RequestFactory
from django.test import Client
from project.models import *
from django.contrib.auth.models import User

class OrganizationTestCase(TestCase):
    def setUp(self):
        new_organization = Organization.objects.create(name="OpenBuild", description="Test OpenBuild description", organization_url="http://open.build")
        new_organization.save()

    def test_organization_exists(self):
        get_organization = Organization.objects.get(name="OpenBuild")
        self.assertEqual(Organization.objects.filter(id=get_organization.id).count(), 1)

class AnnouncementTestCase(TestCase):
	def setUp(self):
		new_announcement = Announcement.objects.create(title="Test Announcement", description="Test Announcement description")
		new_announcement.save()

	def test_announcement_exists(self):
		get_announcement = Announcement.objects.get(title="Test Announcement")
		self.assertEqual(Announcement.objects.filter(id=get_announcement.id).count(), 1)