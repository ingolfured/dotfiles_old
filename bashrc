#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

function __ps1_newline_login {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

PROMPT_COMMAND='__ps1_newline_login'
[[ -s /etc/profile.d/autojump.sh ]] && . /etc/profile.d/autojump.sh
export PS1="\[\e[33;1m\][\t]~ \n\[\e[34;0m\]\[\e[31;1m\][\u]\[\e[36;23m\]@[\h]\[\e[34;0m\]  \[\e[01;34m\]\w  \`if [ \$? = 0 ]; then echo -e '\e[01;32m:)'; else echo -e '\e[01;31m:('; fi\`\[\e[00m\] "
