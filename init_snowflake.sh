# Init
base_dir=$(pwd)
shopt -s expand_aliases
source "${base_dir}/configs/bash_alias"
source "${base_dir}/configs/bash_func"

if [ ! -d ~/.setting_backup ]; then
    mkdir ~/.setting_backup
fi

function backup_and_copy
{
    if [ -f "$1" ]; then
        backup "$1"
        mv ${backup_file_dir} ~/.setting_backup/
    fi
}

# Install zsh
if [ -d ~/.oh-my-zsh ]; then
  echo "oh-my-zsh has been installed."
else
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

backup_and_copy ~/.oh-my-zsh/custom/snowflake.zsh
cp ${base_dir}/configs/snowflake.zsh ~/.oh-my-zsh/custom/snowflake.zsh



# Install Vim

if [ ! -d ~/.vim_runtime ]; then
    echo "Installing vim configs"
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
fi

# Install Tmux
backup_and_copy ~/.tmux.conf
tmux_version=$(tmux -V | awk '{print $2}')
if [ $(echo "2.3 ${tmux_version}" | awk '{if($1>$2) {print 0} else {print 1}}') -eq 1 ]; then
    sed -i '' "s@#HV2.3 @@" ~/.tmux.conf
else
    sed -i "s@#LV2.3 @@" ~/.tmux.conf
fi

if [ "$(uname)" == "Darwin" ]; then
    # reconfig the tmux
    sed -i '' "s@#MAC @@" ~/.tmux.conf
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # reconfig the tmux
    sed -i "s@#LINUX @@" ~/.tmux.conf
fi

echo "${green}[FINISHED]${endcolor} done installing! "
