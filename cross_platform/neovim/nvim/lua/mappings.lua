---@diagnostic disable: undefined-global
local opts = { noremap=true, silent=true }
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cc", ":tabnew $HOME/.vimrc<CR>", opts)
vim.keymap.set("n", "<leader>vi", ":edit $HOME/.vimrc<CR>", opts)
vim.keymap.set("n", "<leader>ls", ":edit $HOME/.config/nvim/lua/config.lua<CR>", opts)
vim.keymap.set("n", "<leader>nt", ":help nvim-tree-setup<CR>", opts)
vim.keymap.set("n", "<leader>h", ":noh<CR>", opts)
vim.keymap.set("n", "<leader>h", ":noh<CR>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- TELESCOPE
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files hidden=true<cr>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

vim.cmd("nmap <leader>e  <leader>t <cmd>NvimTreeToggle<CR> <cmd>vertical resize 35<CR>")


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
vim.keymap.set("n", "<leader>yy", "+yy", opts)
vim.keymap.set("n", "<leader>y", "+y", opts)

-- terminal emulator
vim.cmd("nnoremap <leader>t <C-W>s<C-W>j:terminal<CR> :resize 10<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)

vim.cmd("map Y y$")
