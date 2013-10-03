export VISUAL=vim
export TERMINAL=lilyterm
feh  --bg-scale $HOME/.curr.png
xset -b
xset r rate 200 50
twmnd &
pulseaudio --start &
exec i3
