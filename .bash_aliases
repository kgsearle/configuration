# Enable color ls if available
#if [ -e "~/.dircolors" ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#elif [ -e "~/.dir_colors" ]; then 
#    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
#elif [ "$OSTYPE" == "linux-gnu" ]; then
#    alias ls='ls --color=auto'
#elif [ "$OSTYPE" == "darwin16" ]; then 
#    alias ls="ls -G"
#fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -l | egrep "^d"' # List only directories
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias vim='/usr/local/bin/nvim'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias phpfind="find -type f -name '*.php' -print | xargs grep"
alias jsfind="find -type f -name '*.js' -print | xargs grep"
alias cssfind="find -type f -name '*.css' -print | xargs grep"

alias hist='history | grep $1' # Searches history

alias drmall='docker ps -a -q | xargs docker rm'
alias drmiall='docker images -a -q | xargs docker rmi'

alias summon='docker-compose build && docker-compose up -d && docker-compose logs -f'
alias banish='docker-compose down && docker system prune --all'

alias unit='bin/exec ./vendor/bin/phpunit -c etc/build $1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.work_bash_aliases ]; then
  . ~/.work_bash_aliases
fi
