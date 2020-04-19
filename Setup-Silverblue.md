# Set up a Silverblue machine

### Post installation
- Layer these "important" packages and restart to take effect
```
rpm-ostree install gnome-tweak-tool util-linux-user zsh
```


- Change default shell:
```
chsh -s $(which zsh)
```


- Configure firewall:
```
firewall-cmd --set-default-zone=drop
firewall-cmd --complete-reload
```

- Override detach_keys to avoid CTRL+P while in toolbox
```
nvim ~/.config/containers/libpod.conf
# use ctrl-a as tmux
detach_keys = "ctrl-a,ctrl-x"
```
Note: Avoid these leaders
* ctrl-d is used by vim and is the default shortcut for `toolbox exit`
* ctrl-p is used by weechat


- Configure fonts and keymaps in gnome-tweak-tool
* Fonts > Antialiasing: Subpixel
* Keyboard & Mouse > Additional Layout Options > Caps Lock behavior > Caps Lock
  is also a Ctrl
