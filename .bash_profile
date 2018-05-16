export PATH="/usr/local/bin:$HOME/bin:$HOME/.composer/vendor/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt/go/libexec/bin"

export GOPATH=$(go env GOPATH)

export GRAPHVIZ_DOT=/usr/local/bin/dot

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
