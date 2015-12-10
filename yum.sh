#!/bin/bash
yum -y install pyliblzma 
yum update -y
yum -y install epel-release
yum -y install ansible
# there add your needed packeges:
#rpm -ivh pa-config-0.1-1.noarch.rpm
