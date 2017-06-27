export ZSH=/home/zsolt/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
unsetopt correct_all
COMPLETION_WAITING_DOTS="true"
plugins=(git ubuntu vi-mode)
export VIMRUNTIME=/usr/local/share/vim/vim80/
alias ll='ls -a' svim='sudo vim' cd..='cd ..' toclip='xclip -selection c' tmux='tmux -2'

if [ "$TMUX" = "" ]; then tmux -2; fi
bindkey -v
export KEYTIMEOUT=1
source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs root_indicator vi_mode)

# solarized colorchemed powerlevel9k config

POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND="245"

POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="245"

POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="245"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND="white"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="cyan"

POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="white"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="red"

POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="white"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
