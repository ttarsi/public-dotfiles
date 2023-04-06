set nocompatible

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'TovarishFin/vim-solidity'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'simrat39/rust-tools.nvim'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-rust-analyzer',
  \ 'coc-solidity',
  \ 'coc-tabnine',
  \ 'coc-toml',
  \ 'coc-tsserver',
  \ ]

" colorscheme
autocmd vimenter * ++nested colorscheme gruvbox
set background=light

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
  autocmd Filetype make,go,gomod
        \ setlocal tabstop=4 softtabstop=0 shiftwidth=4 noexpandtab
  " Prevent auto-indenting from occuring
  autocmd Filetype yaml setlocal indentkeys-=<:>
augroup end

" Fzf mapping
nnoremap ;b :Buffers<cr>
nnoremap ;f :Files<cr>
nnoremap ;l :Lines<cr>
nnoremap ;h :call fzf#vim#helptags()<cr>

" treesitter setup

function s:init_treesitter()
  if !exists('g:loaded_nvim_treesitter')
    echom 'nvim-treesitter does not exist, skipping...'
    return
  endif
lua << EOF
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = { "cairo" },
  },
  textobjects = { enable = true },
  autotag = { enable = true  },
  ensure_installed = {
    'bash',
    'c',
    'css',
    'dockerfile',
    'go',
    'graphql',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'python',
    'query',
    'regex',
    'rust',
    'svelte',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
}})
EOF
endfunction

augroup custom_treesitter
  autocmd!
  autocmd VimEnter * call s:init_treesitter()
augroup end

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
