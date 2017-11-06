#!/usr/bin/env bash

git clone y2kbugger@bitbucket.org:y2kbugger/bash_config.git /tmp/syncy2kconfigs/bash_config

cd /tmp/syncy2kconfigs/bash_config
cp .bashrc .bash_aliases .inputrc ~/



rm -rf /tmp/syncy2kconfigs
