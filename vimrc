" Ref: http://dougblack.io/words/a-good-vimrc.html

" Vundle install {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}
" Load plugins {{{
Bundle 'tpope/vim-fugitive'
Plugin 'gmarik/Vundle.vim'
Bundle 'nvie/vim-pyunit'
Plugin 'rking/ag.vim'                       " Search
Plugin 'jiangmiao/auto-pairs'               " Auto pair {} ()
Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'SirVer/ultisnips'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'jcf/vim-latex'
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'hallison/vim-markdown'
Plugin 'aperezdc/vim-template'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdcommenter'           " Commenter

call vundle#end()                           " required
" }}}
" Colors {{{
syntax enable           " enable syntax processing
set background=dark     " light for light background
colorscheme solarized
" }}}
" Spaces & Tabs {{{
set tabstop=2           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 4 space tab
set shiftwidth=2
set modelines=1
set autoindent
" }}}
" UI Layout {{{
"set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline          " highlight current line
set wildmenu
"set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}
" Window navigation{{{
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}
" Toggle & Mouse {{{
" Paste toggle & Mouse
set pastetoggle=<F2>
set mouse=a
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
nmap <silent> ,n :nohlsearch<CR>

" }}}
" Folding {{{
"=== folding ===
"set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldmethod=syntax
nnoremap <space> za
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>a :Ag
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :Make!
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
vnoremap <leader>y "+y
inoremap jk <esc>
" }}}
" Vim-latex {{{
" Vim-latex setting
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf, aux'
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_cpp_check_header = 1
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
" }}}
" make YCM compatible with UltiSnips (using supertab){{{
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" }}}
" Powerline (Status bar){{{
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
" set laststatus=2
"}}}
" Vim-airline {{{
let g:airline#extensions#enabled = 1
let g:airline_theme='kalisi'  " Fix the color of status bar that is difficult to see with solarized scheme
set laststatus=2
"}}}
" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
"}}}
"Editing{{{
" Set to auto read when a file is changed from the outside
set autoread
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
set spell
map <leader>ss :setlocal spell!<cr>0
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set fileencodings=ucs-bom,utf-8,euc-jp
"}}}
" Tabs and indentation{{{
" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype tex setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
" }}}

"Custom function{{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
"}}}
autocmd FileType vimrc setlocal foldmethod=marker
set foldlevel=0
set modelines=1
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
filetype plugin indent on
" Useful map keys for editting
" 1. Remove tabs (4 spaces)
:map ,rt :s/^    //g <Enter>
:map ,t :s/^/    /g <Enter>
" vim:foldmethod=marker:foldlevel=0
