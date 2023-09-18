https://docs.ansible.com/ansible/latest/getting_started/index.html

### Setup
```bash
python3 -m pip install --user ansible
```

### Verify the hosts in your inventory.
```bash
ansible-inventory -i inventory.yaml --list
```

### Ping inventory.
```bash
ansible virtualmachines -m ping -i inventory.yaml
```

### Example add neofetch playbook
```bash
ansible-playbook -i inventory.yaml add_neofetch.yaml
```

