---@diagnostic disable: undefined-global
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local get_opts = function(desc)
    return { noremap=true, silent=true, desc=desc }
end
vim.keymap.set('n', '<leader><S-e>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>di', vim.diagnostic.goto_next, get_opts("Next code diagnostic"))
vim.keymap.set('n', '<leader>do', vim.diagnostic.goto_prev, get_opts("Previous code diagnostic"))
vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", get_opts("Search code diagnostics"))
vim.keymap.set('n', '<leader><S-q>', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap=true, silent=true, buffer=bufnr, desc='Go to declaration' })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc='Go to definition' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap=true, silent=true, buffer=bufnr, desc='hover tool tip' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap=true, silent=true, buffer=bufnr, desc='Go to implementation' })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap=true, silent=true, buffer=bufnr, desc='Signature help' })
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { noremap=true, silent=true, buffer=bufnr, desc='Add workspace folder' })
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { noremap=true, silent=true, buffer=bufnr, desc='Remove workspace folder' })
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { noremap=true, silent=true, buffer=bufnr, desc='List workspace folders' })
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { noremap=true, silent=true, buffer=bufnr, desc='Show type definition' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap=true, silent=true, buffer=bufnr, desc='Rename' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap=true, silent=true, buffer=bufnr, desc='Code action' })
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", { noremap=true, silent=true, buffer=bufnr, desc='Find references' })
 -- vim.keymap.set('n', '<leader><S-f>', vim.lsp.buf.formatting, bufopts)
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
lsp_config.lua_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
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
