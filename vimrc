set nocompatible
set rtp+=/usr/local/opt/fzf

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-tsserver coc-json coc-html coc-tabnine coc-styled-components coc-explorer' }
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'tomlion/vim-solidity'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme happy_hacking

set relativenumber
set number
set expandtab
set autoindent

set laststatus=2
set tabstop=2
set shiftwidth=2

set mouse=a

:nnoremap <space>e :CocCommand explorer<CR>
