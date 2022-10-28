# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{red}[%F{blue}%n%F{green}@%F{yellow}%m%f %F{magenta}%~%f%F{red}] %F{red}$vcs_info_msg_0_%f$ '
# PROMPT="\[\e[31m\][\[\e[m\]\[\e[34m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
# PS1='%F{green}[%n@%m] %F{red}%~ ->%f '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -U compinit && compinit -u
zstyle ':compinstall:*' menu select
# Auto complete with case insesnsitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through histroy
bindkey '^R' histroy-incremental-pattern-search-backward

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

compinit -u
zstyle :compinstall filename '/home/lenni/.zshrc'

# End of lines added by compinstall

export VISUAL=nvim
export EDITOR="$VISUAL"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
# ls to exa
alias ll='exa -l --color=always --group-directories-first'
alias ls='exa -la --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'

# Navigation
alias ..='cd ..'
