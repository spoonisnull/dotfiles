source ~/.aliases
source ~/.secrets
source ~/.lessrc
source ~/.z.sh

export SHELL=/usr/local/bin/zsh
export ZSH="/Users/zsolt.pazmandy/.oh-my-zsh"
export TERM="xterm-256color"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export RTV_BROWSER=firefox
export DISPLAY=':0'
export KEYTIMEOUT=1

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

eval $(thefuck --alias)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928373"

plugins=(
  docker
  git
  kubectl
  vi-mode
  zsh-syntax-highlighting
  zsh-autosuggestions
  forgit
  history
)

FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--cycle
--reverse
--height '80%'
"

ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

function extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1   ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*)           echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

bindkey '^ ' autosuggest-accept
bindkey -v

# spaceship config
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  exec_time     # Execution time
  vi_mode
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(terraform kubecontext aws git)

# SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_SYMBOL="$"
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT=""
SPACESHIP_VI_MODE_NORMAL="[NORMAL]"

SPACESHIP_TERRAFORM_SYMBOL="tf:"

SPACESHIP_KUBECONTEXT_SYMBOL="k8s:"
SPACESHIP_KUBECONTEXT_PREFIX=""
SPACESHIP_KUBECONTEXT_SUFFIX=""

SPACESHIP_GIT_PREFIX=" "
SPACESHIP_DOCKER_PREFIX=""

# gcloud autocomplete
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# awscli autocomplete
source '/usr/local/share/zsh/site-functions/aws_zsh_completer.sh'

# The next line updates PATH for Yandex Cloud CLI.
# if [ -f '/Users/zsolt.pazmandy/yandex-cloud/path.bash.inc' ]; then source '/Users/zsolt.pazmandy/yandex-cloud/path.bash.inc'; fi


# this thing is so slow:
# export NVM_DIR="/Users/zsolt.pazmandy/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm



















































