
export VISUAL=vim
export TERMINAL=xterm
xrdb -merge ~/.Xresources
feh  --bg-scale $HOME/.curr.png
xset -b
xset r rate 200 50
dropboxd &
pulseaudio --start &
NetworkManager
twmnd &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
