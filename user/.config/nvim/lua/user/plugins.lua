local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use 'navarasu/onedark.nvim' -- Color scheme

  use 'christoomey/vim-tmux-navigator' -- Better navigation with tmux

  use "kyazdani42/nvim-web-devicons"

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('user.plugins.nvim-tree')
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('user.plugins.indent-blankline')
    end
  }

--  -- My plugins here
--  use "akinsho/bufferline.nvim"
--  use "moll/vim-bbye"
--  use "nvim-lualine/lualine.nvim"
--  use "akinsho/toggleterm.nvim"
--  use "ahmedkhalf/project.nvim"
--  use "lewis6991/impatient.nvim"
--  use "lukas-reineke/indent-blankline.nvim"
--  use "goolord/alpha-nvim"
--  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
--  use "folke/which-key.nvim"
--
--  -- Colorschemes
--  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
--  use "lunarvim/darkplus.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      -- { 'nvim-telescope/telescope-live-grep-raw.nvim' },
    },
    config = function()
      require('user.plugins.telescope')
    end
  }

  -- Completions
  use {
    'hrsh7th/nvim-cmp', -- The completion plugin
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      -- 'onsails/lspkind-nvim',
      -- 'hrsh7th/cmp-nvim-lsp-signature-help',
      -- 'hrsh7th/cmp-nvim-lsp-document-symbol',
      -- 'hrsh7th/cmp-cmdline',
    use "tamago324/cmp-zsh"
    },
    config = function()
      require('user.plugins.cmp')
    end
  }

-- snippets
use "L3MON4D3/LuaSnip" --snippet engine
use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

-- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
     -- 'b0o/schemastore.nvim',
     -- 'folke/lsp-colors.nvim',
     -- 'weilbith/nvim-code-action-menu',
     'williamboman/nvim-lsp-installer', -- simple to use language server installer
    },
    config = function ()
      require('user.plugins.lsp_config')
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('user.plugins.treesitter')
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

--  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
--
--  -- Telescope
--
--  -- Treesitter
--  use {
--    "nvim-treesitter/nvim-treesitter",
--    run = ":TSUpdate",
--  }
--  use "JoosepAlviste/nvim-ts-context-commentstring"
--
--  -- Git
--  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
