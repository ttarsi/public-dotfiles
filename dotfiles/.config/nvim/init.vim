set nocompatible

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-commentary'
Plug 'yorickpeterse/happy_hacking.vim'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-rust-analyzer',
  \ 'coc-solidity',
  \ 'coc-tabnine',
  \ 'coc-toml',
  \ 'coc-tsserver',
  \ ]

colorscheme happy_hacking

set relativenumber
set number
set expandtab
set autoindent
set smartcase

set laststatus=2
set tabstop=2
set shiftwidth=2

set mouse=a

" fonts and nerdtree
:nnoremap <space>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
set encoding=UTF-8
set guifont=hack_nerd_font:h21

" filetype settings
augroup filetype_recognition
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.config,*.yaml,*.yml set filetype=yaml
  autocmd BufNewFile,BufRead,BufEnter Makefile.* set filetype=make
  autocmd BufNewFile,BufRead,BufEnter *.rs  set filetype=rust
  autocmd BufNewFile,BufRead,BufEnter *.py  set filetype=python
augroup end

augroup indentation_sr
  autocmd!
  autocmd Filetype python,rust
        \ setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype make
        \ setlocal tabstop=4 softtabstop=0 shiftwidth=4 noexpandtab
  " Prevent auto-indenting from occuring
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup end

" Fzf mapping
nnoremap ;b :Buffers<cr>
nnoremap ;f :Files<cr>
nnoremap ;l :Lines<cr>
nnoremap ;h :call fzf#vim#helptags()<cr>


let mapleader=' '
nnoremap <leader>v :vsplit<cr> " easy vertical split
set splitright " puts cursor on new vertical split
nnoremap <leader>x :split<cr> " easy horizontal split
set splitbelow " puts cursor on new horizontal split

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Shows code documentation using the language server
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
