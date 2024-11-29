# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/georger/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolours && eval "$(dircolors -b ~/.dircolours)" || eval "$(dircolors -b)"
# fi
alias ls='ls --color=auto'

# Use 'jk' to return from insert mode to command mode
bindkey -M viins 'jk' vi-cmd-mode

export VIRTUAL_ENV_DISABLE_PROMPT=1

# use ctrl P and crtl N to search back and forward through history
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# To get kak to render correctly
export LANG=en_US.utf8

function gdiff {
  tmux resize-pane -Z
  git difftool $@
  tmux resize-pane -Z
}

export PS1="$ "

source .tokens

alias cls="clear"

eval "$(zoxide init zsh)"
