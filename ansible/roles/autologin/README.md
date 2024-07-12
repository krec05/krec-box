# AutoLogin

One of the reasons that Ubuntu are considered so secure is because they require passwords to install software or to 
configure the system. They also require passwords to login to the computer. If you want to bypass the login password, 
there is an Auto Login function you can set and use.

## Enabling AutoLogin from command line

```
sudo mkdir /etc/lightdm/lightdm.conf.d
sudo nano /etc/lightdm/lightdm.conf.d/vagrant.conf
```

```
[SeatDefaults]
autologin-user=USERNAME
autologin-user-timeout=0
```

## Links

https://wiki.ubuntu.com/LightDM