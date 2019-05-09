#! /bin/bash
# File   : update_configs_with_local.sh
# License: MIT
# Author : Xinyue Ou <xinyue3ou@gmail.com>
# Date   : 20.01.2019

function update_config
{
    if [ -f "$1" ]; then
        if [ $# -eq 2 ]; then
            cp "$1" "$2"
        elif [ $# -eq 1 ]; then
            cp "$1" configs/${1##*/}
        fi
    fi
}

update_config ~/.bash_alias bash_alias
update_config ~/.bash_func bash_func
update_config ~/.bashrc bashrc
update_config ~/.tmux.conf tmux.conf
update_config ~/.vim_runtime/my_configs.vim my_configs.vim
update_config ~/.vimrc vimrc
update_config ~/.gitconfig gitconfig
update_config ~/.bash_profile bash_profile
update_config ~/.inputrc inputrc
update_config ~/Library/Preferences/com.apple.Terminal.plist #terminal theme binary config
