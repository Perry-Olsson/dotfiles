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
local get_opts = function(desc)
    return { noremap=true, silent=true, desc=desc }
end
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
-- TELESCOPE
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", get_opts("Find files"))
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files hidden=true<cr>", get_opts("Find files (include hidden)"))
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", get_opts("Search text"))
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
