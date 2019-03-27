# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

#eval $( dircolors -b $HOME/LS_COLORS )

decode_jwt() {
   decode_base64_url $(echo -n $2 | cut -d "." -f $1) | jq .
}

# Decode JWT header
alias jwth="decode_jwt 1"

# Decode JWT Payload
alias jwtp="decode_jwt 2"

# More ls aliases
alias lr="ls -rtl"
alias lrr="ls -tl"

# xsel aliases
alias -g xip=" | xsel -ip"
alias -g xis=" | xsel -is"
alias -g xic=" | xsel -ib"
alias -g xib=" | xsel -ib"

alias -g xop=" | xsel -op"
alias -g xos=" | xsel -os"
alias -g xoc=" | xsel -ob"
alias -g xob=" | xsel -ob"

alias -g XIP=" | xsel -ip"
alias -g XIS=" | xsel -is"
alias -g XIC=" | xsel -ib"
alias -g XIB=" | xsel -ib"

alias -g XOP=" | xsel -op"
alias -g XOS=" | xsel -os"
alias -g XOC=" | xsel -ob"
alias -g XOB=" | xsel -ob"

# tee copy to all
#alias teecopy="tsc >(XIP) >(XIS) >(XIC)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [[ "$(yarn global bin)" ]]; then
  export PATH="$PATH:`yarn global bin`"
fi

# Esperanto keyboard accents
#setxkbmap -option esperanto:qwerty

alias xo="xdg-open"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"
alias zshrc="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

firstpage() {
   pdftoppm $1.pdf $1 -ng -r 300 -f 1 -singlefile
}

alias passhs="PASSWORD_STORE_DIR=$HOME/999-hackerspace/.password-store pass"
