#.bashrc
export PAGER=less
export EDITOR=vim
export LESS='-R'



if [[ $- != *i* ]] ; then
         # Shell is non-interactive.  Be done now!
         return
fi

# Bash completion

source /etc/profile.d/autojump.sh
source ~/dotfiles/bash_aliases 

export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTFILESIZE=100000

### Bash options
#fix spelling
shopt -s cdspell
#makes bash append to history rather than overwrite
shopt -s histappend
#make bash check window after each command
shopt -s checkwinsize

### Misc
# disable XON/XOFF flow control (^s/^q) 
stty -ixon

# Tab complete for sudo
complete -cf sudo

#prevent overwriting files with cat
set -o noclobber

#stops ctrl+d from logging me out
#set -o ignoreeof

#Treat undefined variables as errors
#set -o nounset




### Aliases
#safety! ohnoes.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
#colors
#alias ls='ls --color'
#alias ls='ls -hp --time-style=locale --color' 
alias ls='ls -G'
alias grep='grep --color=auto'
#alias ncmpc='ncmpc -c'
#unicode
#alias xterm='xterm -u8'
#alias screen='screen -U'
#sudo
#alias root='sudo su'
#alias pacman='sudo pacman'
#alias apt-get='sudo apt-get'
#alias aptitude='sudo aptitude'
#
alias cd..='cd ..'
alias more='less'
alias nano='nano -w'
alias vim='vim -X'
#alias xcomp='xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7'
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias m='mate'
alias ss='./script/server'

###Console
#makes console terminal pretty
#slightly modified phraktured's
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0121212" #black
    echo -en "\e]P8474747" #darkgrey
    echo -en "\e]P1803232" #darkred
    echo -en "\e]P9982b2b" #red
    echo -en "\e]P25b762f" #darkgreen
    echo -en "\e]PA89b83f" #green
    echo -en "\e]P3AA9943" #dark yellow
    echo -en "\e]PBefef60" #yellow
    echo -en "\e]P4324c80" #darkblue
    echo -en "\e]PC2b4f98" #blue
    echo -en "\e]P55F5A90" #darkmagenta
    echo -en "\e]PD826ab1" #magenta
    echo -en "\e]P692b19e" #darkcyan
    echo -en "\e]PEa1cdcd" #cyan
    echo -en "\e]P7ffffff" #lightgrey
    echo -en "\e]PFdedede" #white
    clear #for background artifacting
fi


#more colors!
if [ -f ~/.dir_colors ]; then
            eval `dircolors ~/.dir_colors`
fi 
export PATH="$PATH:/home/ingolfur/.gem/ruby/2.0.0/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Display the current RVM ruby selection
#PS1="\$(/usr/local/rvm/bin/rvm-prompt) $PS1"

#export GIT_PS1_SHOWDIRTYSTATE=1
#[[ -r /usr/local/rvm/scripts/completion ]] && . /usr/local/rvm/scripts/completion
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
export PS1='[\[\e[0;32m\]\u\[\e[m]\]@[\[\e[0;32m\]\h\[\e[m]\] \w \[\e[0;33m\]$(__git_ps1)\[\e[m$\] '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
