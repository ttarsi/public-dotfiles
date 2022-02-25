set nocompatible
set rtp+=/usr/local/opt/fzf

call plug#begin(stdpath('data') . '/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {
  'branch': 'release',
  'do': ':CocInstall coc-tsserver coc-json coc-html coc-tabnine coc-styled-components coc-explorer'
}
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'tomlion/vim-solidity'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'

call plug#end()

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

" Fzf mapping
nnoremap ;b :Buffers<cr>
nnoremap ;f :Files<cr>
nnoremap ;l :Lines<cr>
nnoremap ;h :call fzf#vim#helptags()<cr>

:nnoremap <space>e :CocCommand explorer<CR>

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
