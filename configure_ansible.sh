#cloud-boothook
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
yum -y update
sudo amazon-linux-extras install ansible2
sudo yum install -y git python python-devel python-pip openssl ansible
yum install ansible -y
sudo pip install boto
