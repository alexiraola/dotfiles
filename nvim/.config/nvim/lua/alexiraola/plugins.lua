local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  use 'wbthomason/packer.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'arcticicestudio/nord-vim'

  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-tree/nvim-tree.lua'

  use 'numToStr/Comment.nvim'

  use 'dinhhuy258/git.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'christoomey/vim-tmux-navigator' -- tmux & split window navigation
  use 'windwp/nvim-autopairs'
  use 'nikvdp/ejs-syntax'
  use {
	  'ray-x/navigator.lua',
	  requires = {
		  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
		  { 'neovim/nvim-lspconfig'},
	  },
  }

  if packer_bootstrap then
    require('packer').sync()
	print('Intalling plugins, restart nvim when finished')
  end
end)
