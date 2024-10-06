#! /bin/bash
#
# install_brew.sh
# Copyright (C) 2017-07-12 Hanxiao <hah114@ucsd.edu>
#
# Distributed under terms of the MIT license.
#

# this script is to install the brew on mac

# curl -LsSf http://github.com/mxcl/homebrew/tarball/master | sudo tar xvz -C/usr/local --strip 1
# sudo chown -R $(whoami) /usr/local
# rm -rf /usr/local/share/doc/homebrew
# brew update -v
user_name=$(id -un)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/${user_name}/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/${user_name}/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

