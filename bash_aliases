#!/bin/bash
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias is="setxkbmap is"
alias us="setxkbmap us"
function vpn() {
 if [ "$#" -eq 0  ]
 then
  /usr/bin/hma-vpn.sh -p tcp London
else
  /usr/bin/hma-vpn.sh -p tcp $1
fi
}
