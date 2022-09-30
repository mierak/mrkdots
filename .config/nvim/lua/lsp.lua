local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--[[ local opts = { noremap=true, silent=true } ]]--


local on_attach = function(client, bufnr)
  local bufopts = { buffer=bufnr }
  vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader><F2>', vim.lsp.buf.rename, bufopts)
end

require'lspconfig'.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require'lspconfig'.ccls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("autocomp")
