source ~/.env_vars
source ~/.secrets/.IFS_certs

# aws eksctl autocomplete
fpath=($fpath ~/.zsh/completion)


plugins=(compleat docker extract git kubectl osx vi-mode zsh-syntax-highlighting zsh-autosuggestions)

ZSH_THEME="powerlevel9k/powerlevel9k"
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

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# aliases
source ~/.aliases

# powerlevel9k config
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %F{12}❯ "
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir ssh dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs vi_mode)
POWERLEVEL9K_VI_INSERT_MODE_STRING="INS"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NOR"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_HOME_ICON="家"
# POWERLEVEL9K_HOME_ICON="\uF415 "
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C'

# segments
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
# colors
#DARK_SCHEME POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='12'
#DARK_SCHEME POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='16'
#DARK_SCHEME POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='138'
#DARK_SCHEME POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='16'

#DARK_SCHEME POWERLEVEL9K_DIR_HOME_BACKGROUND='16'
#DARK_SCHEME POWERLEVEL9K_DIR_HOME_FOREGROUND='138'
#DARK_SCHEME POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='16'
#DARK_SCHEME POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='138'

#DARK_SCHEME POWERLEVEL9K_VCS_CLEAN_FOREGROUND='14'
#DARK_SCHEME POWERLEVEL9K_VCS_CLEAN_BACKGROUND='16'
#DARK_SCHEME POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='1'
#DARK_SCHEME POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='16'
#DARK_SCHEME POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='3'
#DARK_SCHEME POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='16'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export SHELL=/usr/local/bin/zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zpazmandy/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zpazmandy/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zpazmandy/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zpazmandy/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

