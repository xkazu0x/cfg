HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history
HISTCONTROL=ignoreboth

autoload -U colors && colors

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

NEWLINE=$'\n'
PROMPT="%F{#999999}%~%f %F{#121212}${vcs_info_msg_0_}%f${NEWLINE}%F{#a5aaa7}λ%f "
zstyle ':vcs_info:git:*' formats '%b'

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
