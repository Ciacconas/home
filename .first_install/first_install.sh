# go to home directory
cd ~

## Update Arch
echo -e "\n\n\n\n"
echo "Updating Arch Linux..."
echo -e "\n\n\n\n"
sleep 5

sudo pacman -Syu --noconfirm


## git
echo -e "\n\n\n\n"
echo "Installing git..."
echo -e "\n\n\n\n"
sleep 5

# installation
sudo pacman -S --noconfirm git
# git default email adress
git config --global user.email "floris.laporte@gmail.com"
# git default email adress
git config --global user.name flaport
# cache git password for 12 hours
git config --global credential.helper "cache --timeout=43200"

echo -e "\n\n\n\n"
echo "Installing YAY..."
echo -e "\n\n\n\n"
sleep 5
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf yay

## Arch repositories
echo -e "\n\n\n\n"
echo "Installing packages..."
echo -e "\n\n\n\n"
sleep 5

## vim
# installation
sudo pacman -S --noconfirm neovim
# aliasses
sudo ln -sf /usr/bin/nvim /usr/bin/vim

## i3: the main graphical user interface
# i3-gaps: allow gaps between windows
sudo pacman -S --noconfirm i3-gaps
# i3-blocks: status bar for i3
sudo pacman -S --noconfirm i3blocks
# i3-block: screen lock for i3
sudo pacman -S --noconfirm i3lock
# xdotool: allows for more complicated window manipulation commands
sudo pacman -S --noconfirm xdotool
# unicode characters
sudo pacman -S --noconfirm rxvt-unicode
# wallpapers
sudo pacman -S --noconfirm feh
# xterm
sudo pacman -S --noconfirm xterm
# sockets
sudo pacman -S --noconfirm socat

## xorg: the graphical server
# the graphical server
sudo pacman -S --noconfirm xorg-server
# querying window information
sudo pacman -S --noconfirm xorg-xwininfo
# initializing
sudo pacman -S --noconfirm xorg-xinit
# tool for detecting window properties
sudo pacman -S --noconfirm xorg-xprop
# for transparent windows etc.
sudo pacman -S --noconfirm xcompmgr
# for changing brightnes etc:
sudo pacman -S --noconfirm xorg-xbacklight
# get info on current active windows
sudo pacman -S --noconfirm xorg-xdpyinfo

## build tools
# makefiles
sudo pacman -S --noconfirm make

## archiving tools
# rsync
sudo pacman -S --noconfirm rsync

## toolbar
# battery information
sudo pacman -S --noconfirm acpi

## fonts
# monospace
sudo pacman -S --noconfirm ttf-inconsolata
# serif
sudo pacman -S --noconfirm ttf-linux-libertine
# sans-serif + chromium/firefox dependency
sudo pacman -S --noconfirm ttf-droid
# symbols
yay -S --noconfirm ttf-symbola
# disable bitmaps:
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
# enable sub-pixel RGB rendering
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
# enable LCD-filtering
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
# enable freetype subpixel hinting:
echo 'export FREETYPE_PROPERTIES="truetype:interpreter-version=40"' | sudo tee --append /etc/profile.d/freetype2.sh

## security
# gnupg
sudo pacman -S --noconfirm gnupg
# openvpn
sudo pacman -S --noconfirm openvpn
# ssh
sudo pacman -S --noconfirm openssh

## ranger: terminal file browser
sudo pacman -S --noconfirm ranger

## arandr: for screen adjustment
sudo pacman -S --noconfirm arandr

## drive and file system access
# dosfstools: support for dos (windows) - like filesystems
sudo pacman -S --noconfirm dosfstools
# exfat-utils: access fat-drives
sudo pacman -S --noconfirm exfat-utils
# ntfs-3g: access NTFS partitions
sudo pacman -S --noconfirm ntfs-3g

## desktop notifications
# libnotify allows desktop notifications
sudo pacman -S --noconfirm libnotify
# dunst creates desktop notifications (suckless)
sudo pacman -S --noconfirm dunst

## image viewer
sudo pacman -S --noconfirm sxiv

## wallpaper adjustment
sudo pacman -S --noconfirm xwallpaper

