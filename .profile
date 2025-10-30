#!/usr/bin/env bash
#    _____ _     ____  ____  ____  ____  _____
#   /    // \   /  _ \/  __\/  _ \/  __\/__ __\
#   |  __\| |   | / \||  \/|| / \||  \/|  / \
#   | |   | |_/\| |-|||  __/| \_/||    /  | |
#   \_/   \____/\_/ \|\_/   \____/\_/\_\  \_/

## Note
#-------------------------------------------------------------------------------
#
# if default shell is bash or zsh, this file will be sourced at login.
#
# if default shell is fish, this file will be parsed in such a way that the
# lines starting with the word 'export' - the environment variables - will be
# translated into fish environment variables. The rest of the file will then be
# ignored.
#
# current shell: zsh
#

# Make sure the following files exist:
#-------------------------------------------------------------------------------

[ -d $HOME/.webapps ] || mkdir $HOME/.webapps
[ -f $HOME/.pythonpath ] || touch $HOME/.pythonpath &> /dev/null
[ -f $HOME/.config/rofi/xresources-colors.rasi ] || touch $HOME/.config/rofi/xresources-colors.rasi &> /dev/null
[ -f $HOME/.Xresources ] || cp $HOME/.config/Xresources/nord $HOME/.Xresources &> /dev/null
[ -f $HOME/.config/Kvantum/kvantum.kvconfig ] || cp $HOME/.config/Kvantum/kvantum.kvconfig.example $HOME/.config/Kvantum/kvantum.kvconfig


## Environment variables
#-------------------------------------------------------------------------------

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export BROWSER="firefox-developer-edition"
export BROWSER2="chromium" # fallback browser
export CC="gcc"
export COLORTERM="truecolor"
export CXX="g++"
export DMENU="dmenu" # rofi
export EDITOR="vim"
export FM="vifm"
export FZF_DEFAULT_OPTS="--layout=reverse --height=60% --multi --bind=ctrl-n:down,ctrl-p:up,ctrl-l:preview-down,ctrl-h:preview-up,ctrl-a:select-all --preview-window=right --preview='fzf_preview {} $LINES'"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export ICAROOT="$HOME/.ica"
export PYTHONSTARTUP="$HOME/.pythonstartup"
export MPLBACKEND=tkagg
export QT_QPA_PLATFORMTHEME="qt6ct"
export READER="zathura"
export SAVEHIST=1000000
export SUDO_ASKPASS="$HOME/.local/bin/askpass"
export SUDO_ASKUSERPASS="$HOME/.local/bin/askuserpass"
export TERMINAL="alacritty"
## screen dpi scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# export IPKISS_PORT=5050
# export DOCKER_BUILDKIT=1
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export MKL_DEBUG_CPU_TYPE=5 # fix intel mkl poor performance on amd cpu
export CHIP_DESIGN_REPOS="$HOME/Documents/xanadu/github"
export SAVOYTRUFFLE_WORKDIR="$HOME/Documents/xanadu"
export AWS_PROFILE=hw-google


# Python
#-------------------------------------------------------------------------------

# python path from ~/.pythonpath file
# (start line with space to prevent fish config from parsing this line.)
 export PYTHONPATH="$(tr '\n' ':' < ~/.pythonpath | head -c -1 | sed 's|~|'$HOME'|g')"

# source "$HOME/.cargo/env"
