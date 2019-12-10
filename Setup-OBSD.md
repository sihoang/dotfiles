# Set up an OpenBSD machine

### Installation
- Download the installXX.fs file
- Verify checksum and sig
- Disable sshd
- Disable xenodm (if go with gnome)


### Post installation
- Update firmwares and patches
```
fw_update
syspatch
```


- Install packages
```
pkg_add i3-gaps git gnupg neovim wireguard zsh colorls
```

copy \*.bsd files to the right locations


### System configs
- Add user to staff
```
usermod -G staff <USER>
```


- Increase the ulimit for staff
```
nvim /etc/login.conf

staff:\
	:datasize-cur=infinity:\
	:datasize-max=infinity:\
	:datasize=infinity:\
	:openfiles-max=4096:\
	:openfiles-cur=4096:\
	:maxproc-max=512:\
	:maxproc-cur=512:\
	:ignorenologin:\
	:requirehome@:\
	:tc=default:
```


- Add `softdep,noatime` to all partitions (except swap) to improve disk performance
```
nvim /etc/fstab

.b none swap sw
.a / ffs rw,softdep,noatime 1 1
.l /home ffs rw,softdep,noatime,nodev,nosuid 1 2
.d /tmp ffs rw,softdep,noatime,nodev,nosuid 1 2
.f /usr ffs rw,softdep,noatime,nodev 1 2
.g /usr/X11R6 ffs rw,softdep,noatime,nodev 1 2
.h /usr/local ffs rw,softdep,noatime,wxallowed,nodev 1 2
.k /usr/obj ffs rw,softdep,noatime,nodev,nosuid 1 2
.j /usr/src ffs rw,softdep,noatime,nodev,nosuid 1 2
.e /var ffs rw,softdep,noatime,nodev,nosuid 1 2
````


- Modify xenodm to disable xconsole, beep and enable background pictures
```
nvim /etc/X11/xenodm/Xsetup_0

#!/bin/sh

xset b off

if test -x /usr/local/bin/openbsd-wallpaper
then
	/usr/local/bin/openbsd-wallpaper
fi
```


- Modify openbsd-wallpaper to fill images full-screen
```
pkg_add openbsd-wallpaper

sed -i 's/maximize/stretch/' /usr/local/bin/openbsd-wallpaper
```


- Enable natural scroll and tapping
```
nvim /etc/wsconsctl.conf

mouse.reverse_scrolling=1
mouse.tp.tapping=1
```


- Add apm hooks to restart wg-quick and lock screen when closing the lid
```
mkdir /etc/apm
```

```
nvim /etc/apm/suspend


#!/bin/sh
# Prevent dhclient to auto-restart on resume
pkill dhclient
# Lock the screen automatically when the lid is closed
pkill -USR1 xidle
```

```
nvim /etc/apm/resume


#!/bin/sh
# Manually start dhclient and restart wg_quick in right order
dhclient iwm0
[[ -s /var/run/rc.d/wg_quick ]] && rcctl restart wg_quick
```


- Make apm hooks executable
```
chmod +x /etc/apm/{resume,suspend}
```


- Enable rc services
```
nvim /etc/rc.conf.local

apmd_flags=-A
pkg_scripts=wg_quick
sshd_flags=NO
wg_quick_flags=<WIREGUARD_IF>
xenodm_flags=
```

If using gnome-app in i3, enable messagebus
```
rcctl enable messagebus
```


- (Optional) Use gnome as default DM and DE
```
pkg_add gnome

nvim /etc/rc.conf.local

apmd_flags=-A
pkg_scripts=wg_quick messagebus avahi_daemon gdm
multicast_host=YES
wg_quick_flags=<WIREGUARD_IF>
sshd_flags=NO
```
