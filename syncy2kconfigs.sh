#!/usr/bin/env bash

# Update configs. Note that a more thorough --remote update may also need to be done.
"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && git pull origin master && git submodule update --recursive --init )"

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
if [ $(uname) = "Linux" ]; then
    ln -fs $p/.bash_aliases_home ~/
elif [ $(uname) = "msys" ]; then
    ln -fs $p/.bash_aliases_win ~/
fi

# ssh_authorized_keys
p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f ssh_authorized_keys )"
cp -p $p/authorized_keys ~/.ssh/


# vim
p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f vim_config )"
ln -fs $p ~/.config/nvim

