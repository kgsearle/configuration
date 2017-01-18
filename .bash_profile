# .bash_profile
export PATH=~/bin:~/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
if [ -f ~/.dash ]; then
        . ~/.dash
fi

function homestead() {
    ( cd ~/src/Homestead && vagrant $* )
}
