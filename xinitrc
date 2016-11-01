export VISUAL=vim
export TERMINAL="terminology"
xrdb -merge ~/.Xresources
feh  --bg-scale $HOME/.curr.png
xset -b
xset r rate 200 50
#pulseaudio --start &
twmnd &
unclutter &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
eval `ssh-agent -s`
ssh-add
exec i3
#exec startxfce4
