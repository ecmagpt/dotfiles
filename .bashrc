echo -ne "\033]0;Cygwin Terminal\007"
PS1="\[\e]0;Cygwin Terminal\007\]\u@\h:\w\$ "

[[ "$-" != *i* ]] && return
export PS1=$'\[\e[30m\]\[\e[44m\] \w\[\e[40m\]\[\e[34m\]\xee\x82\xb0\[\e[0m\] '
export NERDTREE_BOOKMARKS="$HOME/.NERDTreeBookmarks"

alias ls="ls --color=auto"
alias l="ls -CF"
alias vrc="vim ~/.vimrc"
alias vcr="vim /usr/local/bin/comprun-file"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

mkp(){
	mkdir -p $1/{src,bin}
	cd $1/src
	vim $2
}
alias mkp=mkp

winpath() {
    if [ ${#} -eq 0 ]; then
        : skip
    elif [ -f "$1" ]; then
        local dirname=$(dirname "$1")
        local basename=$(basename "$1")
        echo "$(cd "$dirname" && pwd -W)/$basename" \
        | sed \
          -e 's|/|\\|g';
    elif [ -d "$1" ]; then
        echo "$(cd "$1" && pwd -W)" \
        | sed \
          -e 's|/|\\|g';
    else
        echo "$1" \
        | sed \
          -e 's|^/\(.\)/|\1:\\|g' \
          -e 's|/|\\|g'
    fi
}

unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}