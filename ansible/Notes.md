https://docs.ansible.com/ansible/latest/getting_started/index.html

### Setup
```bash
python3 -m pip install --user ansible
```

### Verify the hosts in your inventory.
```bash
ansible-inventory -i inventory_all.yaml --list
```

### Ping inventory.
```bash
ansible virtualmachines -m ping -i inventory_all.yaml
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