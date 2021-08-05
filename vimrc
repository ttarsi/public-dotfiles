set nocompatible
set rtp+=/usr/local/opt/fzf

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'tomlion/vim-solidity'

call plug#end()

colorscheme happy_hacking

set mouse=a
set laststatus=2

set expandtab autoindent tabstop=2 shiftwidth=2

set relativenumber
set number

