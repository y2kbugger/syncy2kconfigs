#!/usr/bin/env bash

# bash_config
p="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && readlink -f bash_config )"
echo $p
ln -fs $p/.bash_profile $p/.bashrc $p/.bash_aliases $p/.inputrc $p/.dir_colors ~/
if [ $(uname) = "Linux" ]; then
    ln -fs $p/.bash_aliases_home ~/
elif [ $(uname) = "msys" ]; then
    ln -fs $p/.bash_aliases_win ~/
fi
