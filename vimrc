set encoding=utf-8

" Leader
let mapleader = " "

set ruler
set showcmd
set laststatus=2

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set number
set numberwidth=4
set relativenumber
set t_Co=256

if &compatible
  set nocompatible
endif

set tabstop=2
set shiftwidth=2
set shiftround

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
