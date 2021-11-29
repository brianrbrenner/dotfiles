# i3 configuration files for Void Linux (XFCE4 NOT BASE VERSION)

Zsh plugins in .config/zshplugs required are fast-syntax-highlighting, zsh-autosuggestions, zsh-completions.
Vim plug must also be installed for Neovim's init.lua. The scripts for i3 will give a good idea of package requirements.
Neovim required >= 0.5 and vim-plug required.

Install:
```
sudo xbps-install -Su
sudo xbps-install -Su git
git clone https://github.com/brianrbrenner/dotfiles
cd dotfiles
chmod +x install.sh
./install.sh
```
If you would like Network Manager set up run this.
Services:
```
chmod +x services.sh
./services.sh
```
