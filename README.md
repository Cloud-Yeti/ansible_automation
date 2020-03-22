# ansible_automation

#### Inventory file
  * Inventory file basically contains a list of servers to communicate with your servers.
  * From linux knowledge, the host file is situated at /etc/hosts that matches IP addresses to domain names
  * Similar to that, Ansible Inventory file matches servers which may include IP addresses or domain names ---> to groups.
  * We need to update the /etc/ansible/hosts file in order to add server to it; see the below example
  ```
          [cloudyeti_group]
          www.cloudyeti.com
          
```
  * Ansible documentation page: https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html
  * Dynamic Inventory for AWS EC2: https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory#inventory-script-example-aws-ec2
