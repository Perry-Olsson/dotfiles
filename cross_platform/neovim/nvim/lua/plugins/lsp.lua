---@diagnostic disable: undefined-global
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
lsp_config.sumneko_lua.setup{
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
