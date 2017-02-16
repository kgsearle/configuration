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

# EXPORTS
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOME/pear/bin:$PATH
# PHP 7 on OSX
if [ "$OSTYPE" == "darwin" ]; then 
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
fi
export SSH_ENV=$HOME/.ssh/environment
#if [ "$OSTYPE" != "darwin" ]; then
    export PS1="\[\033[0;31m\][\\u@\\h:\\w]\[\033[00m\] "
#fi
export EDITOR=/usr/bin/vim
export NVM_DIR="$HOME/.nvm"
export MONGODB_CONFIG="/usr/local/etc/mongod.conf"
export HISTFILESIZE=3000 # history will save 30000 commands
export HISTCONTROL=ignoredups # don't put duplicate lines in history
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

# ALIASES
alias hist='history | grep $1' # Searches history
alias lsd='ls -l | egrep "^d"' # List only directories
alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"
alias mongostart="mongod --config $MONGODB_CONFIG"
if [ "$OSTYPE" == "darwin" ]; then
    alias mountdev="sshfs scsdev:/home/ksearle/scs $HOME/scsdev"
fi

# Load NVM
if [ -e "$NVM_DIR/nvm.sh" ]; then 
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

