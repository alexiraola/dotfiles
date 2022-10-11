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

if has('nvim')
	:tnoremap <Esc> <C-\><C-n>
	:tnoremap <C-h> <C-\><C-N><C-w>h
    :tnoremap <C-j> <C-\><C-N><C-w>j
    :tnoremap <C-k> <C-\><C-N><C-w>k
    :tnoremap <C-l> <C-\><C-N><C-w>l
    :inoremap <C-h> <C-\><C-N><C-w>h
    :inoremap <C-j> <C-\><C-N><C-w>j
    :inoremap <C-k> <C-\><C-N><C-w>k
    :inoremap <C-l> <C-\><C-N><C-w>l
endif

imap jk <Esc>
imap kj <Esc>

set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'

" LSP configuration helpers
Plug 'neovim/nvim-lspconfig'

" Improved syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Improved LSP interface
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Autocomplete menus
Plug 'hrsh7th/nvim-compe'

" Formatter integration
Plug 'mhartington/formatter.nvim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'keith/swift.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme nord
set background=dark

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_map = 'ff'
" nnoremap ff :CtrlP<cr>
nnoremap ff :Telescope find_files<cr>

" source ~/.vim/coc.vim

:lua require('setup')
