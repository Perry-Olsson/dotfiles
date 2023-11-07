---@diagnostic disable: undefined-global
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({
    "mfussenegger/nvim-jdtls",
    "williamboman/mason.nvim",
    { "folke/tokyonight.nvim", branch = "main" },
    "EdenEast/nightfox.nvim",
    "b3nj5m1n/kommentary",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    { "nvim-treesitter/nvim-treesitter", ['do'] = ':TSUpdate' },
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim", tag = '0.1.0' },
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "nvim-lualine/lualine.nvim",
    "kyazdani42/nvim-web-devicons",
    "wbthomason/packer.nvim",
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
})
