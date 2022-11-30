#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
TOKEN="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" #this is your secret github token
cd /home/ec2-user && git clone https://$TOKEN@github.com/senolkeklik/Phonebook-Application
python3 /home/ec2-user/phonebook/phonebook-app.py


#we used for this launch template, while we are launched templaed this commands active
