# .bashrc

# EXPORTS
export PATH=$PATH:$HOME/bin:$HOME/pear/bin
export SSH_ENV=$HOME/.ssh/environment
# JSON-style colorized prompt
export PS1="\[\033[01;31m\]{'user':'\\u','host':'\\h','dir':'\\W'}\[\033[00m\] "
export EDITOR=/usr/bin/vim
export HISTFILESIZE=3000 # history will save 30000 commands
export HISTCONTROL=ignoredups # don't put duplicate lines in history
# Set 256 color terminal if possible
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

# ALIASES
alias hist='history | grep $1' # Searches history

# GLOBAL
if [ -f /etc/bashrc ]; then
  /etc/bashrc
fi
