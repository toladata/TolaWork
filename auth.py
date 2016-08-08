import re

PASS = re.compile(r'sshd.*Failed\spassword\sfor\sinvalid\suser')
CONNECT = re.compile(r'sshd.*Did\snot')


def password_failure(line):
    user_name = None
    ip_addr = None
    
    if PASS.search(line):
        user_name, ip_addr = line.split()[10], line.split()[12]

    return user_name, ip_addr

def failed_connection(line):

    if CONNECT.search(line):

        return line.split()[11]


fail_pass = {}
failed_conns = {}

with open('/var/log/auth.log') as log:
    for line in log:

        user_name, ip_addr = password_failure(line[:-1])

        if user_name:
            #print str(user_name) + " - " + str(ip_addr)
            if fail_pass.get(user_name):
                fail_pass[user_name] += 1
            else:
                fail_pass[user_name] = 1


        ip_add = failed_connection(line[:-1])

        if ip_add:
            if failed_conns.get(ip_add):
                failed_conns[ip_add] += 1
            else:
                failed_conns[ip_add] = 1

print('Failed Logins')
print(fail_pass)
print('Failed connections')
print(failed_conns)