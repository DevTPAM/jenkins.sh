#!/bin/bash
#Author: Ange
#date: 06/17/22
# Description: A script to install jenkins in Centos7


# Step 1: Install java

sudo yum install java-1.8.0-openjdk-devel

# Step 2: Enable the jenkins repository

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
if 
[$? -eq 0]
then
echo "wget installed successfully"
else
sudo yum install wget -y
fi

# Disable key check on the repo

sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

# Step 3: install the latest version of jenkins

sudo yum install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins

#Step 4: Adjust the firewall

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
