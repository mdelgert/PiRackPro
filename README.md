### PiRackPro
PiRackPro setup

### Links
https://github.com/UCTRONICS/SKU_RM0004
https://www.uctronics.com/raspberry-pi/uctronics-pi-rack-pro-for-raspberry-pi-4b-19-1u-rack-mount-support-for-4-2-5-ssds.html
https://www.jeffgeerling.com/blog/2022/homelab-pi-rack-upgrade-just-time-ansiblefest-2022
https://www.amazon.com/UCTRONICS-Raspberry-Support-Shutdown-Display/dp/B0B6TW81P6
https://github.com/alexb7217/Pi-Rack-Pro_SKU_RM0004-Install/tree/main

### Setup
```bash
sudo apt install python3-pip
# Create a virtual environment
python3 -m venv venv
# Activate the virtual environment
source venv/bin/activate # On Windows, use `venv\Scripts\activate`
# Now install Ansible within the virtual environment
pip install ansible
# When you're done, deactivate the virtual environment
deactivate
```

### Verify the hosts in your inventory.
```bash
ansible-inventory -i all.yaml --list
```

### Ping inventory.
```bash
ansible all -m ping -i all.yaml
```

### Setup
```bash
ansible-playbook -i all.yaml tasks/setup.yml
```

### SSH
```bash
ansible-playbook -i clients.yaml tasks/ssh.yml
```