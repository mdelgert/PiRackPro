### PiRackPro
PiRackPro setup

### Links
https://github.com/UCTRONICS/SKU_RM0004
https://www.uctronics.com/raspberry-pi/uctronics-pi-rack-pro-for-raspberry-pi-4b-19-1u-rack-mount-support-for-4-2-5-ssds.html
https://www.jeffgeerling.com/blog/2022/homelab-pi-rack-upgrade-just-time-ansiblefest-2022
https://www.amazon.com/UCTRONICS-Raspberry-Support-Shutdown-Display/dp/B0B6TW81P6

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
ansible all -m ping -i inventory_all.yaml
```

### Example apply tasks
```bash
ansible-playbook -i inventory_all.yaml tasks_apply.yaml
```

### Example remove tasks
```bash
ansible-playbook -i inventory_all.yaml tasks_remove.yaml
```