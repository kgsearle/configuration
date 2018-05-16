# Load environment variables
if [ -f ~/.env ]; then
  . ~/.env
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
