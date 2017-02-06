# .bashrc

# EXPORTS
export PATH=$HOME/bin:$HOME/.composer/vendor/bin:$HOME/pear/bin:$PATH
# PHP 7 on OSX
#export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export SSH_ENV=$HOME/.ssh/environment
export PS1="\[\033[0;31m\][\\u@\\h:\\w]\[\033[00m\] "
export EDITOR=/usr/bin/vim
export HISTFILESIZE=3000 # history will save 30000 commands
export HISTCONTROL=ignoredups # don't put duplicate lines in history
export NVM_DIR="/Users/kevins/.nvm"
# Set 256 color terminal if possible
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

# ALIASES
alias hist='history | grep $1' # Searches history
alias lsd='ls -l | egrep "^d"' # List directories
alias mountdev="sshfs scsdev:/home/ksearle/scs /Users/kevins/scsdev"
# find shortcuts
alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"

# GLOBAL
if [ -f /etc/bashrc ]; then
  /etc/bashrc
fi

# Load NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
