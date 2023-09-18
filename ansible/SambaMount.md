```bash
touch ~/.smbcredentials
chmod 600 ~/.smbcredentials
```

```bash
nano ~/.smbcredentials
```

### Add the following
username=your_username
password=your_password

```bash
sudo mkdir /mnt/d1
sudo mount -t cifs //b1/d1 /mnt/d1 -o credentials=/home/mdelgert/.smbcredentials,uid=$(id -u mdelgert),gid=$(id -g mdelgert),file_mode=0664,dir_mode=0775
ln -s /mnt/d1 ~/shared
sudo umount /mnt/d1
```

```bash
sudo nano /etc/fstab
//b1/d1 /mnt/d1 cifs credentials=/home/mdelgert/.smbcredentials,uid=1000,gid=1000,file_mode=0664,dir_mode=0775 0 0
```