source ~/.aliases
source ~/.secrets
source ~/.z.sh

export ZSH="/Users/zsolt.pazmandy/.oh-my-zsh"
export SHELL=/usr/local/bin/zsh
export TERM="xterm-256color"
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

eval $(thefuck --alias)

plugins=(compleat docker extract git kubectl osx vi-mode zsh-syntax-highlighting zsh-autosuggestions forgit)

# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=powerlevel10k/powerlevel10k
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line if pasting URLs and other text is messed up
# DISABLE_MAGIC_FUNCTIONS=true
ENABLE_CORRECTION="false"
# COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=white
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=white

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=236"
bindkey '^ ' autosuggest-accept

bindkey -v
export KEYTIMEOUT=1
export RTV_BROWSER=chromium

autoload -Uz compinit && compinit

# kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# powerlevel9k config
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" ❯ "

POWERLEVEL9K_CUSTOM_K8SCTX="echo ⎈ \[\$(kubectl config view | grep current | awk '{print \$2}' | cut -d'_' -f 2)\]"
POWERLEVEL9K_CUSTOM_K8SCTX_BACKGROUND='237'
POWERLEVEL9K_CUSTOM_K8SCTX_FOREGROUND='138'

POWERLEVEL9K_CUSTOM_GCPPROJ="echo  \[\$(gcloud config list project 2>&1 | grep project | awk '{print \$3}')\]"
POWERLEVEL9K_CUSTOM_GCPPROJ_BACKGROUND='238'
POWERLEVEL9K_CUSTOM_GCPPROJ_FOREGROUND='138'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir ssh dir_writable custom_first)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kube_ps1 custom_gcpproj custom_k8sctx vcs vi_mode)
POWERLEVEL9K_VI_INSERT_MODE_STRING="INS"
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NOR"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_HOME_ICON=""
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C'

# segments
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""

# colors
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='16'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='108'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='16'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='138'

POWERLEVEL9K_DIR_HOME_BACKGROUND='239'
POWERLEVEL9K_DIR_HOME_FOREGROUND='138'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='239'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='138'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='108'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'

POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='1'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='236'

POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='3'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='236'

POWERLEVEL9K_STATUS_OK_FOREGROUND='16'
POWERLEVEL9K_STATUS_OK_BACKGROUND='108'

POWERLEVEL9K_STATUS_ERROR_FOREGROUND='16'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='1'


export NVM_DIR="/Users/zsolt.pazmandy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gcloud autocomplete
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

