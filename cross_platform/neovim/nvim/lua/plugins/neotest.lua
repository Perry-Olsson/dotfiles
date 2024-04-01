---@diagnostic disable: undefined-global
local neotest = require("neotest")
local function opts(desc)
  return { desc = "nvim-neotest: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      runner = "pytest"
    }),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})

local function run_nearest()
    neotest.run.run()
end

local function run_file()
    neotest.run.run(vim.fn.expand("%"))
end

vim.keymap.set("n", "<leader>tr", run_nearest, opts("Run nearest test"))
vim.keymap.set("n", "<leader>tf", run_file, opts("Run tests in current file"))
