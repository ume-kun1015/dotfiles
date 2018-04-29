# Path to your oh-my-zsh installation.
export ZSH=/Users/ryosuke.umeki/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# RUBY
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# GO
export GOPATH=$HOME/.go
export GOENV_ROOT=$HOME/.goenv
export GOBIN=$GOPATH/bin
export PATH=$GOENV_ROOT/bin:$PATH:$GOBIN
eval "$(goenv init -)"

alias vimgo='vim -u ~/.vimrc.go'
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# PYTHON
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# NODE
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# ECS-DEPLOY
export PATH=$PATH:~/.ecs-deploy

# AWS KEYS 
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=

# peco settings
# peco-select-gitadd list files within any git project and let me search them. This even tells each file is whether modified or a new file.
function peco-select-gitadd() {
    local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
                                  peco --query "$LBUFFER" | \
                                  awk -F ' ' '{print $NF}')"
    if [ -n "$SELECTED_FILE_TO_ADD" ]; then
      BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
      CURSOR=$#BUFFER
    fi
    zle accept-line
    # zle clear-screen
}

zle -N peco-select-gitadd
bindkey '^g^a' peco-select-gitadd

# peco-select-git-local-branch list local branches and let me search them
function peco-git-local-branch(){
    local current_buffer=$BUFFER

    local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads | column -t -s '|' | peco | head -n 1 | awk '{print $1}')"

    if [ -n "$selected_line" ]; then
        BUFFER="${current_buffer}${selected_line}"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-git-local-branch
bindkey '^g^b' peco-git-local-branch

# peco-ls list all files within the current directory.
function peco-ls() {
    local current_buffer=$BUFFER
    local selected_lines="$(ls | peco | awk '{print $NF}')"

    if [ -n "$selected_lines" ]; then
        BUFFER="${current_buffer}$(echo "$selected_lines" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
}
zle -N peco-ls
bindkey '^l^s' peco-ls

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# peco setting
# This setting should be here... I don't get any single clue of the reason...
# peco-select-history list commands in history and let me search previous commands that I have executed
function peco-select-history() {
    BUFFER=$(\history 1 | \
                    sort -r -k 2 |\
                    uniq -1 | \
                    sort -r | \
                    awk '$1=$1' | \
                    cut -d" " -f 2- | \
                    peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

zle -N peco-select-history
bindkey '^r' peco-select-history

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
