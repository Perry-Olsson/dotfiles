---@diagnostic disable: undefined-global
local opts = { noremap=true, silent=true }
local get_opts = function(desc)
    return { noremap=true, silent=true, desc=desc }
end
vim.g.mapleader = " "
-- quit all
vim.keymap.set("n", "<leader>q", ":qa<CR>", get_opts("quit all"))
-- quit window
vim.keymap.set("n", "q", ":q<CR>", get_opts("quit"))
-- save
vim.keymap.set("n", "<leader>s", ":w<CR>", get_opts("save file"))
vim.keymap.set("n", "<leader>ls", ":edit $HOME/.config/nvim/lua/config.lua<CR>", get_opts("Edit config.lua"))
vim.keymap.set("n", "<leader>nt", ":help nvim-tree-setup<CR>", get_opts("Nvim tree setup help"))
vim.keymap.set("n", "<leader>h", ":noh<CR>", get_opts("No highlight"))
vim.keymap.set("i", "jk", "<ESC>", opts)

vim.cmd("nmap <leader>e  <cmd>NvimTreeToggle<CR> <cmd>vertical resize 35<CR>")

vim.keymap.set("n", "<C-L>", "nohl<CR><C-L>", opts)
vim.keymap.set("n", "<leader>wv", "<C-W>v", opts)
vim.keymap.set("n", "<leader>wc", "<C-W>s", opts)
vim.keymap.set("n", "<leader>wd", ":lcd %:p:h<CR>", opts)

-- split resizing
vim.keymap.set("n", "<A-=>", ":res +5<CR>", opts)
vim.keymap.set("n", "<A-->", ":res -5<CR>", opts)
vim.keymap.set("n", "=", ":vertical res +15<CR>", opts)
vim.keymap.set("n", "-", ":vertical res -15<CR>", opts)

-- split movements
vim.keymap.set("n", "<A-h>", "<C-W>h", opts)
vim.keymap.set("n", "<A-j>", "<C-W>j", opts)
vim.keymap.set("n", "<A-k>", "<C-W>k", opts)
vim.keymap.set("n", "<A-l>", "<C-W>l", opts)
vim.keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", opts)

-- remap copy to clipboard
vim.keymap.set("n", "<leader>yy", '"+yy', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)

-- paste no yank
vim.keymap.set("v", "<leader>p", "\"_dP")

-- terminal emulator
vim.cmd("nnoremap <leader>t <C-W>s<C-W>j:terminal<CR> :resize 10<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)

vim.cmd("map Y y$")

local function get_buf_file_path ()
    local file_path = vim.api.nvim_buf_get_name(0)
    file_path = file_path:gsub("/[^/]*$", "")
    vim.cmd(":cd "..file_path)
end

-- Set working directory to current file
vim.keymap.set("n", "fd", get_buf_file_path, opts)
