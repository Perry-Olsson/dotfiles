---@diagnostic disable: undefined-global
require("mason").setup()
--[[ 
**************************************************************
*************************VIM CONFIG***************************
**************************************************************
--]]
vim.g.netrw_liststyle = 3 -- Tree-style view
--[[ 
**************************************************************
*************************DAP CONFIG***************************
**************************************************************
--]]
local dap = require("dap")
vim.keymap.set("n", "<leader>8", dap.continue)
vim.keymap.set("n", "<leader>9", dap.step_over)
vim.keymap.set("n", "<leader>0", dap.step_into)
vim.keymap.set("n", "<leader>-", dap.step_out)
vim.keymap.set("n", "<leader>=", dap.terminate)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
-- **********************C++/C/RUST**************************
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return string.format('%s/build/TESTING', vim.fn.getcwd())
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
dap.configurations.rust = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp
--[[ 
*************************PYTHON*******************************
--]]
local venv = os.getenv("VIRTUAL_ENV")
dap.adapters.python = {
  type = 'executable';
  command = string.format("%s/bin/python",venv);
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      if vim.fn.executable(string.format('%s/bin/python', venv)) == 1 then
        return string.format('%s/bin/python', venv)
      else
        return '/usr/bin/python'
      end
    end;
  },
}
--[[ 
**************************************************************
***********************DAP UI CONFIG**************************
**************************************************************
--]]
local dapui = require("dapui")
vim.keymap.set("n", "<leader>du", dapui.toggle)
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
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
*************************LSP CONFIG***************************
**************************************************************
--]]
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader><S-e>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>di', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>do', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", opts)
vim.keymap.set('n', '<leader><S-q>', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", bufopts)
  vim.keymap.set('n', '<leader><S-f>', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local lsp_config = require("lspconfig")
lsp_config.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
lsp_config.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
lsp_config.sumneko_lua.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
lsp_config.terraformls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = vim.lsp.buf.formatting_sync,
})
lsp_config.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
lsp_config.ccls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
lsp_config.jdtls.setup {
    capabilities = capabilities,
    on_attach = function (client, buf)
        on_attach(client, buf)
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end,
    flags = lsp_flags,
}
--[[ 
**************************************************************
********************NVIM CMP CONFIGURATION********************
**************************************************************
--]]
local cmp = require'cmp'
cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body)
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})


--[[ 
**************************************************************
**********************TREESITTER CONFIG***********************
**************************************************************
--]]

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "java", "kotlin" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    indent = { enable = true },
  },
}

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
--[[ 
**************************************************************
**********************LUALINE CONFIG**************************
**************************************************************
--]]
-- local custom_gruvbox = require'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#000000'
require("lualine").setup{
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
