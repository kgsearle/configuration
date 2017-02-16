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
if [ "$OSTYPE" == "linux-gnu" ] && [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## Terminal
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi
# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

## Command prompt
#if [ "$OSTYPE" != "darwin" ]; then
#    export PS1="\[\033[0;31m\][\\u@\\h:\\w]\[\033[00m\] "
#fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

## Xterm title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

## Application settings
export EDITOR=/usr/bin/vim
export NVM_DIR="$HOME/.nvm"
if [ -e "$NVM_DIR/nvm.sh" ]; then 
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
export MONGODB_CONFIG="/usr/local/etc/mongod.conf"
# Make less friendlier for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Aliases
# Enable color ls if available
if [ -e "~/.dircolors" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
# Moved to separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias hist='history | grep $1' # Searches history
alias lsd='ls -l | egrep "^d"' # List only directories
alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"
alias mongostart="mongod --config $MONGODB_CONFIG"
if [ "$OSTYPE" == "darwin" ]; then
    alias mountdev="sshfs scsdev:/home/ksearle/scs $HOME/scsdev"
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
