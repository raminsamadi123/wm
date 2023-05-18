#!/usr/bin/env bash

git clone https://aur.archlinux.org/paru-bin.git ~/.config/paru && cd ~/.config/paru/ && makepkg -sif -clean

paru -Syu --needed - <"$HOME/dotfiles/packages.txt"

pip install neovim

gem install neovim
sudo npm install -g neovim
sudo gpasswd -a "$USER" plugdev
sudo systemctl enable --now libvirtd.service
sudo usermod -a -G libvirt "$(whoami)"
sudo systemctl restart libvirtd.service

sudo virsh net-start default
sudo virsh net-autostart default
sudo systemctl restart libvirtd.service

git clone --depth=1 https://gitlab.com/brinkervii/grapejuice.git /tmp/grapejuice && cd /tmp/grapejuice && ./install.py
cd && wget https://github.com/raminsamadi123/hyprinstall/releases/download/Fonts/Meslo-fonts.zip && unzip Meslo-fonts.zip && sudo rm -rf Meslo-fonts.zip
git clone https://github.com/christitustech/mybash ~/mybash && cd ~/mybash/ && ./setup-arch.sh
sudo pacman -Syu --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
sudo ufw enable && sudo systemctl enable --now ufw.service
systemctl enable --now sshd.service
sudo ufw allow 22 comment "ssh"
systemctl enable --now bluetooth.service
# Device 28:6F:40:5C:5D:6A Jabra Elite 3
# Device D0:C0:25:BB:DC:02 Basilisk X HyperSpeed

cd && git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf && sudo sed -i 's/#NoProgressBar/ILoveCandy/g' /etc/pacman.conf && sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g' /etc/pacman.conf

mkdir "$HOME/GitHub"

git clone https://aur.archlinux.org/dwm.git ~/.config/dwm && cd ~/.config/dwm/ && makepkg -sif –clean

# Dmenu
rm -rf ~/.config/dmenu/
mv ~/dotfiles/home/.config/dmenu/ ~/.config/

# Xwallpaper
mv $HOME/dotfiles/home/.Xresources $HOME
xrdb -load ~/.Xresources

# Neovim
rm -rf ~/.config/nvim/
mv ~/dotfiles/home/.config/nvim/ ~/.config/

# St
rm -rf ~/.config/st/
mv ~/dotfiles/home/.config/st/ ~/.config/

# Alacritty
rm -rf ~/.config/alacritty/
mv ~/dotfiles/home/.config/alacritty/ ~/.config/

# Eww
rm -rf ~/.config/eww/
mv ~/dotfiles/home/.config/eww/ ~/.config/

# BTop
rm -rf ~/.config/btop/
mv ~/dotfiles/home/.config/btop/ ~/.config/

# Calcurse
rm -rf ~/.config/calcurse/
mv ~/dotfiles/home/.config/calcurse/ ~/.config/
calcurse -i ~/.config/calcurse/raminsam05@gmail.com.ics
calcurse -i ~/.config/calcurse/ramin.samadi@elev.ga.ntig.se.ics
calcurse -i ~/.config/calcurse/addressbook#contacts@group.v.calendar.google.com.ics
calcurse -i ~/.config/calcurse/MAKER SPACE_classroom111097032359149922796@group.calendar.google.com.ics

# Dunst
rm -rf ~/.config/dunst/
mv ~/dotfiles/home/.config/dunst/ ~/.config/

# DWM
rm -rf ~/.config/dwm/
mv ~/dotfiles/home/.config/dwm/ ~/.config/ && cd ~/.config/dwm/ && makepkg -sif --clean

mv -f ~/dotfiles/home/.local/bin/* ~/.local/bin/
# mv ~/dotfiles/home/.bashrc_files ~/
# mv -f ~/dotfiles/home/.bashrc ~/
mv -f ~/dotfiles/home/.bash_profile ~/
mv -f ~/dotfiles/home/.xinitrc ~/
sudo rm -rf ~/.bashrc.bak

cd && sudo bash -c "echo '58,18 * * * * sudo /usr/bin/pacman -Syu --noconfirm && /usr/bin/flatpak update -y && /usr/bin/paru -Syu && yes J | sudo /usr/bin/pacman -Scc' >> /var/spool/cron/root" && sudo systemctl stop cronie && sudo systemctl enable cronie.service && sudo systemctl start cronie.service
sudo bash -c "echo '58,18 * * * * /home/ramin/.local/bin/update-dotfiles' >> /var/spool/cron/$USER" && systemctl stop cronie && systemctl enable cronie.service && systemctl start cronie.service

source ~/.bashrc
source ~/.bash_profile

reboot
