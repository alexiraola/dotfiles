" Leader
let mapleader = " "

set showcmd

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set numberwidth=4
set relativenumber

if &compatible
  set nocompatible
endif

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup

set textwidth=80
set colorcolumn=+1

set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

imap jk <Esc>
imap kj <Esc>

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
call plug#end()

autocmd vimenter * colorscheme gruvbox
set background=dark
