export VISUAL=vim
export TERMINAL=xterm
exec i3
xrdb -merge ~/.Xresources
feh  --bg-scale $HOME/.curr.png
xset -b
xset r rate 200 50
dropboxd &
pulseaudio --start &
NetworkManager
twmnd &
exec i3
