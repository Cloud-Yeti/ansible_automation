#========================================================================#
#### Below example shows how secrets manger can be used to copy ssh-keys #
#### The Secrets Manger access should be provided both for control node and managed node #
# add below command on Control Node #
```
   cd ~/ && ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
   cat ~/.ssh/id_rsa.pub | sed 's/^/{"/;s/$/"}/' | sed 's/ssh-rsa/pub_key\":\ "ssh-rsa/g' > ~/my_creds.json
   aws secretsmanager create-secret --name MyAnsibleSecret --description "My public key of ansible master" --secret-string file://my_creds.json --region us-east-1
   rm ~/my_creds.json
```
#========================================================================#
# add below command on Managed Nodes #
```
   sudo yum install jq -y
   aws secretsmanager get-secret-value --secret-id MyAnsibleSecret --region us-east-1 | jq ".SecretString" | sed 's/[\]//g' | sed 's/.//' | sed  's/.$//' | jq ".pub_key" | sed 's/"//g' >> ~/.ssh/authorized_keys
```
# use below command to delete the secrets from secrets manager
#### aws secretsmanager delete-secret --secret-id MyAnsibleSecret --region us-east-1
