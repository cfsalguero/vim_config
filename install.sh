#!/bin/bash
DATE=$(date +%FT%T%z)
VIMRC="${HOME}/.vimrc"

echo "need to install build-essential & cmake"
sudo apt-get install -y build-essential cmake git vim neovim
sudo apt-get install -y python3-dev python3-pip python-neovim python3-neovim
sudo pip install --upgrade neovim

if [ -a ${HOME}/.vimrc ];
then
    echo "Found ${VIMRC}"
    if [ -L ${VIMRC} ];
    then
	echo "Deleting .vimrc link ${VIMRC}"
        rm $VIMRC
    else
	echo "Renaming ${VIMRC} to ${VIMRC}_${DATE}"
        mv ${VIMRC} ${VIMRC}_${DATE}
    fi
fi

mkdir -p ${HOME}/.vim/undodir

ln -s ${HOME}/.vim/.vimrc ${VIMRC} 

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/scrooloose/nerdtree.git ~/vim/bundle/nerdtree

# YCM
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --gocode-completer

cd ~/
vim +PluginInstall +qall

# Fix for NerdTree. If we try to open but the file is already opened, 
# just jump to the that instead of opening it twice.
cp override_tab_mapping.vim bundle/nerdtree/nerdtree_plugin/

# PowerFonts for PowerLine
cd /tmp
git clone https://github.com/powerline/powerline.git
cd powerline
sudo python setup.py install

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

mkdir -p ${HOME}/.config/nvim/
rm -f /home/karl/.config/nvim/init.vim
ln -s ~/.vim/.vimrc ~/.config/nvim/init.vim
