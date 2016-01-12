Tola-Help
===
This is a help desk and info mangement system for the Tola suite of tools

Install
===
Ensure the server you are running on has all the required pip packages.
server_requirements.txt

Virtual Environemnt
===
Create a virtual environment on each server your app will run on and install
app specific libraries in the venv

Instructions
====
Create Virtualenv
virtualenv venv  (USES SERVER INSTALLED PACKAGES)

virtualenv —no-site-packages venv
*use no site packages to prevent virtualenv from seeing your global packages

. venv/bin/activate
*allows us to just use pip from command line by adding to the path rather then full path


Activate Virtualenv
source venv/bin/activate
workon venv
OR (if using wrapper)
mkvirtualenv venv1
workon venv

Create App Specifc Library List
===
pip freeze > app_requirements.txt
* creates a app_requirements.txt file for future installs

Updating or installing on a new server
pip install -r requirements.txt
