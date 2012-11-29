# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin:$HOME/pear/bin
export SSH_ENV=$HOME/.ssh/environment
# JSON-style colorized prompt
export PS1="\[\033[01;31m\]{'user':'\\u','host':'\\h','dir':'\\W'}\[\033[00m\] "
# vim4life
export SVN_EDITOR=vim

# Set 256 color terminal if possible
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi
