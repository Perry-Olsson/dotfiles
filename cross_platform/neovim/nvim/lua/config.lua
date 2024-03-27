---@diagnostic disable: undefined-global
require("mason").setup()
require("mappings")
require("vim_settings")
require("plugins.dap")
require("plugins.dapui")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.harpoon")
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

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files hidden=true<cr>", get_opts("Find files (include hidden)"))
