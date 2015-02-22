#!/bin/bash

# Install pathogen
echo "Install Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/syntax ~/.vim/bundle && \
   curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim color solarized
echo "Install solarized color scheme"
git clone git://github.com/altercation/vim-colors-solarized.git  ~/.vim/bundle/vim-colors-solarized 2>/dev/null

# Install Gundo
echo "Install gundo"
git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo 2>/dev/null

# Silver searcher
echo "Install silversearch"
sudo apt-get install silversearcher-ag 2>/dev/null
git clone https://github.com/rking/ag.vim ~/.vim/bundle/ag && vim +Helptags 2>/dev/null

echo "Install syntastic"
sudo pip install flake8
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic && vim +Helptags

wget http://www.vim.org/scripts/download_script.php?src_id=21056 -O ~/.vim/syntax/python.vim

echo "Install vim autocomplete"
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

echo "Install vim markdown"
git clone https://github.com/plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown

echo "Install vim header"
mkdir -p ~/.vim/plugin
wget http://www.vim.org/scripts/download_script.php?src_id=20985 -O ~/.vim/plugin/header.vim

echo "Install vim-pairs"
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

echo "Install vim-latex"
(
cd ~/.vim/bundle
wget http://downloads.sourceforge.net/project/vim-latex/snapshots/vim-latex-1.8.23-20141116.812-gitd0f31c9.tar.gz\?r\=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fvim-latex%2Ffiles%2Fsnapshots%2F\&ts\=1424568162\&use_mirror\=jaist -O - | tar xvpfz -
vim +Helptags
)
echo "Install vimrc"
wget https://raw.githubusercontent.com/truongdq54/vimcustom/master/vimrc -O ~/.vimrc
