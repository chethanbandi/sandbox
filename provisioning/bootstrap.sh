#!/usr/bin/env bash
sudo cp /vagrant/provisioning/datastax.repo /etc/yum.repos.d
sudo cp /vagrant/provisioning/mysql.repo /etc/yum.repos.d

sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install wget vim unzip python PyYAML pystache python-pip
sudo yum -y install java-1.7.0-openjdk-devel rabbitmq-server
sudo yum -y install redis cassandra20 dsc20 mysql-community-server MySQL-python
sudo yum -y install git

sudo systemctl enable mysqld redis rabbitmq-server
sudo systemctl start cassandra mysqld redis rabbitmq-server

# create jenkins user
id jenkins
if [ $? -eq 1 ]
then
    sudo useradd jenkins
fi