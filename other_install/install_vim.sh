#! /bin/bash
#
# install_vim.sh
# Copyright (C) 2017-09-05 Hanxiao <hah114@ucsd.edu>
#
# Distributed under terms of the MIT license.
#

user_name="$1"
user_mail="$2"

if [ ! -d ~/.vim_runtime ]; then
    echo "Start to Setting Up Vim..."
    git clone --depth=1 https://github.com/plrectco/vimrc ~/.vim_runtime
    bash ~/.vim_runtime/install_awesome_vimrc.sh
    pushd ~/.vim_runtime > /dev/null
    bash getmyplugins.sh
    popd > /dev/null
fi

#set up vim-template
if [[ -z ${user_name} || -z ${user_mail} ]]; then
    :;
else
    echo "let g:tmpl_author_email = '${user_mail}'" >> ~/.vim_runtime/my_configs.vim
    echo "let g:tmpl_author_name = '${user_name}'" >> ~/.vim_runtime/my_configs.vim
fi

