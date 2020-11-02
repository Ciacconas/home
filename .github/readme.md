# home

A Portable Linux Home Folder to feel right at home in any distribution.

a.k.a _my dotfiles_ + _[bootstrapping scripts](../.install) for Arch and Debian_

a.k.a _highly opinionated configurations for anything I ever used._

![arch + dwm](home.gif)

##### what you're seeing

- [My dwm fork](https://github.com/flaport/dwm) with clickable [status bar](../.scripts/dwm/dwm_status).
- [Adaptive theming](../.scripts/x/xcs) for TUIs, GTK apps and QT apps.
- [Neovim](https://github.com/neovim/neovim) opened at the [Arch Linux bootstrapping script](../.install/arch_install).
- [ViFM](https://github.com/vifm/vifm) + [ueberzug](https://github.com/seebye/ueberzug) image previews.
- [Conky](https://github.com/brndnmtthws/conky) system monitor showing [weather information](../.scripts/weather/update_weather), [todo-lists](../.scripts/nvim/todo) and [appointments](../.calcurse/apts).
- [Picom](https://github.com/yshui/picom) compositor for window transparency, shadows and blur.
- [lsd](https://github.com/Peltoche/lsd) aliased as ls.
- [Custom zsh prompt](../.zshrc).
- [Distrotube wallpapers](https://gitlab.com/dwt1/wallpapers).
- [CLI-visualizer](https://github.com/dpayne/cli-visualizer) for audio visualization.
- [Dunst](../.config/dunst/dunstrc) notifications.

## How does this work?

My home folder _is_ my dotfiles git repo. However, by default no new
files will be tracked because the [.gitignore](../.gitignore) file
contains a single `*`. To start tracking a file, simply `git add` them
with the `-f` flag:

```
    git add -f new-file-to-track
```

## Installation instructions

Although, the settings are universal, I recommend [Arch Linux](https://archlinux.org) as
distribution. Instructions on how to install Arch Linux can be found
[here](../.install/readme.md).

To try out these configs, it's best to start from a completely empty
home folder. Then initialize the home folder as a git repository:

```
git init .
```

add this git repository (or your fork) as origin:

```
git remote add origin http://github.com/flaport/home
```

pull the repository:

```
git pull origin master
```

set up the master branch to track the master branch at origin

```
git branch --set-upstream-to=origin/master master
```

pull in all git submodules for custom builds

```
git submodule update --init --recursive
```

[optional but recommended] If you're on Arch Linux, install my recommended programs with
my bootstrapping script: `~/.install/arch_install`. Installing the recommended programs
will make sure the configs and scripts work properly. This script won't re-install
programs that are already on the system and hence is pretty fast after its first run.
Edit the file to your liking first.

```
bash ~/.install/arch_install
```

[completely optional] I'm using python a lot. I have a similar bootstrapping script with
my preferred Anaconda installation. Edit the file to your liking first.

```
bash ~/.install/python_install
```

## List of configs

A non-exhaustive list of configurations and script this repository has to offer:

- [app defaults](../.config/mimeapps.list/)
- [app files](../.local/share/applications/)
- [alacritty](../.config/alacritty/alacritty.yml) · a terminal with GPU acceleration + [scripts](../.scripts/alacritty/)
- [askpass](../.scripts/askpass) · custom GTK pinentry
- [albert](../.config/albert/albert.confg) · a GTK based application launcher
- [autojump](../.scripts/autojump/) · jump to folders in the cli.
- [bash](../.bashrc) · shell
- [broot](../.config/broot/) · terminal file browser
- [castero](../.config/castero/castero.conf) · a TUI for podcasts
- [cat](../.scripts/cat/) · concatenate files
- [conda](../.condarc) · python package manager
- [contacts](../.scripts/contact) · simple scripts to mange iCal contacts
- [conky](../.config/conky/) · system monitor
- [chromium](../.config/chromium-flags.conf) · the famous browser
- [ctags](../.ctags) · used for tag jumping in vim
- [dwm](../.scripts/dwm/) · startup and status bar script
- [dmenu](https://github.com/flaport/dmenu) · application launcher ([rofi](../.config/rofi) alternative) + [much more](../.scripts/dmenu)
- [dragon](../.scripts/dragon/d) · dragon drag-and-drop aliased to `d`.
- [dunst](../.config/dunst/) · notifications
- [emacs](../.emacs.d/) · editor and more
- [eslint](../.eslintrc) · javascript linting
- [flameshot](../.config/Dharkael/) · a very capable screenshot program + [scripts](../.scripts/flameshot/)
- [fish](../.config/fish/) · shell
- [fontconfig](../.config/fontconfig) · default fonts and other font settings
- [fstab](~/.extra/fstab) · an fstab example
- [firefox](../.scripts/browser/) · the best browser
- [fzf](../.scripts/fzf) · the fuzzy file finder
- [git](../.gitconfig) · source control + many convenience [scripts](../.scripts/git/)
- [gtk 2.0](../.config/gtk-2.0/) · gtk theming
- [gtk 3.0](../.config/gtk-3.0/) · gtk theming
- [gnupg](../.gnupg/) · gpg agent
- [ghostscript](../.scripts/ghostscript/) · the low level pdf editor
- [hosts](../.extra/hosts) · a hosts file example
- [inkscape](../.scripts/inkscape) · custom scripts using the incscape CLI
- [ipython](../.ipython/profile_default/) · interactive python shell
- [joplin](../.config/joplin/) · note taking app + some basic [scripts](../.scripts/joplin/)
- [jupyter](../.jupyter/) · notebook server for python (and others) + [scripts](../.scripts/jupyterhubopen)
- [kvantum](../.config/Kvantum/) · qt theming + [scripts](../.scripts/kvantum/)
- [lockscreen] · custom scripts handling screenlocks and more
- [ls](../.scripts/ls) · ls aliased to lsd if no arguments given
- [lxappearance](../.scripts/lxappearance/) · GTK theme chooser
- [latexmk](../.latexmkrc) · latex build settings
- [matplotlib](../.config/matplotlib/) · python plotting + [scripts](../.scripts/matplotlib)
- [mouse cursor](../.icons/default/index.theme) · configuration
- [mpv](../.config/mpv/) · media player + [scripts](../.scripts/mpv/)
- [nemo](../.local/share/nemo/actions/) · file browser + [scripts](../.scripts/nemo/)
- [neofetch](../.config/neofetch/) · system information
- [nextcloud](../.config/Nextcloud/) · nextcloud client
- [newsboat](../.config/newsboat/) · an RSS reader TUI
- [nvim](../.config/nvim/) · neovim: the terminal text editor + [scripts](../.scripts/nvim/)
- [open-octet-stream](../.scripts/octet-stream/) · custom script to open 'octet-stream' (binary) files.
- [openvpn](../.config/openvpn/) · vpn tool
- [picom](../.config/picom/) · compositor + [alpha script](../.scripts/x/alpha) to change transparency from cli + [custom scripts](../.scripts/picom/).
- [rename](../.scripts/rename/) · a simple script to batch rename files with vim
- [qt5ct](../.config/qt5ct/) · qt theming
- [qutebrowser](../.config/qutebrowser/) · qt based web browser with vim keybindings
- [rofi](../.config/rofi/) · application launcher ([dmenu](https://github.com/flaport/dmenu) alternative) + [much more](../.scripts/dmenu)
- [spotifyd](../.config/spotifyd) · the headless spotify daemon (used in conjuction with spotify-tui)
- [spotify-tui](../.config/spotify-tui) · the spotify TUI + [scripts](../.scripts/spotify-tui/)
- [sxhkd](../.config/sxhkd/) · keyboard shortcuts
- [syncthing](../.config/syncthing/) · file synchronization between devices
- [sxiv](../.config/sxiv/) · the simple X image viewer
- [tmux](../.tmux.conf) · terminal multiplexer
- [transmission-daemon](../.config/transmission-daemon/) · transmission torrent daemon + [scripts](../.scripts/transmission/)
- [vifm](../.config/vifm/) · terminal file browser with vim keybindings + [scripts](../.scripts/vifm/)
- [wallpaper](../.scripts/wallpaper) · a custom script to set wallpapers using `feh`.
- [weather](../.scripts/weather/) · custom weather scripts
- [webapp](../.scripts/webapps/) · custom scripts to open webpages as webapps.
- [x](../.scripts/x) · custom scripts to configure X
- [xdg-open](../.scripts/xdg-open/) · custom scripts related to `xdg-open`, such as `o` aliased to `xdg-open`.
- [vimb](../.config/vimb/) · web browser with vim keybindings (does not seem to work very well for me)
- [termdown](../.scripts/termdown) · the terminal countdown timer
- [vimfx](../.config/vimfx/) · vim keybindings for firefox (requires [legacyfox patch](https://github.com/girst/LegacyFox))
- [vis](../.config/vis/) · music cli visualizer
- [vscode](../.config/Code%20-%20OSS/) · code editor
- [wallpaper](../.scripts/wallpaper/) · scripts to set wallpaper
- [xinit](../.xinitrc) · x session starter
- [xrandr](../.scripts/screenlayout/) · screenlayout [convenience scripts](../.scripts/screenlayout/) + [screenlayout selector](../.scripts/dmenu/dmenu_screenlayout).
- [xresources](../.config/Xresources) · colorschemes + [xcs script](../.scripts/x/xcs)
- [zathura](../.config/zathura/) · pdf reader + [scripts](../.scripts/zathura)
- [zsh](../.zshrc) · my preferred shell
- [ueberzug](../.scripts/ueberzug/) · the terminal image overlayer

## List of custom builds

Furthermore, this repository contains submodules for the following builds:

- [My dwm fork](https://github.com/flaport/dwm) my window manager + [scripts](../.scripts/dwm)
- [My dmenu fork](https://github.com/flaport/dmenu) my application launcher ([and much more](../.scripts/dmenu))
- [My st fork](https://github.com/flaport/st) my terminal
- [My scroll fork](https://github.com/flaport/scroll) dependency of st to enable terminal scrolling

## License

© flaport 2020 - [GPLv3](LICENSE)
