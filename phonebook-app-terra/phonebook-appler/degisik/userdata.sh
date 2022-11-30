#! /bin/bash

yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
echo ${rds-endpoint} > /home/ec2-user/dbserver.endpoint
TOKEN="silindi"
FOLDER="https://$TOKEN@raw.githubusercontent.com/Nihatcan17/002-phone-box/main"
curl -s --create-dirs -o "/home/ec2-user/templates/index.html" -L "$FOLDER"/templates/index.html
curl -s --create-dirs -o "/home/ec2-user/templates/add-update.html" -L "$FOLDER"/templates/add-update.html
curl -s --create-dirs -o "/home/ec2-user/templates/delete.html" -L "$FOLDER"/templates/delete.html
curl -s --create-dirs -o "/home/ec2-user/app.py" -L "$FOLDER"/phonebook-app.py
python3 /home/ec2-user/app.py