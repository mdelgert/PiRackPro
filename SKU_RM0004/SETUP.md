cd /usr/bin
sudo wget https://github.com/mdelgert/PiRackPro/raw/main/SKU_RM0004/display
sudo chmod +x display
sudo nano /boot/config.txt
dtparam=i2c_arm=on,i2c_arm_baudrate=400000
dtoverlay=gpio-shutdown,gpio_pin=4,active_low=1,gpio_pull=up
sudo nano /etc/rc.local
display &