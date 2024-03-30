---@diagnostic disable: undefined-global
local api = require "nvim-tree.api"
local function opts(desc)
  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

local previous_path = nil

local function change_root_to_config()
    previous_path = vim.fn.getcwd()
    api.tree.change_root("~/.config/nvim/lua")
    vim.cmd(":cd ~/.config/nvim/lua")
end

local function change_back_from_config()
    if previous_path == nil then
        return
    end
    api.tree.change_root(previous_path)
    vim.cmd(":cd "..previous_path)
end

local function change_working_directory()
    local abs_path = api.tree.get_node_under_cursor()["absolute_path"]
    print(abs_path)
    vim.cmd(":cd "..abs_path)
end

local function change_root_and_working_directory()
    local abs_path = api.tree.get_node_under_cursor()["absolute_path"]
    vim.cmd(":cd "..abs_path)
    api.tree.change_root(abs_path)
end

local function run_script()
    local abs_path = api.tree.get_node_under_cursor()["absolute_path"]
    local handle = io.popen(abs_path)
    if handle == nil then
        return
    end
    local output = handle:read("*a")
    handle:close()
    local format = output:gsub("[\n\r]", " ")
    print(format)
end

local function my_on_attach(bufnr)
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "<leader>cn", change_root_to_config, opts("change root"))
    vim.keymap.set("n", "<leader>cb", change_back_from_config, opts("change root"))
    vim.keymap.set("n", "<leader>cd", change_working_directory, opts("Change to working directory"))
    vim.keymap.set("n", "<leader>r", run_script, opts("Run shell script"))
    vim.keymap.set("n", "<C-[>", change_root_and_working_directory, opts("Change root and working directory"))
end

  -- pass to setup along with your other options
require("nvim-tree").setup {
    on_attach = my_on_attach,
    view = {
        preserve_window_proportions = true
    }
}
