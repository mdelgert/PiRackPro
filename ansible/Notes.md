### Links
https://docs.ansible.com/ansible/latest/getting_started/index.html
https://github.com/geerlingguy/ansible-role-pip
https://github.com/geerlingguy/ansible-role-docker
https://galaxy.ansible.com/geerlingguy/docker

### Setup
```bash
sudo apt install python3-pip
python3 -m pip install --user ansible
```

### Add the following line to .bashrc
export PATH=$PATH:~/.local/bin

### Verify the hosts in your inventory.
```bash
ansible-inventory -i inventory_all.yaml --list
```

### Ping inventory.
```bash
ansible allmachines -m ping -i inventory_all.yaml
```

### Example add neofetch playbook
```bash
ansible-playbook -i inventory_rack.yaml add_neofetch.yaml
```

### Example remove neofetch playbook
```bash
ansible-playbook -i inventory_rack.yaml remove_neofetch.yaml
```

### Example setup display playbook
```bash
ansible-playbook -i inventory_rack.yaml display.yaml
```

### Example add libsensors playbook
```bash
ansible-playbook -i inventory_all.yaml add_libsensors.yaml
```

### Example add docker
```bash
ansible-galaxy install geerlingguy.docker
ansible-playbook -i inventory_test.yaml geerlingguy_docker.yaml
```

### Example sync ssh
```bash
ansible-playbook -i inventory_test.yaml sync_ssh.yaml
```

### Example install git
```bash
ansible-playbook -i inventory_rack.yaml add_git.yaml
```

### Example setup sbm
```bash
ansible-playbook -i inventory_rack.yaml add_smb.yaml
```