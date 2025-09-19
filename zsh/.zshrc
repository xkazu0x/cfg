HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history
HISTCONTROL=ignoreboth

set -o emacs

autoload -U colors && colors
NEWLINE=$'\n'
PROMPT="%~${NEWLINE}λ "
PROMPT="%F{#666666}%~%f${NEWLINE}%F{#c1c1c1}λ%f "

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
