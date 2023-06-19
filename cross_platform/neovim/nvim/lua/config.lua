---@diagnostic disable: undefined-global
require("mason").setup()
require("mappings")
require("vim_settings")
require("plugins.dap")
require("plugins.dapui")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.treesitter")
vim.cmd("colorscheme tokyonight")
--[[ 
**************************************************************
**********************NVIM TREE CONFIG************************
**************************************************************
--]]
require("nvim-tree").setup({
     view = {
         preserve_window_proportions = true
     }
})
--[[ 
**************************************************************
**********************TELESCOPE CONFIG************************
**************************************************************
--]]
require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "%.git/", "%build/", "%.class" }
    }
})
