echo "executing ~/.zshrc"
# Set keyboard layout
setxkbmap -layout us,de
setxkbmap -option 'grp:switch'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true" # Colors added manually in shell_aliases

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000000;
SAVEHIST=10000000;

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker npm ssh-agent)
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lazy yes
zstyle ':omz:plugins:nvm' autoload yes
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# source /usr/bin/virtualenvwrapper.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# fix for HOME and END key not working in zsh
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working#Zsh
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# TODO: add check for tmux installed
bindkey -s ^f "tmux-sessionizer\n"

export VISUAL='vim'
export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.shell_aliases

find "$HOME/temp/" -maxdepth 1 -type d -empty -exec rmdir {} \;
mkdir -p $TD;
ln -s -f -T $TD "$HOME/temp/00-today"

preexec() { echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $1" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log; }

export fpath=(~/.mwcli $fpath)
source ~/dotfiles/antigen/antigen.zsh

# disable liquidprompt envs
LP_ENABLE_VIRTUALENV=0
LP_ENABLE_SCLS=0
LP_ENABLE_RUBY_VENV=0
antigen bundle nojhan/liquidprompt

antigen bundle petervanderdoes/git-flow-completion
antigen bundle composer
antigen bundle fd

antigen bundle nvm

if [ "$(lsb_release -is)" = "Arch" ]
then
    antigen bundle archlinux
elif [ "$(lsb_release -is)" = "Ubuntu" ]
then
    antigen bundle ubuntu
else
    echo "Neither Arch Linux nor Ubuntu"
fi

# Guess what to install when running an unknown command
antigen bundle command-not-found
antigen bundle zoxide
# plugin README: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
# fzf usage: https://github.com/junegunn/fzf#usage
antigen bundle fzf
antigen bundle yarn
antigen bundle systemadmin
antigen bundle dotenv

antigen bundle aliases
antigen bundle djui/alias-tips

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

LOCAL_CONF_FILE=".local.conf"
if [[ -e ~/$LOCAL_CONF_FILE ]] then
    source ~/.local.conf
fi

