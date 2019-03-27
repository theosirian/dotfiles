# If you come from bash you might have to change your $PATH.
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/100-scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export PATH="$PATH:/home/xtheosirian/rakudo/install/bin/"
export PATH="$PATH:/home/xtheosirian/rakudo/install/share/perl6/site/bin"

source $HOME/emsdk-portable/emsdk_env.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
   # it'll load a random theme each time that oh-my-zsh is loaded.
   # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
   #ZSH_THEME="agnoster"
   #ZSH_THEME="ys"
   #ZSH_THEME="powerlevel9k/powerlevel9k"
   #ZSH_THEME="agnosterzak"
   ZSH_THEME="spaceship"
   

   if command -v tmux>/dev/null; then
      [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux new -A -s home
   fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
   COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
   # under VCS as dirty. This makes repository status check for large repositories
      # much, much faster.
      # DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
   # stamp shown in the history command output.
   # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
   HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
colored-man-pages
colorize
command-not-found
compleat
copydir
copyfile
cp
dircycle
dirpersist
encode64
extract
#gpg-agent
history
history-substring-search
#per-directory-history
rsync
safe-paste
ssh-agent
tmux
tmuxinator
torrent
urltools
#vi-mode
web-search
autojump
bower
cabal
docker
gas
git
github
gitignore
gnu-utils
go
mix
postgres
rebar
redis-cli
archlinux
systemd
battery
emoji-clock
lol
#nyan
rand-quote
themes
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
   #if [[ -n $SSH_CONNECTION ]]; then
      #export EDITOR='vim'
      #else
         #export EDITOR='mvim'
         #fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [[ -f $HOME/yoopay.sh ]]; then
  source $HOME/yoopay.sh
fi
