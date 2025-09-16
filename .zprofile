export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="brave"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
