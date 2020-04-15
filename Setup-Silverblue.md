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
detach_keys = "ctrl-d,ctrl-q"
```
Note: ctrl-d is the default shortcut for `toolbox exit`
