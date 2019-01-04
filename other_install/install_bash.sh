if [ ! -d ~/.bash_it ]; then
    echo "Start to Setting Up Bash..."
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    bash ~/.bash_it/install.sh --silence

    # setting up theme
    # install powerline fonts
    git clone --depth=1 https://github.com/powerline/fonts.git ~/.fonts
    bash ~/.fonts/install.sh

    # Clone agnoster prompt
    git clone --depth=1 https://github.com/maddeye/agnoster-bash.git ~/.bash_it/themes/agnoster
fi

