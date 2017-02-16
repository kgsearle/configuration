# .bashrc

## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Global bashrc
if [ -r /etc/bashrc ]; then
  source /etc/bashrc
elif [ -r /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi

## Path
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOME/pear/bin:$PATH
# PHP 7 on OSX
if [ "$OSTYPE" == "darwin" ]; then 
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
fi

## SSH settings
export SSH_ENV=$HOME/.ssh/environment

## Command line history
# Ignore duplicate lines and lines starting with spaces
export HISTCONTROL=ignoreboth
# Append to history file
shopt -s histappend
# history will save 30000 commands
export HISTSIZE=2000
export HISTFILESIZE=3000

## Identifying chroot in Debian-based Linux
if [ "$OSTYPE" == "linux-gnu"] && [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## Terminal
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

## Command prompt
#if [ "$OSTYPE" != "darwin" ]; then
    export PS1="\[\033[0;31m\][\\u@\\h:\\w]\[\033[00m\] "
#fi

## Application settings
export EDITOR=/usr/bin/vim
export NVM_DIR="$HOME/.nvm"
if [ -e "$NVM_DIR/nvm.sh" ]; then 
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
export MONGODB_CONFIG="/usr/local/etc/mongod.conf"

## Aliases
alias hist='history | grep $1' # Searches history
alias lsd='ls -l | egrep "^d"' # List only directories
alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"
alias mongostart="mongod --config $MONGODB_CONFIG"
if [ "$OSTYPE" == "darwin" ]; then
    alias mountdev="sshfs scsdev:/home/ksearle/scs $HOME/scsdev"
fi


