#.bashrc
export PAGER=less
export EDITOR=vim
export PATH=$PATH
export LESS='-R'

if [[ $- != *i* ]] ; then
         # Shell is non-interactive.  Be done now!
         return
fi


# Fancy PWD display function
# The home directory (HOME) is replaced with a ~
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=15
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
        case $TERM in
    xterm*|rxvt*)
        local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
        ;;
    *)
        local TITLEBAR=""
        ;;
        esac
        
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # empahsized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    
    PS1="$TITLEBAR${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"

}
PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

### Bash stuff
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
set -o nounset




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
export EDITOR="/usr/bin/mate -w"