## image and video tools
# imagemagick: for images
sudo pacman -S --noconfirm imagemagick
# maim: screenshots
sudo pacman -S --noconfirm maim
# ffmpeg: for videos
sudo pacman -S --noconfirm ffmpeg
# youtube-dl: download youtube videos
sudo pacman -S --noconfirm youtube-dl

## network tools
sudo pacman -S --noconfirm networkmanager
sudo systemctl enable NetworkManager

## terminal
# search tool (grep alternative)
sudo pacman -S --noconfirm ack
# fuzzy finder tool
sudo pacman -S --noconfirm fzf
# multiple terminals in one
sudo pacman -S --noconfirm tmux
# copying and pasting from the terminal
sudo pacman -S --noconfirm xclip
# pdf previews
sudo pacman -S --noconfirm poppler
# highlight: to highlight code
sudo pacman -S --noconfirm highlight
# mediainfo: show audio and video information in terminal
sudo pacman -S --noconfirm mediainfo

## process information
sudo pacman -S --noconfirm htop

## archives
# atool gives information about archives
sudo pacman -S --noconfirm atool
# unrar
sudo pacman -S --noconfirm unrar
# unzip
sudo pacman -S --noconfirm unzip

## keboard shortcuts
# xcape: used for example to remap caps lock to esc
sudo pacman -S --noconfirm xcape

## readers
# general document reader with vim bindings
sudo pacman -S --noconfirm zathura
# pdf reader extension
sudo pacman -S --noconfirm zathura-pdf-mupdf
# djvu reader extension
sudo pacman -S --noconfirm zathura-djvu

## graphics card:
# nvidia: nvidia driver
sudo pacman -S --noconfirm nvidia

## Sound
# alsamixer
sudo pacman -S --noconfirm alsa-utils
sudo pacman -S --noconfirm alsa-plugins

## Latex
# tex-live
sudo pacman -S --noconfirm texlive-most
sudo pacman -S --noconfirm texlive-lang
# bibliographies
sudo pacman -S --noconfirm biber
# viewer with synctex support
sudo pacman -S --noconfirm xdotool
# sudo pacman -S --noconfirm evince
# download evince synctex compatibility
# curl http://dud.inf.tu-dresden.de/~ben/evince_synctex.tar.gz

## browsers
# qutebrowser
sudo pacman -S --noconfirm qutebrowser
sudo pacman -S --noconfirm chromium
sudo pacman -S --noconfirm firefox

## other programs
# code (open source build of vscode)
sudo pacman -S --noconfirm code
code --install-extension vscodevim.vim
code --install-extension ban.spellright
code --install-extension wholroyd.jinja
code --install-extension ms-python.python
code --install-extension codezombiech.gitignore
code --install-extension james-yu.latex-workshop
code --install-extension formulahendry.code-runner
code --install-extension PKief.material-icon-theme
code --install-extension shardulm94.trailing-spaces
# yay -S --noconfirm klayout


## Tools
# hide an inactive mouse
yay -S --noconfirm unclutter-xfixes-git

## Terminal
## drive and file system access
yay -S --noconfirm simple-mtpfs


# suckless terminal of Luke Smith
git clone http://github.com/lukesmithxyz/st.git
cd st
make
sudo make install
cd ..
rm -rf st

# redating git commands
git clone http://github.com/potatolabs/git-redate .git-redate

echo -e "\n\n\n\n"
echo "Python packages"
echo -e "\n\n\n\n"
sleep 5

# install pip for system python
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm python2-pip

# install neovim integration for system python
sudo python2 -m pip install neovim
sudo python3 -m pip install neovim

# install anaconda python
cd ~
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output miniconda.sh
sh miniconda.sh -b -p $HOME/.anaconda
rm miniconda.sh

# remove ld binary that causes trouble for cython:
mv ~/.anaconda/compiler_compat/ld ~/.anaconda/compiler_compat/ld_disabled

# install nodejs in our anaconda installation
conda install -y nodejs

# neovim anaconda python integration
pip install neovim
pip install neovim-remote
npm install -g neovim

# conda packages
conda install -y numpy
conda install -y pandas
conda install -u cython
conda install -y scikit-learn
conda install -y matplotlib
conda install -y jupyterlab

# pip packages
pip install grip
pip install ipdb
