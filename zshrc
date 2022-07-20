# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/moriarty/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days)et
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  autojump
  zsh-autosuggestions
  zsh-vim-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# z jump nicer look
zstyle ':completion:*' menu select
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zconf{,ig}="nvim ~/dotfiles/zshrc"
alias zfresh="source ~/.zshrc"
alias vim="nvim"
alias v="nvim"
# git
alias gcss="git commit -s -S"
alias gco="git checkout"

# vim config
alias vconf{,ig}="v ~/dotfiles/init.vim"

# VSCode config
alias codeconf="nvim ~/Library/Application\ Support/Code/User/settings.json"

# tmux
alias tconf{,ig}="nvim ~/dotfiles/tmux.conf"
alias tmux="tmux -u"
alias tach="tmux attach -t"
alias muxls="tmux ls"
alias sesh="tmux new -s"

alias tmuxyoma="tmux set-option remain-on-exit on; tmux split-window 'ssh yoma'"

# follow/attach to docker logs of a container 
dlf () {
  if [ -z "$1" ]; then
    echo "Usage: dlf <container_name>"
    echo "Follow the logs of a docker container given its name"
  else
   docker logs --follow $(docker ps -f name="$1" | awk 'FNR == 2 {print $1}')
  fi
}

dcid () {
  if [ -z "$1" ]; then
    echo "Useage: dcid <container_name>"
    echo "Get the id of a docker container given its name"
  else
   docker ps -f name="$1" | awk 'FNR == 2 {print $1}'
  fi
}

rootgf () {
 dir=`pwd`
 cd
 ...
 sudo find ! -path './run' | grep $1
 cd $dir
}

gccd () {
 if [ -z "$1" ]; then
   # display usage if no parameters given
   echo "Usage: gccd <url>"
   echo "Clones a repo from url with git and cd's into its root folder immediately"
   return 1
 else
   git clone "$1" && cd $(basename $_ .git)
 fi
}

mkcd () {
 if [ -z "$1" ]; then
   # display usage if no parameters given
   echo "Usage: mkcd <path|foldername>"
   echo "Create a folder and cd into it directly"
   return 1
 else
   mkdir "$1" && cd $_
 fi
}

dlogfollow () {
  if [ -z "$1" ]; then
    echo "Usage: dlf <container_name>"
    echo "Follow the logs of a docker container given its name"
  else
    echo "$1"
    CONTAINER_LOG_LINE=$(docker ps -f name="$1")
    CONTAINER_ID=$(echo "$CONTAINER_LOG_LINE" | awk 'FNR == 2 {print $1}' )
    echo "$CONTAINER_ID"
    docker logs --follow "$CONTAINER_ID"
  fi
}

dcontainernames () {
  # List all docker container names
  CONTAINER_NAMES=$(docker-compose ps  | awk -F\"   '{ print $3 }' | awk '{ print $1 }')
  echo "$CONTAINER_NAMES"
}

# tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH=$(pyenv root)/shims:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export GPG_TTY=$(tty)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
export COMPOSE_DOCKER_CLI_BUILD=0
export DOCKER_BUILDKIT=0
export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"
export PATH=${PATH}:/usr/local/bin/
source $HOME/.cargo/env
source /opt/homebrew/share/antigen/antigen.zsh

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
source /Users/moriarty/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh pyenv 
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
source /Users/moriarty/.cargo/env
 export LANG=en_US.UTF-8
