#cloud-boothook
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console)2>&1
sudo yum update -y
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo amazon-linux-extras install ansible2 -y
sudo yum install ansible -y
sudo yum install -y git python python-devel python-pip openssl ansible
sudo pip install boto


#========================================================================#
# Below example shows how secrets manger can be used to copy ssh-keys #
# The Secrets Manger access should be provided both for control node and managed node #
# add below command on Condrol Node #
# cd ~/ && ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
# cat ~/.ssh/id_rsa.pub | sed 's/^/{"/;s/$/"}/' | sed 's/ssh-rsa/pub_key\":\ "ssh-rsa/g' > ~/my_creds.json
# aws secretsmanager create-secret --name MyAnsibleSecretCred --description "My public key of ansible master" --secret-string file://my_creds.json --region us-east-1
# rm -rf ~/my_creds.json
#========================================================================#
# add below command on Managed Nodes #
# sudo yum install jq -y
# aws secretsmanager get-secret-value --secret-id MyAnsibleSecretCred --region us-east-1 | jq ".SecretString" | sed 's/\\n //g; s/\ \n//g; s/\\"/"/g; s/"\\n/"/g; s/^"//; s/"$//' | jq ".pub_key" | sed 's/\"//g' >> ~/.ssh/authorized_keys
