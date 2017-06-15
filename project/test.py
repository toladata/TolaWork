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


class CountryTestCase(TestCase):
	def setUp(self):
		new_country = Country.objects.create(country="TestCountry", code="TC", description="Just a test country")
		new_country.save()

	def test_country_exists(self):
		get_country = Country.objects.get(country="TestCountry")
		self.assertEqual(Country.objects.filter(id=get_country.id).count(), 1) 
		
