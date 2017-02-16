if [ "$OSTYPE" == "linux-gnu" ]; then
    alias ls='ls --color=auto'
elif [ "$OSTYPE" == "darwin16" ]; then 
    alias ls="ls -G"
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -l | egrep "^d"' # List only directories
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"

alias hist='history | grep $1' # Searches history

alias mongostart="mongod --config $MONGODB_CONFIG"

if [ "$OSTYPE" == "darwin16" ]; then
    alias mountdev="sshfs scsdev:/home/ksearle/scs $HOME/scsdev"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

