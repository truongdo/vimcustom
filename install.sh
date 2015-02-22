#!/bin/bash

# Install Vundle
echo "Install Vundle"
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
    mkdir -p ~/.vim/autoload ~/.vim/syntax ~/.vim/bundle && \
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || exit 1
fi
# Install powerline
pip install --user git+git://github.com/Lokaltog/powerline
echo '
if [ -d "$HOME/.local/bin"  ]; then
        PATH="$HOME/.local/bin:$PATH"
    fi
' >> ~/.profile
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/ 

echo "Install vimrc"
wget https://raw.githubusercontent.com/truongdq54/vimcustom/master/vimrc -O ~/.vimrc
vim +BundleInstall
