### Download this image new image seems to have issues
wget https://downloads.raspberrypi.com/raspios_lite_arm64/images/raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz

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
dtparam=poe_fan_temp0=58000
dtparam=poe_fan_temp1=60000
dtparam=poe_fan_temp2=62000
dtparam=poe_fan_temp3=64000

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

### Docker DHCP loses ip at random issue - https://raspberrypi.stackexchange.com/questions/136320/raspberry-pi-loses-ipv4-address-randomly-but-keeps-ipv6-address
```bash
sudo nano /etc/dhcpcd.conf
# add the following to the end
#denyinterfaces veth*
```

### Docker
```bash
sudo curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker $USER
sudo reboot
docker run mdelgert/hello-world
```

### Portainer Setup
https://docs.portainer.io/user/docker/host/setup
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee:latest
```

### Default Templates
https://raw.githubusercontent.com/portainer/templates/master/templates-2.0.json

### Pi Hosted
https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/template/portainer-v2-arm64.json
https://raw.githubusercontent.com/novaspirit/pi-hosted/master/template/portainer-v2-amd64.json

### Default application templates
Cloudflare DDNS
Nginx Proxy Manager v2 with Sqllite
DashMachine 

### Python setup
https://virtualenv.pypa.io/en/latest/installation.html
https://pypi.org/project/pipx/

```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
sudo apt-get install python3-venv
pipx install virtualenv
virtualenv --help
virtualenv venv
source venv/bin/activate
```

### Update controller
https://jamesachambers.com/fixing-storage-adapters-for-raspberry-pi-via-firmware-updates/
```bash
sudo nano /boot/cmdline.txt
```

#### Enable TRIM
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi

```bash
sudo fstrim -v /
lsblk -D
sudo su
apt-get install -y sg3-utils lsscsi hdparm
sudo hdparm -I /dev/sda | grep "TRIM supported"
sudo hdparm -I /dev/sda
sg_vpd -p bl /dev/sda
```
echo unmap > /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb2/2-2/2-2:1.0/host0/target0:0:0/0:0:0:0/scsi_disk/0:0:0:0/provisioning_mode