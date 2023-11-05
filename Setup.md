### SSH setup
```bash
# Copy config SSH_KEYS
cd ~/.ssh
chmod 600 SSH_KEYS
```

### Base packages and setup
```bash
sudo apt update
sudo apt upgrade
sudo apt install neofetch htop libsensors5 restic python3-pip git
```

### Git setup
```
git config --global user.name "First Lastname"
git config --global user.email "user@example.com"
```

### POE hat
```bash
sudo nano /boot/config.txt
```

# PoE Hat Fan Speeds
dtparam=poe_fan_temp0=50000
dtparam=poe_fan_temp1=54000
dtparam=poe_fan_temp2=58000
dtparam=poe_fan_temp3=62000

### Display
```bash
# enable I2C
sudo raspi-config 
cd /usr/bin
sudo wget https://github.com/mdelgert/PiRackPro/raw/main/SKU_RM0004/display
sudo chmod +x display
sudo nano /etc/rc.local 
# add the follow before exit 0
# display &
```

## Turn on the button to control the shutdown function
```bash
sudo nano /boot/config.txt
#add the following
# PiRack power button
#dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up
```

### Samba
```bash
sudo apt install samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.bk
sudo nano /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a mdelgert
```

### Example smb.conf
[root]
   path = /
   writeable = yes
   browseable = yes
   create mask = 0777
   directory mask = 0777
   public = no

### Docker
```bash
sudo curl -fsSL https://get.docker.com | bash
sudo reboot
sudo usermod -aG docker $USER
docker run mdelgert/hello-world
```