# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'

export LANG=C

#PROMPT_COMMAND='history -a;history -n'
PROMPT_COMMAND=''
# in wmii, display current dir as term title
WMII_IS_RUNNING=`ps aux | grep wmii | grep -v grep`
if [ -n "$WMII_IS_RUNNING" ]; then
  #PROMPT_COMMAND="dirs | perl -pe 'chomp if eof' | wmiir write /client/sel/label"
  PROMPT_COMMAND='printf "\033]2;%s\033\\" "`dirs`"'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#. /opt/semper/prog/aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    #. /etc/bash_completion
#fi

set -o vi
export SVN_EDITOR=vi
export VISUAL=vi

#co-up
alias klingel='curl 192.168.2.5/letmein'

#dev
export PATH="/opt/semper/prog:/usr/local/bin:$PATH"

alias lock='xscreensaver-command -lock'

alias gt="git tag | python -c \
'import sys
def x(l, n):
    if len(l) > n:
        try:
            return int(l[n])
        except ValueError:
            return l[n]
    else:
        return 0
def g(n):
    return lambda l: x(l, n)
k = [l.rstrip(\"\\n\").split(\".\") for l in sys.stdin.readlines()]
k = sorted(k, key=g(4))
k = sorted(k, key=g(3))
k = sorted(k, key=g(2))
k = sorted(k, key=g(1))
k = sorted(k, key=g(0))
print \"\\n\".join([\".\".join(e) for e in k]),
'"

alias gc="git gc --aggressive && git remote prune origin && git branch --merged master | grep -v 'master$' | xargs git branch -d"

alias j="python -m json.tool"
alias rm-rf-slow='find -type f | while read f; do echo "rm $f"; rm "$f"; sleep 0.1; done; find -type d | while read f; do echo "rmdir $f"; rmdir "$f"; sleep 0.1; done;'


# added by travis gem
[ -f /home/richard/.travis/travis.sh ] && source /home/richard/.travis/travis.sh

export GOPATH=/home/richard/src/go
export PATH="$GOPATH/bin:$PATH"

alias vi="vi -o"

alias lf="less +%F $(ls -t | head -n 1)"

#function vigrep {
#    files=""
#    for c in `grep -Rn "$@" | cut -d ':' -f 1,2 | sort | uniq`
#    do
#        f=`echo $c | cut -d ':' -f 1`
#        #n=`echo $c | cut -d ':' -f 2`
#        files="$files $f"
#    done
#    vim -o $files
#}


export NVM_DIR="/home/richard/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/opt/rpterm:$PATH"

function sc() {
    f="/home/richard/src/work/img/$(date -u | tr ' ' '-').png"
    import "$f"
    echo "$f"
}

export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale

function docker_cleanup() {
    docker kill $(docker ps -a -q)
    docker rm -f $(docker ps -a -q)
    docker rmi -f $(docker images -a -q)
    docker volume rm $(docker volume ls -q)
    sudo service docker restart
}

#
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
# TODO: move to /etc/profile
#           http://superuser.com/questions/365847/where-should-the-xdg-config-home-variable-be-defined
#
# $XDG_DATA_HOME $HOME/.local/share
# $XDG_CONFIG_HOME $HOME/.config
# $XDG_CACHE_HOME $HOME/.cache

export PATH=~/.local/bin:$PATH

export GPG_TTY=tty
export PINENTRY_USER_DATA="USE_CURSES=1"
