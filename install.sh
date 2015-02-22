#!/bin/bash

# Install pathogen
echo "Install Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/syntax ~/.vim/bundle && \
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim || exit 1
echo "Install vimrc"
wget https://raw.githubusercontent.com/truongdq54/vimcustom/master/vimrc -O ~/.vimrc
vim +BundleInstall
