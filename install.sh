
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/scrooloose/nerdtree.git ~/vim/bundle/nerdtree

# YCM
sudo apt-get install build-essential cmake
sudo apt-get install python-dev

cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --gocode-completer

if [ -e ~/.vimrc ]; then
    if [ -e ~/.vimrc.old ]; then
        rm ~/.vimrc.old
    fi
    mv ~/.vimrc ~/.vimrc.old
fi

ln -s .vimrc ~/

cd ~/
vim +PluginInstall +qall

# PowerFonts for PowerLine

cd /tmp
git clone https://github.com/powerline/powerline.git
cd powerline
sudo setup.py install

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

