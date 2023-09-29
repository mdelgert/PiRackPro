### Link
https://nickhowell.uk/2016/07/23/raspberry-pi-nas-with-gluster/
https://pimylifeup.com/raspberry-pi-samba/

```bash
apt-get install samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.bk
sudo nano /etc/samba/smb.conf
sudo service smbd restart
sudo smbpasswd -a mdelgert
sudo chown -R mdelgert:mdelgert /mnt/gfs
```

### Example smb.conf
[gluster]
   path = /mnt/gfs
   writeable = yes
   browseable = yes
   create mask = 0777
   directory mask = 0777
   public = no