#!/bin/sh

# THIS INSTALL SCRIPT IS VERY BASIC AND FOR XFCE4 VOID LINUX INSTALLS ONLY

# Applications and dependencies to allow either xfce4 with i3 or just i3 alone
sudo xbps-install -Syu xtools tmux dmenu nitrogen i3-gaps i3status neovim subversion NetworkManager network-manager-applet chromium alacritty zsh htop xfce4-pulseaudio-plugin xfce4-alsa-plugin bluez blueman unzip wget picom nerd-fonts-ttf font-awesome5 ripgrep cmake clang valgrind xrandr arandr python3 python3-pip pasystray pulseaudio-utils

# change to zsh
chsh -s $(which zsh)

# install vim plug
mkdir ~/.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# configuration
cp -r ~/dotfiles/.config
cp ~/dotfiles/.zshrc ~/
cp ~/dotfiles/.tmux.conf ~/
mkdir ~/Pictures
cp -r ~/dotfiles/Wallpapers ~/Pictures/Wallpapers

# zsh-plugs
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zshplugs
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zshplugs
git clone https://github.com/zsh-users/zsh-completions ~/.config/zshplugs
