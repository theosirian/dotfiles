# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
   *i*) ;;
   *) return;;
esac

if command -v tmux>/dev/null; then
   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux new -A -s home
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Add to history instead of overriding it
shopt -s histappend

# History lenght
HISTSIZE=1000
HISTFILESIZE=2000

# Window size sanity check
shopt -s checkwinsize

# User/root variables definition
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored XTERM promp
case "$TERM" in
   xterm-color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      color_prompt=yes
   else
      color_prompt=
   fi
fi

# Prompt
if [ -n "$SSH_CONNECTION" ]; then
   export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
else
   export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 7)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG

# I this is an xterm set the title to user@host:dir
case "$TERM" in
   xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
      ;;
   *)
      ;;
esac

# Color support
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls -l --color=auto'
   alias dir='dir --color=auto'
   alias vdir='vdir --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

decode_base64_url() {
   local len=$((${#1} % 4))
   local result="$1"
   if [ $len -eq 2 ]; then result="$1"'=='
   elif [ $len -eq 3 ]; then result="$1"'='
   fi
   echo "$result" | tr '_-' '/+' | openssl enc -d -base64
}

decode_jwt(){
   decode_base64_url $(echo -n $2 | cut -d "." -f $1) | jq .
}

# Decode JWT header
alias jwth="decode_jwt 1"

# Decode JWT Payload
alias jwtp="decode_jwt 2"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

# Auto-completion
if ! shopt -oq posix; then
   if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
   elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
   fi
fi

# Advanced directory creation
function mkcd {
   if [ ! -n "$1" ]; then
      echo "Entrez un nom pour ce dossier"
   elif [ -d $1 ]; then
      echo "\`$1' existe déjà"
   else
      mkdir $1 && cd $1
   fi
}

# Go back with ..
b() {
   str=""
   count=0
   while [ "$count" -lt "$1" ];
   do
      str=$str"../"
      let count=count+1
   done
   cd $str
}

# Color man pages
man() {
   env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# Auto cd
shopt -s autocd

# ls after a cd
function cd()
{
   builtin cd "$*" && ls
}

extract () {
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)   tar xjf $1     ;;
         *.tar.gz)    tar xzf $1     ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar e $1     ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xf $1      ;;
         *.tbz2)      tar xjf $1     ;;
         *.tgz)       tar xzf $1     ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *)     echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Esperanto keyboard accents
setxkbmap -option esperanto:qwerty
