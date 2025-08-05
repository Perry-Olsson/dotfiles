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
    "rebelot/kanagawa.nvim",
    "EdenEast/nightfox.nvim",
    "b3nj5m1n/kommentary",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    { "nvim-treesitter/nvim-treesitter", ['do'] = ':TSUpdate' },
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",
    "nvim-lua/plenary.nvim",
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    { "nvim-neotest/nvim-nio" },
    { "nvim-lualine/lualine.nvim", dependencies={ "nvim-tree/nvim-web-devicons" } },
    {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
    },
    "kyazdani42/nvim-web-devicons",
    "wbthomason/packer.nvim",
    "lewis6991/gitsigns.nvim",
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
    },
    {
        "kdheepak/lazygit.nvim",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
           { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-plenary"
        }
    },
    { "folke/neodev.nvim", opts = {} }
})
