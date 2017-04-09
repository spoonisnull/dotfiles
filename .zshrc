# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zsolt/.zshrc'

autoload -Uz compinit
compinit
_comp_options+=(globdots)
# End of lines added by compinstall
export TERM="xterm-256color"
alias ll='ls -a' svim='sudo vim'

if [ "$TMUX" = "" ]; then tmux -2; fi
. ~/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

source  ~/Applications/powerlevel9k/powerlevel9k.zsh-theme
