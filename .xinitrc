xmodmap -e 'clear lock'
xmodmap -e 'clear mod4'
xmodmap -e 'clear control'
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'keycode 133 = F13'
xmodmap -e 'keycode 37 = Hyper_L'
xmodmap -e 'keycode 134 = F14'
xmodmap -e 'add mod3 = Hyper_L'
xmodmap -e 'add control = Control_L'
xmodmap -e 'add control = Control_R'
xkbset sticky -twokey latchlock
xkbset exp =sticky =latchlock =twokey
