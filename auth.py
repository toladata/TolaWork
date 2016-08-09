import re

PASS = re.compile(r'sshd.*Failed\spassword\sfor\sinvalid\suser')
CONNECT = re.compile(r'sshd.*Did\snot\sreceive\sidentification\sstring')
ROOT = re.compile(r'sshd.*authentication\sfailure;')

def pass_fail(line):
    user_name = None
    ip_addr = None
    month=None
    day=None
    time=None
    
    if PASS.search(line):
        month,day,time,user_name, ip_addr = line.split()[0],line.split()[1],line.split()[2],line.split()[10], line.split()[12]

    return month,day,time,user_name, ip_addr

def root_fail(line):
    root_ip = None
    month_=None
    day_=None
    time_=None

    if ROOT.search(line):
        month_,day_,time_,root_ip = line.split()[0],line.split()[1],line.split()[2],line.split()[13]

    return month_,day_,time_,root_ip

def fail_connect(line):
    fail_ip=None
    month__=None
    day__=None
    time__=None

    if CONNECT.search(line):
        month__,day__,time__,fail_ip = line.split()[0],line.split()[1],line.split()[2],line.split()[11]
    return month__,day__,time__,fail_ip

with open('/var/log/auth.log') as log:
    for line in log:

        month,day,time,user_name, ip_addr = pass_fail(line[:-1])
        month__,day__,time__,fail_ip = fail_connect(line[:-1])
        month_,day_,time_,root_ip = root_fail(line[:-1])

        if user_name:
            print str(month) + " " + str(day) + " " + str(time) + " " + str(user_name) + " " + str(ip_addr)
        if fail_ip:
            print str(month__) + " " + str(day__) + " " + str(time__) + " NotIdentified " + str(fail_ip)
        if root_ip:
            print str(month_) + " " + str(day_) + " " + str(time_) + " " + "root " + str(root_ip)