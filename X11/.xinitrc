urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources
setxkbmap -option 'caps:ctrl_modifier'; xcape -e 'Cape_Lock=Escape'&
udiskie &
exec i3
