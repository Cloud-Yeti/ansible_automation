#cloud-boothook
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console)2>&1
sudo yum update -y
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo amazon-linux-extras install ansible2 -y
sudo yum install ansible -y
sudo yum install -y git python python-devel python-pip openssl ansible
sudo pip install boto
