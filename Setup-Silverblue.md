# Set up a Silverblue machine

### Post installation

- Layer these "important" packages and restart to take effect:

```
rpm-ostree install gnome-tweak-tool util-linux-user zsh
```

- Change default shell:

```
chsh -s $(which zsh)
```

- Set up toolbox:

```
sudo dnf install zsh neovim tmux fzf the_silver_searcher util-linux-user pinentry python3-pip
pip3 install pynvim --user
```

For a new system, install oh-my-zsh, vim-plug and copy dotfiles accordingly:

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Configure firewall:

```
firewall-cmd --set-default-zone=drop
firewall-cmd --complete-reload
```

- Override detach_keys to avoid CTRL+P while in toolbox:

```
nvim ~/.config/containers/libpod.conf
# use ctrl-a as tmux
detach_keys = "ctrl-a,ctrl-x"
```

Note: Avoid these leaders

- ctrl-d is used by vim and is the default shortcut for `toolbox exit`
- ctrl-p is used by weechat

* Configure fonts and keymaps in gnome-tweak-tool

- Fonts > Antialiasing: Subpixel
- Keyboard & Mouse > Additional Layout Options > Caps Lock behavior > Caps Lock
  is also a Ctrl

* Use `.profile` as `.zprofile` because `toolbox enter` does not source
  `.profile`

- Install dark theme for flatpak apps:

```
flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark
```

- Set up Android Studio:

* Install `qemu-kvm` for Android emulator:

```
rpm-ostree install qemu-kvm
```

- Install dependencies in toolbox:

```
sudo dnf install libcanberra-gtk2
sudo dnf install pulseaudio-libs alsa-lib libglvnd-glx libXrender libXcomposite libXcursor freetype
sudo dnf install nss fontconfig e2fsprogs mesa-libGLU mesa-dri-drivers mesa-vulkan-drivers
```
