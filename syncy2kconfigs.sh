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

