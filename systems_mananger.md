# Systems Manager
 
#### The New AWS AMI's comes with ssm agent preconfigured. But, if you aren't using latest AMI. Follow below commands for installation of SSM agent:-
```
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
sudo systemctl status amazon-ssm-agent
```
## Major Components of Systems Manager

#### Inventory
  * periodically scans EC2 instances, or on prem servers/VM's, retrieving details of installed applications.
  
#### Compliance
  * allows that the data to be compared against a 'baseline', providing a Compliant or Non-Compliant state of resource.
  
#### SSM Documents
  * configuration entity inside the systems manager. Can be JSON or YAML. They can be used by:-
    * State Manager
    * Run Command and
    * Automation
    
#### Automation
  * is a set of actions that occur in managed resources. You can assign role to the automation.
  
#### Run command
  * execute a document on one or more managed instances. eg-: running cloudwatch agent on instances. So, think like this way, its a execution of documents to instance for config change.

#### State manager
  * is a desired state engine. You can define the 'desired state' in the form of a systems manager document. A document can be a 'command-document' or a 'policy document'.
  
#### Patch manager
  * allows us to define state of those instances, how upto date we want the patches on those managed resource to be. And it handles the remediation ot it.
  
## Parameter Store
  * This is a bit seperate component of systems manager
  * Provides secure storage for configuration data and secrets.
  * Parameter store integrates with many AWS Services - EC2, ECS, Lambda, CodeBuild/Deploy, and many more.
  * Can also be used for automated deployment using cloudformation
  * serverless, resilient, and scalable
