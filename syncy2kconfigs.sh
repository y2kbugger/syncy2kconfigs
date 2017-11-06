#!/usr/bin/env bash

tmppath="$(mktemp -d)"
git clone y2kbugger@bitbucket.org:y2kbugger/bash_config.git \ "$tmppath/bash_config"

cd "$tmppath/bash_config"
cp .bashrc .bash_aliases .inputrc ~/

rm -rf $tmppath
