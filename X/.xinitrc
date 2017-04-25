setxkbmap gb              &
#urxvtd -q -o -f           &
#~/.dropbox-dist/dropboxd  &
#dropbox                   &
#./wallpapers.shuffle.sh   &
#variety                   &
udiskie --tray            &
#pasystray                 &
xrdb -merge ~/.Xresources &
#xcompmgr                  &
#redshift                  &  
xrandr --output VGA1 --primary &
#exec i3 -V >> ~/.i3/i3log 2>&
exec i3
#exec startkde
#exec startlxde
