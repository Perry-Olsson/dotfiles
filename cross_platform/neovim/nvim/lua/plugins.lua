---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'mfussenegger/nvim-jdtls'
  use 'williamboman/mason.nvim'
  use {
      'folke/tokyonight.nvim',
      branch = 'main'
  }
  use 'EdenEast/nightfox.nvim'
  use 'b3nj5m1n/kommentary'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use {
      'nvim-treesitter/nvim-treesitter',
      ['do'] = ':TSUpdate'
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lua/plenary.nvim'
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0'
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'wbthomason/packer.nvim'
end)
