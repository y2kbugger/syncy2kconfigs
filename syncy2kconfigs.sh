#!/usr/bin/env bash

tmppath="$(mktemp -td bash_config.XXXXX)"
git clone y2kbugger@bitbucket.org:y2kbugger/bash_config.git $tmppath

cd $tmppath
pwd
cp .bashrc .bash_aliases .inputrc ~/

# cleanup
# rm -rf $tmppath
