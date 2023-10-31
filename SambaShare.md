### Samba share setup

```bash
sudo apt install cifs-utils
touch ~/.smbcredentials
nano ~/.smbcredentials
sudo mkdir /mnt/d1
sudo nano /etc/fstab
```

### Example .smbcredentials
username=smbuser
password=smbpass

### Example fstab
//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775 0 0
//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials uid=1000 gid=1000 file_mode=0664 dir_mode=0775 _netdev 0 0

```bash
sudo reboot
ln -s /mnt/d1 ~/shared
```