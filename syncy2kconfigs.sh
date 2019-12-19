#!/usr/bin/env bash

# check if on windows
if [ -d /c ]; then
    win=true
else
    win=false
fi

# Update configs. Note that a more thorough --remote update may also need to be done.
echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && git pull origin master && git submodule update --recursive --init )"

# bash_config
p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f bash_config )"
echo $p
# same on all systems
ln -fs \
    $p/.bash_profile \
    $p/.bashrc \
    $p/.bash_aliases \
    $p/.inputrc \
    $p/.dir_colors \
    $p/.tmux.conf \
    ~/
# system specific
if [ ${win} = true ]; then
    ln -fs $p/.bash_aliases_win ~/
else
    ln -fs $p/.bash_aliases_home ~/
fi

# Authorized Keys
if [ ${win} = false ]; then
    p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f ssh_authorized_keys )"
    cp -p $p/authorized_keys ~/.ssh/
fi


# vim
p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f vim_config )"
echo $p
if [ ${win} = true ]; then
    ln -fsT $p ~/AppData/Local/nvim
else
    ln -fsT $p ~/.config/nvim
fi

# desktop environment config
if [ ${win} = false ]; then
    p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f desktop_environment_config )"
    echo $p
    ln -fsT $p/.config/i3 ~/.config/i3
    ln -fsT $p/.config/i3status ~/.config/i3status
    ln -fsT $p/.config/dunst ~/.config/dunst
    ln -fsT $p/.mplayer ~/.mplayer

    ln -fs $p/.config/pulse/default.pa ~/.config/pulse/default.pa
    ln -fs $p/.config/picom.conf ~/.config/picom.conf
    ln -fs $p/.config/user-dirs.dirs ~/.config/user-dirs.dirs
    ln -fs $p/.Xresources ~/.Xresources
    ln -fs $p/.xinitrc ~/.xinitrc
    ln -fs $p/.xscreensaver ~/.xscreensaver
fi
