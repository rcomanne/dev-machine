# Dev Machine
This is an Ansible playbook for installing and configuring a dev machine.  

# Requirements
All that is needed to use this playbook, is to have the following tools installed;  
- ansible
- git

```bash
$ sudo apt install -y ansible git
```

# Run
1. Ensure you have ansible and git installed  
2. Run the playbook on your local machine  
   ```bash
   $ ansible-playbook -K dev-machine.yml
   ```